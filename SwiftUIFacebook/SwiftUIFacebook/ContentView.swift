//
//  ContentView.swift
//  SwiftUIFacebook
//
//  Created by monkey on 2021/4/13.
//  代码对齐：全选然后 ctl + i

import SwiftUI

struct FBPostModel: Hashable {
    
    let name: String
    let post: String
    let imageName: String
}

struct ContentView: View {
    
    @Binding var text: String
    
    let stories = ["story1", "story2", "story3", "story1", "story2", "story3"]
    let posts = [
        FBPostModel(name: "Mark", post: "Hey guys I made this cool website called the facebook to see if Im cool or not!", imageName: "story1"),
        FBPostModel(name: "Mark", post: "Hey guys I made this cool website called the facebook to see if Im cool or not!", imageName: "story2"),
        FBPostModel(name: "Mark", post: "Hey guys I made this cool website called the facebook to see if Im cool or not!", imageName: "story3")
    ]
    
    let facebookBlue = UIColor(displayP3Red: 23 / 255.0,
                               green: 120 / 255.0,
                               blue: 242 / 255.0,
                               alpha: 1)
    
    var body: some View {
        VStack {
            HStack {
                Text("facebook")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(Color(facebookBlue))
                
                Spacer()
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding()
            
            TextField("Search...", text: $text)
                .padding(7)
                .background(Color(.systemGray5))
                .cornerRadius(13)
                .padding(.horizontal, 15)
            
            ZStack {
                Color(.secondarySystemBackground)
                
                ScrollView() {
                    VStack {
                        StoriesView(stories: stories)
                        
                        ForEach(posts, id: \.self) { post in
                            FBPost(post: post)
                            Spacer()
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: .constant(""))
            .preferredColorScheme(.dark)
            
    }
}
