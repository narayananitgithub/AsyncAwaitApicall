//
//  UserViewModel.swift
//  AsyncAwaitApicall
//
//  Created by Narayanasamy on 10/08/23.
//

import Foundation

protocol Userservices: AnyObject {
    
    func reloadata() // Data binding protocal = (View and Viewmodel communication)
}


class UserViewModel {
    
    var users:[UserModel] = []{
        
        didSet {
            self.userDelegate?.reloadata()
        }
    }
    private let manager = WebserviceManager()
    
    weak var userDelegate:Userservices?
    
    //@MainActor ->  DispatchQueue.Main.Async
    
    @MainActor func fetchUsers() {
        Task { // @MainActor in
            
            do {
                let userResponseArray:[UserModel] = try await
                
                manager.request(url: userURL)
                self.users = userResponseArray
            } catch {
                print(error)
            }
        }
        
    }
}
