//
//  ViewController.swift
//  FlagPhoneNumber
//
//  Created by Aurélien Grifasi on 06/08/2017.
//  Copyright (c) 2017 Aurélien Grifasi. All rights reserved.
//

import UIKit
import FlagPhoneNumber

private struct TextField {
    
    static let placeholderAttributes:[NSAttributedString.Key:Any] = [NSAttributedString.Key.foregroundColor:UIColor.white.withAlphaComponent(0.8),
                                                                     NSAttributedString.Key.kern:4.67,
                                                                     NSAttributedString.Key.font:UIFont(name: "Avenir-Light", size: 16.0)!]
    
    static let textAttributes:[NSAttributedString.Key:Any] = [NSAttributedString.Key.foregroundColor:UIColor.white,
                                                              NSAttributedString.Key.kern:4.67,
                                                              NSAttributedString.Key.font:UIFont(name: "Avenir-Light", size: 14.0)!]
    
}


class ViewController: UIViewController {

	var phoneNumberTextField: PhoneField!

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "FlagPhoneNumber"

		// To use your own flag icons, uncommment the line :
		//		Bundle.FlagIcons = Bundle(for: ViewController.self)

		phoneNumberTextField = PhoneField(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 16, height: 50))
		

		// Comment this line to not have access to the country list
		phoneNumberTextField.parentViewController = self
		phoneNumberTextField.flagPhoneNumberDelegate = self

		// Custom the size/edgeInsets of the flag button
//        phoneNumberTextField.flagSize = CGSize(width: 35, height: 35)
//        phoneNumberTextField.flagButtonEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

		// Example of customizing the textField input accessory view
		//		let items = [
		//			UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: nil),
		//			UIBarButtonItem(title: "Item 1", style: .plain, target: self, action: nil),
		//			UIBarButtonItem(title: "Item 2", style: .plain, target: self, action: nil)
		//		]
		//		phoneNumberTextField.textFieldInputAccessoryView = getCustomTextFieldInputAccessoryView(with: items)

		// The placeholder is an example phone number of the selected country by default. You can add your own placeholder :
		phoneNumberTextField.hasPhoneNumberExample = true
		//		phoneNumberTextField.placeholder = "Phone Number"

		// Set the country list
		//		phoneNumberTextField.setCountries(including: [.FR, .ES, .IT, .BE, .LU, .DE])

		// Exclude countries from the list
		//		phoneNumberTextField.setCountries(excluding: [.AM, .BW, .BA])

		// Set the flag image with a region code
		//		phoneNumberTextField.setFlag(for: "FR")

		// Set the phone number directly
		//		phoneNumberTextField.set(phoneNumber: "+33612345678")

		view.addSubview(phoneNumberTextField)

		phoneNumberTextField.center = view.center
	}

	private func getCustomTextFieldInputAccessoryView(with items: [UIBarButtonItem]) -> UIToolbar {
		let toolbar: UIToolbar = UIToolbar()

		toolbar.barStyle = UIBarStyle.default
		toolbar.items = items
		toolbar.sizeToFit()

		return toolbar
	}
}

extension ViewController: FPNTextFieldDelegate {

	func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
//        textField.rightViewMode = .always
//        textField.rightView = UIImageView(image: isValid ? #imageLiteral(resourceName: "success") : #imageLiteral(resourceName: "error"))

//        print(
//            isValid,
//            textField.getFormattedPhoneNumber(format: .E164),
//            textField.getFormattedPhoneNumber(format: .International),
//            textField.getFormattedPhoneNumber(format: .National),
//            textField.getFormattedPhoneNumber(format: .RFC3966),
//            textField.getRawPhoneNumber()
//        )
	}

	func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
		print(name, dialCode, code)
	}
}

public class PhoneField:FPNTextField {
    private func commonInit(){
        self.borderStyle = .none
        self.backgroundColor = UIColor.clear
        self.tintColor = UIColor.white
        self.textColor = UIColor.white
        self.textAlignment = .left
//        setupPlaceholder()
        self.flagSize = CGSize(width: 35, height: 35)
        self.flagButtonEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.typingAttributes = TextField.textAttributes
        self.placeholderAttributes = TextField.placeholderAttributes

    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
}
