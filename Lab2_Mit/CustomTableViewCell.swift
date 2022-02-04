//
//  CustomTableViewCell.swift
//  Lab2_Mit
//
//  Created by user214044 on 31/1/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 6, width: self.frame.width + 50, height: 110))
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var userImage: UIImageView = {
        let userImage = UIImageView(frame: CGRect(x: 4, y: 6, width: 104, height: 104))
        userImage.contentMode = .scaleAspectFit
        return userImage
    }()
    
    lazy var namelbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 116, y: 7, width: backView.frame.width - 116, height: 30))
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    lazy var agelbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 116, y: 42, width: backView.frame.width - 116, height: 30))
        lbl.textAlignment = .left
        return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        backView.layer.cornerRadius = 5
        backView.clipsToBounds = true
        userImage.layer.cornerRadius = 52
        userImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        addSubview(backView)
        backView.addSubview(userImage)
        backView.addSubview(namelbl)
        backView.addSubview(agelbl)
    }

}
