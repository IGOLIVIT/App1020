//
//  R2.swift
//  App1020
//
//  Created by IGOR on 09/11/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    Text("Track progress easily")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Organize and monitor each student's training routine and development in one place.")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()

                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    
                }
                .padding()
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .frame(height: 330)
                .background(RoundedRectangle(cornerRadius: 0).fill(Color("bg")))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    R2()
}
