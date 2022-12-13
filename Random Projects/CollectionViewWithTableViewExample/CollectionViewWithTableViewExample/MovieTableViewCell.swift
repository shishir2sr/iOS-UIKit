
import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
    }
}

extension MovieTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberofItem = movieData[movieCollectionView.tag].movieList.count
        return numberofItem
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let movieList = movieData[movieCollectionView.tag].movieList
        let collectionViewCell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionviewcell", for: indexPath) as! MovieCollectionViewCell
        
        collectionViewCell.movieImage.image = UIImage(named: movieList[indexPath.row])
        
        return collectionViewCell
    }
    
    
}

extension MovieTableViewCell: UICollectionViewDelegate{
    
}


extension MovieCollectionViewCell: UICollectionViewFlowLayout{
    
}



