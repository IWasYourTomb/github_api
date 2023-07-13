//
//  ContentView.swift
//  api
//
//  Created by 1 on 23.05.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            if case .LOADING = viewModel.currentState {
                loaderView()
            } else if case .SUCCESS(let users) = viewModel.currentState {
                List(users) { user in
                    userCell(user: user)
                        .frame(width: geometry.size.width, height: 80)
                }
            } else if case .FAILURE(let error) = viewModel.currentState {
                VStack(alignment: .center) {
                    Spacer()
                    Text(error)
                        .font(.headline.bold())
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
            }
        }
    }
}
        

        
      
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
                ContentView()
        }
    }
