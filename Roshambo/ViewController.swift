//
//  ViewController.swift
//  Roshambo
//
//  Created by Juan Carlos Lopez on 8/24/16.
//  Copyright © 2016 Juan Carlos Lopez. All rights reserved.
//

import UIKit

enum RoshambonOptions: Int {
    case rock = 1, paper, scissors
}

enum Message{
    case rock_WIN(String)//"Rock crushes Scissor. You Win!"
    case paper_WIN(String)//"Paper cover Rock. You Win!"
    case scissors_WIN(String)//"Scissors cut Paper. You Win!"
    case tid(String)//"Is a Tid!"
    case lost(String)
    
}


class ViewController: UIViewController {
    
    var history:[Match] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randonChoose() -> Int{
        
        let randonChoose = 1 + arc4random() % 3;
        
        return Int(randonChoose);
    }
    
    func compareSelection(_ userChoose: RoshambonOptions) -> Message?{
        let num = randonChoose();
        let computerChoose = RoshambonOptions(rawValue: num)!;
        let match = Match(p1: computerChoose, p2: userChoose)

        history.append(match)
        
        return match.message;
    }
    
    @IBAction func precentingFromCode(_ sender: AnyObject) {
        let msg = compareSelection(.rock)
        
        let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultIdentifier") as! ResultViewController
        
        resultViewController.messager = msg
        
        self.present(resultViewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "historySegue"{
            let historyViewController = segue.destination as! HistoryViewController
            historyViewController.history = self.history
        }else{
            let resultViewController = segue.destination as! ResultViewController
            let choise = (segue.identifier == "resultcodesague") ? compareSelection(.paper) : compareSelection(.scissors)
        
            resultViewController.messager = choise
        }
        

    }
    
    @IBAction func precentinFromCodeAndSegue(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier: "resultcodesague", sender: nil)
    }

    

}

