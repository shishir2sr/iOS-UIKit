

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createText()
    }
    
    private func createText(){
        // Save some text in a .text file
        // 1. get URL for the document dir
        // 2. create URL for subfolder
        // 3. create a subfolder
        // 4. create URL for our text URL
        // 5. convert string text to data
        // 6. create/save our text file
        // 7. Read file contents
        
        let  fileManager = FileManager.default
        
        // Document directory URL
        guard let documentDirURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else{
            return
        }
        
        // create URL for subfolder
        let folderURL = documentDirURL.appendingPathComponent("Newfolder").appendingPathComponent("newfolder2").appendingPathComponent("newfolder3")
        do{
            try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
        }catch{
            print(error)
        }
        
        
        //MARK: Write
        let message = "Hello world"
        let data = message.data(using: .utf8)
        
        let fileURL = folderURL.appendingPathComponent("test.text")
        print(fileURL)
        
        fileManager.createFile(atPath: fileURL.path, contents: data)
        
        
        //MARK: Read
        do {
            let readData = try Data(contentsOf: fileURL)
            let readStr = String(data: readData, encoding: .utf8)
            print(readStr!)
        } catch
        {
            print(error)
        }
        
    }
    
   
    
    /**
     ## UIImage(data)
     UIImage ke data te convert korte hobe
    data ta filepath e pas skorte hobe
     abar read korte gele image data ke uiimage e convert korte hobe.
     
     */
    
    
}

