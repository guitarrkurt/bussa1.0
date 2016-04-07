//
//  InicioViewController.swift
//  Bussa
//
//  Created by guitarrkurt on 31/03/16.
//  Copyright © 2016 guitarrkurt. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

class InicioViewController: UIViewController {
    
    @IBOutlet weak var imagoTipo: UIImageView!
    @IBOutlet weak var logoTipo: UIImageView!
    @IBOutlet weak var botonRegistro: UIButton!
    @IBOutlet weak var botonFaceBook: UIButton!
    
    
    let moviePath = NSBundle.mainBundle().pathForResource("bussaVideo", ofType: "mp4")
    var playerB: AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidAppear(true)
        
        print("Alto: \(UIScreen.mainScreen().bounds.height)")
        print("Ancho: \(UIScreen.mainScreen().bounds.width)")

    }

    override func viewDidAppear(animated: Bool) {
        if let path = moviePath {
            
            let url = NSURL.fileURLWithPath(path)
            let player = AVPlayer(URL: url)
            //
            playerB = player
            
            let playerViewController = AVPlayerViewController()
            playerViewController.player = playerB
            
            /*Mostrar en una parte*/
            playerViewController.view.frame = UIScreen.mainScreen().bounds
            playerViewController.videoGravity = AVLayerVideoGravityResizeAspectFill

            playerViewController.showsPlaybackControls = false
            self.view.addSubview(playerViewController.view)
            self.addChildViewController(playerViewController)
            
            playerB.play()
            
            NSNotificationCenter.defaultCenter().addObserver(self,
                selector: "playerItemDidReachEnd:",
                name: AVPlayerItemDidPlayToEndTimeNotification,
                object: self.playerB.currentItem)
            
        }
        else
        {
            print("Error al cargar el video")
        }
        
        self.view.bringSubviewToFront(self.imagoTipo)
        self.view.bringSubviewToFront(self.logoTipo)
        self.view.bringSubviewToFront(self.botonRegistro)
        self.view.bringSubviewToFront(self.botonFaceBook)
    }
    func playerItemDidReachEnd(notification: NSNotification) {
        self.playerB.seekToTime(kCMTimeZero)
        self.playerB.play()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RegistroIdentifier"{
            playerB.pause()
        }
    }
    
//
}
