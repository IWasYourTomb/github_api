//
//  Loading.swift
//  api
//
//  Created by 1 on 13.07.2023.
//

import Foundation
import SwiftUI


func loaderView() -> some View{
    ZStack{
        Color.black.opacity(0.05)
            .ignoresSafeArea()
        ProgressView().scaleEffect(1, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
    }
}
