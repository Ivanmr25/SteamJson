//
//  ResultGame.swift
//  SteamJson
//
//  Created by Usuario on 26/01/2023.
//  Copyright © 2023 Usuario. All rights reserved.
//

import UIKit
class ResultGame: Codable {
    let data:Data?
    private enum CodingKeys: String, CodingKey{
        case data = "data"
    }
}


struct Data: Codable {
    let nombre:String?
    let descrip:String?
    let url:String?
    
    private enum CodingKeys: String, CodingKey{
        case nombre = "name"
        case descrip = "detailed_description"
        case url = "header_image"
       
    }
}

