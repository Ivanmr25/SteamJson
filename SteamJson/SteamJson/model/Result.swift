//
//  Result.swift
//  SteamJson
//
//  Created by Usuario on 26/01/2023.
//  Copyright © 2023 Usuario. All rights reserved.
//

import UIKit
class Result: Codable {
    let applist:Games?
    private enum CodingKeys: String, CodingKey{
        case applist = "applist"
    }
}

struct Games: Codable {
    let games:[Game]?
    private enum CodingKeys: String, CodingKey{
        case games = "apps"
    }
}
struct Game: Codable {
    let appid:Int?
    let name:String?
    private enum CodingKeys: String, CodingKey{
        case appid = "appid"
        case name = "name"
    }
}
