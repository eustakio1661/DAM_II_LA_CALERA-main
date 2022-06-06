//
//  ContentView.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 29/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = userViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                VStack(alignment: .leading) {
                    Text(user.name).font(.title)
                    Text(user.lastname).font(.subheadline)
                }
            }.navigationBarTitle("Users")
            .onAppear() {
                self.viewModel.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
