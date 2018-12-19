//
//  ViewController.swift
//  ThirdTest
//
//  Created by student on 2018/12/19.
//  Copyright © 2018年 zongpingzhang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var numone: UITextField!
    @IBOutlet weak var numtwo: UITextField!
    @IBOutlet weak var numresult: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Add(_ sender: Any) {
        let num1 = Float(numone.text! == "" ? "0":numone.text!)
        let num2 = Float(numtwo.text! == "" ? "0":numtwo.text!)
        numresult.text = String(num1! + num2!)
        save(operation: " + ")
    }
    
    @IBAction func Sub(_ sender: Any) {
        let num1 = Float(numone.text! == "" ? "0":numone.text!)
        let num2 = Float(numtwo.text! == "" ? "0":numtwo.text!)
        numresult.text = String(num1! - num2!)
        save(operation: " - ")
    }
    @IBAction func Mul(_ sender: Any) {
        let num1 = Float(numone.text! == "" ? "0":numone.text!)
        let num2 = Float(numtwo.text! == "" ? "0":numtwo.text!)
        numresult.text = String(num1! * num2!)
        save(operation: " * ")
    }
    @IBAction func Div(_ sender: Any) {
        let num1 = Float(numone.text! == "" ? "0":numone.text!)
        let num2 = Float(numtwo.text! == "" ? "0":numtwo.text!)
        if num2 == 0{
            numresult.text = "除数不能为0"
        }else{
            numresult.text = String(num1! / num2!)
        }
        save(operation: " / ")
    }
    func save(operation:String){
        let num1 = numone.text! == "" ? "0":numone.text!
        let num2 = numtwo.text! == "" ? "0":numtwo.text!
        let result = numresult.text!
        let context = appDelegate.persistentContainer.viewContext
        let data = History(context: context)
        data.data = num1 +  operation + num2 + " = " + result
        appDelegate.saveContext()
    }
}

