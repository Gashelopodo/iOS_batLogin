//
//  BLListaTareasTableViewController.swift
//  App_BatLogin
//
//  Created by cice on 10/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BLListaTareasTableViewController: UITableViewController {
   

    
    @IBAction func añadirNuevaTareaVC(_ sender: AnyObject) {
        let nuevoPostVC = storyboard?.instantiateViewController(withIdentifier: "NuevaTareaTableViewController") as! BLNuevaTareaTableViewController
        
        let navigationRoot = UINavigationController(rootViewController: nuevoPostVC)
        present(navigationRoot, animated: true, completion: nil)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(tareasManager.tareas.count)
        tableView.register(UINib(nibName: "BLDetalleTareaTableViewCell", bundle: nil), forCellReuseIdentifier: "DetalleTareaTableViewCell")
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
        return tareasManager.tareas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetalleTareaTableViewCell", for: indexPath) as! BLDetalleTareaTableViewCell
        
        let tareasModel = tareasManager.tareas[indexPath.row]
        let fotosModel = tareasManager.fotoTarea[indexPath.row]
        
        if let imagenTareaDes = fotosModel[CONSTANTES.USER_DEFAULTS.KEY_IMAGEN_TAREA] as? Data{
            cell.myImagenTarea.image = UIImage(data: imagenTareaDes)
        }
        
        cell.myDescripcionTarea.text = tareasModel[CONSTANTES.USER_DEFAULTS.KEY_DESCRIPCION_TAREA] as! String?
        
        if let iconoTareaDes = tareasModel[CONSTANTES.USER_DEFAULTS.KEY_ICONO_TAREA]{
            cell.myIconoTarea.image = UIImage(named: iconoTareaDes as! String)
        }else{
            cell.myIconoTarea.image = UIImage(named: "img_no_icon")
        }
    

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let borrarCelda = UITableViewRowAction(style: .normal, title: "Borrar") { (action, indexPath) in
            tareasManager.tareas.remove(at: indexPath.row)
            tareasManager.fotoTarea.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
        let localCelda = UITableViewRowAction(style: .normal, title: "Localizar") { (action, indexPath) in
            
        }
        
        borrarCelda.backgroundColor = CONSTANTES.COLORES.colorCasiNegro
        localCelda.backgroundColor = CONSTANTES.COLORES.colorAmarillo
        
        return [borrarCelda, localCelda]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPathDes = tableView.indexPathForSelectedRow{
            
            let destinationVC = storyboard?.instantiateViewController(withIdentifier: "ListaIconosCollectionViewController") as! BLListaIconosCollectionViewController
            
            let tareasSelect = tareasManager.tareas[indexPath.row]
            destinationVC.cabeceraDescripcionTarea = tareasSelect[CONSTANTES.USER_DEFAULTS.KEY_DESCRIPCION_TAREA] as! String?
            destinationVC.tareaSeleccionada = indexPathDes.row
            self.navigationController?.pushViewController(destinationVC, animated: true)
            
            
        }
    }
    
    
    
    
    

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

}
