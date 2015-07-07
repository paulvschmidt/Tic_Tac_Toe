//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Kathy Gallo on 7/2/15.
//  Copyright © 2015 Paul Schmidt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var topLeftLabel: UILabel!
    @IBOutlet weak var topCenterLabel: UILabel!
    @IBOutlet weak var topRightLabel: UILabel!
    @IBOutlet weak var middleLeftLabel: UILabel!
    @IBOutlet weak var middleCenterLabel: UILabel!
    @IBOutlet weak var middleRightLabel: UILabel!
    @IBOutlet weak var bottomLeftLabel: UILabel!
    @IBOutlet weak var bottomCenterLabel: UILabel!
    @IBOutlet weak var bottomRightLabel: UILabel!
    @IBOutlet weak var turnLabel: UILabel!
    
    var tileArray : [UILabel]!
    var turn = true
    var boardTags : [UILabel: Bool]!
    var boardSides : [UILabel: String]!
    var turnCount = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Red background.png")!)
        boardTags = [topLeftLabel : false, topCenterLabel : false, topRightLabel : false, middleLeftLabel : false, middleCenterLabel : false, middleRightLabel : false, bottomLeftLabel : false, bottomCenterLabel : false, bottomRightLabel : false]
        
        boardSides = [topLeftLabel : "blank", topCenterLabel : "blank", topRightLabel : "blank", middleLeftLabel : "blank", middleCenterLabel : "blank", middleRightLabel : "blank", bottomLeftLabel : "blank", bottomCenterLabel : "blank", bottomRightLabel : "blank"]
        
        tileArray = [topLeftLabel, topCenterLabel, topRightLabel, middleLeftLabel, middleCenterLabel, middleRightLabel, bottomLeftLabel, bottomCenterLabel, bottomRightLabel]
        for tile in tileArray{
            tile.backgroundColor = UIColor(patternImage: UIImage(named: "Red Box.png")!)
        }
    }
    @IBAction func screenTapped(sender: AnyObject) {
        for tile in tileArray {
            if CGRectContainsPoint(tile.frame, sender.locationInView(boardView)){
                tap(tile)
            }
        }
    }
    
    func tap (tile : UILabel){
        if boardTags[tile] == false {
            if turn == false {
                turn = true
                turnCount--
                boardTags [tile] = true
                boardSides [tile] = "robot"
                tile.backgroundColor = UIColor(patternImage: UIImage(named: "Robot.png")!)
                winCheck()
                turnLabel.text = "It is Godzilla's turn"
            }
            else {
                turn = false
                turnCount--
                boardTags [tile] = true
                boardSides [tile] = "godzilla"
                tile.backgroundColor = UIColor (patternImage:UIImage(named: "Godzilla.png")!)
                winCheck()
                turnLabel.text = "It is Robot's turn"
            }
        }
    }
    func alertMessage(winner : String) {
        if winner == "Cats" {
            let message = "Cats Game!"
            let alert = UIAlertController(title: "Game Over!", message: message, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                for tile in self.tileArray{
                    tile.backgroundColor = UIColor(patternImage: UIImage(named: "Red Box.png")!)
                }
            }))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        else{
            let message = "\(winner) Wins!"
            let alert = UIAlertController(title: "Game Over!", message: message, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                for tile in self.tileArray{
                    tile.backgroundColor = UIColor(patternImage: UIImage(named: "Red Box.png")!)
                }
                self.turnLabel.text = "It is Godzilla's turn"
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    func playAgain(winnerConfirmer : String){
        boardTags = [topLeftLabel : false, topCenterLabel : false, topRightLabel : false, middleLeftLabel : false, middleCenterLabel : false, middleRightLabel : false, bottomLeftLabel : false, bottomCenterLabel : false, bottomRightLabel : false]
        
        boardSides = [topLeftLabel : "blank", topCenterLabel : "blank", topRightLabel : "blank", middleLeftLabel : "blank", middleCenterLabel : "blank", middleRightLabel : "blank", bottomLeftLabel : "blank", bottomCenterLabel : "blank", bottomRightLabel : "blank"]
        turnCount = 9
        turn = true
        alertMessage(winnerConfirmer)
    }
    
    func winCheck(){
        if boardSides[topLeftLabel] == "robot" && boardSides[topCenterLabel] == "robot" && boardSides[topRightLabel] == "robot"{
            playAgain("Robot")
        }
        else if boardSides[topLeftLabel] == "godzilla" && boardSides[topCenterLabel] == "godzilla" && boardSides[topRightLabel] == "godzilla"{
            playAgain("Godzilla")
        }
        else if boardSides[middleLeftLabel] == "robot" && boardSides[middleCenterLabel] == "robot" && boardSides[middleRightLabel] == "robot"{
            playAgain("Robot")
        }
        else if boardSides[middleLeftLabel] == "godzilla" && boardSides[middleCenterLabel] == "godzilla" && boardSides[middleRightLabel] == "godzilla"{
            playAgain("Godzilla")
        }
        else if boardSides[bottomLeftLabel] == "robot" && boardSides[bottomCenterLabel] == "robot" && boardSides[bottomRightLabel] == "robot"{
            playAgain("Robot")
        }
        else if boardSides[bottomLeftLabel] == "godzilla" && boardSides[bottomCenterLabel] == "godzilla" && boardSides[bottomRightLabel] == "godzilla" {
            playAgain("Godzilla")
        }
        else if boardSides[topLeftLabel] == "robot" && boardSides[middleCenterLabel] == "robot" && boardSides[bottomRightLabel] == "robot"{
            playAgain("Robot")
        }
        else if boardSides[topLeftLabel] == "godzilla" && boardSides[middleCenterLabel] == "godzilla" && boardSides[bottomRightLabel] == "godzilla"{
            playAgain("Godzilla")
        }
        else if boardSides[topRightLabel] == "robot" && boardSides[middleCenterLabel] == "robot" && boardSides[bottomLeftLabel] == "robot"{
            playAgain("Robot")
        }
        else if boardSides[topRightLabel] == "godzilla" && boardSides[middleCenterLabel] == "godzilla" && boardSides[bottomLeftLabel] == "godzilla"{
            playAgain("Godzilla")
        }
        else if boardSides[topLeftLabel] == "robot" && boardSides[middleLeftLabel] == "robot" && boardSides[bottomLeftLabel] == "robot"{
            playAgain("Robot")
        }
        else if boardSides[topLeftLabel] == "godzilla" && boardSides[middleLeftLabel] == "godzilla" && boardSides[bottomLeftLabel] == "godzilla"{
            playAgain("Godzilla")
        }
        else if boardSides[topCenterLabel] == "robot" && boardSides[middleCenterLabel] == "robot" && boardSides[bottomCenterLabel] == "robot"{
            playAgain("Robot")
        }
        else if boardSides[topCenterLabel] == "godzilla" && boardSides[middleCenterLabel] == "godzilla" && boardSides[bottomCenterLabel] == "godzilla"{
            playAgain("Godzilla")
        }
        else if boardSides[topRightLabel] == "robot" && boardSides[middleRightLabel] == "robot" && boardSides[bottomRightLabel] == "robot"{
            playAgain("Robot")
        }
        else if boardSides[topRightLabel] == "godzilla" && boardSides[middleRightLabel] == "godzilla" && boardSides[bottomRightLabel] == "godzilla"{
            playAgain("Godzilla")
        }
        else if turnCount == 0{
            playAgain("Cats")
        }
        else{
            
            print("what?")
        }
    }
}

