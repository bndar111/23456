import UIKit

class ViewController1: UIViewController,UITableViewDelegate,UITableViewDataSource , UpdateDelegate {

    @IBOutlet weak var TabelName: UITextField!
    @IBOutlet weak var TableView: UITableView!
    
    var Namber:Int = 0
    func updateName(name: String) {
        arrNames[Namber] = name
        TableView.reloadData()
    }
    var arrNames = ["Go To Work","Go To Mosq","Go To Shopping","Go To Sleep"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
    }
    @IBAction func btnEdit(_ sender: Any) {
        TableView.isEditing = !TableView.isEditing
        
    }
    @IBAction func btnAdd(_ sender: Any) {
        if TabelName.text == ""{return}
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
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        arrNames.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deletAcAction = UIContextualAction(style: .destructive, title: "حذف") {( action, view, completionHandler) in
            self.arrNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }

        deletAcAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deletAcAction])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVC =
        (storyboard?.instantiateViewController(withIdentifier: "Ubdete"))as! ViewController
        newVC.delegate = self
        Namber = indexPath.row
        newVC.name = arrNames[indexPath.row]
        navigationController?.pushViewController(newVC, animated: true)
    }

}

