//
//  BaseViewController.swift
//  ValhallaAssignement
//
//  Created by John Freidrich Cinco on 1/19/22.
//

import Foundation
import UIKit

class Spinner {
    private var progressView: UIActivityIndicatorView!
    
    func createSpinner(view: UIView) {
        self.progressView = UIActivityIndicatorView(style: .large)
        self.progressView.color = UIColor.darkGray
        self.progressView.center = view.center
    }
    
    
    func showLoading(view: UIView) {
       // self.view.addSubview(self.progressContainer)
        view.addSubview(self.progressView)
        
        self.progressView.startAnimating()
    }
    
    func hideLoading() {
        self.progressView.removeFromSuperview()
        self.progressView.stopAnimating()
    }
}


open class BaseViewController: UIViewController {
    private var spinner: Spinner = Spinner()
    
    override open func viewDidLoad() {
        spinner.createSpinner(view: self.view)
        super.viewDidLoad()
    }
    
    func showLoading() {
        self.spinner.showLoading(view: self.view)
    }
    
    func hideLoading() {
        self.spinner.hideLoading()
    }
}


open class BaseTableViewController: UITableViewController {
    private var spinner: Spinner = Spinner()
    
    override open func viewDidLoad() {
        spinner.createSpinner(view: self.view)
        super.viewDidLoad()
    }
    
    func showLoading() {
        self.spinner.showLoading(view: self.view)
    }
    
    func hideLoading() {
        self.spinner.hideLoading()
    }
}
