//
//  BLGuitarraViewController.swift
//  App_BatLogin
//
//  Created by cice on 10/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BLGuitarraViewController: UIViewController {
    
    //MARK: - outlet
    
    @IBOutlet weak var myImagenAcordeGuitarra: UIImageView!
    @IBOutlet weak var myLabelAcordeGuitarra: UILabel!
    
    
    //MARK: - action
    
    @IBAction func acordeSeleccionado(_ sender: UIButton) {
        
        myLabelAcordeGuitarra.text = sender.titleLabel?.text
        asignarAcorde(sender.tag)
        
        
    }
    
    func asignarAcorde(_ tag : Int){
        switch tag {
        case 0:
            myImagenAcordeGuitarra.image = UIImage(named: "img_g_do")
        case 1:
            myImagenAcordeGuitarra.image = UIImage(named: "img_g_re")
        case 2:
            myImagenAcordeGuitarra.image = UIImage(named: "img_g_rem")
        case 3:
            myImagenAcordeGuitarra.image = UIImage(named: "img_g_mi")
        case 4:
            myImagenAcordeGuitarra.image = UIImage(named: "img_g_mim")
        case 5:
            myImagenAcordeGuitarra.image = UIImage(named: "img_g_fa")
        case 6:
            myImagenAcordeGuitarra.image = UIImage(named: "img_g_fasm")
        case 7:
            myImagenAcordeGuitarra.image = UIImage(named: "img_g_sol")
        case 8:
            myImagenAcordeGuitarra.image = UIImage(named: "img_g_la")
        case 9:
            myImagenAcordeGuitarra.image = UIImage(named: "img_g_lam")
        case 10:
            myImagenAcordeGuitarra.image = UIImage(named: "img_g_si")
        case 11:
            myImagenAcordeGuitarra.image = UIImage(named: "img_g_sim")
        default:
            myImagenAcordeGuitarra.image = UIImage(named: "img_mastil")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
