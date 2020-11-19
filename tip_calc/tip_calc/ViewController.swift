//
//  ViewController.swift
//  tip_calc
//
//  Created by Kenny Jung on 11/15/20.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var partyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locale = Locale.current
        let currency_symbol = locale.currencySymbol
        
        billField.placeholder = currency_symbol!
        
        tipLabel.text = currency_symbol! + "0.00"
        totalLabel.text = currency_symbol! + "0.00"
        amountLabel.text = currency_symbol! + "0.00"
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        billField.becomeFirstResponder()
        self.view.overrideUserInterfaceStyle = defaults.bool(forKey: "isNightMode") ? .dark : .light

        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
//        let bill = Double(billField.text!) ?? 0
        
        let bill = NSString(string: billField.text!).doubleValue
        
        let locale = Locale.current
        let currency_symbol = locale.currencySymbol
        
        let party_size = Double(partyLabel.text!) ?? 0
        
        let tipPercentages = [0.10, 0.15, 0.20]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        var amount_per_person = total
        
        if (party_size > 0) {
            amount_per_person = amount_per_person / party_size
        }
        
        tipLabel.text = String(format: currency_symbol! + "%.2f", tip)
        totalLabel.text = String(format: currency_symbol! + "%.2f", total)
        amountLabel.text = String(format: currency_symbol! + "%.2f", amount_per_person)
    }
    
    @IBAction func changeAmount(_ sender: UIStepper!) {
        partyLabel.text = "\(Int(sender.value))"
        calculateTip((Any).self)
    }
}

