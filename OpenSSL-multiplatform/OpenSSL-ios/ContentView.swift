//
//  ContentView.swift
//  OpenSSL-multiplatform
//
//  Created by Dmitry Feld on 8/17/23.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var md5 = ""
    @State var sha256 = ""
    @State var sha512 = ""
    
    var body: some View {
        List {
            Section("Input") {
                TextField("Enter text Here", text: self.$text)
                    .onChange(of: self.text) { newValue in
                        if !newValue.isEmpty {
                            self.md5 = FSOpenSSL.md5(from: newValue)
                            self.sha256 = FSOpenSSL.sha256(from: newValue)
                            self.sha512 = FSOpenSSL.sha512(from: newValue)
                        } else {
                            self.md5 = "---"
                            self.sha256 = "---"
                            self.sha512 = "---"
                        }
                    }
            }
            Section("Hashes") {
                HStack {
                    Text("MD5 Hash:")
                    ScrollView(.horizontal) {
                        Text(self.md5)
                            .padding(3)
                    }
                    .border(.black)
                }
                HStack {
                    Text("SHA256 Hash:")
                    ScrollView(.horizontal) {
                        Text(self.sha256)
                            .padding(3)
                    }
                    .border(.black)
                }
                HStack {
                    Text("SHA512 Hash:")
                    ScrollView(.horizontal) {
                        Text(self.sha512)
                            .padding(3)
                    }
                    .border(.black)
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
