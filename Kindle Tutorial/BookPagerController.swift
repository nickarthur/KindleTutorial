//
//  BookPagerController.swift
//  Kindle Tutorial
//
//  Created by Dawid Ramone on 26/02/2018.
//  Copyright © 2018 Dawid Czmyr. All rights reserved.
//

import UIKit

class BookPagerController: UICollectionViewController, UICollectionViewDelegateFlowLayout { // protokój do sizeForItem
  
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        navigationItem.title = self.book?.title
        let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout // muszę przypisać do tej klasy, żeby dodało mi więcej opcji zarządzana collectionView
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView?.isPagingEnabled = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseBook))
    }
    
    @objc func handleCloseBook() {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 44 - 20) // minus wysokosc navigationStatusBar i statusBar
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.pages?.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell

        if let pageTxt = book?.pages?[indexPath.item] {
        pageCell.textLabel.text = pageTxt.text
        }
        return pageCell
    }
}
