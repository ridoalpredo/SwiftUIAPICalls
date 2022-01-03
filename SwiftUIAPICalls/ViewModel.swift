//
//  ViewModel.swift
//  SwiftUIAPICalls
//
//  Created by rido alpredo on 03/01/22.
//

import Foundation
import SwiftUI

struct Course: Hashable, Codable {
    let name: String
    let image: String
}

class ViewModel: ObservableObject{ //buat class dulu
    
    @Published var courses: [Course] = []
    
    func fetch() { //lakukan fetch (mengambil data json)
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php")else {
            return //masukinn link json nya
        }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else{
                return //lakukan URLSession
            }
            //Convert to JSON
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }
            catch {
                print("Error")
            }
        }
        task.resume()
    }
}

