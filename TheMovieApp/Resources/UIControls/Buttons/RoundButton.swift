//
//  CustomUIElements.swift
//  TheMovieApp
//
//  Created by MacAdrian on 08/07/2021.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {

  private let customBGColor: UIColor = Colors().Main
  @IBInspectable var cornerRadius: CGFloat = 15 {
    didSet {
      refreshCorners(value: cornerRadius)
    }
  }

  @IBInspectable var backgroundImageColor: UIColor = Colors().Main {
    didSet {
      refreshColor(color: customBGColor)
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    sharedInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    sharedInit()
  }
  
  override func prepareForInterfaceBuilder() {
    sharedInit()
  }
  
  private func sharedInit() {
    refreshCorners(value: cornerRadius)
    refreshColor(color: backgroundImageColor)
  }
  
  func refreshCorners(value: CGFloat) {
    layer.cornerRadius = value
  }
  
  func refreshColor(color: UIColor, for state:  UIControl.State = .normal) {
    let image = createImage(color: color)
    setBackgroundImage(image, for: state)
    clipsToBounds = true
  }

  private func createImage(color: UIColor) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), true, 0.0)
    color.setFill()
    UIRectFill(CGRect(x: 0, y: 0, width: 1, height: 1))
    guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
    return image
  }
}
