//
//  EntreesViewController.swift
//  RestaurantRater
//
//  Created by Ronald Ramsey on 3/26/24.
//

import UIKit
import CoreData

class EntreesViewController: UIViewController, UITextFieldDelegate {
    
    var currentEntree: EntreeEntity?
    let entreeAppDelegate = UIApplication.shared.delegate as! AppDelegate
    var restaurantName: String = ""

    @IBOutlet weak var lblRestaurant: UILabel!
    @IBOutlet weak var txtEntree: UITextField!
    @IBOutlet weak var txtType: UITextField!
    @IBOutlet weak var txtRating: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Rate Entree"
        rateEntree(restaurantName: restaurantName)
        
        let textFields: [UITextField] = [txtEntree, txtType, txtRating]
        for textField in textFields {
            textField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)), for: UIControl.Event.editingDidEnd)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.save, target: self, action: #selector(saveEntree))
    }
    
    func rateEntree(restaurantName: String) {
        if currentEntree == nil {
            let context = entreeAppDelegate.persistentContainer.viewContext
            currentEntree = EntreeEntity(context: context)
        }
        currentEntree?.restaurant = restaurantName
        lblRestaurant.text = restaurantName
    }
    
    func textFieldShouldEndEditing (_ textField: UITextField) -> Bool {
        if currentEntree == nil {
            let context = entreeAppDelegate.persistentContainer.viewContext
            currentEntree = EntreeEntity(context: context)
        }
        currentEntree?.name = txtEntree.text
        currentEntree?.type = txtType.text
        currentEntree?.rating = txtRating.text
        return true
    }
    
    @objc func saveEntree() {
        entreeAppDelegate.saveContext()
        self.navigationController?.popViewController(animated: true)
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
