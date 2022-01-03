//
//  ContentView.swift
//  SwiftUIAPICalls
//
//  Created by rido alpredo on 03/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.courses, id: \.self) {course in
                    HStack {
                        URLImage(urlString: course.image)
                       
                        Text(course.name).bold()
                    }
                }
            }
            .navigationTitle("Courses")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
