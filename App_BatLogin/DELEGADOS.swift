//
//  DELEGADOS.swift
//  App_BatLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import Foundation
import UIKit


protocol mostrarMiPerfilDelegate {
    func muestraMiPerfilVC()
}

extension mostrarMiPerfilDelegate{
    func muestraMiPerfil(genericoVC : UIViewController){
        genericoVC.present(alertVC("Esta es otra VC", "Bienvenido", "OK cierrate"), animated: true, completion: nil)
    }
}
