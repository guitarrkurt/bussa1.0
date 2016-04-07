//
//  RojoViewController.swift
//  Bussa
//
//  Created by guitarrkurt on 07/04/16.
//  Copyright © 2016 guitarrkurt. All rights reserved.
//

import UIKit
import MessageUI

class RojoViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    let fonNumber = "2227402098"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    private func callNumber(phoneNumber:String) {
        if let phoneCallURL:NSURL = NSURL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.sharedApplication()
            if (application.canOpenURL(phoneCallURL)) {
                application.openURL(phoneCallURL);
            }
        }
    }



    @IBAction func llamarCont1(sender: AnyObject) {
        callNumber(fonNumber)
    }
    @IBAction func llamarCont2(sender: AnyObject) {
        callNumber(fonNumber)
    }
    @IBAction func llamarCont3(sender: AnyObject) {
        callNumber(fonNumber)
    }
    
    
    
    @IBAction func alertaAMBERT(sender: AnyObject) {
        let alert = SCLAlertView()
        alert.addButton("CONFIRMAR", target: self, selector: Selector("enviarAlertaAmbert"))
        alert.showError("Enviar Alerta", subTitle: "Al enviar esta alerta está enviando un mensaje serio de auxilio a sus 3 contactos de confianza, así como a las comisarias de policia más cercanas. Es posible que se active la alerta AMBER con el fin de salvaguardar su integridad. MANTENGA LA CALMA.")
        
    }
    func enviarAlertaAmbert(){
        print("Enviando Alerta AMBERT ...")
        
        
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "!Peligro! Tu amiga Juana López se encuentra en peligro, actualmente su última ubicación fue en __, viajaba a una velocidad de: __. Puedes consultar su nota en el siguiente link: goo.gl/FweC7T y activar la alerta en el siguiente link: goo.gl/33CHgU"
            controller.recipients = [fonNumber]
            controller.messageComposeDelegate = self
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    
    
    
    
    
//
}
