//
//  HistoryViewController.swift
//  
//
//  Created by Moritz Gort on 17/09/15.
//
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {

    var history:[RPSMatch] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell") as! HistoryTableViewCell
        
        cell.resultLabel.text = calculateResults(history[indexPath.row].p1, computerChoice: history[indexPath.row].p2)

        cell.backgroundColor = history[indexPath.row].p1.defeats(history[indexPath.row].p2) ? UIColor.greenColor() :  UIColor.redColor()
        
        cell.detailedResultLabel.text = "\(history[indexPath.row].p1.description) vs. \(history[indexPath.row].p2.description)"
        
        return cell
    }
    
    func calculateResults(userChoice: RPS, computerChoice: RPS) -> String {
        if userChoice.defeats(computerChoice) {
            return "You Won!"
        } else {
            if userChoice.description == computerChoice.description {
                return "It's a tie!"
            } else {
                return "You Lost!"
            }
            
        }
    }
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
