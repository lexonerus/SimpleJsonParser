//
//  ViewController.swift
//  SimpleJsonParser
//
//  Created by Alex Krzywicki on 22.06.2022.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var imageUrl = ""
    var viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        viewModel.loadData()
        bindViewModel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDetailView") {
            let nextViewController = segue.destination as! DetailViewController
            nextViewController.viewModel = self.viewModel
        }
    }
    
    func bindViewModel() {
        viewModel.imageUrl.bind({ (imageUrl) in
            DispatchQueue.main.async {
                let url = URL(string: imageUrl)
                self.image.contentMode = .scaleToFill
                self.image.kf.setImage(with: url)
            }
        })
        viewModel.labelText.bind({ (labelText) in
            DispatchQueue.main.async {
                self.label.text = labelText
            }
        })
    }

    


}

