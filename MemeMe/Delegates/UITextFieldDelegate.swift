//
//  UITextFieldDelegate.swift
//  MemeMe
//
//  Created by Mohammed Almalki on 26/04/2019.
//  Copyright © 2019 Mohowsa. All rights reserved.
//

import Foundation
import UIKit

extension MemeEditorViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == tfTop){
            textField.text = topText
        }
        else{
            textField.text = bottomText
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField == tfTop){
            topText = textField.text
        }else{
            bottomText = textField.text
        }
    }
}
