//
//  AddTraining.swift
//  App1020
//
//  Created by IGOR on 11/11/2024.
//

import SwiftUI

struct AddTraining: View {

    @StateObject var viewModel: TrainingsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Create plan")
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
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isGroups = true
                            }
                            
                        }, label: {
                            
                            if viewModel.gNameForAdd.isEmpty {
                                
                                HStack {
                                    
                                    Text("Group")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 16, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                
                            } else {
                                
                                HStack {
                                    
                                    Text(viewModel.gNameForAdd)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
         
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 16, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                        })

                        Menu(content: {
                            
                            ForEach(viewModel.days, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.dayForAdd = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                        
                                    })
                            }
                            
                        }, label: {
                            
                            if viewModel.dayForAdd.isEmpty {
                                
                                HStack {
                                    
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Text("Day of the week*")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()

                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                
                            } else {
                                
                                HStack {
                                    
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Text(viewModel.dayForAdd)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
         
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                        })

                        Text("Parts")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Name")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.trPName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.trPName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                        ZStack(content: {
                            
                            Text("Duration")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.trPDur.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.trPDur)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        ZStack(content: {
                            
                            Text("Exercise")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.trPEx.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.trPEx)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))

                    }
                }
                
                Button(action: {
                    
                    viewModel.totSes += 1
                    viewModel.time += Int(viewModel.trPDur) ?? 0

                    viewModel.trGroup = viewModel.gNameForAdd
                    viewModel.trDay = viewModel.dayForAdd
                    
                    viewModel.addTrain()
                    
                    viewModel.trPName = ""
                    viewModel.trPDur = ""
                    viewModel.trPEx = ""
                    viewModel.dayForAdd = ""
                    viewModel.gNameForAdd = ""
                    
                    viewModel.fetchTrains()
                    
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
                .opacity(viewModel.gNameForAdd.isEmpty || viewModel.dayForAdd.isEmpty || viewModel.trPName.isEmpty ? 0.5 : 1)
                .disabled(viewModel.gNameForAdd.isEmpty || viewModel.dayForAdd.isEmpty || viewModel.trPName.isEmpty ? true : false)
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isGroups, content: {
            
            GroupsView(mainModel: viewModel)
        })
    }
}

#Preview {
    AddTraining(viewModel: TrainingsViewModel())
}
