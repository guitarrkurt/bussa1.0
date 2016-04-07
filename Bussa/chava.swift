//
//  chava.swift
//  Bussa
//
//  Created by guitarrkurt on 04/04/16.
//  Copyright © 2016 guitarrkurt. All rights reserved.
//

import UIKit

class chava: NSObject {
    
    var nombre: String = String()
    var correo: String = String()
    var ciudad: String = String()
    var edad: Int = 0
    
    func chavaIsEmpty() -> Bool{
        if(nombre == "" && correo == "" && ciudad == "" && edad <= 0){
            return true
        }else{
            return false
        }
    }
}
