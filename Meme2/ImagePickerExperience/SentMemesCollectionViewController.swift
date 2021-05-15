//
//  SentMemesCollectionViewController.swift
//  ImagePickerExperience
//
//  Created by YoYo on 2021-05-15.
//

import Foundation
import UIKit
 
class SentMemesCollectionViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegate {
 
    //MARK: Outlets
 
    @IBOutlet weak var collectionView: UICollectionView!
 
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
 
    
 
    //MARK: Properties
 
    var memes: [MemeModel]! {
 
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes

    }

    //MARK: Lifecycle functions

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayoutSize()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

    

    //MARK: Delegates Funtions

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let viewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        viewController.meme = memes[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        memes.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier:  "CollectionCellViewController", for: indexPath) as! CollectionCellViewController
        let meme = memes[indexPath.row]

        cell.collectionCellImage.image = meme.memedImage
        return cell

    }

    

    //MARK: Utility Funnction

    
    

    private func configureLayoutSize(){

        let space: CGFloat = 3.0

        let edgeLength = (self.view.frame.size.width < self.view.frame.size.height) ?

            self.view.frame.size.width : self.view.frame.size.height

        let dimension = (edgeLength - (2 * space)) / 3.0

        

        flowLayout.minimumInteritemSpacing = space

        flowLayout.minimumLineSpacing = space

        flowLayout.itemSize = CGSize(width: dimension, height: dimension)

    }

}
