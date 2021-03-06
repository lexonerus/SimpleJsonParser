//
//  ViewControllerViewModel.swift
//  SimpleJsonParser
//
//  Created by Alex Krzywicki on 23.06.2022.
//

import Foundation
import Alamofire

class MainViewModel {
    private let url = "https://pryaniky.com/static/json/sample.json"
    public var jsonData: Responce?
    var dataObject: [Responce.dataItem]?
    var imageUrl        = Dynamic("")
    var labelText       = Dynamic("")
    var viewLabelText   = Dynamic("")
    var indexPath = 0
    var objectName = ""
    
    private func loadJson() {
        let request = AF.request(url)
        
        request.responseDecodable(of: Responce.self) { (response) in
            guard let data = response.value else { return }
            self.jsonData = data
            self.dataObject = data.data
            self.retrieveJsonObjects()
        }
    }
    private func retrieveJsonObjects() {
        for i in 0...(jsonData!.data.count-1) {
            if jsonData!.data[i].name == "picture" {
                print(jsonData!.data[i].data.url!)
                self.imageUrl.value = jsonData!.data[i].data.url!
                self.labelText.value = "\""+jsonData!.data[i].data.text!+"\""
            }

        }
        
        let view = self.jsonData?.view
        for i in 0...(view!.count-1) {
            self.viewLabelText.value += " \(i+1).\(String(view![i]))"
        }
        

    }
    
    public func loadData() {
        loadJson()
    }
    
    

}

