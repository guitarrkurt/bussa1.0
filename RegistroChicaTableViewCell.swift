//
//  RegistroChicaTableViewCell.swift
//  Bussa
//
//  Created by guitarrkurt on 03/04/16.
//  Copyright © 2016 guitarrkurt. All rights reserved.
//

import UIKit

protocol RegistroChicaCellProtocol{
    func guardarDatos(dato: String, index: Int, numeroAmigaTagbutton: Int)
}

class RegistroChicaTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var caja: UITextField!
    @IBOutlet weak var icono: UIImageView!
    @IBOutlet weak var campo: UILabel!
    
    var delegate: RegistroChicaCellProtocol? = nil
    var cellIndex: Int = Int()
    var numeroAmigaTagbutton: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Dismiss
        caja.delegate = self
    }
    
    internal func textFieldShouldReturn(textField: UITextField) -> Bool {

        self.delegate?.guardarDatos(caja.text!, index: cellIndex, numeroAmigaTagbutton: numeroAmigaTagbutton)

        //Dismiss
        caja.resignFirstResponder()
        return true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
