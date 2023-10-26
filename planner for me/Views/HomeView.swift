//
//  ContentView.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import SwiftUI
 
struct HomeView: View {
    //Create a view model for managing the views data and behavior
    @StateObject var viewModel = HomeViewViewModel()
    
    var body: some View {
        //Check if the user is signed in and the current userID is not empty
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty{
            //if user is signed in, display the account view.
            accountView
        }
        else{
            //If the user is not signed in, display the sign-in view
            SignInView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        //Create a tabbed view with two tabs: "Home" and "Profile"
        TabView{
            //Home tab is associated with the ToDoListView
            ToDoListView(userID: viewModel.currentUserID)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            //Profile tab is associated with the ProfileView
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct HomeView_Preview: PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}
