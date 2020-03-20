//
//  App.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/19/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import Foundation

public struct App: Codable {
    public let isGameCenterEnabled: Bool?
    public let screenshotUrls: [String]?
    public let ipadScreenshotUrls: [String]?
    public let appletvScreenshotUrls: [String]?
    public let artworkUrl60: String?
    public let artworkUrl512: String?
    public let artworkUrl100: String?
    public let artistViewUrl: String?
    public let advisories: [String]?
    public let supportedDevices: [String]?
    public let kind: String?
    public let features: [String]?
    public let trackCensoredName: String?
    public let languageCodesISO2A: [String]?
    public let fileSizeBytes: String?
    public let contentAdvisoryRating: String?
    public let trackViewUrl: String?
    public let trackContentRating: String?
    public let formattedPrice: String?
    public let sellerName: String?
    public let trackId: Int?
    public let trackName: String?
    public let minimumOsVersion: String?
    public let releaseDate: String?
    public let primaryGenreId: Int?
    public let currentVersionReleaseDate: String?
    public let releaseNotes: String?
    public let isVppDeviceBasedLicensingEnabled: Bool?
    public let primaryGenreName: String?
    public let genreIds: [String]?
    public let currency: String?
    public let version: String?
    public let wrapperType: String?
    public let artistId: Int?
    public let artistName: String?
    public let genres: [String]?
    public let price: Double?
    public let description: String?
    public let bundleId: String?
}
