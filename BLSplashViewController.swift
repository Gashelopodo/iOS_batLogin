//
//  BLSplashViewController.swift
//  App_BatLogin
//
//  Created by cice on 27/1/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BLSplashViewController: UIViewController {
    
    
    //MARK: - VAriables
    
    var viewAnimator : UIViewPropertyAnimator!
    var desbloqueoGesto = Timer()
    
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var myImageLogo: UIImageView!
    @IBOutlet weak var myEtiquetaMarca: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        viewAnimator = UIViewPropertyAnimator(duration: 1.0,
                                              curve: .easeInOut,
                                              animations: nil)
        viewAnimator.addAnimations {
            //aquí la etiqueta se quede transparente
            self.myEtiquetaMarca.layer.opacity = 0
            self.myImageLogo.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.desbloqueoGesto = Timer.scheduledTimer(timeInterval: 1.5,
                                                        target: self,
                                                        selector: #selector(self.muestraAutomatico),
                                                        userInfo: nil,
                                                        repeats: false)
        }
        
        viewAnimator.startAnimation()
        
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
    
    
    func muestraAutomatico(){
        //aquí está la otra animación
        
        let logoAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.myImageLogo.transform = CGAffineTransform(scaleX: 25, y: 25)
        }
        
        logoAnimation.startAnimation()
        logoAnimation.addCompletion { Void in
            self.comienzoApp()
        }
    }
    
    func comienzoApp(){
        
        if(prefs.bool(forKey: "login")){
            let tabVc = self.storyboard?.instantiateViewController(withIdentifier: "RootTabBarViewController") as! BLRootTabBarViewController
            tabVc.modalTransitionStyle = .crossDissolve
            self.present(tabVc, animated: true, completion: nil)
        }else{
            let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! BLLoginViewController
            loginVC.modalTransitionStyle = .crossDissolve
            present(loginVC, animated: true, completion: nil)
        }
        
    }

}
