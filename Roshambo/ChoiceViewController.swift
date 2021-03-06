//
//  ViewController.swift
//  Roshambo
//
//  Created by Dhruv Shah on 19/07/21.
//

import UIKit

class ChoiceViewController: UIViewController {

    // MARK: Programmatic Approach
    
    @IBAction private func playRock(_sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        vc.userChoice = getUserShape(_sender)
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: Segue with Code Approach
    
    @IBAction private func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }

    // MARK: Segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let vc = segue.destination as! ResultsViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }

    // MARK: Utilities

    // The enum "Shape" represents a play or move
    private func getUserShape(_ sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.title(for: UIControl.State())!
        return Shape(rawValue: shape)!
    }
}

