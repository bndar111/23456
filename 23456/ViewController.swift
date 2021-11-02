import UIKit

protocol UpdateDelegate {
    func updateName(name:String)
}

class ViewController: UIViewController {
    
    var name: String = ""
    var delegate : UpdateDelegate!
    
    @IBOutlet weak var ebdete1: UITextField!
    @IBAction func BtnAdd2(_ sender: Any) {
        delegate.updateName(name: ebdete1.text!)
        navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ebdete1.text = name
    }
}

