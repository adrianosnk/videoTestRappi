//
//  MovieDetailProtocols.swift
//  TheMovieApp
//
//  Created by MacAdrian on 08/07/2021.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

// MARK: - VIPER Protocols
protocol MovieDetailViewProtocol: class {
  var presenter: MovieDetailPresenterProtocol? { get set }
  // PRESENTER -> VIEW
  func loadDetails(_ movie: Movie)
  func loadImage(_ image: UIImage)
  func loadVideo(_ key: String?)
  func showErrorMessage(_ message: String)
}

protocol MovieDetailPresenterProtocol: class {
  var view: MovieDetailViewProtocol? { get set }
  var interactor: MovieDetailInteractorInputProtocol? { get set }
  var router: MovieDetailRouterProtocol? { get set }
  // VIEW -> PRESENTER
  var title: String? { get set }
  func loadDetails()
  func loadVideo()
}

protocol MovieDetailInteractorInputProtocol: class {
  var presenter: MovieDetailInteractorOutputProtocol? { get set }
  var cacheDataManager: CacheDataManager { get set }
  var coverImage: UIImage? { get set }
  // PRESENTER -> INTERACTOR
  func loadImage(of movie: Movie)
}

protocol MovieDetailInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
  func loadImage(_ image: UIImage)
}

protocol MovieDetailRouterProtocol: class {
  // PRESENTER -> ROUTER
}
