//
//  JsonData.swift
//  SimpleJsonParser
//
//  Created by Alex Krzywicki on 22.06.2022.
//

import Foundation

struct JsonData: Decodable {
    
    let data: [dataItem]
    
    struct dataItem: Decodable {
        let name: String
        let data: dataItemData
    }
    
    struct dataItemData: Decodable {
        let text: String?
        let url: String?
        let selectedId: Int?
        let variants: [variantsItem]?
        
    }
    
    struct variantsItem: Decodable {
        let id: Int
        let text: String
    }
    
    let view: [String]
    
}





