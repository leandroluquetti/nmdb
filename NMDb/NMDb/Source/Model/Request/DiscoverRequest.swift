//
//  DiscoverRequest.swift
//  NMDb
//
//  Created by Gian Nucci on 30/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

struct DiscoverRequest: Codable {
    
    let apiKey = ApiProvider.apiSecret
    var sortBy: String
    var language: String
    var includeVideo: Bool
    var primaryReleaseGreaterThan: String
    var primaryReleaseLowerThan: String
    var page: Int
    
    init(sortBy: String = "primary_release_date.asc",
         language: String = "en-US",
         includeVideo: Bool = true,
         primaryReleaseGreaterThan: String = "",
         primaryReleaseLowerThan: String = "",
         page: Int = 1) {
        
        self.sortBy = sortBy
        self.language = language
        self.includeVideo = includeVideo
        self.primaryReleaseGreaterThan = primaryReleaseGreaterThan
        self.primaryReleaseLowerThan = primaryReleaseLowerThan
        self.page = page
    }
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case language
        case includeVideo = "include_video"
        case primaryReleaseGreaterThan = "primary_release_date.gte"
        case primaryReleaseLowerThan = "primary_release_date.lte"
        case page
        case sortBy = "sort_by"
    }
}
