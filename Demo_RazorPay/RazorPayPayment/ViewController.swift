//
//  ViewController.swift
//  RazorPayPayment
//
//  Created by Bhargav Kaneriya on 06/07/20.
//  Copyright © 2020 Bhargav Kaneriya. All rights reserved.
//

import UIKit
import Razorpay

class ViewController: UIViewController,RazorpayPaymentCompletionProtocol {

    var razorpay : RazorpayCheckout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        razorpay = RazorpayCheckout.initWithKey("rzp_test_4Lav5NfimrG4W7", andDelegate: self) // Write you api key here
    }

    @IBAction func btnPayBillsClicked(_ sender: UIButton) {
        self.showPaymentform()
    }
    
    internal func showPaymentform() {
            let option : [String:Any] = [
                "amount": "100", //100 Amount Value = 1 Rs.
                "currency": "INR",
                "description": "How to user razor pay payment gatway",
                "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRYPlaRarFBuqfBC3JIH2t94vonACWvGr-6SQ&usqp=CAU",
                "name":"Bhargav Kaneriya",
                "prefill": [
                    "contact": "12345678899", // Your RazorPay Account Number
                    "email": "kaneriyabhargavkumar@gmail.com" // Your RazorPay EmailId
                ],
                "theme": [
                    "color": "#528FF0"
                ]
            ]
            razorpay.open(option)
    }

    func onPaymentError(_ code: Int32, description str: String) {
        let alert = UIAlertController(title: "Failure", message: str, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.view.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
        
    func onPaymentSuccess(_ payment_id: String) {
         let alert = UIAlertController(title: "Sucess", message: "Payment Id \(payment_id)", preferredStyle: .alert)
         let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
         alert.addAction(okay)
         self.view.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

