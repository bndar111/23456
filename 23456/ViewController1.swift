import UIKit
class ViewController1: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var TabelName: UITextField!
    @IBOutlet weak var TableView: UITableView!
    
    var arrNames = ["Go To Work","Go To Mosq","Go To Shopping","Go To Gym","Do The Homework","Go To Sleep"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let btnAdd1 = UserDefaults.standard.string(forKey: "btnAdd")
//        TabelName.text = btnAdd1
        TableView.delegate = self
        TableView.dataSource = self
    }
    @IBAction func btnEdit(_ sender: Any) {
        TableView.isEditing = !TableView.isEditing
        
    }
    @IBAction func btnAdd(_ sender: Any) {
        // الاضافة
//        UserDefaults.standard.set(btnAdd, forKey: "btnAdd")
        if TabelName.text == ""{return}
        if let text = TabelName.text {
            arrNames.append(text)
            let indaPath = IndexPath(row: arrNames.count - 1, section: 0)
            TableView.insertRows(at: [indaPath], with: .automatic)
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
//            tableView.endUpdates()
//            completionHandler(true)
        }
//        favoriteAction.image = UIImage(systemName: "pencil")
        deletAcAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deletAcAction])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    }
    




