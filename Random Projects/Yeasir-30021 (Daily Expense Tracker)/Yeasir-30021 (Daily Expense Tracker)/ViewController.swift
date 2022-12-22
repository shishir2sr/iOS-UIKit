import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var expenseTbView: UITableView!
    
    var selectedRow = 0
    var updateData: Expense!
    var tobeAdd = true
    
    var transactions = [Expense]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Expense Tracker"
        configureItems()
        expenseTbView.dataSource = self
        expenseTbView.delegate = self
        
        expenseTbView.register(UINib(nibName: "TableViewHeaderVC", bundle: nil), forHeaderFooterViewReuseIdentifier: "TableViewHeaderVC")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mysegue"{
            if let destination = segue.destination as? AddTransactionVC{
                destination.delegate = self
                
                
                if tobeAdd{
                    

                }else{
                    destination.editData = updateData
                }
            }
        }
    }
    
    
    private func configureItems(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedButton))
        }
    
    @objc func tappedButton() {
                tobeAdd = true
                performSegue(withIdentifier: "mysegue", sender: self)
    }
    
    func calculateTotalExpense()-> Double{
        var totalExpense = 0.0
        for transaction in transactions{
            totalExpense = totalExpense + transaction.expenseAmount
        }
        return totalExpense
    }
}

extension ViewController: TransactionDelegate{
    func updateTableDate(trAmount: Double, trType: String, trDescription: String, trDate: String) {
        transactions[selectedRow] = Expense(expenseType: trType, expenseDescription: trDescription, expenseAmount: trAmount, date: trDate)
        expenseTbView.reloadData()
    }
    
    
    func createTransaction(trAmount: Double, trType: String, trDescription: String, trDate: String) {
        print("\(trAmount)")
        transactions.append(Expense(expenseType: trType, expenseDescription: trDescription, expenseAmount: trAmount, date: trDate))
        expenseTbView.reloadData()
    }
}




extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! TableViewCell
        let expense = transactions[indexPath.row]

        cell.expenseType.text = expense.expenseType
        cell.expenseDescripTion.text = expense.expenseDescription
        cell.expenseDate.text = expense.date
        cell.expenseAmount.text = "$\(expense.expenseAmount)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myHeader = expenseTbView.dequeueReusableHeaderFooterView(withIdentifier: "TableViewHeaderVC") as! TableViewHeaderVC
        
        let tExpense = calculateTotalExpense()
        myHeader.totalAmount.text = "Total Expense"
        myHeader.headerTitle.text = "$\(tExpense)"
        return myHeader
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       50  }
    
    
}


extension ViewController: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editAction = UIContextualAction(style: .normal, title: nil){[weak self] _, _, _ in
            guard let self = self else {return}
            self.handleEditAction(indexPath: indexPath)
        }
        editAction.image = UIImage(systemName: "square.and.pencil")
        
        
        
        let ourEditAction = UISwipeActionsConfiguration(actions: [editAction])
        return ourEditAction
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil){[weak self] _, _, _ in
            guard let self = self else {return}
            
            self.handleDeleteAction(indexPath: indexPath)
        }
        deleteAction.image = UIImage(systemName: "trash")
        
        
        let ourDeleteAction = UISwipeActionsConfiguration(actions: [deleteAction])
        return ourDeleteAction
    }
    
    
    func handleEditAction(indexPath: IndexPath){
        tobeAdd = false
        let selectedRow = indexPath.row
        updateData = transactions[selectedRow] // Expense
        performSegue(withIdentifier: "mysegue", sender: self)
    }
    
    func handleDeleteAction(indexPath: IndexPath){

        expenseTbView.beginUpdates()
       expenseTbView.deleteRows(at: [indexPath], with: .fade)
        transactions.remove(at: indexPath.row)
        expenseTbView.endUpdates()
        expenseTbView.reloadData()
    }
    
    

    
}

