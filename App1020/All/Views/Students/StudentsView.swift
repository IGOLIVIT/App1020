//
//  StudentsView.swift
//  App1020
//
//  Created by IGOR on 09/11/2024.
//

import SwiftUI

struct StudentsView: View {
    
    @StateObject var viewModel = StudentsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("My students")
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
                .padding(.bottom, 24)
                
                if viewModel.students.isEmpty {
                    
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
                            
                            ForEach(viewModel.students, id: \.self) { index in
                            
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 12) {
                                        
                                        Text("Avg. age: \(index.stAge ?? "") y.o.")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12, weight: .regular))
                                            .padding(.horizontal, 6)
                                            .padding(5)
                                            .background(RoundedRectangle(cornerRadius: 4).fill(Color("prim")))
                                        
                                        Text(index.stName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .semibold))
                                        
                                        Text(index.stStudents ?? "")
                                            .foregroundColor(.white.opacity(0.5))
                                            .font(.system(size: 15, weight: .regular))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Spacer()
                                    
                                    Image(index.stType ?? "")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                    
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 25.0).stroke(.white.opacity(0.5)))
                                .padding(1)
                            }
                        }
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchStuds()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddStud(viewModel: viewModel)
        })
    }
}

#Preview {
    StudentsView()
}
