//
//  RestaurantsViewController.swift
//  RestaurantRater
//
//  Created by Ronald Ramsey on 3/26/24.
//

import UIKit
import CoreData

protocol RestaurantControllerDelegate: class {
    func rateEntree(restaurantName: String)
}

class RestaurantsViewController: UIViewController, UITextFieldDelegate {
    weak var delegate: RestaurantControllerDelegate?
    var currentRestaurant: Restaurant?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
   
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    @IBOutlet weak var btnRateEntree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let textFields: [UITextField] = [txtName, txtAddress, txtCity, txtState, txtZip]
        for textField in textFields {
            textField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)), for: UIControl.Event.editingDidEnd)
        }
        let saveButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(saveRestaurant))
        self.navigationItem.rightBarButtonItem = saveButton
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.save, target: self, action: #selector(saveRestaurant))
    }
    
    
    func textFieldShouldEndEditing (_ textField: UITextField) -> Bool {
        if currentRestaurant == nil {
            let context = appDelegate.persistentContainer.viewContext
            currentRestaurant = Restaurant(context: context)
        }
        currentRestaurant?.name = txtName.text
        currentRestaurant?.address = txtAddress.text
        currentRestaurant?.city = txtCity.text
        currentRestaurant?.state = txtState.text
        currentRestaurant?.zipCode = txtZip.text
        return true
    }
    
    @objc func saveRestaurant() {
        appDelegate.saveContext()
        self.delegate?.rateEntree(restaurantName: txtName.text!)
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
