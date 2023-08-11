//
//  UserModel.swift
//  AsyncAwaitApicall
//
//  Created by Narayanasamy on 10/08/23.
//

import Foundation


struct UserModel: Decodable {
    
    let postId: Int
    let id: Int
    let name:String
    let email:String
    let body:String
  
}
