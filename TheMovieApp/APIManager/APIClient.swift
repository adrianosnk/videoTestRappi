//
//  APIManager.swift
//  TheMovieApp
//
//  Created by MacAdrian on 08/07/2021.
//  Copyright © 2020 Calidda. All rights reserved.
//
// Examples:
// https://api.themoviedb.org/3/movie/popular?api_key=157b108f1f2d275c12e9092b4b2bcdd9
//
import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol APIResponseProtocol {
  func fetchedResult(data: MovieResults)
  func fetchedGenres(data: Genres)
  func onFailure(_ error: Error)
}

protocol APIClientProtocol: class {
  func fetchMovieListOf(url: APIUrls, release: APIMovieParams, lang: MovieLanguage)
  func fetchGenreListOf(url: APIUrls, release: APIMovieParams, lang: MovieLanguage)
}

// MARK: - CONNECTIVITY
// Helps to know if device is connected to internet
class Connectivity {
  class var isConnectedToInternet: Bool {
    return NetworkReachabilityManager()?.isReachable ?? false
  }
}

// MARK: - CLIENT
class APIClient: APIClientProtocol {
  
  var delegate: APIResponseProtocol?
  
  init() {}

  func fetchMovieListOf(url: APIUrls, release: APIMovieParams, lang: MovieLanguage) {
    let URL = url.rawValue + release.rawValue
    let params = [APIParams.key.rawValue: RequestValues().key,
                  APIParams.lang.rawValue: lang.rawValue]
    Alamofire.request(URL, parameters: params).responseObject { (response: DataResponse<MovieResults>) in
      switch response.result {
      case .success(var results):
        results.category = release
        self.delegate?.fetchedResult(data: results)
      case .failure(let error):
        self.delegate?.onFailure(error)
      }
    }
  }

  func fetchGenreListOf(url: APIUrls, release: APIMovieParams, lang: MovieLanguage) {
    let URL = url.rawValue + release.rawValue
    let params = [APIParams.key.rawValue: RequestValues().key,
                  APIParams.lang.rawValue: lang.rawValue]
    Alamofire.request(URL, parameters: params).responseObject { (response: DataResponse<Genres>) in
      switch response.result {
      case .success(let results):
        self.delegate?.fetchedGenres(data: results)
      case .failure(let error):
        self.delegate?.onFailure(error)
      }
    }
  }
  
  func fetchYouTubeKey(of movie: Movie, completion: @escaping (_ key: String?) -> Void) {
    guard let id = movie.id else { return }
    let URL = APIUrls.movie.rawValue + "\(id)/videos"
    let params = [APIParams.key.rawValue: RequestValues().key,
                  APIParams.lang.rawValue: MovieLanguage.US.rawValue]
    Alamofire.request(URL, parameters: params).responseObject { (response: DataResponse<Video>) in
      switch response.result {
      case .success(let details):
        let keysResults = details.results?.compactMap { $0.key }
        completion(keysResults?.first)
      case .failure(_ ):
        completion(nil)
        break
      }
    }
  }
}
