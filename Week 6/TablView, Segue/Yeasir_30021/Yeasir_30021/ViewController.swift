import UIKit

class ViewController: UIViewController {
    var myNewses = [
           News(newsTitle: "Royal Navy Sailors Help Dig Out World's Most Remote Post Office In Antarctica After Heavy Snowfall", newsSubtitle: "World News | Edited by Anoushka Sharma | Sunday December 4, 2022", newsImage: UIImage(named: "image1")!, newsDescription: "Engineers say they used traditional naval ship damage control methods to stabilise the structure, such as wooden stakes and blocks."),
           
           
           News(newsTitle: "Video Shows What Happens When A Dog Owner Tries To Control Pet On Snow-Covered Road", newsSubtitle: "Offbeat | Edited by Nikhil Pandey | Tuesday November 29, 2022", newsImage: UIImage(named: "image2")!, newsDescription: "Lorem ipsum dolor sit amet. Nam vitae beatae in voluptatem quibusdam ex nisi provident. Et accusamus dicta hic quia corrupti in tenetur sapiente nam voluptas enim et omnis possimus in doloremque eveniet aut iste recusandae. In corporis dolorum vel neque nemo qui distinctio debitis qui eaque minima qui dolorem distinctio ab porro maiores. Aut aliquam veritatis et magni voluptatem est praesentium consequatur. </p><p>Est neque similique eum nesciunt officiis sit cumque voluptatem et dolorem quia? Ad molestiae ipsum est omnis tenetur eum laborum harum sed voluptate consequatur aut aperiam enim eum voluptatum voluptatem? Qui veniam enim et placeat blanditiis est nihil maiores. Ea voluptatem iste hic voluptas obcaecati est omnis esse. </p><p>Et sunt quae sed nesciunt nisi eos magnam quibusdam id odit repellendus et nesciunt natus et Quis vitae et alias quaerat. Ut magni necessitatibus eos quidem voluptas et cupiditate ipsum ea cupiditate officia. Ex harum laboriosam in obcaecati placeat hic odio incidunt qui modi impedit ad numquam quos sit iste vero. "),
           
           News(newsTitle: "Watch: Highways Closed, Villages Cut Off After Heavy Snowfall In Kashmir", newsSubtitle: "India News | Press Trust of India | Monday November 14, 2022", newsImage: UIImage(named: "image3")!, newsDescription: "Lorem ipsum dolor sit amet. Nam vitae beatae in voluptatem quibusdam ex nisi provident. Et accusamus dicta hic quia corrupti in tenetur sapiente nam voluptas enim et omnis possimus in doloremque eveniet aut iste recusandae. In corporis dolorum vel neque nemo qui distinctio debitis qui eaque minima qui dolorem distinctio ab porro maiores. Aut aliquam veritatis et magni voluptatem est praesentium consequatur. </p><p>Est neque similique eum nesciunt officiis sit cumque voluptatem et dolorem quia? Ad molestiae ipsum est omnis tenetur eum laborum harum sed voluptate consequatur aut aperiam enim eum voluptatum voluptatem? Qui veniam enim et placeat blanditiis est nihil maiores. Ea voluptatem iste hic voluptas obcaecati est omnis esse. </p><p>Et sunt quae sed nesciunt nisi eos magnam quibusdam id odit repellendus et nesciunt natus et Quis vitae et alias quaerat. Ut magni necessitatibus eos quidem voluptas et cupiditate ipsum ea cupiditate officia. Ex harum laboriosam in obcaecati placeat hic odio incidunt qui modi impedit ad numquam quos sit iste vero. "),
           
           News(newsTitle: "Viral Video: Pet Dog Wants To Go Out But Turns Back After Spotting Snow", newsSubtitle: "Offbeat | Edited by Diksha Rani | Tuesday July 12, 2022", newsImage: UIImage(named: "image4")!, newsDescription: "Lorem ipsum dolor sit amet. Nam vitae beatae in voluptatem quibusdam ex nisi provident. Et accusamus dicta hic quia corrupti in tenetur sapiente nam voluptas enim et omnis possimus in doloremque eveniet aut iste recusandae. In corporis dolorum vel neque nemo qui distinctio debitis qui eaque minima qui dolorem distinctio ab porro maiores. Aut aliquam veritatis et magni voluptatem est praesentium consequatur. </p><p>Est neque similique eum nesciunt officiis sit cumque voluptatem et dolorem quia? Ad molestiae ipsum est omnis tenetur eum laborum harum sed voluptate consequatur aut aperiam enim eum voluptatum voluptatem? Qui veniam enim et placeat blanditiis est nihil maiores. Ea voluptatem iste hic voluptas obcaecati est omnis esse. </p><p>Et sunt quae sed nesciunt nisi eos magnam quibusdam id odit repellendus et nesciunt natus et Quis vitae et alias quaerat. Ut magni necessitatibus eos quidem voluptas et cupiditate ipsum ea cupiditate officia. Ex harum laboriosam in obcaecati placeat hic odio incidunt qui modi impedit ad numquam quos sit iste vero. "),
       ]

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cutomTableViewCell")
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsRoute"{
            let idxpath = tableView.indexPathForSelectedRow
            
            if let segueVC = segue.destination as? SegueVC{
                if idxpath?.section == 0{
                    segueVC.labelTitle = myNewses[idxpath!.row].newsTitle
                    segueVC.imageName = myNewses[idxpath!.row].newsImage
                    segueVC.labelSubTitle = myNewses[idxpath!.row].newsSubtitle
                    segueVC.labelDescription = myNewses[idxpath!.row].newsDescription
                    
                } else if idxpath?.section == 1{
                    segueVC.labelTitle = myNewses[idxpath!.row].newsTitle
                    segueVC.imageName = myNewses[idxpath!.row].newsImage
                    segueVC.labelSubTitle = myNewses[idxpath!.row].newsSubtitle
                    segueVC.labelDescription = myNewses[idxpath!.row].newsDescription
                    
                } else{
                    segueVC.labelTitle = myNewses[idxpath!.row].newsTitle
                    segueVC.imageName = myNewses[idxpath!.row].newsImage
                    segueVC.labelSubTitle = myNewses[idxpath!.row].newsSubtitle
                    segueVC.labelDescription = myNewses[idxpath!.row].newsDescription
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "newsRoute", sender: self)
        
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myNewses.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
        let headingCell = tableView.dequeueReusableCell(withIdentifier: "newsHeadingsRoute", for: indexPath) as! HeadingTableViewCell
            
        let news = myNewses[indexPath.row]
        headingCell.headingImage.image = news.newsImage
        headingCell.headingTitle.text = news.newsTitle
        return headingCell
            
        }
        
        if indexPath.section == 1{
            let subHeadingCell = tableView.dequeueReusableCell(withIdentifier: "newsHeadingWithSubHeadingRoute", for: indexPath) as! SubHeadingTableViewCell
            
            let subHeadingNews = myNewses[indexPath.row]
            
            subHeadingCell.subHeadingImage.image = subHeadingNews.newsImage
            subHeadingCell.subHeadingTitle.text = subHeadingNews.newsTitle
            subHeadingCell.subHeadingSubTitle.text = subHeadingNews.newsSubtitle
            return subHeadingCell
        }
        
        if indexPath.section == 2 {
            let customTVCNews = myNewses[indexPath.row]
            let customTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cutomTableViewCell", for: indexPath) as! TableViewCell
            customTableViewCell.customTVCellImage.image = customTVCNews.newsImage
            customTableViewCell.customTVCellTitle.text = customTVCNews.newsTitle
            customTableViewCell.customTVCellSubTitle.text = customTVCNews.newsSubtitle
            customTableViewCell.customTVCellDescription.text = customTVCNews.newsDescription
            
            
            return customTableViewCell
        }
        
        let detailedCell = tableView.dequeueReusableCell(withIdentifier: "detailedNewsRoute", for: indexPath) as! DetailedTableViewCell
        
        let  detailedNews = myNewses[indexPath.row]
        detailedCell.detailViewImage.image = detailedNews.newsImage
        detailedCell.detailedNews.text = detailedNews.newsDescription
        
        return detailedCell
    }
    
}




// News Struct
struct News {
    var newsTitle: String
    var newsSubtitle: String
    var newsImage: UIImage
    var newsDescription: String
}

