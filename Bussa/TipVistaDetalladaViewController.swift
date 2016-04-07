//
//  TipVistaDetalladaViewController.swift
//  Bussa
//
//  Created by guitarrkurt on 07/04/16.
//  Copyright © 2016 guitarrkurt. All rights reserved.
//

import UIKit

class TipVistaDetalladaViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var imagenFondo: UIImageView!
    @IBOutlet weak var etiqueta: UILabel!
    
    var tipNameImag: String!
    var tipEtiqText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagenFondo.image = UIImage(named: tipNameImag)
        etiqueta.text = tipEtiqText

    }

    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!)  {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.commonInit()
    }
    
    func commonInit() {
        self.modalPresentationStyle = .Custom
        self.transitioningDelegate = self
    }
    
    
    // ---- UIViewControllerTransitioningDelegate methods
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        if presented == self {
            return CustomPresentationControllerTip(presentedViewController: presented, presentingViewController: presenting)
        }
        
        return nil
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if presented == self {
            return CustomPresentationAnimationController(isPresenting: true)
        }
        else {
            return nil
        }
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if dismissed == self {
            return CustomPresentationAnimationController(isPresenting: false)
        }
        else {
            return nil
        }
    }
    
    @IBAction func Cerrar(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
