//
//  LauchViewController.swift
//  NMDb
//
//  Created by Gian Nucci on 29/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import UIKit
import ElasticTransition

class LauchViewController: UIViewController, Identifiable {

    var textField: AnimatedTextField?
    lazy var transition: ElasticTransition = {
        let transition = ElasticTransition()
        transition.edge = .right
        transition.sticky = true
        transition.panThreshold = 0.2
        transition.interactiveRadiusFactor = 0.4
        transition.showShadow = true
        return transition
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performInitialAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func performInitialAnimation() {
        textField = AnimatedTextField(frame: self.view.bounds, andText: LocalizableStrings.mainTitle.localize())
        view.addSubview(textField!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let _self = self else { return }
            _self.openHome()
        }
    }
    
    private func openHome() {
        performSegue(withIdentifier: HomeCollectionViewController.segueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = transition
        segue.destination.modalPresentationStyle = .custom
        segue.destination.view.backgroundColor = UIColor.darkGray
    }
}
