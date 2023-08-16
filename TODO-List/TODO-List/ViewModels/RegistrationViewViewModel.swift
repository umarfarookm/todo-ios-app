//
//  RegistrationViewViewModel.swift
//  TODO-List
//
//  Created by Apple on 10/08/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegistrationViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
        
    }
    
    func register(){
        guard validate() else{
            return
        }
        //Login API call
        Auth.auth().createUser(withEmail: email, password: password){ [weak self]result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let user = User(id: id, name: name, email: email, joinedDate: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(user.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty
                && !password.trimmingCharacters(in: .whitespaces).isEmpty
                && !name.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMessage = "Please fill in all fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email"
            return false
        }
        guard password.count >= 8 else{
            errorMessage = "Please enter valid email"
            return false
        }
        return true
    }
}
