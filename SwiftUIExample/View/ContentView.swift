//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by BHJ on 2021/06/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            baseTabView()
        }
    }
}

struct baseTabView: View {
    @ObservedObject var vm = PostListViewModel()
    let colors: [Color] = [.red, .green, .blue]

    var drag: some Gesture {
      DragGesture()
        .onChanged { state in
          print("changing")
        }
        .onEnded { state in
          print("ended")
      }
    }
    
    var body: some View {
        TabView {
            //1st
            FirstListView()
            .tabItem{
                    Image(systemName: "phone.fill")
                    Text("First Tab")
                }
            //2st
            List {
                ForEach(vm.posts) { post in
                    if let text = post.title{
                        Text(text)
                            .foregroundColor(.black)
                    }
                }
            }.tabItem{
                    Image(systemName: "note")
                    Text("Second Tab")
            }
            //3st
            List{
                Group {
                    Text("1")
                    Text("2")
                    Text("3")
                    Text("4")
                    Text("5")
                    Text("6")
                    Text("7")
                    Text("8")
                    Text("9")
                    Text("10")
                }
                Group {
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(0..<10) { i in
                                Text("Bock \(i)")
                                    .frame(width: 300, height: 200)
                                    .background(colors[i % colors.count])
                            }
                        }
                    }
                }
                Group {
    
                }
     
            }.tabItem{
                Image(systemName: "heart.fill")
                Text("Third Tab")
            }
        }
    }
}

struct BottomButton: View {
    var title: String
    var iconName: String
    
    var body: some View{
        Button(action: {
            print("=======taped=======")
            
        }) {
            HStack {
                Image(iconName)
                    .font(.title)
                Text(title)
                    .fontWeight(.semibold)
                    .font(.title)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.yellow)
            .frame(height:160)
            .cornerRadius(10)
        }
    }
}
struct CustomCell: View {
    var body: some View {
        HStack {
            Image("star")
            Text("Star")
        }
    }
}
struct FirstListView: View {
    var body: some View {
        List {
            Section(header: Text("1st Header")){
                CustomCell()
            }
            Section(header: Text("2st Header")){
                Text("One")
                Text("Two")
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
