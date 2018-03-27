//
//  PageCell.swift
//  Kindle Tutorial
//
//  Created by Dawid Ramone on 27/02/2018.
//  Copyright © 2018 Dawid Czmyr. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let textLabel : UILabel = {
        let label = UILabel()
        label.text = "SOME TEXT FOR LABEL SOME TEXT FOR LABEL SOME TEXT FOR LABEL SOME TEXT FOR LABEL SOME TEXT FOR LABEL SOME TEXT FOR LABEL SOME TEXT FOR LABEL"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        textLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
