//
//  DataManagerProtocols.swift
//  TheMovieApp
//
//  Created by MacAdrian on 08/07/2021.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import CoreData

// MARK: - CORE DATA ENTITY NAMES
// Protocols to help get coredata entity names
protocol EntityNameProtocol: class {
  func getEntityName() -> String
}
extension EntityNameProtocol where Self: NSManagedObject {
  func getEntityName() -> String {
    let thisType = type(of: self)
    return String(describing: thisType)
  }
}
extension CDResult: EntityNameProtocol {}
extension CDMovie: EntityNameProtocol {}
extension CDGenre: EntityNameProtocol {}
extension CDAllGenres: EntityNameProtocol {}
extension CDGallery: EntityNameProtocol {}
extension CDImages: EntityNameProtocol {}
