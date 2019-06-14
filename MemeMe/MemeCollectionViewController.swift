//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Mohammed Almalki on 28/04/2019.
//  Copyright © 2019 Mohowsa. All rights reserved.
//

import Foundation
import UIKit


class MemeCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        collectionView?.reloadData()
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let meme = appDelegate.memes[(indexPath as NSIndexPath).row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionMemeCell", for: indexPath) as! MemeCollectionViewCell
        cell.imageView?.image = meme.memedImage
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController") as! MemeEditorViewController
        controller.editMeme = appDelegate.memes[(indexPath as NSIndexPath).row]
        tabBarController?.tabBar.isHidden = true
        self.navigationController!.pushViewController(controller, animated: true)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets (top: 0, left: 2, bottom: 0, right: 2)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        if UIDevice.current.orientation.isPortrait{
            return CGSize(width: (bounds.width/3)-2 , height: (bounds.height/5))
        }else{
            return CGSize(width: (bounds.width/5)-2 , height: (bounds.height/3))
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //TODO: Set minimumLineSpacing to 0
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //TODO: Set minimumInteritemSpacing to 0
        return 0
    }
    
}
