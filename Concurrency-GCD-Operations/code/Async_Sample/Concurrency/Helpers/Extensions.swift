//
//  Extensions.swift
//  Concurrency
//
//  Created by Grace Njoroge on 08/06/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

let imageToCache = NSCache<NSString, UIImage>()
//add image caching
extension UIImageView {
    func loadImageUsingCacheWithURLString(_ URLString: String) {
        self.image = nil
      if let cachedImage = imageToCache.object(forKey: NSString(string: URLString)) {
        self.image = cachedImage
        return
      }
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil {
                  print("\(String(describing: error))")
                    return
                }
              
              guard let data = data, let downloadedImage = UIImage(data: data) else { return }
              DispatchQueue.main.async {
                self.image = downloadedImage
                imageToCache.setObject(downloadedImage, forKey: NSString(string: URLString))
              }
              
            }).resume()
        }
    }
}
