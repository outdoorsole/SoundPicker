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
    // array that contains sound file names
    var sounds: [String] = ["applause", "bubbles", "guitar", "monster"]
    // will hold name of user selected sound
    var selectedSound: String = ""
    
    @IBOutlet weak var soundPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // the default row will be the first row in the picker
        let defaultRow = 0
        
        // store the sound name for default row
        selectedSound = sounds[defaultRow]
        
        // select the row to display upon app load
        soundPicker.selectRow(defaultRow, inComponent: 0, animated: true)
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        // play sound
        playSound(audioSound: selectedSound)
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        print("stop button tapped")
        // stop current playback for player
        player?.stop()
    }
    
    // MARK: UIPickerViewDataSource methods
    // 1) numberOfComponents
    // 2) numberOfRowsInComponent
    
    // 1) returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 2) returns the # of rows in each component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sounds.count
    }
    
    // MARK: Optional UIPickerViewDelegate methods
    // 1) titleForRow
    // 2) didSelectRow
    
    // 1) return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sounds[row]
    }

    // 2) manages behavior when row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelectRow \(row)")
        selectedSound = sounds[row]
        print("sound picked: \(selectedSound)")
    }
    
    // helper method to set up audio session
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

