//
//  Home.swift
//  Resizable App Bar
//
//  Created by hosam on 12/16/20.
//

import SwiftUI

struct Home: View {
    
    // top edge value...
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    @State var current = "house.fill"
    @Namespace var animation
    
    @State var isHide = false
    
    var body: some View {
        
        VStack(spacing: 0){
            
            // App Bar....
            VStack(spacing: 22){
                
                // hiding...
                if !isHide{
                    
                    HStack(spacing: 12){
                        
                        Text("facebook")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("fb"))
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}) {
                            
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color.black.opacity(0.1))
                                .clipShape(Circle())
                        }
                        
                        Button(action: {}) {
                            
                            Image(systemName: "message.fill")
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color.black.opacity(0.1))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                }
                
                // CUstom Tab Bar....
                
                HStack(spacing: 0){
                    
                    TabBarButton(current: $current, image: "house.fill", animation: animation)
                    TabBarButton(current: $current, image: "magnifyingglass", animation: animation)
                    TabBarButton(current: $current, image: "person.2.fill", animation: animation)
                    TabBarButton(current: $current, image: "tv.fill", animation: animation)
                }
            }
            .padding(.top,top! + 10)
            .background(Color.white)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 0){
                    
                    // geomtry reader for getting location values....
                    
                    GeometryReader{reader -> AnyView in
                        
                        let yAxis = reader.frame(in: .global).minY
                        
                        // logic simple if if goes below zero hide nav bar
                        // above zero show navbar...
                        
                        if yAxis < 0 && !isHide{
                            DispatchQueue.main.async {
                                withAnimation{isHide = true}
                            }
                        }
                        
                        if yAxis > 0 && isHide{
                            DispatchQueue.main.async {
                                withAnimation{isHide = false}
                            }
                        }
                        
                        return AnyView(
                            Text("")
                                .frame(width: 0, height: 0)
                        )
                    }
                    .frame(width: 0, height: 0)
                    
                    VStack(spacing: 15){
                        
                        ForEach(1...20,id: \.self){i in
                            
                            VStack(spacing: 10){
                                
                                HStack(spacing: 10){
                                    
                                    Image(systemName:"person.fill")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        
                                        Text("Hosam Mohamed")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                        
                                        Text("\(45 - i) Min")
                                    }
                                    
                                    Spacer(minLength: 0)
                                }
                                
                                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. ")
                            }
                            .padding()
                            .background(Color.white)
                        }
                    }
                    
                }
            }
            .padding(.top)
        }
        .background(Color.black.opacity(0.07))
        .ignoresSafeArea()
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
