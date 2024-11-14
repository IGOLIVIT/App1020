//
//  GroupsView.swift
//  App1020
//
//  Created by IGOR on 11/11/2024.
//

import SwiftUI

struct GroupsView: View {

    @StateObject var viewModel = StudentsViewModel()
    @StateObject var mainModel: TrainingsViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                                    
                    Text("Add group")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
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
                            
                                Button(action: {
                                    
                                    viewModel.selectedStud = index
                                    mainModel.gNameForAdd = viewModel.selectedStud?.stName ?? ""
                                    
                                    withAnimation(.spring()) {
                                        
                                        mainModel.isGroups = false
                                    }
                                    
                                }, label: {
                                    
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
                                    .background(RoundedRectangle(cornerRadius: 25.0).stroke(.white.opacity(0.5)).opacity(viewModel.selectedStud == index ? 0 : 1))
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")).opacity(viewModel.selectedStud == index ? 1 : 0))
                                    .padding(1)
                                })
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
    }
}

#Preview {
    GroupsView(mainModel: TrainingsViewModel())
}
