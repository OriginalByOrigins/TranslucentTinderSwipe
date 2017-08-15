//
//  VC+panGesture.swift
//  TranslucentTinderSwipe
//
//  Created by Harry Cao on 16/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

extension ViewController {
  @objc
  func handlePanCard (_ sender: UIPanGestureRecognizer) {
    let translation = sender.translation(in: view)
    // Tranlation
    cardVisualEffectView.center = CGPoint(x: originalCardCenter.x + translation.x, y: originalCardCenter.y + translation.y)
    // Rotation and Scale
    let rotationAngle = (translation.x/(self.view.frame.width/2))*(35/180*CGFloat.pi)
    let scale = min(1, sqrt(100/abs(translation.x)))
    cardVisualEffectView.transform = CGAffineTransform(rotationAngle: rotationAngle).scaledBy(x: scale, y: scale)
    
    // Love Hate Image
    if translation.x > 0 {
      loveHateImageView.image = #imageLiteral(resourceName: "love")
    } else if translation.x < 0 {
      loveHateImageView.image = #imageLiteral(resourceName: "nah")
    }
    loveHateImageView.alpha = abs(translation.x/self.view.frame.width)
    
    if sender.state == .ended {
      if cardVisualEffectView.center.x < 75 {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
          self.cardVisualEffectView.center = CGPoint(x: self.cardVisualEffectView.center.x - 200, y: self.cardVisualEffectView.center.y + 75)
          self.cardVisualEffectView.alpha = 0
        }, completion: { (completed) in
          self.resetCard()
        })
        
        return
      } else if cardVisualEffectView.center.x > self.view.frame.width - 75 {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
          self.cardVisualEffectView.center = CGPoint(x: self.cardVisualEffectView.center.x + 200, y: self.cardVisualEffectView.center.y + 75)
          self.cardVisualEffectView.alpha = 0
        }, completion: { (completed) in
          self.resetCard()
        })
        
        return
      }
      
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
        self.cardVisualEffectView.center = self.originalCardCenter
        self.cardVisualEffectView.transform = .identity
        self.loveHateImageView.alpha = 0
      }, completion: { (completed) in
        // may do smth
      })
    }
  }
  
  func resetCard() {
    cardVisualEffectView.center = originalCardCenter
    cardVisualEffectView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    setRandomGirl()
    loveHateImageView.alpha = 0
    
    UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
      self.cardVisualEffectView.alpha = 1
      self.cardVisualEffectView.transform = .identity
    }) { (completed) in
      // maydo smth
    }
  }
}
