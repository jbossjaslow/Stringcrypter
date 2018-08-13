//
//  LogicViewController.swift
//  Stringcrypter
//
//  Created by Josh Jaslow on 1/10/17.
//  Copyright © 2017 Jaslow Enterprises. All rights reserved.
//

import UIKit

class LogicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Properties
    var masterString: String = "sixtyzipperswerequicklypickedfromthewovenjutebag"
    var stringPart: String = ""
    var foundString: String = ""
    
    var startLabelData: Int = 0
    var lengthLabelData: Int = 0
    
    //MARK: - Outlets
    @IBOutlet weak var getStringPartAnswer: UILabel!
    @IBOutlet weak var startLabel: UITextField!
    @IBOutlet weak var lengthLabel: UITextField!
    
    
    //MARK: - Actions
    @IBAction func findStringPartButton(_ sender: UIButton) {
        
    }
    
    @IBAction func getStringPartFromIndex(_ sender: UIButton) {
        getStringPartAnswer.text = getStringPart(start: startLabelData, length: lengthLabelData)
    }
    
    @IBAction func startLabel(_ sender: UITextField) {
        
    }
    
    @IBAction func lengthLabel(_ sender: UITextField) {
        
    }
    
    
    //MARK: - Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        startLabelData = Int(startLabel.text!)!
        lengthLabelData = Int(lengthLabel.text!)!
    }
    
    func getStringPart(start: Int, length: Int) -> String {
        let startIndex = masterString.index(masterString.startIndex, offsetBy: start)
        let endIndex = masterString.index(masterString.startIndex, offsetBy: start + length)
        
        return masterString.substring(with: startIndex..<endIndex)
    }
    
    func findPartInMaster(part: String) -> String {
        var length = 2
        for var i in 0...(masterString.characters.count - length) {
            let startIndex = masterString.index(masterString.startIndex, offsetBy: i)
            let endIndex = masterString.index(masterString.startIndex, offsetBy: i + length)
            if masterString.substring(with: startIndex..<endIndex) == part.substring(to: part.index(part.startIndex, offsetBy: length)) {
                return part.substring(to: part.index(part.startIndex, offsetBy: length))
                break
            }
            if i == masterString.characters.count - length {
                length += 1
                i = 0
            }
        }
        return ""
    }

}

