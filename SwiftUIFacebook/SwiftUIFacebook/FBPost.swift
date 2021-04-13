//
//  FBPost.swift
//  SwiftUIFacebook
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

struct FBPost: View {
    
    @State private var isLiked = false
    
    let post: FBPostModel
    
    var body: some View {
        VStack {
            HStack {
                Image(post.imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                
                VStack(alignment: .leading) {
                    Text(post.name)
                        .foregroundColor(.blue)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Text("12 minutes ago")
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Text(post.post)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            HStack {
                Button(action: {
                    
                    self.isLiked.toggle()
                }, label: {
                    Text(isLiked ? "liked" : "Like")
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Comment")
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Share")
                })
            }
            .padding()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(7)
    }
}

struct FBPost_Previews: PreviewProvider {
    static var previews: some View {
        FBPost(post: FBPostModel(name: "", post: "", imageName: ""))
    }
}
