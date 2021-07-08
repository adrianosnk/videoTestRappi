//
//  CellHelpers.swift
//  TheMovieApp
//
//  Created by MacAdrian on 08/07/2021.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

// MARK: - MOVIE DETAIL INFO HELPER
public class MovieDetails {
  static func formatInfo(of movie: Movie) -> String {
    let rating: Float = movie.rating ?? 0.0
    let votes: Int = movie.voteCount ?? 0
    let date: String = movie.releaseDate ?? ""
    return "\(rating)★  \(votes)✓  \(date)"
  }
}

// URL CREATOR
func getURL(of movie: Movie) -> String {
  guard let path = movie.posterPath else { return "" }
  let fullPath: String = "\(APIUrls.img.rawValue)\(path)"
  return fullPath
}

func getCategoryKeyFrom(name: String) -> APIMovieParams {
  switch name {
  case "popular":
    return APIMovieParams.popular
  case "top_rated":
    return APIMovieParams.topRated
  case "upcoming":
    return APIMovieParams.upcoming
  default:
    return APIMovieParams.none
  }
}

