//
//  ViewController.swift
//  Queues
//
//  Created by Grace Njoroge on 01/06/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController {
  
  let solarImageUrls =   ["https://www.solarsystemscope.com/textures/download/2k_stars.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_moon.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_sun.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_stars_milky_way.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_ceres_fictional.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_haumea_fictional.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_earth_clouds.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_earth_nightmap.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_earth_daymap.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_neptune.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_uranus.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_saturn_ring_alpha.png",
                      "https://www.solarsystemscope.com/textures/download/2k_saturn.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_jupiter.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_mars.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_venus_atmosphere.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_venus_surface.jpg",
                      "https://www.solarsystemscope.com/textures/download/2k_mercury.jpg"]
  

  override func viewDidLoad() {
    super.viewDidLoad()
  }


}

extension MainViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return solarImageUrls.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
    let url = URL(string: solarImageUrls[indexPath.row])
   
    //Load image by GCD
    DispatchQueue.global().async {
      guard let data = try? Data(contentsOf: url!) else { return }
      DispatchQueue.main.async {
        cell.imageCell.image = UIImage(data: data)
      }
    }
    
    /*
     Without GCD, the project will hang here.
    if let data = try? Data(contentsOf: url!)  {
      cell.imageCell.image = UIImage(data: data)
    }
  */
    return cell
  }

}
