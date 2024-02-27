//
//  ViewController.swift
//  Calculator
//
//  Created by Ronald Ramsey on 2/26/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtNum1: UITextField!
    @IBOutlet weak var txtNum2: UITextField!
    @IBOutlet weak var lblAnswer: UILabel!
        
    @IBAction func add(_ sender: Any) {
        calculate(operand: "add")
    }
    
    @IBAction func subtract(_ sender: Any) {
        calculate(operand: "subtract")
    }
    
    @IBAction func multiply(_ sender: Any) {
        calculate(operand: "multiply")
    }
    
    @IBAction func divide(_ sender: Any) {
        calculate(operand: "divide")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getValues() -> [Double] {
        let num1 = txtNum1.text!
        let num2 = txtNum2.text!
        let dubs: [Double] = [Double(num1)!, Double(num2)!]
        return dubs
    }
    
    func calculate(operand: String) {
        var answer: Double = 0
        let values = getValues()
        var err: Bool = false
        
        switch operand {
        case "subtract":
            answer = values[0] - values[1]
        case "multiply":
            answer = values[0] * values[1]
        case "divide":
            if (values[1] != 0) {
                answer = values[0] / values[1]
            }
            else {
                err = true
                lblAnswer.text = "Error: Can't divide by 0!"
            }
        default:
            answer = values[0] + values[1]
        }
        
        if !err {
            lblAnswer.text = "Answer: " + String(answer)
        }
        
    }
    
}

