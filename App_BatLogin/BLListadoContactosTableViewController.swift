//
//  BLListadoContactosTableViewController.swift
//  App_BatLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BLListadoContactosTableViewController: UITableViewController {

    var arrayContactos : [[String: Any]] = []
    var diccionarioContactos : [String : Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Aquí creamos un botón en la barra de navegación (Whatsapp)
        let customButtonBN = UIButton(type: .custom)
        customButtonBN.setImage(UIImage(named: "brad-pitt.jpg"), for: .normal)
        customButtonBN.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        customButtonBN.layer.cornerRadius = customButtonBN.frame.width / 2
        customButtonBN.layer.borderColor = CONSTANTES.COLORES.colorAmarillo.cgColor
        customButtonBN.layer.borderWidth = 0.5
        customButtonBN.imageView?.contentMode = .scaleAspectFill
        customButtonBN.clipsToBounds = true
        customButtonBN.addTarget(self, action: #selector(muestraVCLocal), for: .touchUpInside)
        
        let barButtonItem = UIBarButtonItem(customView: customButtonBN)
        navigationItem.rightBarButtonItem = barButtonItem
        
        let rutaFichero = Bundle.main.path(forResource: "Contactos", ofType: "plist")
        
        arrayContactos = NSArray(contentsOfFile: rutaFichero!) as! arrayDiccionario
        tableView.register(UINib(nibName: "BLVistaMiContactoCustomCell", bundle: nil), forCellReuseIdentifier: "VistaMiContactoCustomCell")
        
        self.title = "Mis contactos"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayContactos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myPerfilCell = tableView.dequeueReusableCell(withIdentifier: "VistaMiContactoCustomCell", for: indexPath) as! BLVistaMiContactoCustomCell
        diccionarioContactos = arrayContactos[indexPath.row];
        myPerfilCell.myNombreContacto.text = diccionarioContactos["firstName"] as! String?
        myPerfilCell.myApellidoContacto.text = diccionarioContactos["lastName"] as! String?
        myPerfilCell.myFotoContacto.image = UIImage(named: diccionarioContactos["imageProfile"]! as! String)
        
        // Configure the cell...

        return myPerfilCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ventanaDetalle = self.storyboard?.instantiateViewController(withIdentifier: "DetalleContactoViewController") as! BLDetalleContactoViewController
        
        ventanaDetalle.dataDetalle = arrayContactos[indexPath.row]
        present(ventanaDetalle, animated: true, completion: nil)
        
    }
    
    /*func muestraMiPerfilVC(){
        present(alertVC("Esta es otra VC", "Bienvenido", "OK cierrate"), animated: true, completion: nil)
    }*/
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func muestraVCLocal(){
        muestraMiPerfilVC(genericoVC: self.navigationController!)
    }

}
