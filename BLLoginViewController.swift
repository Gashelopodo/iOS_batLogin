//
//  BLLoginViewController.swift
//  App_BatLogin
//
//  Created by cice on 27/1/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BLLoginViewController: UIViewController {
    
    
    //MARK: VAriables
    
    var animacion : UIViewPropertyAnimator!
    
    
    //MARK: - OUTLET
    
    
    @IBOutlet weak var myImagenLogo: UIImageView!
    @IBOutlet weak var myImageNombre: UIImageView!
    @IBOutlet weak var myusuarioLB: UILabel!
    @IBOutlet weak var myUsuarioTF: UITextField!
    @IBOutlet weak var myPassLB: UILabel!
    @IBOutlet weak var myPassTF: UITextField!
    @IBOutlet weak var myEntrarBT: UIButton!
    
    
    //MARK: - Actions
    
    @IBAction func saltaVC(_ sender: AnyObject) {
        
        let customBound = myEntrarBT.bounds
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: { 
            self.myEntrarBT.bounds = CGRect(x: customBound.origin.x - 20, y: customBound.origin.y, width: customBound.width + 20, height: customBound.height)
            }) { Void in
                let tabVc = self.storyboard?.instantiateViewController(withIdentifier: "RootTabBarViewController") as! BLRootTabBarViewController
                tabVc.modalTransitionStyle = .crossDissolve
                self.present(tabVc, animated: true, completion: nil)
                
                prefs.set(true, forKey: "login")
        }
        
        
    }
    
    //MARK: - LIFE V
    override func viewDidLoad() {
        super.viewDidLoad()

        myEntrarBT.layer.cornerRadius = 3
        objetosSinOpacidad()
        objetosDespalzados()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        iniciaAnimacion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: - UTILS
    
    func objetosSinOpacidad(){
        myImagenLogo.layer.opacity = 0;
        myImageNombre.layer.opacity = 0;
        myusuarioLB.layer.opacity = 0;
        myUsuarioTF.layer.opacity = 0;
        myPassLB.layer.opacity = 0;
        myPassTF.layer.opacity = 0;
        myEntrarBT.layer.opacity = 0;
    }
    
    func objetosDespalzados(){
        myImagenLogo.transform = CGAffineTransform(translationX: 0, y: 620)
        myImageNombre.transform = CGAffineTransform(translationX: 0, y: 620)
        myusuarioLB.transform = CGAffineTransform(translationX: 0, y: 620)
        myUsuarioTF.transform = CGAffineTransform(translationX: 0, y: 620)
        myPassLB.transform = CGAffineTransform(translationX: 0, y: 620)
        myPassTF.transform = CGAffineTransform(translationX: 0, y: 620)
        myEntrarBT.transform = CGAffineTransform(translationX: 0, y: 620)
    }
    
    func iniciaAnimacion(){
        
        
        muestraAnimation(0.6, myImagenLogo )
        muestraAnimation(0.7, myImageNombre )
        muestraAnimation(0.8, myusuarioLB )
        muestraAnimation(0.9, myUsuarioTF )
        muestraAnimation(1.0, myPassLB )
        muestraAnimation(1.1, myPassTF )
        muestraAnimation(1.2, myEntrarBT )

        
      /*
        animacion = UIViewPropertyAnimator(duration: 0.6, curve: .easeInOut, animations: { 
            self.myImagenLogo.layer.opacity = 1
            self.myImagenLogo.transform = CGAffineTransform.identity
        })
        
        animacion.startAnimation()
        */
    }
    
    func muestraAnimation(_ duracion : Double, _ objeto : UIView ){
        
        animacion = UIViewPropertyAnimator(duration: duracion, curve: .easeInOut, animations: {
            objeto.layer.opacity = 1
            objeto.transform = CGAffineTransform.identity
        })
        
        animacion.startAnimation()
        
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
