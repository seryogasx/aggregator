import UIKit

class NewsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(color:UIColor, width: CGFloat, height: CGFloat) {
        backgroundColor = color
        frame.size = CGSize(width: width, height: 2)
    }

}
