
import Foundation

struct Expense{
    var expenseType: String
    var expenseDescription: String
    var expenseAmount: Double
    var date: String
}

var dummyData = [
    Expense(expenseType: "Home and Garden", expenseDescription: "Sunflower tree", expenseAmount: 50, date: "November 9"),
    Expense(expenseType: "Transportation", expenseDescription: "Dhaka to sunamganj", expenseAmount: 890, date: "December 13")
]
