//
//  ViewController.swift
//  CoreImageFun
//
//  Created by Fernando Paredes on 8/14/14.
//  Copyright (c) 2014 Fernando Paredes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
  @IBOutlet var imageView: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    let fileURL = NSBundle.mainBundle().URLForResource("image", withExtension: "png")
    let beginImage = CIImage(contentsOfURL: fileURL)

    let filter = CIFilter(name: "CISepiaTone")
    filter.setValue(beginImage, forKey: kCIInputImageKey)
    filter.setValue(0.5, forKey: kCIInputIntensityKey)

    let context = CIContext(options: nil)
    let cgimg = context.createCGImage(filter.outputImage, fromRect: filter.outputImage.extent())

    let newImage = UIImage(CGImage: cgimg)
    self.imageView.image = newImage
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

