//
//  ViewController.swift
//  Extension ile Basit TableView
//
//  Created by Yavuz Güner on 7.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var countries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries = ["Germany","Italy","France","Spain","Morocco","Tunusia","Switzerland","Sweeden"]
        
        tableView.dataSource = self
        tableView.delegate = self
    }


}

//Daha kibar ve modüler hale getirmiş oluruz.
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellName", for: indexPath)
        
        //Prototype üzerinde bir label var varsayıyoruz...
        cell.textLabel?.text = countries[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Seçilen ülke:\(countries[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, boolValue) in
            print("\(self.countries[indexPath.row])yi sil.")
        }
        let updateAction = UIContextualAction(style: .normal, title: "Update") { (contextualAction, view, boolValue) in
            print("\(self.countries[indexPath.row])yi düzenle.")
        }
        return UISwipeActionsConfiguration(actions: [deleteAction,updateAction])
    }

}
