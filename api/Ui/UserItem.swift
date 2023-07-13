//
//  UserItem.swift
//  api
//
//  Created by 1 on 13.07.2023.
//

import Foundation
import SwiftUI

func userCell(user: User) -> some View {
      HStack(spacing: 40) {
          AsyncImage(url: URL(string: user.avatar_url ?? "Unknown user")) { image in
              image
                  .resizable()
                  .scaledToFill()
          } placeholder: {
              ProgressView()
          }
          .frame(width: 60, height: 60, alignment: .center)
          .clipShape(Circle())

          Text(user.login ?? "")
              .font(.headline)
          Spacer()
      }
  }
