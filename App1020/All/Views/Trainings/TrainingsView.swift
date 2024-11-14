//
//  TrainingsView.swift
//  App1020
//
//  Created by IGOR on 09/11/2024.
//

import SwiftUI

struct TrainingsView: View {

    @StateObject var viewModel = TrainingsViewModel()
    @StateObject var mainModel = StudentsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Training plan")
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
                .padding(.bottom, 4)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(viewModel.days, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentDay = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .medium))
                                    .frame(width: 60, height: 28)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim").opacity(viewModel.currentDay == index ? 1 : 0)))
                            })
                        }
                    }
                }
                .frame(height: 50)
                .padding(.bottom)
                
                if viewModel.trainings.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                        
                        Text("You don’t have any groups")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 16, weight: .regular))
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.trainings.filter{($0.trDay ?? "") == viewModel.currentDay}, id: \.self) { index in
                            
                                ForEach(mainModel.students.filter{($0.stName ?? "") == index.trGroup ?? ""}, id: \.self) { indexer in
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text(indexer.stName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                            Spacer()
                       
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 12) {
                                            
                                            Text(index.trPDur ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(4)
                                                .padding(.horizontal, 5)
                                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                                            
                                            Text(index.trPName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 17, weight: .semibold))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 20).stroke(.white.opacity(0.5)))
                                        .padding(1)
                                    }
                                    .padding(.bottom)
                                }
                            }
                        }
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchTrains()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddTraining(viewModel: viewModel)
        })
        .onAppear {
            
            mainModel.fetchStuds()
        }
    }
}

#Preview {
    TrainingsView()
}
