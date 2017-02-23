//
//  BLWebViewController.swift
//  App_BatLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BLWebViewController: UIViewController {
    
    //MARK: variables
    var urlString : String?
    var batDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    //MARK: outlets
    
    @IBOutlet weak var myWebView: UIWebView!
    
    
    //MARK: actions
    
    @IBAction func cerrarWebView(_ sender: AnyObject) {
        batDelegate.puedoRotar = false
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func irAtras(_ sender: AnyObject) {
        myWebView.goBack()
    }
    
    @IBAction func irAdelante(_ sender: AnyObject) {
        myWebView.goForward()
    }
    
    
    @IBAction func refrescar(_ sender: AnyObject) {
        myWebView.reload()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        batDelegate.puedoRotar = true
        
        let customUrl = URL(string: urlString!)
        let request = URLRequest(url: customUrl!)
        myWebView.loadRequest(request)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .all
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
