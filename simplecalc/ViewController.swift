//
//  ViewController.swift
//  simplecalc
//
//  Created by iGuest on 4/21/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber = 0;
    
    var secondNumber = 0;
    
    var currNumberString = "";
    
    var operation = "";
    
    var textToDisplay = "";
    
    var numCount = 0;
    
    var numSum = 0;
    
    var finishedOp = false
    

    @IBOutlet weak var textDisplay: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        textDisplay.userInteractionEnabled = false;
        textDisplay.textAlignment = NSTextAlignment.Right
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ClickNumber(sender: UIButton) {
        if finishedOp == true {
            clearAll()
            finishedOp = false
        }
        currNumberString += sender.currentTitle!
        textToDisplay += sender.currentTitle!
        displayToUI()
    }
    
    @IBAction func ClickOperator(sender: UIButton) {
        operation = sender.currentTitle!
        setFirstNumber()
        
        textToDisplay += operation
        NSLog("text to display'\(textToDisplay)'")
        displayToUI()
        
        currNumberString = ""
    }
    
    @IBAction func doOperation() {
        
        
        finishedOp = true
        
        switch operation {
        case "+" :
            setSecondNumber()
            textToDisplay += " = \(add(firstNumber, right: secondNumber))"
            displayToUI()
        case "-" :
            setSecondNumber()
            textToDisplay += " = \(subtract(firstNumber, right: secondNumber))"
            displayToUI()
        case "*" :
            setSecondNumber()
            textToDisplay += " = \(multiply(firstNumber, right: secondNumber))"
            displayToUI()
        case "/" :
            setSecondNumber()
            textToDisplay += " = \(divide(firstNumber, right: secondNumber))"
            displayToUI()
        case "%" :
            setSecondNumber()
            textToDisplay += " = \(mod(firstNumber, right: secondNumber))"
            displayToUI()
        case "COUNT" :
            textToDisplay += " = \(count())"
            displayToUI()
        case "AVG" :
            textToDisplay += " = \(avg())"
            displayToUI()
        case "FACT" :
            textToDisplay += " = \(factorial())"
            displayToUI()
        default :
            print("Not a valid operator")
            clearAll()
        }
        currNumberString = ""
        operation = ""
        
    }
    
    func setFirstNumber() {
        firstNumber = intVersion(currNumberString)
        addToCountAndAvg(firstNumber)
        NSLog("first number \(firstNumber)")
    }
    
    func setSecondNumber() {
        secondNumber = intVersion(currNumberString)
        addToCountAndAvg(secondNumber)
        NSLog("second number \(secondNumber)")
    }
    
    func addToCountAndAvg(num : Int) {
        numCount += 1
        NSLog("count is \(numCount)")
        numSum += num
        NSLog("sum is \(numSum)")
    }
    
    func intVersion(toConvert : String) -> Int {
        if Int(toConvert) != nil {
            return Int(toConvert)!
        }
        NSLog("not convertible to an int")
        return 0
    }
    
    func displayToUI() {
        textDisplay.text = textToDisplay
    }
    
    @IBAction func clearClick(sender: AnyObject) {
        NSLog("should clear")
        clearAll()
    }
    
    func clearAll() {
        firstNumber = 0;
        
        secondNumber = 0;
        
        currNumberString = "";
        
        operation = "";
        
        textToDisplay = "";
        
        numCount = 0;
        
        numSum = 0;
        
        displayToUI()
    }
    
    func add(left : Int, right : Int) -> Int {
        return left + right
    }
    
    func subtract(left : Int, right : Int) -> Int {
        return left - right
    }
    
    func divide(left : Int, right : Int) -> Int {
        NSLog("left \(left)")
        NSLog("right \(right)")
        if (right == 0) {
            return 0
        }
        return left / right
    }
    
    func multiply(left : Int, right : Int) -> Int {
        return left * right
    }
    
    func mod(left : Int, right : Int) -> Int {
        return left % right
    }
    
    func count() -> Int {
        return numCount
    }
    
    func avg() -> Int {
        return numSum / numCount
    }
    
    func factorial() -> Int {
        var result = 0
        if (firstNumber == 0) {
            result = 1
        } else {
            result = 1
            for var i = firstNumber; i > 1; i -= 1 {
                result *= i
            }
        }
        return result
    }
}

