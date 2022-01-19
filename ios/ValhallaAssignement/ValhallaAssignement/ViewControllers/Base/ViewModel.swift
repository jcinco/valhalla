//
//  ViewModel.swift
//  ValhallaAssignement
//
//  Created by John Freidrich Cinco on 1/19/22.
//

import Foundation

enum ViewModelState {
    case idle
    case busy
    case error
}

protocol ViewModelDelegate {
    func onState(state: ViewModelState)
}

open class ViewModel: NSObject {
    func runInMain(executable: @escaping ()->Void) {
        DispatchQueue.main.sync {
            executable()
        }
    }
}
