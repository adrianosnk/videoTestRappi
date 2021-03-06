//
//  VideoPlayerViewController.swift
//  TheMovieApp
//
//  Created by MacAdrian on 08/07/2021.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class VideoPlayerViewController: UIViewController {
  
  @IBOutlet weak var viewPlayer: YTPlayerView!
  
  // observe videokey changes then perform loading
  var videoKey: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.clear
    self.viewPlayer.delegate = self
    let newBackgroundView = BlurEffectHelper.getBlurEffect(frame: self.view.frame, style: .dark)
    self.view.insertSubview(newBackgroundView, at: 0)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if !videoKey.isEmpty {
      self.viewPlayer.load(withVideoId: videoKey, playerVars: YouTubeParams)
    }
  }

  @IBAction func dismiss(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
}
extension VideoPlayerViewController : YTPlayerViewDelegate {
  func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
    self.viewPlayer.playVideo()
  }
}

