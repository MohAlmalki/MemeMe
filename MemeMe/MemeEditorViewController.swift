//
//  ViewController.swift
//  MemeMe
//
//  Created by Mohammed Almalki on 13/04/2019.
//  Copyright © 2019 Mohowsa. All rights reserved.
//

import UIKit

class MemeEditorViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tfTop: UITextField!
    @IBOutlet weak var tfBottom: UITextField!
    @IBOutlet weak var btnShare: UIBarButtonItem!
    @IBOutlet weak var btnCancel: UIBarButtonItem!
    @IBOutlet weak var btnCamera: UIBarButtonItem!
    @IBOutlet weak var btnAlbum: UIBarButtonItem!
    @IBOutlet weak var containerView: UIView!
    
    var backgroundColor: UIColor!
    var memedImage : UIImage!
    var topText : String!
    var bottomText : String!
    var editMeme :Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons("Default")
        tfTop.configure()
        tfBottom.configure()
        setupEditMeme()
        self.tfTop.delegate = self
        self.tfBottom.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    //Button's Actions
    @IBAction func openCamera(_ sender: Any) {
        pickAnImage(sourceType:.camera)
    }
    
    @IBAction func openAlbum(_ sender: Any) {
        pickAnImage(sourceType: .photoLibrary)
    }
    
    @IBAction func shareMeme(_ sender: Any) {
        backgroundColor = containerView.backgroundColor;
        containerView.backgroundColor = .white
        let image = screenShotMethod()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        controller.completionWithItemsHandler = { (activityType, completed, returnedItems, activityError) -> () in
            if (completed) {
                self.save()
                self.dismiss(animated: true, completion: nil)
                self.navigationController!.popToRootViewController(animated: true)
            }
        }
        containerView.backgroundColor = backgroundColor
        memedImage = image
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func cancelMeme(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    func screenShotMethod() -> UIImage {
        UIGraphicsBeginImageContext(self.containerView.frame.size)
        self.containerView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        memedImage = image
        UIGraphicsEndImageContext()
        return image!
    }
    
    func save() {
        // Create the meme
        let memedImage = screenShotMethod()
        let meme = Meme(topText: tfTop.text!, bottomText: tfBottom.text!, originalImage: imgView.image!, memedImage: memedImage)
        (UIApplication.shared.delegate as! AppDelegate).memes.append(meme)
    }
    
    // SETUP BUTTONS
    func setUpButtons(_ type: String){
        switch type {
        case "Default":
            btnShare.isEnabled = false
            btnCancel.isEnabled = true
            btnCamera.isEnabled = false
            // If the device has a Camera
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                btnCamera.isEnabled = true
            }
        case "ImageSelected":
            btnShare.isEnabled = true
            btnCancel.isEnabled = true
            
        case "CancelMeme":
            btnCancel.isEnabled = false
            btnShare.isEnabled = false
        default:
            print("There is an error")
        }
    }
    func setupEditMeme(){
        if let meme = editMeme {
            imgView.image = meme.originalImage
            tfTop.text = meme.topText
            tfBottom.text = meme.bottomText
            btnShare.isEnabled = true
        }
    }
}

