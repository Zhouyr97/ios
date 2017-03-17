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
       result.text = calculate1.simplecalculate(Loanamount:Double (Loanmount.text!)!,Years:Int (Loanterms.text!)!,Interestrate:Double (rate.text!)!).description
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
