import UIKit
protocol TransactionDelegate{
    var tobeAdd:Bool{get set}
    func createTransaction(trAmount: Double, trType: String, trDescription: String,  trDate: String)
    func updateTableDate(trAmount: Double, trType:String, trDescription: String, trDate: String)
}

class AddTransactionVC: UIViewController {
    
    var delegate: TransactionDelegate?
    
    var editData: Expense!
    
    @IBOutlet weak var addOrEditButton: UIButton!
    
    @IBOutlet weak var transactionDate: UIDatePicker!
    
    @IBOutlet weak var transactionAmount: UITextField!
    
    @IBOutlet weak var transactionDescription: UITextField!
    
    @IBOutlet weak var transactionType: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Transaction"
        transactionAmount.keyboardType = .numberPad
        
        if delegate?.tobeAdd == false{
            transactionType.text = editData.expenseType
            transactionAmount.text = "\(editData.expenseAmount)"
            transactionDescription.text = editData.expenseDescription
            addOrEditButton.titleLabel?.text = "Update"
        }
        
    }
 
    @IBAction func addTransaction(_ sender: Any) {
        if transactionAmount.text != "" &&  transactionDescription.text != "" && transactionType.text != ""{
    
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle =  .medium
            dateFormatter.timeStyle = .none
            
            let formattedDate = dateFormatter.string(from: transactionDate.date)
            
            if delegate?.tobeAdd == true{
            delegate?.createTransaction(trAmount: Double(transactionAmount.text!)!, trType: transactionType.text! , trDescription: transactionDescription.text!, trDate: formattedDate)
            navigationController.self?.popViewController(animated: true)
                
            }
            
            else{
                delegate?.updateTableDate(trAmount: Double(transactionAmount.text!)!, trType: transactionType.text!, trDescription: transactionDescription.text!, trDate: formattedDate)
                navigationController.self?.popViewController(animated: true)
                
            }
        }
        
    }
    
}
