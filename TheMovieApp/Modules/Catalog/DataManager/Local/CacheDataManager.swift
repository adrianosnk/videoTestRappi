//
//  LocalDataManager.swift
//  TheMovieApp
//
//  Created by MacAdrian on 08/07/2021.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

// MARK: - IMAGE CACHE SINGLETON
public class CacheDataManager {
  
  static let shared = CacheDataManager()
  
  private(set) var imageCache: NSCache<NSString, UIImage> = NSCache<NSString, UIImage>()

  init() {}

}
