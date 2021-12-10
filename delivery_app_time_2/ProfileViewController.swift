//
//  ProfileViewController.swift
//  delivery_app_time_2
//
//  Created by Minh Anh on 13/12/2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var cameraOL: UIImageView!{
        didSet {
            cameraOL.layer.cornerRadius = cameraOL.frame.size.width / 2
        }
    }
    
    @IBOutlet var dateOL: UITextField!
    let datePicker = UIDatePicker()
    func createToolBar() -> UIToolbar {
        //create tool bar: button at the view
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        doneBtn.tintColor = UIColor(rgb: 0x696D73)
        let spaceItemLeft = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let nextItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        toolbar.setItems([spaceItemLeft, spaceItemLeft, doneBtn], animated: true)
        return toolbar
    }
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        // Presented when object becomes first responder.  If set to nil, reverts to following responder chain.  If
        // set while first responder, will not take effect until reloadInputViews is called.
        //assign datepicker to text field
        dateOL.inputView = datePicker
        
        // assign toolbar for textfield
        dateOL.inputAccessoryView = createToolBar()
        
        //datepicker mode
        datePicker.datePickerMode = .date
    }
    
    @objc func donePressed() {
        let dateFormatr = DateFormatter()
        dateFormatr.dateFormat = "dd MMMM, h:mm a"
        self.dateOL.text = dateFormatr.string(from: (datePicker.date))
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        // Do any additional setup after loading the view.
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
