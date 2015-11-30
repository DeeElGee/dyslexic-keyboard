//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by David Gordon on 27/11/2015.
//  Copyright © 2015 David Gordon. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    var keyboardView: UIView!
    @IBOutlet var nextKeyboardButton: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .System)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }
    
    @IBAction func didTapLetter(letter: UIButton) {
        
        if var letterAsString = letter.titleLabel?.text {
            
            switch(letterAsString){
                case "Q":
                    letterAsString = "A";
                    break;
                case "W":
                    letterAsString = "S";
                    break;
                case "E":
                    letterAsString = "D";
                    break;
                case "R":
                    letterAsString = "Z";
                    break;
                case "T":
                    letterAsString = "F";
                    break;
                case "Y":
                    letterAsString = "G";
                    break;
                case "U":
                    letterAsString = "H";
                    break;
                case "I":
                    letterAsString = "J";
                    break;
                case "O":
                    letterAsString = "K";
                    break;
                case "P":
                    letterAsString = "L";
                    break;
                case "A":
                    letterAsString = "Q";
                    break;
                case "S":
                    letterAsString = "X";
                    break;
                case "D":
                    letterAsString = "C";
                    break;
                case "F":
                    letterAsString = "V";
                    break;
                case "G":
                    letterAsString = "B";
                    break;
                case "H":
                    letterAsString = "N";
                    break;
                case "J":
                    letterAsString = "M";
                    break;
                case "K":
                    letterAsString = "O";
                    break;
                case "L":
                    letterAsString = "P";
                    break;
                case "Z":
                    letterAsString = "R";
                    break;
                case "X":
                    letterAsString = "W";
                    break;
                case "C":
                    letterAsString = "E";
                    break;
                case "V":
                    letterAsString = "T";
                    break;
                case "B":
                    letterAsString = "Y";
                    break;
                case "N":
                    letterAsString = "U";
                    break;
                case "M":
                    letterAsString = "I";
                    break;
                case ",":
                    letterAsString = ".";
                    break;
                case ".":
                    letterAsString = ",";
                    break;
                case "___":
                    letterAsString = " ";
                    break;
                default:
                    break;
            }
            let proxy = textDocumentProxy as UITextDocumentProxy
            if(letterAsString != "<--"){
                proxy.insertText(letterAsString)
            } else {
                proxy.deleteBackward()
            }
        }
    }
    
    func loadInterface() {
        // load the nib file
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        // instantiate the view
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        // add the interface to the main view
        view.addSubview(keyboardView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
