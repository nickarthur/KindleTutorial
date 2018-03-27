//
//  BookCell.swift
//  Kindle Tutorial
//
//  Created by Dawid Ramone on 25/02/2018.
//  Copyright © 2018 Dawid Czmyr. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    var book: Book? {
        didSet {
            titleLabel.text = book?.title
            authorLabel.text = book?.author
            
            guard let imageCoverUrl = book?.coverImageUrl else {return}
            guard let url = URL(string:imageCoverUrl) else { return }
            URLSession.shared.dataTask(with: url) { (data, respone, error) in
                if let error = error {
                    print(error)
                }
                if let dataImg = data {
                    let coverImage = UIImage(data: dataImg)
                    DispatchQueue.main.async {
                        self.coverImgaeView.image = coverImage
                    }
                }
            }.resume()
        }
    }
    
    private let coverImgaeView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false // dezaktywuje stary styl i pozala na użycie AutoLayout
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "this is a text for the title of our book inside of our cell"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "this is some author from the book tht we have in this row"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier
         )
        backgroundColor = .clear // domyślnie komórki mają białe tło
        
        addSubview(coverImgaeView)
        coverImgaeView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        coverImgaeView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        coverImgaeView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true // bottom constant zawsze MINUS
        coverImgaeView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: coverImgaeView.rightAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        
        
        addSubview(authorLabel)
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: coverImgaeView.rightAnchor, constant: 8).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
