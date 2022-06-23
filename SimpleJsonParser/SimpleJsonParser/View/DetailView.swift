//
//  DetailView.swift
//  SimpleJsonParser
//
//  Created by Alex Krzywicki on 23.06.2022.
//

import UIKit

class DetailView: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ViewModel?
    var textForLabel = "Отображаем данные в следующем порядке: "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setup()
    }
    
    func setup() {
        DispatchQueue.main.async {
            self.detailLabel.text = self.textForLabel + self.viewModel!.viewLabelText.value
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toObjectInfo") {
            let nextViewController = segue.destination as! ObjectInfoView
            nextViewController.viewModel = self.viewModel
        }
    }
    
}

extension DetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.jsonData?.view.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewCell", for: indexPath) as? DetailViewCell else {
            fatalError()
        }
        cell.objectLabel.text = String(indexPath.row) + "."
        cell.dataLabel.text = String(viewModel!.jsonData!.view[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(viewModel!.jsonData!.view[indexPath.row])
        viewModel?.objectName = viewModel!.jsonData!.view[indexPath.row]
    }
    
    
}

