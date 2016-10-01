//
//  DetailViewController.swift
//  Hacking1
//
//  Created by Maryanne Peters on 2016-09-17.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  
  var selectedImage: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    if let imageToLoad = selectedImage {
      imageView.image = UIImage(named: imageToLoad)
    }
      
    title = selectedImage
    // .action shows an arrow coming out of a box (user can do something when tapped icon)
    // when tapped, call the shareTapped method
    // target tells the button that the method belongs to the current view controller (self)
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnTap = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.hidesBarsOnTap = false
  }
  
  func shareTapped(){
    // UIActivityViewController is built-in ios sharing with other apps and services
  //  let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
    // this tells ios where the view controller should appear from - for ipad, where the popover won't take up the whole screen
  //  vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
  //  present(vc, animated: true)
    
    if let(vc) = SLComposeViewController(forServiceType: SLServiceTypeFacebook){
      vc.setInitialText("Look at this great picture!")
      vc.add(imageView.image!)
      vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
      present(vc, animated: true)
    }
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
