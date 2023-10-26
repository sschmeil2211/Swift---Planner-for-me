//
//  ProfileView.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user: user)
                }
                else{
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear(){
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
        
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                Text(user.name)
            }
            HStack{
                Text("Email: ")
                Text(user.email)
            }
            HStack{
                Text("Member Since: ")
                Text("\(Date(timeIntervalSinceNow: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        
        Spacer()
        
        Button{
            viewModel.signOut()
        } label: {
            Text("Sign Out")
        }
    }
}

#Preview {
    ProfileView()
}
