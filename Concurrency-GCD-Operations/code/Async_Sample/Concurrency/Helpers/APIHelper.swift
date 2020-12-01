//
//  APIHelper.swift
//  Concurrency
//
//  Created by Grace Njoroge on 07/06/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import Foundation
import UIKit

enum Result <T>{
case Success(T)
}

class APIHelper: NSObject {
  
  let query = "flower"
  
  lazy var endPoint: String = {
      return "https://api.flickr.com/services/feeds/photos_public.gne?format=json&tags=\(self.query)&nojsoncallback=1#"
  }()
  
  func getDataWith(completion: @escaping (Result<[[String: AnyObject]]>) -> Void) {
    guard let url = URL(string: endPoint) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else { return }
      guard let data = data else { return }
      do {
        if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
          guard let itemsJsonArray = json["items"] as? [[String: AnyObject]] else {  return  }
          DispatchQueue.main.async {
            completion(.Success(itemsJsonArray))
          }
        }
      } catch let error {
        print(error)
      }
    }.resume()
  }
}
