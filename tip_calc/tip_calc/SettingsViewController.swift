//
//  SettingsViewController.swift
//  tip_calc
//
//  Created by Kenny Jung on 11/18/20.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var modeSwitch: UISwitch!
    
    func loadDefault() {
        modeSwitch.isOn = defaults.bool(forKey: "isNightMode")
    }
    
    func setBackground() {
        self.view.overrideUserInterfaceStyle = modeSwitch.isOn ? .dark : .light
    }
    
    func viewUpdate() {
        loadDefault()
        setBackground()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewUpdate()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        defaults.set(modeSwitch.isOn, forKey: "isNightMode")
        
        defaults.synchronize()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func switchedMode(_ sender: Any) {
        setBackground()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
