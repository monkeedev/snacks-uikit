//
//  ViewController.swift
//  UIKitSnacks
//
//  Created by Sergey Zakharov on 02.06.2023.
//

import UIKit

class CardViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var items: UITextField!
    @IBOutlet var price: UILabel!
    @IBOutlet weak var countBar: UIStackView!
    
    // MARK: - edit items count
    @IBAction func changeCount(_ sender: UITextField) {
        
        if let text = self.items.text {
            let value = text.isEmpty ? 0 : Double(text)!;
                
            if value < 0 { return }
            self.price.text = String(format: "$%.2f", 1.99 * value);
        }
    }
    
    // MARK: - add item to cart
    @IBAction func addItem(_ sender: UIButton) {
        if let text = self.items.text, let value = Int(text) {

            let coeff = value + 1
            
            self.items.text = "\(coeff)";
            self.price.text = String(format: "$%.2f", 1.99 * Double(coeff));
        }
    }
    
    // MARK: - remove item from cart
    @IBAction func removeItem(_ sender: UIButton) {
        if let text = self.items.text, let value = Int(text) {
            if value == 0 { return }
            
            let coeff = value - 1
            self.items.text = "\(coeff)";
            self.price.text = String(format: "$%.2f", 1.99 * Double(coeff));
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adding border to count bar
        countBar.layer.borderWidth = 2
        countBar.layer.borderColor = CGColor(red: 25 / 255, green: 25 / 255, blue: 25 / 255, alpha: 0.1)
        countBar.layer.cornerRadius = 6
        
        
        // adding tap gesture responder to parent view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - dismiss keyboard on tap outside
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        items.resignFirstResponder()
        
        if let text = items.text {
            if(text.isEmpty) { items.text = "0" }
        }
    }
}

