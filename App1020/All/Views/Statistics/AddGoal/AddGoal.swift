//
//  AddGoal.swift
//  App1020
//
//  Created by IGOR on 11/11/2024.
//

import SwiftUI

struct AddGoal: View {

    @StateObject var viewModel: StatisticsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add goals")
                        .foregroundColor(.white.opacity(0.9))
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
          
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                            
                        })
                        
                        Spacer()

                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {

                        ZStack(content: {
                            
                            Text("Name")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.gName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.gName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                        ZStack(content: {
                            
                            Text("Achievement name")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.gAchName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.gAchName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                        ZStack(content: {
                            
                            Text("Description")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.gDescr.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.gDescr)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                    }
                }
                
                Button(action: {
                    
                    viewModel.addGoal()
                    
                    viewModel.gName = ""
                    viewModel.gAchName = ""
                    viewModel.gDescr = ""
                    
                    viewModel.fetchGoals()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .opacity(viewModel.gName.isEmpty || viewModel.gAchName.isEmpty ? 0.5 : 1)
                .disabled(viewModel.gName.isEmpty || viewModel.gAchName.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddGoal(viewModel: StatisticsViewModel())
}
