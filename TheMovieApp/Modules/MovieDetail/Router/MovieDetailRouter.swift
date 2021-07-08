//
//  MovieDetailRouter.swift
//  TheMovieApp
//
//  Created by MacAdrian on 08/07/2021.
//  Copyright © 2020 Calidda. All rights reserved.
//

import Foundation

class MovieDetailRouter: MovieDetailRouterProtocol {
  
  typealias MovieDetailPresenterProtocols = MovieDetailPresenterProtocol & MovieDetailInteractorOutputProtocol

  class func createMovieTrailerModule(for view: MovieDetailViewController, and movie: Movie) {
    let presenter: MovieDetailPresenterProtocols = MovieDetailPresenter(movie: movie)
    view.presenter = presenter
    view.presenter?.view = view
    view.presenter?.interactor = MovieDetailInteractor()
    view.presenter?.interactor?.presenter = presenter
    view.presenter?.router = MovieDetailRouter()
  }
}
