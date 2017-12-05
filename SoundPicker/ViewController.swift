//
//  ViewController.swift
//  SoundPicker
//
//  Created by Maribel Montejano on 12/4/17.
//  Copyright © 2017 Maribel Montejano. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var player: AVAudioPlayer?
    
    var sounds: [String] = ["applause", "bubbles", "guitar", "monster"]
    
    @IBOutlet weak var soundPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func playButton(_ sender: UIButton) {
        print("play button tapped")
        playSound(audioSound: "applause")
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        print("stop button tapped")
    }
    
    // MARK: UIPickerViewDataSource methods
    // 1) numberOfComponents
    // 2) numberOfRowsInComponent
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sounds.count
    }
    
    // MARK: Optional UIPickerViewDelegate methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sounds[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelectRow \(row)")
        print("sound picked: \(sounds[row])")
    }
    
    func playSound(audioSound: String) {
        print("playsound called")
        
        let sound = NSDataAsset(name: audioSound)
        
        if sound == nil {
            print("error opening sound")
            return
        }
        
        // play the sound
        do {
            // tells the system that playback is desired
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("error setting up AVAudioSession")
        }
        
        do {
            player = try AVAudioPlayer(data: (sound?.data)!)
            player?.play()
        } catch {
            print("error playing sound")
        }
    }
}

