//
//  ContentView.swift
//  PuppyChoresApp
//
//  Created by Lulu on 6/23/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
    }
    @State var selectedIndex = 0
    @State var shouldShowModal = false
    
    let tabBarImageNames = [ "house", "cross.case", "plus.circle", "calendar", "square.and.arrow.up" ]
    
    var body: some View {
        VStack {
            ZStack{
                
                Spacer().fullScreenCover(isPresented: $shouldShowModal, content: {
                    Button(action: {shouldShowModal.toggle()}, label: {
                        Text("Fullscreen cover")
                    })
                })
                
                switch selectedIndex {
                case 0:
                    NavigationView {
                        Text("Dog's Day")
                            .navigationTitle("Moments")
                    }
                case 1:
                    NavigationView {
                        Text("Health")
                            .navigationTitle("Health info")
                    }
                case 2:
                    NavigationView {
                        Text("Add Moment")
                            .navigationTitle("Add Moment")
                    }
                case 3:
                    NavigationView {
                        Text("Calendar")
                            .navigationTitle("Calendar")
                    }
                case 4:
                    NavigationView {
                        Text("Share Profile")
                            .navigationTitle("Share profile")
                    }
                default:
                    Text("remaining tabs")
                }
            }
            
            Spacer()
            Divider()
                .padding(.bottom, 8)
            HStack{
                ForEach(0..<5) { num in
                    Button(action: {
                            
                        if num == 2 {
                            shouldShowModal.toggle()
                            return
                        }
                        selectedIndex = num
                    }, label: {
                        Spacer()
                            
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 44, weight: .bold))
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black) : .gray)
                        }
                            
                        Spacer()
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

