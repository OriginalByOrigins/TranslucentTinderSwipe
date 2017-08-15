//
//  Girl.swift
//  TranslucentTinderSwipe
//
//  Created by Harry Cao on 16/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class Girl {
  let name: String
  let quote: String
  let image: UIImage
  
  init(with dictionary: [String: Any]) {
    self.name = dictionary["name"] as! String
    self.quote = dictionary["quote"] as! String
    self.image = dictionary["image"] as! UIImage
  }
}
