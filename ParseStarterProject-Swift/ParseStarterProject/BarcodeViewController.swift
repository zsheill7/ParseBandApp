//
//  BarcodeViewController.swift
//  Band App
//
//  Created by Zoe Sheill on 7/5/16.
//  Copyright © 2016 ClassroomM. All rights reserved.
//

import UIKit

class BarcodeViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    var activityIndicator = UIActivityIndicatorView()
    let pickedBarcodeImage = UIImagePickerController()
    @IBOutlet weak var barcodeImage: UIImageView!
    
    
    @IBAction func takePhoto(sender: AnyObject) {
        
        
        
        
        if #available(iOS 8.0, *) {
            let alertController = UIAlertController(title: "Choose Photo", message: "", preferredStyle: .Alert)
            let choosePhoto = UIAlertAction(title: "Choose from Photo Library", style: .Default) { (_) in
                
            }
            let takePhoto = UIAlertAction(title: "Take Photo", style: .Default) { (_) in
                self.pickedBarcodeImage.delegate = self
                self.pickedBarcodeImage.sourceType = UIImagePickerControllerSourceType.Camera
                self.pickedBarcodeImage.allowsEditing = false
                
                self.presentViewController(self.pickedBarcodeImage, animated: true, completion: nil)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
        } else {
            // Fallback on earlier versions
        }
        
        
    }
  
    @IBAction func choosePhoto(sender: AnyObject) {
        
        /*let pickedBarcodeImage = UIImagePickerController()
        pickedBarcodeImage.delegate = self
        pickedBarcodeImage.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        pickedBarcodeImage.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)*/

    }
 
    @IBOutlet weak var takePhotoButtonLabel: UIButton!
    
    @IBOutlet weak var choosePhotoButtonLabel: UIButton!
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
  
            //barcodeImage.image = pickedBarcodeImage
        
        
        
        takePhotoButtonLabel.setTitle("", forState: UIControlState.Normal)
        choosePhotoButtonLabel.setTitle("", forState: UIControlState.Normal)
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
