//
//  DetailViewController.swift
//  Meme2
//
//  Created by YoYo on 2021-05-14.
//

import Foundation
import UIKit
class DetailViewController: UIViewController {
    var meme: MemeModel!
    @IBOutlet weak var detailedImageView: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let meme = meme{
            detailedImageView.image = meme.memedImage
        }
    }
}
