//
//  AboutView.swift
//  Eftelya
//
//  Created by Doğa Demirtürk on 30.12.2023.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        Layout(content: mainContent as! AnyView, title: "About Eftelya")
    }

    private var mainContent: some View {
        VStack(spacing: .zero) {

            Spacer()

            ParagraphText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet velit vel tellus euismod aliquet. Nullam tincidunt aliquet velit, a vulputate lacus volutpat eu. Praesent non orci eu dui tristique ultrices. Suspendisse luctus, eros id bibendum tristique, dolor dolor dapibus metus, et aliquam elit augue a quam. Integer sit amet justo sit amet dolor fringilla scelerisque. Morbi elementum euismod justo, in fermentum ligula. Vivamus lacinia, sem sit amet tincidunt tincidunt, purus turpis dictum justo, vel fringilla urna mauris a augue.")

            ParagraphText(text: "Maecenas vitae congue elit. Etiam fringilla, justo id bibendum cursus, libero tortor accumsan lectus, nec fermentum ipsum felis ac erat. Sed sit amet eros a ligula varius ullamcorper nec vel nisl. Phasellus feugiat risus ut dui cursus, sit amet rhoncus neque euismod. Sed lacinia justo in bibendum sollicitudin. Ut eu justo vel urna dictum accumsan eget eu erat. Nulla facilisi. Duis rhoncus orci id sem fermentum, vitae scelerisque ex fermentum. Integer tincidunt, sem id pellentesque fermentum, lectus tortor facilisis velit, vel luctus nisl risus vel nisl.")

            Spacer()
        }
    }
}

#Preview {
    AboutView()
}
