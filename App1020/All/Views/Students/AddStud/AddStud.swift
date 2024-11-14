//
//  AddStud.swift
//  App1020
//
//  Created by IGOR on 09/11/2024.
//

import SwiftUI

struct AddStud: View {

    @StateObject var viewModel: StudentsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New group")
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
                                .opacity(viewModel.stName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.stName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                        ZStack(content: {
                            
                            Text("Average age")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.stAge.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.stAge)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        Menu(content: {
                            
                            ForEach(viewModel.sports, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentSport = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                        
                                    })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentSport.isEmpty {
                                
                                HStack {
                                    
                                    Text("Type of sport")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 16, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                
                            } else {
                                
                                HStack {
                                    
                                    Text(viewModel.currentSport)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
         
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                        })

                        Text("Students")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter name a student")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.stStudents.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.stStudents)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                    }
                }
                
                Button(action: {

                    viewModel.stType = viewModel.currentSport
                    
                    viewModel.addStud()
                    
                    viewModel.stName = ""
                    viewModel.stAge = ""
                    viewModel.stStudents = ""
                    viewModel.currentSport = ""
                    
                    viewModel.fetchStuds()
                    
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
            }
            .padding()
        }
    }
}

#Preview {
    AddStud(viewModel: StudentsViewModel())
}
