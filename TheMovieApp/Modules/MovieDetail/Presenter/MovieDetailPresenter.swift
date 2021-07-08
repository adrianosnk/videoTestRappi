//
//  MovieDetailPresenter.swift
//  TheMovieApp
//
//  Created by MacAdrian on 08/07/2021.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

class MovieDetailPresenter: MovieDetailPresenterProtocol {
  
  // MARK: - VIPER
  weak var view: MovieDetailViewProtocol?
  var interactor: MovieDetailInteractorInputProtocol?
  var router: MovieDetailRouterProtocol?
  
  private var movie: Movie?
  var title: String?
  
  init(movie: Movie) {
    self.movie = movie
    self.title = movie.title
  }
  
  func loadDetails() {
    guard let movie = self.movie else { return }
    view?.loadDetails(movie)
    interactor?.loadImage(of: movie)
  }
  
  func loadVideo() {
    guard let movie = self.movie else { return }
    let apiclient = APIClient()
    apiclient.fetchYouTubeKey(of: movie) { key in
      self.view?.loadVideo(key)
    }
  }
  
}
extension MovieDetailPresenter:  MovieDetailInteractorOutputProtocol {
  func loadImage(_ image: UIImage) {
    view?.loadImage(image)
  }
}
