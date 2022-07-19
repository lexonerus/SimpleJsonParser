//
//  ObjectInfo.swift
//  SimpleJsonParser
//
//  Created by Alex Krzywicki on 23.06.2022.
//

import Foundation
import UIKit

class ObjectInfoViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataText: UITextView!
        
    var viewModel: MainViewModel?
    var indexPath: Int?
    var object: Responce.dataItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        for i in 0...(viewModel!.dataObject!.count-1) {
            if viewModel!.dataObject![i].name == viewModel?.objectName {
                object = viewModel!.dataObject![i]
            }
        }
        nameLabel.text = object?.name
        var objData = ""
        print(object!.data)
        if let text = object!.data.text {
            objData += "text: \(text)\n"
        }
        if let url = object!.data.url {
            objData += "url: \(url)\n"
        }
        if let selectedId = object!.data.selectedId {
            objData += "selectedId: \(selectedId)\n"
        }
        
        if let variants = object!.data.variants {
            objData += "variants count: \(variants.count)\n"
        }
        
        
        dataText.text = objData

    }
    

}
