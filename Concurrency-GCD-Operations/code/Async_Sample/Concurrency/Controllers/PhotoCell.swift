//
//  PhotoCell.swift
//  Concurrency
//
//  Created by Grace Njoroge on 07/06/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

  lazy var photoImageview: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.translatesAutoresizingMaskIntoConstraints = false
    iv.backgroundColor = .systemPink
    iv.layer.masksToBounds = true
    return iv
  }()
  
  let authorLabel: UILabel = {
    let label = UILabel()
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.textAlignment = .center
    label.lineBreakMode = .byWordWrapping
    return label
  }()
  
  let dividerLineView: UIView = {
    let v = UIView()
    v.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
    v.translatesAutoresizingMaskIntoConstraints = false
    return v
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    isUserInteractionEnabled = false
    
    addSubview(photoImageview)
    addSubview(authorLabel)
    addSubview(dividerLineView)
    
    photoImageview.topAnchor.constraint(equalTo: topAnchor).isActive = true
    photoImageview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    photoImageview.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    photoImageview.heightAnchor.constraint(equalTo: widthAnchor).isActive = true
    
    authorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    authorLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
    authorLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
    authorLabel.topAnchor.constraint(equalTo: photoImageview.bottomAnchor).isActive = true
    
    dividerLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    dividerLineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
    dividerLineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
    dividerLineView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor).isActive = true
    
  }
  
  func setPhotoCellWith(photo: Photo) {
    //update UI
    DispatchQueue.main.async {
      self.authorLabel.text = photo.authorName
      if let url = photo.imageUrl {
        self.photoImageview.loadImageUsingCacheWithURLString(url)
      }
    }

  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
