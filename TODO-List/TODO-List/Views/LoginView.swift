//
//  LoginView.swift
//  TODO-List
//
//  Created by Apple on 10/08/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                //Header
                HeaderView(title: "Umar's ToDo List", subtitle: "Get things done", angle: -15, backgroundColor: Color.indigo)
                
                //Login Form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "Log In", background: Color.blue){
                        viewModel.login()
                    }.padding()
                }.offset(y: -50)
                
                //Create account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create Account", destination: RegistrationView())
                }.padding(.bottom, 50)
                
                Spacer()
            }
        }
        }
        
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
