//
//  ViewController.swift
//  delivery_app_time_2
//
//  Created by Minh Anh on 10/12/2021.
//

import UIKit

extension UIButton {
    func addBorderRadiusBtn (btn: UIButton, degree: CGFloat) {
        btn.layer.cornerRadius = degree
    }
}
extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
                                    CGRect(x: 0, y: 0, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
                                                CGRect(x: 0, y: 0, width: 40, height: 40))
        iconContainerView.addSubview(iconView)
        iconView.center = iconContainerView.center
        self.leftView = iconContainerView
        self.leftViewMode = .always
    }
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
class ViewController: UIViewController {
    
    @IBOutlet var signUpBtnOL: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //back button
        let backImage = UIImage(named: "close3")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController?.navigationBar.tintColor = .init(rgb: 0x555555)
        self.navigationController?.navigationBar.backItem?.title = " "
        //dismiss keyboard
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }


}

