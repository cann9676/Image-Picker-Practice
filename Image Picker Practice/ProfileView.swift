//
//  ProfileView.swift
//  Image Picker Practice
//
//  Created by Chelsea Hannah on 8/6/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            Button(action: {
                
                changeProfileImage = true
                openCameraRoll = true
                
            }, label: {
                if changeProfileImage {
                    Image(uiImage: imageSelected)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                } else {
                    Image("profileImage")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())

                }
                        })
            
            Image(systemName: "plus")
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .background(Color.gray)
                .clipShape(Circle())
        } .sheet(isPresented: $openCameraRoll) {
            ImagePicker(imageSelected: $imageSelected)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
