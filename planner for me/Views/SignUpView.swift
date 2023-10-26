//
//  SignUpView.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel = SignUpViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                HeaderView(
                    title: "Sign Up!",
                    subtitle: "Start organizing your tasks",
                    rotationAngle: 165,
                    backgroundColor: Color.orange
                )
                
                Form{
                    TextField("Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    
                    ButtonView(title: "Sign Up", backgroundColor: Color.green) {
                        viewModel.signUp()
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct SignUpView_Preview: PreviewProvider{
    static var previews: some View{
        SignUpView()
    }
}
