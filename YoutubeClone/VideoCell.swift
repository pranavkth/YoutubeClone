//
//  VideoCell.swift
//  YoutubeClone
//
//  Created by pranav gupta on 02/05/17.
//  Copyright © 2017 Pranav gupta. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let thumbnailImageView: UIImageView = {
    
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "Taylor")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    
    let userProfileimageView : UIImageView = {
       
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    let titleLabel : UILabel = {
       
        let label = UILabel()
        label.backgroundColor = UIColor.purple
        return label
        
    }()
    
    let subTitleTextView : UITextView = {
        
        let textView = UITextView()
        textView.backgroundColor = UIColor.cyan
        return textView
    }()
    
    
    var separator : UIView = {
       
        let separator = UIView()
        separator.backgroundColor = UIColor.lightGray
        return separator
    
    }()
    
    
    
    func setupViews(){
        self.backgroundColor = UIColor.white
        self.addSubview(thumbnailImageView)
        self.addSubview(separator)
        self.addSubview(userProfileimageView)
        self.addSubview(titleLabel)
        self.addSubview(subTitleTextView)
        
        
        // "H:|-16-[v0]-16-|" means H for horizontal axis - distance - view - distance - screen boundary.V for vertical axis.
        
        // constraints for thumbnailImageView.
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView,userProfileimageView,separator)
        
        // constraints for separator.
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: separator)
        
        
        // constraints for userProfileimageView.
        
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]-8-[v1]-16-|", views: userProfileimageView,titleLabel)
        

        // constraints for TitleLabel.
        
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1]-38-[v2(1)]|", views: thumbnailImageView, titleLabel,separator)
        
        
        // constraints for SubtitletextView.
        
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]-8-[v1]-16-|", views: userProfileimageView,subTitleTextView)
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1]-8-[v2]-16-[v3(1)]|", views: thumbnailImageView, titleLabel,subTitleTextView,separator)
        
    }
    
}


extension UIView{
    
    func addConstraintsWithFormat(format: String , views: UIView...){
        
        var viewsDictionary = [String:UIView]()
        
        //.enumerated takes a se
        for (index,view) in views.enumerated(){
            
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
        
    }
    
    
}
