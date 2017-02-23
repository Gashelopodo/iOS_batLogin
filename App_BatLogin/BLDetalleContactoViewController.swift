//
//  BLDetalleContactoViewController.swift
//  App_BatLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BLDetalleContactoViewController: UIViewController {
    
    //MARK: variables
    
    var dataDetalle : [String : Any]!
    
    //MARK: - OUTLET
    
    @IBOutlet weak var myFotoPerfil: UIImageView!
    @IBOutlet weak var myNombre: UILabel!
    @IBOutlet weak var myApellido: UILabel!
    
    
    //MARK: - ACTION
    
    @IBAction func cerrarModal(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myNombre.text = dataDetalle["firstName"] as! String
        myApellido.text = dataDetalle["lastName"] as! String
        myFotoPerfil.image = UIImage(named: dataDetalle["imageProfile"]! as! String)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
