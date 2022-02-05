//
//  CustomCollectionViewCell.swift
//  Lab2_Mit
//
//  Created by user214044 on 2/2/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "Scarlett Johansson")!
        imageView.backgroundColor = .yellow
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "custom"
        label.backgroundColor = .green
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = CGRect(x: 5, y: contentView.frame.height-50, width: contentView.frame.height-10, height: 50)
        myLabel.frame = CGRect(x: 5, y: 0, width: contentView.frame.height-10, height: contentView.frame.height-50)
    }
}
