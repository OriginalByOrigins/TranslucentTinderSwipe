//
//  VC+setup.swift
//  TranslucentTinderSwipe
//
//  Created by Harry Cao on 16/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import Foundation

extension ViewController {
  func setupBg() {
    self.view.addSubview(bgImageView)
    
    _ = bgImageView.constraintAnchorTo(top: self.view.topAnchor, topConstant: 0, bottom: self.view.bottomAnchor, bottomConstant: 0, left: self.view.leftAnchor, leftConstant: 0, right: self.view.rightAnchor, rightConstant: 0)
  }
  
  func setupCard() {
    self.view.addSubview(cardVisualEffectView)
    
    _ = cardVisualEffectView.constraintCenterTo(centerX: nil, xConstant: nil, centerY: self.view.centerYAnchor, yConstant: 40)
    _ = cardVisualEffectView.constraintAnchorTo(top: nil, topConstant: nil, bottom: nil, bottomConstant: nil, left: self.view.leftAnchor, leftConstant: 40, right: self.view.rightAnchor, rightConstant: -40)
    _ = cardVisualEffectView.constraintSizeToMultipler(widthAnchor: nil, widthMultiplier: nil, heightAnchor: self.view.widthAnchor, heightMultiplier: 1.15)
    
    cardVisualEffectView.contentView.addSubview(cardImageView)
    _ = cardImageView.constraintAnchorTo(top: nil, topConstant: nil, bottom: cardVisualEffectView.bottomAnchor, bottomConstant: -20, left: cardVisualEffectView.leftAnchor, leftConstant: 20, right: cardVisualEffectView.rightAnchor, rightConstant: -20)
    _ = cardImageView.constraintSizeToMultipler(widthAnchor: nil, widthMultiplier: nil, heightAnchor: cardImageView.widthAnchor, heightMultiplier: 1.2)
    
    cardVisualEffectView.contentView.addSubview(loveHateImageView)
    _ = loveHateImageView.constraintCenterTo(centerX: cardImageView.centerXAnchor, xConstant: 0, centerY: cardImageView.centerYAnchor, yConstant: 0)
    _ = loveHateImageView.constraintSizeToMultipler(widthAnchor: cardImageView.widthAnchor, widthMultiplier: 0.8, heightAnchor: cardImageView.widthAnchor, heightMultiplier: 0.8)
    
    cardVisualEffectView.contentView.addSubview(cardLabelStackView)
    _ = cardLabelStackView.constraintAnchorTo(top: cardVisualEffectView.topAnchor, topConstant: 10, bottom: cardImageView.topAnchor, bottomConstant: -20, left: cardVisualEffectView.leftAnchor, leftConstant: 0, right: cardVisualEffectView.rightAnchor, rightConstant: 0)
    
  }
  
  func setupMainLabel() {
    self.view.addSubview(mainLabel)
    
    _ = mainLabel.constraintAnchorTo(top: self.view.topAnchor, topConstant: 40, bottom: cardVisualEffectView.topAnchor, bottomConstant: 0, left: self.view.leftAnchor, leftConstant: 0, right: self.view.rightAnchor, rightConstant: 0)
  }
}
