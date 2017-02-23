//
//  BLListaIconosCollectionViewController.swift
//  App_BatLogin
//
//  Created by cice on 10/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit


class BLListaIconosCollectionViewController: UICollectionViewController {
    
    // variables locales
    var listaIconos = arrayDiccionario()
    var icono = [String]()
    var cabeceraDescripcionTarea : String?
    var tareaSeleccionada : Int?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listaIconos.append([CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA : "img_icono_compra", CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO : "Compras"])
        listaIconos.append([CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA : "img_icono_amigos", CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO : "Amigos"])
        listaIconos.append([CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA : "img_icono_economia", CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO : "Economia"])
        listaIconos.append([CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA : "img_icono_amor", CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO : "Amor"])
        listaIconos.append([CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA : "img_icono_archivos", CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO : "Archivos"])
        listaIconos.append([CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA : "img_icono_deportes", CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO : "Deportes"])
        listaIconos.append([CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA : "img_icono_fechas", CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO : "Calendario"])
        listaIconos.append([CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA : "img_icono_ideas", CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO : "Ideas"])
        listaIconos.append([CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA : "img_icono_musica", CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO : "Musica"])
        listaIconos.append([CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA : "img_icono_vacaciones", CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO : "Vacaciones"])
        listaIconos.append([CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA : "img_icono_lugares", CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO : "Lugares"])
        listaIconos.append([CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA : "img_icono_webs", CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO : "Curro"])
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return listaIconos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BLDetalleIconoCollectionViewCell
        
        let iconoCustom = listaIconos[indexPath.row]
        
        if let iconoDes = iconoCustom[CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA]{
            cell.myImage.image = UIImage(named: iconoDes as! String)
        }
        
        if let textoDes = iconoCustom[CONSTANTES.USER_DEFAULTS.KEY_TITULO_ICONO]{
            cell.myLabel.text = (textoDes as! String)
        }
    
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let cabeceraCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CabeceraDescripcionCollectionReusableView", for: indexPath) as! BLCabeceraDescripcionCollectionReusableView
        
        cabeceraCell.myLabelDescripcionTarea.text = cabeceraDescripcionTarea
        
        return cabeceraCell
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let iconosCustom = listaIconos[indexPath.row]
        
        if let tareaSeleccionadaDes = tareaSeleccionada{
            tareasManager.tareas[tareaSeleccionadaDes][CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA] = iconosCustom[CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA]
            _ = navigationController?.popViewController(animated: true)
        }
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
