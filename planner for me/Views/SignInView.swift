//
//  SignInView.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var viewModel = SignInViewViewModel()
    
    var body: some View {
        //Container for navigation functionality
        NavigationView{
            //Vertical stack for organizing the content
            VStack{
                //Custom Header
                HeaderView(
                    title: "Planner for me",
                    subtitle: "Get things done",
                    rotationAngle: 15,
                    backgroundColor: Color.pink
                )
                
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                     
                    ButtonView(title: "Sign In", backgroundColor: Color.blue) {
                        viewModel.signIn()
                    }
                }
                
                VStack{
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: SignUpView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct SignInView_Preview: PreviewProvider{
    static var previews: some View{
        SignInView()
    }
}
