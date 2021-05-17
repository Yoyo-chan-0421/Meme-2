//
//  SentMemesViewController.swift
//  Meme2
//
//  Created by YoYo on 2021-05-14.
//

import Foundation
import UIKit
class SentMemesTableViewController: UITableViewController{
    
    @IBOutlet weak var tableViewOutlet: UITableView!

    var meme: MemeModel!
    var memes: [MemeModel]! {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewOutlet.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(identifier: "detailVC") as! DetailViewController
        viewController.meme = memes[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCellViewController", for: indexPath) as! TableCellViewController
        let meme = memes[indexPath.row]
        cell.tableCellImage.image = meme.memedImage
        cell.tableCellTopLabel.text = meme.topTextField
        cell.tableCellBottomlabel.text = meme.bottomTextField

        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableSegue" {
         
            _ = segue.destination as! ViewController
         
                  
    }
        dismiss(animated: true, completion: nil)
     
   

}

    }
