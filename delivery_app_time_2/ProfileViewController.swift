//
//  ProfileViewController.swift
//  delivery_app_time_2
//
//  Created by Minh Anh on 13/12/2021.
//

import UIKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var cameraOL: UIImageView!{
        didSet {
            cameraOL.layer.cornerRadius = cameraOL.frame.size.width / 2
        }
    }
    
    //date packer
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
    
    
    // camera
    @IBOutlet var profilePic: UIImageView!
    
    @objc func imageTapped(gesture:UIGestureRecognizer) {
        if let profile1Pic = gesture.view as? UIImageView {
            print("Image Tapped")
            showActionSheet()
        }
    }
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
            print("camera")
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
            print("library")
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    //display camera
    func camera()
    {
        var myPickerController = UIImagePickerController()
        
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            myPickerController.delegate = self;
            myPickerController.sourceType = UIImagePickerController.SourceType.camera
            myPickerController.allowsEditing = true
            self.present(myPickerController, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func photoLibrary()
    {
        
        var myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.allowsEditing = true
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    //trigger finish pick
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        profilePic.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        
        //dismiss keyboard
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        
        //pick image
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        profilePic.addGestureRecognizer(tapGesture)
        profilePic.isUserInteractionEnabled = true
        
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
