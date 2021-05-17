//
//  SentMemesCollectionViewController.swift
//  ImagePickerExperience
//
//  Created by YoYo on 2021-05-15.
//

import Foundation
import UIKit
 
class SentMemesCollectionViewController: UICollectionViewController{
 
    //MARK: Outlets
 
    @IBOutlet weak var collectionViews: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
 
    
 
    //MARK: Properties
    var meme:  MemeModel!
    
    var memes: [MemeModel]! {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }
    //MARK: Lifecycle functions

    override func viewDidLoad() {
        super.viewDidLoad()
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapToCreate))

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionViews.reloadData()
    }

    

    //MARK: Delegates Funtions

 

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        memes.count

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionViews.dequeueReusableCell(withReuseIdentifier:  "CollectionCellViewController", for: indexPath) as! CollectionCellViewController
        let meme = memes[indexPath.row]

        cell.collectionCellImage.image = meme.memedImage
        return cell

    }
   
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(identifier: "detailVC") as! DetailViewController
        viewController.meme = memes[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "collectionSegue" {
         
            _ = segue.destination as! ViewController
         
                  
    }
        dismiss(animated: true, completion: nil)
     
   

}
    @objc private func tapToCreate(){
    
            
    
            let memeMeViewController = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
            let navigation = UINavigationController(rootViewController: memeMeViewController)
    
        
    
            present(navigation, animated: true, completion: nil)
    
        }
  

    
    

 
    
}

