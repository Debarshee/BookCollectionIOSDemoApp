//
//  CollectionViewCell.swift
//  DebarsheeBookCollection
//
//  Created by Debarshee on 4/6/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, CellReusable {
    @IBOutlet private weak var bookView: UIView!
    @IBOutlet private weak var bookImageView: UIImageView!
    @IBOutlet private weak var bookNameLabel: UILabel!
    @IBOutlet private weak var authorsLabel: UILabel!
    @IBOutlet private weak var starImageView1: UIImageView!
    @IBOutlet private weak var starImageView2: UIImageView!
    @IBOutlet private weak var starImageView3: UIImageView!
    @IBOutlet private weak var starImageView4: UIImageView!
    @IBOutlet private weak var starImageView5: UIImageView!
    @IBOutlet private weak var starRatingView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bookImageView.layer.borderWidth = 1
        bookImageView.layer.borderColor = UIColor.black.cgColor
        starImageView1.image = UIImage(named: "star")
        starImageView2.image = UIImage(named: "star")
        starImageView3.image = UIImage(named: "star")
        starImageView4.image = UIImage(named: "star")
        starImageView5.image = UIImage(named: "star")
    }
    
    func configure(name: String, author: [String], image: String) {
        self.bookNameLabel.text = name
        var authorName = ""
        for element in author {
            authorName += element
        }
        self.authorsLabel.text = authorName
        self.bookImageView.downloadImage(with: image)
    }
}

/*
 let fullStarImage:  UIImage = UIImage(named: "starFull.png")!
 let halfStarImage:  UIImage = UIImage(named: "starHalf.png")!
 let emptyStarImage: UIImage = UIImage(named: "starEmpty.png")!

 func getStarImage(starNumber: Double, forRating rating: Double) -> UIImage {
     if rating >= starNumber {
         return fullStarImage
     } else if rating + 0.5 == starNumber {
         return halfStarImage
     } else {
         return emptyStarImage
     }
 }
 
 if let ourRating = object?["OurRating"] as? Double {
     cell?.star1.image = getStarImage(1, forRating: ourRating)
     cell?.star2.image = getStarImage(2, forRating: ourRating)
     cell?.star3.image = getStarImage(3, forRating: ourRating)
     cell?.star4.image = getStarImage(4, forRating: ourRating)
     cell?.star5.image = getStarImage(5, forRating: ourRating)
 }
 OR
 for (index, imageView) in [cell?.star1, cell?.star2, cell?.star3, cell?.star4, cell?.star5].enumerate() {
     imageView?.image = getStarImage(index + 1, forRating: ourRating)
 }
 */
