import UIKit

class DataClass{
    static var myNotes = [Note(noteTitle: "First note", noteDescription: "Loream epsum LoreamepsumLoream epsumLoream epsum"),
                          Note(noteTitle: "First note", noteDescription: "Loream epsum Loream epsumLoream epsumLoream epsum"),
                          Note(noteTitle: "First note", noteDescription: "Loream epsum Loream epsumLoream epsumLoream epsum"),
                          Note(noteTitle: "First note", noteDescription: "Loream epsum Loream epsumLoream epsumLoream epsum"),
                          Note(noteTitle: "First note", noteDescription: "Loream epsum Loream epsumLoream epsumLoream epsum"),
                          ]
}


// MARK: - Main View Controller
class ViewController: UIViewController {
    var notes = DataClass.myNotes
    
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "route"{
            
        }
    }
    
    @IBAction func addNote(_ sender: Any) {
        notes.append(Note(noteTitle: "Default Note", noteDescription: "Nothing"))
        TableView.reloadData()
    }
}


// MARK: - Delegate
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "route", sender: self)
    }
    
    
}


// MARK: - Data source
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    // Return cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "noteTVC", for: indexPath) as! NoteTableViewCell
        
        tableViewCell.noteTitle.text = note.noteTitle
        tableViewCell.noteDescription.text = note.noteDescription
        return tableViewCell
    }
    
    // Editing Style
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            notes.remove(at: indexPath.row)
            tableView.endUpdates()
        }
    }
}

// MARK: - Data Struct

struct Note{
    var noteTitle: String
    var noteDescription: String
}


