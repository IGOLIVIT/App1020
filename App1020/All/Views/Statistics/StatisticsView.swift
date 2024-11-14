//
//  StatisticsView.swift
//  App1020
//
//  Created by IGOR on 09/11/2024.
//

import SwiftUI

struct StatisticsView: View {

    @StateObject var viewModel = StatisticsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Statistics")
                        .foregroundColor(.white)
                        .font(.system(size: 31, weight: .bold))
                    
                    Spacer()

                }
                .padding(.bottom, 24)
                                    
                    VStack {
                        
                        VStack {
                            
                            ZStack {
                                
                                Circle()
                                    .stroke(.white.opacity(0.2), lineWidth: 15)
                                    .frame(width: 200)
                                
                                Text("Sport group")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .bold))
                            }
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        
                        HStack {
                            
                            VStack {
                                
                                Text("\(viewModel.totSes)")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 26, weight: .semibold))
                                
                                Text("Total sessions")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 16, weight: .regular))
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                            
                            VStack {
                                
                                Text("\(viewModel.time):00")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 26, weight: .semibold))
                                
                                Text("Average duration")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 16, weight: .regular))
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                            
                        }
                    }
                    
                    HStack {
                        
                        Text("Goals")
                            .foregroundColor(.white)
                            .font(.system(size: 31, weight: .bold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                                .padding(5)
                                .background(Circle().fill(Color("prim")))
                        })
                    }
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(viewModel.goals, id: \.self) { index in
                        
                            VStack {
                                
                                Text(index.gName ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .medium))
                                
                                Text(index.gAchName ?? "")
                                    .foregroundColor(.white.opacity(0.8))
                                    .font(.system(size: 15, weight: .medium))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                            .background(RoundedRectangle(cornerRadius: 20).stroke(.white.opacity(0.7)))
                            .padding(1)
                        }
                    })
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchGoals()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddGoal(viewModel: viewModel)
        })
    }
}

#Preview {
    StatisticsView()
}
