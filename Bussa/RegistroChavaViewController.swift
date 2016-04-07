//
//  RegistroChavaViewController.swift
//  Bussa
//
//  Created by guitarrkurt on 03/04/16.
//  Copyright © 2016 guitarrkurt. All rights reserved.
//

import UIKit

protocol GuardarDatosChavaProtocol{
    func actualizarPalomitas(amiga: Int)
    //amiga1
    //amiga2...
    //principal
}

class RegistroChavaViewController: UIViewController, UIViewControllerTransitioningDelegate, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate, RegistroChicaCellProtocol {

    //Arreglos 🏨
    var arrayIconos = ["VP2boton1", "iconoMail", "iconoCiudad", "iconoEdad"]
    var arrayNombre = ["Nombre:", "Correo:", "Ciudad:", "Edad:"]
    var arrayEjemplo = ["Juana Perez", "juana.perez@gmail.com", "Puebla", "21"]
    //Arreglos 🏨
    
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    let defaults = NSUserDefaults.standardUserDefaults()

    //CellProtocol🐂
    var delegate: RegistroChicaCellProtocol? = nil
    var esclavo: GuardarDatosChavaProtocol? = nil
    //CellProtocol🐂
    
    //Variables 📱
    var chica: String = "chica1"
    var numeroAmigaTagButton: Int!
    //Variables 📱
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chica == "chica2"{
            imagenPerfil.image = UIImage(named: "chica2")
            imagenPerfil.tag = 2
        }
    }
    
    //TableView Data Source 📕
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrayNombre.count
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! RegistroChicaTableViewCell
        
        cell.campo.text = arrayNombre[indexPath.row]
        cell.icono.image = UIImage(named: arrayIconos[indexPath.row])
        cell.caja.placeholder = arrayEjemplo[indexPath.row]

        //CellProtocol
        cell.delegate = self
        cell.numeroAmigaTagbutton = numeroAmigaTagButton
        cell.cellIndex = indexPath.row
  
        return cell
    }
    
    //⚠️checar para cada chava
    //CellProtocol
    func guardarDatos(dato: String, index: Int, numeroAmigaTagbutton: Int) {
switch (numeroAmigaTagButton) {
  case 0:
/**/
    switch (index) {
        //0.-Nombre
    case 0:
        defaults.setObject(dato, forKey: "nombrePerfilChava")
        break;
        //1.-Correo
    case 1:
        defaults.setObject(dato, forKey: "correoPerfilChava")
        break;
        //2.-Ciudad
    case 2:
        defaults.setObject(dato, forKey: "ciudadPerfilChava")
        break;
        //3.-Edad
    case 3:
        defaults.setObject(dato, forKey: "edadPerfilChava")
        break;
        
    default:
        print("ERROR Switch")
        break;
    }

/**/
    break;
    
case 1:
/**/
    switch (index) {
        //0.-Nombre
    case 0:
        defaults.setObject(dato, forKey: "nombreAmiga1")
        break;
        //1.-Correo
    case 1:
        defaults.setObject(dato, forKey: "correoAmiga1")
        break;
        //2.-Ciudad
    case 2:
        defaults.setObject(dato, forKey: "ciudadAmiga1")
        break;
        //3.-Edad
    case 3:
        defaults.setObject(dato, forKey: "edadAmiga1")
        break;
        
    default:
        print("ERROR Switch")
        break;
    }

/**/
    
    break;

case 2:
    /**/
    switch (index) {
        //0.-Nombre
    case 0:
        defaults.setObject(dato, forKey: "nombreAmiga2")
        break;
        //1.-Correo
    case 1:
        defaults.setObject(dato, forKey: "correoAmiga2")
        break;
        //2.-Ciudad
    case 2:
        defaults.setObject(dato, forKey: "ciudadAmiga2")
        break;
        //3.-Edad
    case 3:
        defaults.setObject(dato, forKey: "edadAmiga2")
        break;
        
    default:
        print("ERROR Switch")
        break;
    }
    
    /**/

    break;
    
case 3:
    /**/
    switch (index) {
        //0.-Nombre
    case 0:
        defaults.setObject(dato, forKey: "nombreAmiga3")
        break;
        //1.-Correo
    case 1:
        defaults.setObject(dato, forKey: "correoAmiga3")
        break;
        //2.-Ciudad
    case 2:
        defaults.setObject(dato, forKey: "ciudadAmiga3")
        break;
        //3.-Edad
    case 3:
        defaults.setObject(dato, forKey: "edadAmiga3")
        break;
        
    default:
        print("ERROR Switch")
        break;
    }
    
    /**/

    break;
    
    
  default:
    print("ERROR Amiga")
    break;
}

    }
    //TableView Data Source 📕
    //Guardar Button Action 🖲
    @IBAction func guardarButtonAction(sender: AnyObject) {
        print("casi")
        if (esclavo != nil) {
         esclavo?.actualizarPalomitas(numeroAmigaTagButton)
            
        self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    //Guardar Button Action 🖲
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!)  {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.commonInit()
    }
    
    func commonInit() {
        self.modalPresentationStyle = .Custom
        self.transitioningDelegate = self
    }
    
    
    // ---- UIViewControllerTransitioningDelegate methods
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        if presented == self {
            return CustomPresentationController(presentedViewController: presented, presentingViewController: presenting)
        }
        
        return nil
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if presented == self {
            return CustomPresentationAnimationController(isPresenting: true)
        }
        else {
            return nil
        }
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if dismissed == self {
            return CustomPresentationAnimationController(isPresenting: false)
        }
        else {
            return nil
        }
    }
    
    @IBAction func Cerrar(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
