//
//  BookCollectionViewController.swift
//  DebarsheeBookCollection
//
//  Created by Debarshee on 4/6/21.
//

import UIKit

class BookCollectionViewController: UIViewController {
    
    @IBOutlet private weak var bookCategorySelection: UISegmentedControl!
    @IBOutlet private weak var bookCollectionView: UICollectionView! {
        didSet {
            self.bookCollectionView.dataSource = self
            self.bookCollectionView.delegate = self
        }
    }
    var dataSource: BookContainer? {
        didSet {
            self.bookCollectionView.reloadData()
        }
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = searchController.searchBar
        searchController.searchBar.placeholder = ""
        getBooks()
    }
    
    private func getBooks() {
        let url = "https://www.googleapis.com/books/v1/volumes?q=swift"
        NetworkManager.manager.getData(url: url) { [weak self] (result: Result<BookContainer, AppError>) in
            guard let self = self else { return }
            switch result {
            case .success(let books):
                self.dataSource = books
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension BookCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let bookCollection = self.dataSource else { return 0 }
        return bookCollection.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bookCollectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.cellIdentifier, for: indexPath) as? CollectionViewCell else {
            fatalError("Failed to dequeue the cell")
        }
        let book = self.dataSource?.items?[indexPath.row]
        
        cell.configure(name: book?.volumeInfo?.title ?? "", author: book?.volumeInfo?.authors ?? [], image: book?.volumeInfo?.imageLinks?.smallThumbnail ?? "")
        return cell
    }
}

extension BookCollectionViewController: UICollectionViewDelegate {}
