//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Juan Carlos Lopez on 8/24/16.
//  Copyright © 2016 Juan Carlos Lopez. All rights reserved.
//

import UIKit



class ResultViewController: UIViewController{

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    var messager: Message?;
    
    override func viewDidLoad() {
        switch messager! {
        case .rock_WIN(let value):
                label.text = value
                image.image = UIImage(named:"RockCrushesScissors")
            break
        case .paper_WIN(let value):
                label.text = value
                image.image = UIImage(named:"PaperCoversRock")
            break
        case .scissors_WIN(let value):
                label.text = value
                image.image = UIImage(named:"ScissorsCutPaper")
            break
        case .tid(let value):
            label.text = value;
            image.image = UIImage(named:"itsATie")
            break
        case .lost(let value):
            label.text = value
            //image.image = UIImage(named:"lost")
            break
            
        }
    }
    
    
    @IBAction func playAgain(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }



    
}


