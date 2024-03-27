//
//  EntreesViewController.swift
//  RestaurantRater
//
//  Created by Ronald Ramsey on 3/26/24.
//

import UIKit
import CoreData

class EntreesViewController: UIViewController, UITextFieldDelegate, RestaurantControllerDelegate {
       
    
    var currentEntree: Entree?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var lblRestaurant: UILabel!
    @IBOutlet weak var txtEntree: UITextField!
    @IBOutlet weak var txtType: UITextField!
    @IBOutlet weak var txtRating: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Rate Entree"
        
        let textFields: [UITextField] = [txtEntree, txtType, txtRating]
        for textField in textFields {
            textField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)), for: UIControl.Event.editingDidEnd)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.save, target: self, action: #selector(saveEntree))
    }
    
    func rateEntree(restaurantName: String) {
        if currentEntree == nil {
            let context = appDelegate.persistentContainer.viewContext
            currentEntree = Entree(context: context)
        }
        currentEntree?.restaurant = restaurantName
        lblRestaurant.text = restaurantName
        print("/(restaurantName)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueRateEntree") {
            let restaurantController = segue.destination as! RestaurantsViewController
            restaurantController.delegate = self
        }
    }
    
    func textFieldShouldEndEditing (_ textField: UITextField) -> Bool {
        if currentEntree == nil {
            let context = appDelegate.persistentContainer.viewContext
            currentEntree = Entree(context: context)
        }
        currentEntree?.name = txtEntree.text
        currentEntree?.type = txtType.text
        currentEntree?.rating = txtRating.text
        return true
    }
    
    @objc func saveEntree() {
        appDelegate.saveContext()
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
