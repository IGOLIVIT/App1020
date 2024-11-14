//
//  SettingsView.swift
//  App1020
//
//  Created by IGOR on 09/11/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 31, weight: .bold))
                    
                    Spacer()
                    
                }
                .padding(.bottom, 24)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("bg"))
                                    .font(.system(size: 12, weight: .regular))
                                    .frame(width: 25, height: 25)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                                
                                Text("Rate us")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .semibold))
                                
                                Spacer()
                                
                                Text("Rate")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .padding(5)
                                    .padding(.horizontal, 4)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            }
                            .padding()
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 20.0).fill(Color("bg2")))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/c8685455-5411-421c-b75e-b0b7622b8c74") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "person.badge.shield.checkmark.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 23, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .semibold))
                                
                                Spacer()
                                
                                Text("Read")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .padding(5)
                                    .padding(.horizontal, 4)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            }
                            .padding()
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 20.0).fill(Color("bg2")))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
