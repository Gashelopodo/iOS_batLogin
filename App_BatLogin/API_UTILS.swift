//
//  API_UTILS.swift
//  App_BatLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import Foundation
import UIKit

typealias arrayDiccionario = [diccionario]
typealias diccionario = [String : Any]
let CONSTANTES = Constantes()
let tareasManager = ApiTareasManager.shared
let prefs = UserDefaults.standard

struct Constantes {
    let COLORES = Colores();
    let USER_DEFAULTS = UserDefaultsCustom()
}


func alertVC(_ titleData : String, _ messageData : String, _ titleDataAction : String) -> UIAlertController{
    let alert = UIAlertController(title: titleData, message: messageData, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: titleDataAction, style: .default, handler: nil))
    
    return alert
}

func muestraMiPerfilVC(genericoVC : UIViewController){
    //genericoVC.present(alertVC("Esta es otra VC", "Bienvenido", "OK cierrate"), animated: true, completion: nil)
    let vc = genericoVC.storyboard?.instantiateViewController(withIdentifier: "MiPerfilViewController") as! BLMiPerfilViewController
    genericoVC.present(vc, animated: true, completion: nil)
}


struct Colores{
    let colorNegro = UIColor.black
    let colorAmarillo = #colorLiteral(red: 0.9591764808, green: 0.8025100827, blue: 0.04652624577, alpha: 1)
    let colorCasiNegro = #colorLiteral(red: 0.102270849, green: 0.1003066376, blue: 0.066101484, alpha: 1)
}

struct UserDefaultsCustom {
    let KEY_TAREAS = "tareas"
    let KEY_DESCRIPCION_TAREA = "descripcion"
    let KEY_ICONO_TAREA = "icono"
    let KEY_IMAGEN_TAREA = "imagen"
    let KEY_TITULO_ICONO = "titulo"
}
