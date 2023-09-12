//
//  ContentView.swift
//  AssignmentTotalityCorp
//
//  Created by Aryan Jagarwal on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    
    // Namespace for Geometry animation
    @Namespace private var namespace
    
    @State var isShowingExpandedScreen : Bool = false
    @State var selectedID: UUID = UUID()
    
    var body: some View {
        ZStack {
            if !isShowingExpandedScreen {
                // For Home Cards
                ScrollView {
                    ForEach(User.samples) { user in
                        CardView(namespace: namespace, isShowingExpandedScreen: $isShowingExpandedScreen, selectedID: $selectedID, user: user)
                            .padding()
                    }
                }
            } else {
                // For Detail Cards View
                ForEach(User.samples) { user in
                    if user.id == selectedID {
                        ExpandedCardView(namespace: namespace, isShowingExpandedScreen: $isShowingExpandedScreen, user: user)
                    }
                }
            }
        }
    }
}

struct ContentViewView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
