import UIKit
import PhotosUI

class ViewController: UIViewController {
    var changeImagePicker = true
    var movieData = [
        UIImage(named: "bmx"),
        UIImage(named: "filmmaker"),
        UIImage(named: "happynewyear"),
        UIImage(named: "jazz"),
        UIImage(named: "rugby"),
        UIImage(named: "inception"),
        UIImage(named: "godzilla"),
        UIImage(named: "joker"),
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavItems()
        configCollectionView()
        collectionView.collectionViewLayout = listLayoutSection()
        
    }
 
    
    @IBAction func floatingActionButton(_ sender: UIButton) {
        print("foating action button pressed")
        if changeImagePicker{
            pickImage()
            changeImagePicker = !changeImagePicker
        }else{
            pickImageUsingImagePicker()
            changeImagePicker = !changeImagePicker
        }
        
    }
    
    
    func pickImage() {
           var picker = PHPickerConfiguration()
           picker.filter = .images
           picker.selectionLimit = 5
           let controller = PHPickerViewController(configuration: picker)
           controller.delegate = self
           present(controller, animated: true, completion: nil)
       }
    
    
    func pickImageUsingImagePicker() {
           let picker = UIImagePickerController()
           picker.sourceType = .photoLibrary
           picker.delegate = self
           present(picker, animated: true, completion: nil)
       }
    
    
    // grid layout
    private func gridLayoutSection() -> UICollectionViewLayout {
               
        let item1 = CollectionVL.createItem(height: .fractionalHeight(1), width: .fractionalWidth(1/2), spacing: 3)

        let horizontalGroup = CollectionVL.createGroup(height: .fractionalHeight(2/9), width: .fractionalWidth(1), alignment: .horizontal, items: [item1,item1])
        
        horizontalGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 3)
        
                let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.orthogonalScrollingBehavior = .none
               
    
                return UICollectionViewCompositionalLayout(section: section)
        } // grid Layout
    
    // List layout
    private func listLayoutSection() -> UICollectionViewLayout {
               
        let item1 = CollectionVL.createItem(height: .fractionalHeight(1), width: .fractionalWidth(1), spacing: 3)

        let group = CollectionVL.createGroup(height: .fractionalHeight(1/2), width: .fractionalWidth(1), alignment: .horizontal, items: [item1,item1])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
        } // List Layout
    
    
    
    
    
    func configNavItems(){
         // nav buttons
        let listButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.grid.1x2.fill")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(listButtonPressed))
        
        let gridButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.grid.2x2.fill")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(gridButtonPressed))
         
        //nav title
        let navTitle = UILabel()
        navTitle.textColor = UIColor.darkGray
        navTitle.text = "Gallery"
        navTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 22.0)!
        
        //configuration
        self.navigationItem.rightBarButtonItems = [listButton, gridButton]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: navTitle)
        
    } //config items
    
    @objc func gridButtonPressed() {
        
        collectionView.startInteractiveTransition(to: gridLayoutSection()){ [weak self] _,_ in
                guard let self = self else{return}
            
        }
        collectionView.finishInteractiveTransition()
        print("grid layout pressed")
        
    }
    
    // list layout
    @objc func listButtonPressed() {

        self.navigationController?.navigationBar.topItem?.rightBarButtonItem?.customView?.isUserInteractionEnabled = false
        
        collectionView.startInteractiveTransition(to: listLayoutSection()){ [weak self] _,_ in
            guard let self = self else{return}

            self.navigationController?.navigationBar.topItem?.rightBarButtonItem?.customView?.isUserInteractionEnabled = true
        }
        
        collectionView.finishInteractiveTransition()
        print("list layout pressed")
        
    }
    
    
    
   
    
    private func configCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
    } //config collectionview
    
} //view controller



extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let image = movieData[indexPath.row]{
            showActionSheet(image: image)
        }
        else{
            return
        }
        
        
    }
    
    func showActionSheet(image:UIImage){
         let actionSheet = UIAlertController(title: "Save Image", message: "Do you want to save this image?", preferredStyle: .actionSheet)
         
         actionSheet.addAction(UIAlertAction(title: "Save", style: .default, handler: {[weak self] (action:UIAlertAction) in
             guard let self = self else { return}
             self.saveImage(image: image)
         }))
         
         actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
         
         self.present(actionSheet, animated: true, completion: nil)
     }
    
    
    func saveImage(image: UIImage) {
                let fileManager = FileManager.default
                guard let documentDirURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else{
                    return
                }
          
                let folderURL = documentDirURL.appendingPathComponent("images")
                do{
                    try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
                }catch{
                    print(error)
                }
                
                //MARK: Write
                let image = image
                let data = image.pngData()
                let fileURL = folderURL.appendingPathComponent(" image - \(Date.now.formatted(date: .omitted, time: .shortened))")
                fileManager.createFile(atPath: fileURL.path, contents: data)
       }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as! CVCell
        cell.imageView.image = movieData[indexPath.row]
        return cell
    }
    
    
} // UicollectionviewDelegate and UICollectionViewDataSource

extension ViewController: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
                results.forEach { (result) in
                    result.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                        if let error = error{
                            print(error.localizedDescription)
                            return
                        }
                        guard let image = image as? UIImage else {return}
                        DispatchQueue.main.async {
                            self.movieData.append(image)
                            self.collectionView.reloadData()
                }
            }
        }
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            guard let image = info[.originalImage] as? UIImage else {return}
            movieData.append(image)
            collectionView.reloadData()
        }
    
}

