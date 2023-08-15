//
//  TLButton.swift
//  TODO-List
//
//  Created by Apple on 12/08/23.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: ()-> Void
    
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(background)
                
                Text(title).foregroundColor(Color.white).bold()
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Text", background: Color.red){
            
        }
    }
}
