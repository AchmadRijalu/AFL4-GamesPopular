//
//  ProfileView.swift
//  GamesPopular
//
//  Created by Macbook Pro on 11/05/22.
//

import SwiftUI

struct ProfileView: View {
    
//    var Edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State private var ison = false
    @State private var isexit = false
    @State private var about = false
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Settings").font(.largeTitle).bold()
                .padding(.bottom , 40)
            VStack(){
                VStack(alignment: .leading){
                    Text("Appeareance").foregroundColor(.blue)
                    HStack{
                    Image(systemName: "moon.stars")
                        Text("Night Mode")
                        Spacer()
                        Toggle(isOn: $ison, label:{
                            Text("Toggle")
                        }).labelsHidden()
                    }.padding(18).background(.white).cornerRadius(10).shadow(color: .black, radius: 0.6, x: 0, y: 2)
                }.padding(.bottom , 27)
                
                VStack(alignment: .leading, spacing: 15){
                    Text("Help").foregroundColor(.blue)
                    HStack{
                    Image(systemName: "goforward")
                        Text("Version")
                        Spacer()
                        Text("1.0").bold()
                    }.padding(20).background(.white).cornerRadius(10).shadow(color: .black, radius: 0.6, x: 0, y: 2)
                    Button(action: {
                        about.toggle()
                    }) {
                        HStack {
                            Image(systemName: "gear.circle")
                            Text("About Application").foregroundColor(.black).frame(height: 24).frame(maxWidth: .infinity , alignment: .leading).font(.headline)
                        }
                    }.alert("This application is my project in 4th Semester", isPresented: $about){
                        Button("Okay", role: .cancel){
                            
                        }
                    }.foregroundColor(.black).frame(height: 24).frame(maxWidth: .infinity , alignment: .leading).padding( 20).foregroundColor(.white).cornerRadius(10).background(.white).cornerRadius(10).shadow(color: .black, radius: 0.6, x: 0, y: 2)
                   
                    
                    
                    Button(action: {
                        if let url = URL(string: "https://achmadrijalu.github.io/Jaloouu") {
                               UIApplication.shared.open(url)
                            }
                    }) {
                        HStack {
                            Image(systemName: "phone.fill")
                            Text("Contact Us").foregroundColor(.black).frame(height: 24).frame(maxWidth: .infinity , alignment: .leading)
                        }
                    }.foregroundColor(.black).frame(height: 24).frame(maxWidth: .infinity , alignment: .leading).padding( 20).foregroundColor(.white).cornerRadius(10).background(.white).cornerRadius(10).shadow(color: .black, radius: 0.6, x: 0, y: 2)

                }.padding(1)
            }
            
            Spacer()
            VStack{
//                HStack{
//                    Text("Exit").foregroundColor(.white).bold()
//                    Spacer()
//                    Image(systemName: "rectangle.portrait.and.arrow.right")
//
//                }.onTapGesture {
//
//                }.alert("Exit Application?", isPresented: $isexit){
//                    Button("Exit", role: .destructive){
//                        exit(0)
//                    }
//                    Button("Cancel", role: .cancel){
//                    }
//                }.padding(18).background(.pink).cornerRadius(10).shadow(color: .black, radius: 0.6, x: 0, y: 2)
                Button(action: {
                    isexit.toggle()
                }) {
                    HStack {
                        Text("Exit").foregroundColor(.white).frame(height: 24).frame(maxWidth: .infinity , alignment: .leading).font(.headline)
                        Spacer()
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                }.alert("Exit this apps?", isPresented: $isexit){
                    Button("Exit", role: .destructive){
                                            exit(0)
                    }
                    Button("Cancel", role: .cancel){
                    }
                    
                    
                }.foregroundColor(.white).frame(height: 24).frame(maxWidth: .infinity , alignment: .leading).padding( 20).foregroundColor(.white).cornerRadius(10).background(.pink).cornerRadius(10).shadow(color: .black, radius: 0.6, x: 0, y: 2)
                
            }
            
        }.padding(50)
            .background(.white)

        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
