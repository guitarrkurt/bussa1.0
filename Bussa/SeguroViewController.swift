//
//  SeguroViewController.swift
//  Bussa
//
//  Created by guitarrkurt on 01/04/16.
//  Copyright © 2016 guitarrkurt. All rights reserved.
//

import UIKit

class SeguroViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let arrayIconTips = ["tip1", "tip2", "tip3", "tip4", "tip5", "tip6", "tip7", "tip8"]
    let arrayLabelTips = [
        "Utiliza sólo taxi de central y/o aplicaciones como Uber o Cabify, en ambos casos asegúrate del número de unidad, placas y auto. Manda esta información a alguien de tu confianza.",
        "Camina del lado contrario al tránsito de los autos.",
        "Sostener una llave entre tus dedos (como arma punzante) puede causar un daño considerable a un agresor. Asegúrate de hacerlo solo si el atacante está desarmada, de otro modo es mejor que cooperes.",
        "No camines distraída por las calles, no revises tu celular y bolso. Si llevas audífonos que sea a un volumen que te permita escuchar lo que pasa a tu alrededor.",
        "Si te encuentras en peligro, grita ¡FUEGO! es más probable que la gente se acerque si gritas esto que si gritas pidiendo ayuda.",
        "Mantén buena comunicación con algún familiar o amigo de confianza, aviza dónde estarás y horas aproximadas de llegada.",
        "Procura traer tu celular siempre con pila y saldo para llamar.",
        "Porta un silbato, está comprobado que el ruido ayuda a prevenir delitos. Si te sientes en peligro ¡hazlo sonar!"]
    let arrayImageTips = ["imageTip3", "imageTip2", "imageTip1", "imageTip4", "imageTip5", "imageTip6", "imageTip8", "imageTip7"]
    
    @IBOutlet weak var tableView: UITableView!

    var tipNameImag: String!
    var tipEtiqText: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.clearColor()
    }

    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrayIconTips.count
    }
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cellTips", forIndexPath: indexPath) as! SeguroTableViewCell
        
        cell.imagenTip.image = UIImage(named: arrayIconTips[indexPath.row])
        cell.labelTip.text = arrayLabelTips[indexPath.row]
        
        return cell
    }
    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tipNameImag = arrayImageTips[indexPath.row]
        tipEtiqText = arrayLabelTips[indexPath.row]
        
        performSegueWithIdentifier("tipVDIdentifier", sender: self)
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "tipVDIdentifier"{
            let vc = segue.destinationViewController as! TipVistaDetalladaViewController
            
            vc.tipNameImag = tipNameImag
            vc.tipEtiqText = tipEtiqText
            
        }
     }
//
}
