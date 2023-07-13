//
//  UserViewModel.swift
//  api
//
//  Created by 1 on 23.05.2023.
//

import Foundation
import Combine
class UserViewModel: ObservableObject{
    
    enum ViewState{
        case START
        case LOADING
        case SUCCESS(users: [User])
        case FAILURE(error: String)
    }
    
    @Published var currentState: ViewState = .START
    private var cancelables = Set<AnyCancellable>()
    
    init(){
        getUsers()
    }
    
    func getUsers(){
        self.currentState = .LOADING
        APIService.shared.getUsers()
            .sink{ completion in
                switch completion{
                case .finished:
                    print("Finish")
                case .failure(let error):
                    self.currentState = .FAILURE(error: error.localizedDescription)
                }
                } receiveValue: { users in
                    self.currentState = .SUCCESS(users: users)
                }.store(in: &cancelables)
            }
}
