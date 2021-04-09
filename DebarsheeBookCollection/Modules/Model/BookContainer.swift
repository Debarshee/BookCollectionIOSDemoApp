//
//  BookContainer.swift
//  DebarsheeBookCollection
//
//  Created by Debarshee on 4/6/21.
//

import Foundation

struct BookContainer: Decodable {
    var kind: String?
    var totalItems: Int?
    var items: [ItemInfo]?
}

struct ItemInfo: Decodable {
    var kind: String?
    var id: String?
    var etag: String?
    var selfLink: String?
    var volumeInfo: VolumeInfo?
    var saleInfo: SaleInfo?
    var accessInfo: AccessInfo?
    var searchInfo: SearchInfo?
}

struct SearchInfo: Decodable {
    var textSnippet: String?
}

struct SaleInfo: Decodable {
    var country: String?
    var saleability: String?
    var isEbook: Bool
    var listPrice: ListPriceInfo?
    var retailPrice: RetailPrice?
    var buyLink: String?
    var offers: [Offers]?
}

struct ListPriceInfo: Decodable {
    var amount: Double
    var currencyCode: String
}

struct RetailPrice: Decodable {
    var amount: Double?
    var currencyCode: String?
}

struct Offers: Decodable {
    var finskyOfferType: Int?
    var listPrice: OffersListPrice?
    var retailPrice: OffersRetailPrice?
    var giftable: Bool
}

struct OffersListPrice: Decodable {
    var amountInMicros: Int?
    var currencyCode: String?
}

struct OffersRetailPrice: Decodable {
    var amountInMicros: Int?
    var currencyCode: String?
}
struct AccessInfo: Decodable {
    var country: String?
    var viewability: String?
    var embeddable: Bool
    var publicDomain: Bool
    var textToSpeechPermission: String?
    var epub: Epub?
    var pdf: Pdf?
    var webReaderLink: String?
    var accessViewStatus: String?
    var quoteSharingAllowed: Bool
}

struct Epub: Decodable {
    var isAvailable: Bool
}

struct Pdf: Decodable {
    var isAvailable: Bool
}

struct VolumeInfo: Decodable {
    var title: String?
    var subtitle: String?
    var authors: [String]?
    var publisher: String?
    var publishedDate: String?
    var description: String?
    var industryIdentifiers: [IndustryIdentifiers]?
    var readingModes: ReadingModes?
    var pageCount: Int?
    var printType: String?
    var categories: [String]?
    var maturityRating: String?
    var allowAnonLogging: Bool
    var contentVersion: String?
    var panelizationSummary: PanelizationSummary?
    var imageLinks: ImageLinks?
    var language: String?
    var previewLink: String?
    var infoLink: String?
    var canonicalVolumeLink: String?
}

struct PanelizationSummary: Decodable {
    var containsEpubBubbles: Bool
    var containsImageBubbles: Bool
}

struct ImageLinks: Decodable {
    var smallThumbnail: String?
    var thumbnail: String?
}

struct ReadingModes: Decodable {
    var text: Bool
    var image: Bool
}

struct IndustryIdentifiers: Decodable {
    var type: String?
    var identifier: String?
}
