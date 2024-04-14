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
    PostModel(icon: .green, title: "ფიგმამ თქვენც დაგტანჯათ?", description: "შევწუხდი დაბალი ხარისხით იწერს ყველას"),
    PostModel(icon: .yellow, title: "მეტი ბედინა გვინდა", description: "შევწუხდით ნუ, აღარ გვინდა ამდენი ტეილორ Swift-ი"),
    PostModel(icon: .yellow, title: "როდის ვქეიფობთ?", description: "როცა საშუალება ცოტაა დავალებები გვექნება -.- ანუ არასდროს დდდდ ")

]
