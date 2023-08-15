//
//  RegistrationView.swift
//  TODO-List
//
//  Created by Apple on 10/08/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, backgroundColor: Color.mint)
            
            Form{
                TextField("Full Name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: Color.green){
                    
                }.padding()
            }.offset(y: -50)
            Spacer()
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
