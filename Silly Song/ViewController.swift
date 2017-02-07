//
//  ViewController.swift
//  Silly Song
//
//  Created by zenkiu on 2/5/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        
        nameField.text = ""
        lyricsView.text = ""
        
        
    }


    @IBAction func displayLyrics(_ sender: Any) {
    
        if( nameField.text != ""){
        
            let lyrics = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
            
            lyricsView.text = lyrics
        }
      
        
    }
}


func shortNameFromName(name: String) -> String {
    // implementation here
    
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    
    let indexOfFirstVowel = lowercaseName.rangeOfCharacter(from: vowelSet)
    
    let res = lowercaseName.substring(from: (indexOfFirstVowel?.lowerBound)!)
    
    return res
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


// join an array of strings into a single template string:
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameFromName(name: fullName)
    
    var templateTemp  = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    templateTemp  = templateTemp.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return templateTemp
}



