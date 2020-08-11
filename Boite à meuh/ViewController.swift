//
//  ViewController.swift
//  Boite à meuh
//
//  Created by Joyce on 17/06/2020.
//  Copyright © 2020 Joyce. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mooBoxImageView: UIImageView!
    var player: AVAudioPlayer = AVAudioPlayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cowSound()
    }
    
    // 🚨 ALLER DANS DEVICE -> SHAKE POUR EFFECTUER LA ROTATION DE LA BOITE 🚨
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            player.play()
            rotationBox()
        }
    }
    
    func cowSound() {
        
        let cow = Bundle.main.path(forResource: "cow", ofType: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: cow!))
        } catch {
            print("ERREUR MP3")
        }
    }
    
    func rotationBox() {
        var rotation: CGAffineTransform?
        rotation = CGAffineTransform(rotationAngle: -3)

        UIView.animate(withDuration: 1, animations: {
            self.mooBoxImageView.transform = rotation!
        }) { (success) in
            self.rotateBack()
        }

    }
    
    func rotateBack() {
        var rotation: CGAffineTransform?
        rotation = CGAffineTransform(rotationAngle: 0)
        
        UIView.animate(withDuration: 1, delay: 3.5, options: [], animations: {
            self.mooBoxImageView.transform = rotation!
        }, completion: nil)
    }


}

