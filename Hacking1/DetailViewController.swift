//
//  DetailViewController.swift
//  Hacking1
//
//  Created by Maryanne Peters on 2016-09-17.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

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
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnTap = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.hidesBarsOnTap = false
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
