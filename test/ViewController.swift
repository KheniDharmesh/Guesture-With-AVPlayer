//
//  ViewController.swift
//  test
//
//  Created by Apple on 15/05/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    let playerViewController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tap(_ sender: Any) {
        
        let videoUrlString = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
        let videoURL = URL(string: videoUrlString)
        self.player = AVPlayer(url: videoURL!)
        
        playerViewController.player = player
        
        playerViewController.disableGestureRecognition()
        present(playerViewController, animated: true, completion: {
            self.player?.play()
        })
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        playerViewController.view.addGestureRecognizer(leftSwipe)
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .left) {
            
            let alert = UIAlertController(title: "Swipe Action", message: "It is LEFT Swipe ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            playerViewController.present(alert, animated: true)
        }
    }
}

extension AVPlayerViewController {
    func disableGestureRecognition() {
        let contentView = view.value(forKey: "contentView") as? UIView
        contentView?.gestureRecognizers = contentView?.gestureRecognizers?.filter { $0 is UITapGestureRecognizer }
    }
}

