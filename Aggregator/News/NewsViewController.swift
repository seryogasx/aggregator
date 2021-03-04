import UIKit

class NewsViewController: UIViewController {
    
    let data = [
        UIColor.green
    ]
    
    let cellID = "NewsTableCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
    }
    
    func tableViewSetup() {
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellWithReuseIdentifier: cellID)
    }
}
