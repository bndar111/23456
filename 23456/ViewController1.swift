//
//  ViewController1.swift
//  23456
//
//  Created by بندر عبيد ثاري الرشيدي on 25/03/1443 AH.
//

import UIKit

class ViewController1: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var TabelName: UITextField!
    @IBOutlet weak var TableView: UITableView!
//    var arrSections = ["Tiem"]
    var arrNames = ["Go To Work","Go To Mosq","Go To Shopping","Go To Gym","Do The Homework","Go To Sleep"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TableView.delegate = self
        TableView.dataSource = self
    }
    @IBAction func btnEdit(_ sender: Any) {
        TableView.isEditing = !TableView.isEditing
        
    }
    @IBAction func btnAdd(_ sender: Any) {
        
        if let text = TabelName.text {
            arrNames.append(text)
            let indaPath = IndexPath(row: arrNames.count - 1, section: 0)
            TableView.beginUpdates()
            TableView.insertRows(at: [indaPath], with: .automatic)
            TableView.endUpdates()
            TabelName.text = ""
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = arrNames[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        arrNames.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deletAcAction = UIContextualAction(style: .destructive, title: "حذف") {( action, view, completionHandler) in
            self.arrNames.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            completionHandler(true)
        }
        
        let favoriteAction = UIContextualAction(style: .normal, title: "") {
            ( _, _,_ ) in
            
             print("user added to favorite list")
        }
        favoriteAction.image = UIImage(systemName: "heart")
        deletAcAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deletAcAction, favoriteAction])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
