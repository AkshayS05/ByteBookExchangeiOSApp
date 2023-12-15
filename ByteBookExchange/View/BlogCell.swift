//
//  BlogCell.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-13.
//

import UIKit

class BlogCell: UITableViewCell {

    @IBOutlet weak var blogBubble: UIView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var blogLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
