//
//  SetupText.swift
//  MemeMe
//
//  Created by Mohammed Almalki on 20/04/2019.
//  Copyright © 2019 Mohowsa. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func configure(){
        defaultTextAttributes = [
            .strokeColor: UIColor .black,
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Impact", size: 40)!,
            .strokeWidth: -5]
        textAlignment = .center
        layer.zPosition = 1
    }
}
