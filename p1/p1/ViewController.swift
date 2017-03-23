//
//  ViewController.swift
//  p1
//
//  Created by  上海海洋大学 on 2017/3/17.
//  Copyright © 2017年  上海海洋大学. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Loanmount: UITextField!
    @IBOutlet weak var Loanterms: UITextField!
    @IBOutlet weak var rate: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBAction func calculate(_ sender: Any) {
        let calculate1 = simpleAmount()
        
        print("textField的初始值=\(Loanmount.text)")
        print("textField的初始值=\(Loanmount.text!)")
        
        guard let Loanterms = Loanterms.text, let Loanmount = Loanmount.text,
        let rate = rate.text
            else {
            print("用户没有输入全部金额")
                return
        }
        
        guard let  loanTerm = Int (Loanterms),let  loanAmount = Double(Loanmount),let  interestRate = Double(rate)
            else {
            print("用户输入格式错误")
                return
        }
        result.text = calculate1.simplecalculate(Loanamount: loanAmount, Years: loanTerm, Interestrate: interestRate).money
        
        
       //result.text = calculate1.simplecalculate(Loanamount:Double (Loanmount.text!)!,Years:Int (Loanterms.text!)!,Interestrate:Double (rate.text!)!).money
        
    }
    
    @IBAction func compoundinterest(_ sender: Any) {
        let calculate2 = compoundAmount()
        print("textField的初始值=\(Loanmount.text)")
        print("textField的初始值=\(Loanmount.text!)")
        
        guard let Loanterms = Loanterms.text, let Loanmount = Loanmount.text,
            let rate = rate.text
            else {
                print("用户没有输入全部金额")
                return
        }
        
        guard let  loanTerm = Int (Loanterms),let  loanAmount = Double(Loanmount),let  interestRate = Double(rate)
            else {
                print("用户输入格式错误")
                return
        }
        result.text = calculate2.compoundcalculate(Loanamount: loanAmount, Years: loanTerm, Interestrate: interestRate).money
       // result.text=calculate2.compoundcalculate(Loanamount:Double (Loanmount.text!)!,Years:Int (Loanterms.text!)!,Interestrate:Double (rate.text!)!).money
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)  {
        Loanmount.resignFirstResponder()
        Loanterms.resignFirstResponder()
        rate.resignFirstResponder()
    }
    func demo(name:String?,age:Int?)  {
        guard let name = name ,let age = age else{
          print("name or age is nil")
            return
        }
        print("没有空值")
        print(name + String(age))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //demo(name:nil,age:100)
        
        //demo(name: "tom", age: 18)
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class simpleAmount  {
    func simplecalculate(Loanamount:Double,Years:Int,Interestrate:Double) -> Double {
        let Rate = Interestrate/100
        let  Interest = Loanamount*Double(Years)*Rate
        return Loanamount + Interest
        
    }
}
class compoundAmount  {
    func compoundcalculate(Loanamount:Double,Years:Int,Interestrate:Double) -> Double {
        let Rate = Interestrate/100
        let  Interest = pow(1.0+Rate, Double(Years))
        return Loanamount * Interest
        
    }
}
extension Double{
    var money : String{
    let  formatter   = NumberFormatter()
    formatter.numberStyle = .currency
    let result:String?
    result = formatter.string(from:NSNumber(value:self))
    if result == nil {
            return "format error"
        }
    return result!
    }
}
