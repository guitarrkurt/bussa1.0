//
//  RegistroNormalViewController.swift
//  Bussa
//
//  Created by guitarrkurt on 03/04/16.
//  Copyright © 2016 guitarrkurt. All rights reserved.
//


//let newView = self.storyboard!.instantiateViewControllerWithIdentifier("VistaDetallada") as! CartaDetailViewController
//
//producto = arrayQuery[indexPath.item] as! Productos
//
//newView.imagePath = (paths as NSString).stringByAppendingPathComponent(producto.ImagenP)
//newView.producto = producto
//
//self.presentViewController(newView, animated: true, completion: nil)

import UIKit

class RegistroNormalViewController: UIViewController, GuardarDatosChavaProtocol {
    
    //Delegado 🐂
    var esclavo: GuardarDatosChavaProtocol? = nil
    //Delegado 🐂

    //Palomitas ✔️
    @IBOutlet weak var palomitCont1: UIImageView!
    @IBOutlet weak var palomitCont2: UIImageView!
    @IBOutlet weak var palomitCont3: UIImageView!
    @IBOutlet weak var palomitPrincipal: UIImageView!
    //Palomitas ✔️
    
    //Variables📱
    var numeroAmigaTagButton: Int!
    //Variables📱
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ocultarPalomitas()
    }
    
    func ocultarPalomitas(){
        palomitPrincipal.hidden = true
        palomitCont1.hidden = true
        palomitCont2.hidden = true
        palomitCont3.hidden = true
    }
    
    @IBAction func contactoPrincipalAction(sender: AnyObject) {
        numeroAmigaTagButton = 0
    performSegueWithIdentifier("VDRegistroIdentifier", sender: self)
    }
    @IBAction func contacto1Action(sender: AnyObject) {
        numeroAmigaTagButton = 1
        performSegueWithIdentifier("VDRegistroIdentifier", sender: self)
    }

    @IBAction func contacto2Action(sender: AnyObject) {
        numeroAmigaTagButton = 2
        performSegueWithIdentifier("VDRegistroIdentifier", sender: self)
    }

    @IBAction func contacto3Action(sender: AnyObject) {
        numeroAmigaTagButton = 3
        performSegueWithIdentifier("VDRegistroIdentifier", sender: self)
    }
    
    func actualizarPalomitas(amiga: Int){
        print("actualizar palomitas")
        switch (amiga) {
            case 0:
                palomitPrincipal.hidden = false
                break;
            case 1:
                palomitCont1.hidden = false
                break;
            case 2:
                palomitCont2.hidden = false
                break;
            case 3:
                palomitCont3.hidden = false
                break;
            default:
                print("ERROR al ocultar la PALOMA")
                break;
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "VDRegistroIdentifier"{
            
            print("entra a segue.identifier")
            
            let vc = segue.destinationViewController as! RegistroChavaViewController
            
            vc.esclavo = self
            vc.numeroAmigaTagButton = numeroAmigaTagButton
            
            if numeroAmigaTagButton == 0{
                vc.chica = "chica1"
            }else{
                vc.chica = "chica2"
            }
            
            
        }
    }
    
    
    
    
    
    
    
    
    
//
}
