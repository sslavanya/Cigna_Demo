//
//  ViewController.swift
//  CignaDemoApp
//
//  Created by Admin on 05/07/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

let maxBoxCount = 10

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var boxCollectionView: BoxCollectionView!
    
    var alreadySelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func submitButtonAction(_ sender: Any) {
        inputTextField.resignFirstResponder()
        
        if inputTextField.text?.isEmpty == false {
            if(Int(inputTextField.text!)! <= maxBoxCount) {
                if alreadySelected == true {
                    inputTextField.text = ""
                    boxCollectionView.loadItems(count: 0)
                } else {
                    boxCollectionView.loadItems(count: Int(inputTextField.text!)!)
                }
            } else {
                let alertView = UIAlertController(title: "Alert", message: "Please enter boxes count less than 10", preferredStyle: UIAlertControllerStyle.alert)
                alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertView, animated: true, completion: nil)
            }
            alreadySelected = !alreadySelected
        }
    }
   
    // UITextfield Delegate Methods
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        alreadySelected = false
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}

