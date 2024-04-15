//
//  PostModel.swift
//  TsutsunHub
//
//  Created by telkanishvili on 14.04.24.
//

import UIKit


enum Icon: String {
    
    case red = "Red"
    case purple = "Purple"
    case green = "Green"
    case yellow = "Yellow"
}

struct PostModel {
    let icon: Icon
    let title: String
    let description: String
}

var existingPosts: [PostModel] = [
    PostModel(icon: .red, title: "ბექა რას გვერჩი?", description: "ახლა გავხსენი დავალება, ეს რააარიიი"),
    PostModel(icon: .purple, title: "რამე სიმღერა მირჩიეთ", description: "დავალების კეთებისას ღამე ძაან მეძინება, ყავამ არ მიშველა"),
    PostModel(icon: .yellow, title: "მეტი ბედინა გვინდა", description: "ჩემი მეზობელია და ისედაც ყოველდღე ვხედავ :დდ"),
    PostModel(icon: .red , title: "კაი და ისევ დიალოგები თორნიკე?", description: "სხვარაგზაა? კომუნიკაციის ყველაზე მარტივი საშუალებაა"),
    PostModel(icon: .purple, title: "ისადა როდის ვქეიფობთ?", description: "აი ახლა ოთხშაბათს, სამშბათს რეტრო უწევს და ბედნიერები ვიქნებით :დ")

]
