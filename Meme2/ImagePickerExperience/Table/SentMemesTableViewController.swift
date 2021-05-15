//
//  SentMemesViewController.swift
//  Meme2
//
//  Created by YoYo on 2021-05-14.
//

import Foundation
import UIKit
class SentMemesTableViewController: UITableViewController{
    var meme: MemeModel!
    var memes : [MemeModel]! {
            let object = UIApplication.shared.delegate
            let appdelegate = object as! AppDelegate
            return appdelegate.memes
        }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100000
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! TableCellViewController
       
        cell.tableCellImage.image = meme.memedImage
        cell.tableCellTopLabel.text = meme.topTextField
        cell.tableCellBottomlabel.text = meme.bottomTextField

        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailController.meme = memes[indexPath.item]
        self.navigationController?.pushViewController(detailController, animated: true)
    }

}
