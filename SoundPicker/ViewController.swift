//
//  ViewController.swift
//  SoundPicker
//
//  Created by Maribel Montejano on 12/4/17.
//  Copyright © 2017 Maribel Montejano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var sounds: [String] = ["applause", "bubbles", "guitar", "monster"]
    
    @IBOutlet weak var soundPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: UIPickerViewDataSource methods
    // 1) numberOfComponents
    // 2) numberOfRowsInComponent
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    // MARK: Optional UIPickerViewDelegate methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sounds[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelectRow \(row)")
    }
}

