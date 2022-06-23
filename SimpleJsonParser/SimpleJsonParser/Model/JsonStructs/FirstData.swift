//
//  TestFirstData.swift
//  SimpleJsonParser
//
//  Created by Alex Krzywicki on 23.06.2022.
//

import Foundation

struct FirstData: Decodable {
    let name: String
    let data: SecondData
}
