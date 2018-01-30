//
//  AnimatedText.swift
//  NMDb
//
//  Created by Gian Nucci on 30/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import UIKit
import Lottie

class CharacterCell: UICollectionViewCell, Identifiable {
    
    var animationView: LOTAnimationView?
    var char: String? {
        didSet {
            guard let character = char else { return }
            let rect = contentView.bounds
            animationView?.removeFromSuperview()
            animationView = LOTAnimationView(name: character)
            animationView?.contentMode = .scaleAspectFit
            addSubview(animationView!)
            animationView?.frame = CGRect(x: -rect.size.width,
                                          y: 0,
                                          width: rect.size.width*3,
                                          height: rect.size.height)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let rect = contentView.bounds
        animationView?.frame = CGRect(x: -rect.size.width,
                                      y: 0,
                                      width: rect.size.width*3,
                                      height: rect.size.height)
        
    }
    
    func displayCharacter() {
        animationView?.play()
    }
}

class AnimatedTextField: UIView {
    
    let size = UIScreen.main.bounds.size.width/4.0
    var collectionView: UICollectionView?
    var scrollInsets: UIEdgeInsets? {
        didSet {
            guard let insets = scrollInsets else { return }
            collectionView?.contentInset = insets
            scrollToBottom()
        }
    }
    var text: String {
        didSet {
            collectionView?.reloadData()
            scrollToBottom()
        }
    }
    
    init(frame: CGRect, andText text: String) {
        self.text = text
        super.init(frame: frame)
        var frame = self.bounds
        frame.origin.y = (frame.size.height/2.0) - size
        collectionView = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView?.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseIdentifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.white
        addSubview(collectionView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.text = ""
        super.init(coder: aDecoder)
    }
    
    private func scrollToBottom() {
        guard let collectionView = self.collectionView else { return }
        var bottomOffset = CGPoint(x: 0,
                                   y: collectionView.contentSize.height -
                                    collectionView.bounds.size.height +
                                    collectionView.contentInset.bottom)
        bottomOffset.y = max(bottomOffset.y, 0)
        collectionView.setContentOffset(bottomOffset, animated: true)
    }
    
    fileprivate func characterAtIndexPath(indexPath: IndexPath) -> String {
        let start = text.index(text.startIndex, offsetBy: indexPath.row)
        let end = text.index(after: start)
        return String(text[start..<end])
    }

}

extension AnimatedTextField: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds.size.width/4.0
        return CGSize(width: size, height: size*2)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension AnimatedTextField: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return text.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseIdentifier,
                                                       for: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        guard let cell = cell as? CharacterCell else { return }
        
        cell.char = characterAtIndexPath(indexPath: indexPath)
        DispatchQueue.main.asyncAfter(deadline: .now() + (0.3*Double(indexPath.row))) {
            cell.displayCharacter()
        }
    }
}
