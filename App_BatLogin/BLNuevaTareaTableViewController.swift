//
//  BLNuevaTareaTableViewController.swift
//  App_BatLogin
//
//  Created by cice on 10/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BLNuevaTareaTableViewController: UITableViewController {
    
    //MARK: - OUTlet
    
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myUserNamePerfil: UILabel!
    @IBOutlet weak var myFechaPerfil: UILabel!
    @IBOutlet weak var myDescripcionNuevaTarea: UITextView!
    @IBOutlet weak var myImagenNuevaTarea: UIImageView!
    @IBOutlet weak var ocultarImagenBTN: UIButton!
    
    
    //MARK: - ACTION
    
    @IBAction func ocultarImagenACTION(_ sender: AnyObject) {
        ocultarImagenBTN.isHidden = true
        myImagenNuevaTarea.image = nil
    }
    
    @IBAction func ocultarVC(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ocultarImagenBTN.isHidden = true
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        myDescripcionNuevaTarea.delegate = self
        
        //Bloque Toolbar
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        toolbar.barTintColor = CONSTANTES.COLORES.colorNegro
        toolbar.tintColor = CONSTANTES.COLORES.colorAmarillo
        let camera = UIBarButtonItem(image: UIImage(named:"camera"),
                                     style: .done,
                                     target: self,
                                     action: #selector(self.pickerFoto))
        let salvarDatos = UIBarButtonItem(title: "Salvar",
                                          style: .plain,
                                          target: self,
                                          action: #selector(self.salvarDatos))
        let barraFlexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [camera, barraFlexible, salvarDatos]
        myDescripcionNuevaTarea.inputAccessoryView = toolbar
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.bajarTeclado))
        tableView.addGestureRecognizer(gestureRecognizer)
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // hacemos foco en el texto nada mas empezar
        super.viewWillAppear(animated)
        myDescripcionNuevaTarea.becomeFirstResponder()
    }
    
    func bajarTeclado(){
        myDescripcionNuevaTarea.resignFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1{
            return UITableViewAutomaticDimension
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: utils
    
    func pickerFoto(){
        pickerPicture()
    }
    
    
    
    func salvarDatos(){
        
        if myDescripcionNuevaTarea.text != "" && myImagenNuevaTarea.image != nil{
            let imageData = UIImageJPEGRepresentation(myImagenNuevaTarea.image!, 0.3)
            tareasManager.tareas.append([CONSTANTES.USER_DEFAULTS.KEY_DESCRIPCION_TAREA : myDescripcionNuevaTarea.text as String])
            tareasManager.fotoTarea.append([CONSTANTES.USER_DEFAULTS.KEY_IMAGEN_TAREA : imageData! as Data])
            dismiss(animated: true, completion: nil)
        }
        
        present(alertVC("EY", "Rellena toda la información", "OK"), animated: true, completion: nil)
        
    }

    
}


extension BLNuevaTareaTableViewController : UITextViewDelegate{

    func textViewDidChange(_ textView: UITextView) {
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.setContentOffset(currentOffset, animated: false)
        
    }

}

extension BLNuevaTareaTableViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func pickerPicture(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            showMenu()
        }else{
            showLibraryPictures()
        }
    }
    
    func showMenu(){
        let actionVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionVC.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: {
            Void in
            self.pickerPicture()
        }))
        actionVC.addAction(UIAlertAction(title: "Escoge de la librería", style: .default, handler: { Void in
            self.showLibraryPictures()
        }))
        present(actionVC, animated: true, completion: nil)
    }
    
    func showLibraryPictures(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func cameraPictures(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageData = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImagenNuevaTarea.image = imageData
            ocultarImagenBTN.isHidden = false
        }
        dismiss(animated: true, completion: nil)
    }
    
}




