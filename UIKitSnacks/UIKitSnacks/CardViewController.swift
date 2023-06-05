//
//  ViewController.swift
//  UIKitSnacks
//
//  Created by Sergey Zakharov on 02.06.2023.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet var items: UITextField!
    @IBOutlet var price: UILabel!
    
    @IBAction func editingChanged(_ sender: UITextField) {
        if let text = self.items.text, let value = Double(text) {
            
        if value < 0 { return }
            self.price.text = String(format: "$%.2f", 1.99 * value);
        }
    }
    
    @IBAction func editingEnd(_ sender: UITextField) {
        if let text = self.items.text, let value = Double(text) {
            print("end: \(value)")
        }
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        if let text = self.items.text, let value = Int(text) {

            let coeff = value + 1
            
            self.items.text = "\(coeff)";
            self.price.text = String(format: "$%.2f", 1.99 * Double(coeff));
        }
    }
    
    @IBAction func removeItemBtn(_ sender: UIButton) {
        if let text = self.items.text, let value = Int(text) {
            if value == 0 { return }
            
            let coeff = value - 1
            self.items.text = "\(coeff)";
            self.price.text = String(format: "$%.2f", 1.99 * Double(coeff));
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

