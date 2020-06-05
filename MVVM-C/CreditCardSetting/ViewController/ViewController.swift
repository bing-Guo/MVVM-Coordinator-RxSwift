//
//  ViewController.swift
//  MVVM-C
//
//  Created by Bing Guo on 2020/6/5.
//  Copyright © 2020 Bing Guo. All rights reserved.
//

import UIKit

class CreditCardSettingViewController: UIViewController {

    // MARK: - Private
    
    private let viewModel: CreditCardSettingViewModel
    
    init(viewModel: CreditCardSettingViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

