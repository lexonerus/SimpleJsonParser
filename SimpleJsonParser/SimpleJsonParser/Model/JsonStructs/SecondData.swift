//
//  TestSecondData.swift
//  SimpleJsonParser
//
//  Created by Alex Krzywicki on 23.06.2022.
//

import Foundation

struct SecondData: Decodable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variants]?
}
