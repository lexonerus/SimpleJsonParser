//
//  ObjectInfo.swift
//  SimpleJsonParser
//
//  Created by Alex Krzywicki on 23.06.2022.
//

import Foundation
import UIKit
import Kingfisher

class ObjectInfoViewController: UIViewController {
        
    private var nameLabel:  UILabel?
    private var dataText:   UILabel?
    private var pickerView: UIPickerView?
    private var imageView:  UIImageView?
    private var item:       Responce.dataItem?
    
    var viewModel: MainViewModel?
    var indexPath: Int?
    var object: Responce.dataItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        /*

         */
        //setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func getElement(name: String) {
        let array = viewModel!.jsonData!.data
        
        if let i = array.firstIndex(where: { $0.name == name }) {
            print("-----------------")
            self.item = array[i]
            print(self.item)
        }
    }
    
    
    func setupViewElements(object: String) {
        switch object {
        case "hz":
            print("UI for hz")
            getElement(name: "hz")
            setupHzUi()
        case "selector":
            print("UI for selector")
            getElement(name: "selector")
            setupSelectorUi()
        case "picture":
            getElement(name: "picture")
            setupPictureUi()
            print("UI for picture")
        default:
            print("unkown object")
        }
    }
    
    func setupHzUi() {
        setupNameLabel()
        
        dataText = UILabel()
        view.addSubview(dataText!)
        dataText?.textAlignment = .left
        dataText?.translatesAutoresizingMaskIntoConstraints = false
        dataText?.topAnchor.constraint(equalTo: (nameLabel?.bottomAnchor)!, constant: 5).isActive = true
        dataText?.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        dataText?.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 50).isActive = true
        dataText?.heightAnchor.constraint(equalToConstant: 60).isActive = true
        dataText?.numberOfLines = 4
        dataText?.text = "Data text: " + self.item!.data.text!
    }
    
    func setupPictureUi() {
        setupNameLabel()
        
        imageView = UIImageView()
        view.addSubview(imageView!)
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.topAnchor.constraint(equalTo: (nameLabel?.bottomAnchor)!, constant: 5).isActive = true
        imageView?.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        imageView?.heightAnchor.constraint(equalToConstant: 150).isActive   = true
        imageView?.widthAnchor.constraint(equalToConstant: 150).isActive    = true
        DispatchQueue.main.async { [self] in
            let url = URL(string: (self.item?.data.url)!)
            imageView?.contentMode = .scaleToFill
            imageView?.kf.setImage(with: url)
        }
        
    }
    
    func setupSelectorUi() {
        setupNameLabel()
        
        pickerView = UIPickerView()
        pickerView?.delegate = self as UIPickerViewDelegate
        pickerView?.dataSource = self as UIPickerViewDataSource
        view.addSubview(pickerView!)
        pickerView?.translatesAutoresizingMaskIntoConstraints = false
        pickerView?.topAnchor.constraint(equalTo: nameLabel!.bottomAnchor, constant: 30).isActive = true
        pickerView?.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pickerView?.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pickerView?.selectRow(((item?.data.selectedId!)!-1), inComponent: 0, animated: true)

    }
    
    func setupNameLabel() {
        let data = self.item
        nameLabel = UILabel()
        view.addSubview(nameLabel!)
        nameLabel?.textAlignment = .left
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        nameLabel?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        nameLabel?.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        nameLabel?.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 50).isActive = true
        nameLabel?.heightAnchor.constraint(equalToConstant: 25).isActive = true
        nameLabel?.numberOfLines = 1
        nameLabel?.text = "Object name: " + data!.name
    }

}

extension ObjectInfoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return item?.data.variants?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = item?.data.variants?[row].text ?? ""
        return row
    }
    
}
