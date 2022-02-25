//
//  ContentView.swift
//  TestingPath
//
//  Created by Leandro Hernandez on 21/2/22.
//

import SwiftUI

struct ContentView: View {
    
    private var radioOutside: CGFloat {
        return UIScreen.main.bounds.width - 40
    }
    
    private var radioInside: CGFloat {
        return self.radioOutside * 0.92
    }
    
    private var needlesDimension: CGSize {
        return CGSize(width: self.radioInside * 0.958, height: self.radioOutside * 0.12)
    }
    
    private var bigLine: CGSize {
        return CGSize(width: self.needlesDimension.height * 0.1, height: self.needlesDimension.width * 0.106)
    }
    
    private var smallLine: CGSize {
        return CGSize(width: self.needlesDimension.height * 0.1, height: self.needlesDimension.width * 0.053)
    }
    
    var outsideView: some View {
        Circle()
            .fill(
                LinearGradient(
                    gradient: .init(colors: [Color.ui.lightGray, Color.ui.cultured]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(width: self.radioOutside, height: self.radioOutside, alignment: .center)
    }
    
    var insideView: some View {
        Circle()
            .fill(
                RadialGradient(gradient: Gradient(colors: [Color.ui.vividSkyBlue, Color.ui.blueDeFrance]), center: .center, startRadius: 0, endRadius: 140)
            )
            .frame(width: self.radioInside, height: self.radioInside, alignment: .center)
    }
    
    var linesView: some View {
        Spacer()
            .frame(width: self.needlesDimension.width, height: self.needlesDimension.width, alignment: .center)
            .overlay(content: {
                
                ForEach(0..<30) { i in
                    Path() { path in
                        path.move(to: CGPoint(x: 0, y: self.needlesDimension.width/2))
                        path.addLine(to: CGPoint(x: self.bigLine.height, y: self.needlesDimension.width/2))
                    }
                    .stroke(style: StrokeStyle(lineWidth: self.bigLine.width, lineCap: .round))
                    .foregroundColor(Color.white)
                    .rotationEffect(Angle(degrees: Double(12*i)))
                }
                
                ForEach(0..<30) { i in
                    Path() { path in
                        path.move(to: CGPoint(x: 0, y: self.needlesDimension.width/2))
                        path.addLine(to: CGPoint(x: self.smallLine.height, y: self.needlesDimension.width/2))
                    }
                    .stroke(style: StrokeStyle(lineWidth: self.smallLine.width, lineCap: .round))
                    .foregroundColor(Color.white)
                    .rotationEffect(Angle(degrees: Double(12*i)+6))
                }
            })
    }
    
    var needlesView: some View {
        Spacer()
            .frame(width: self.needlesDimension.width, height: self.needlesDimension.height, alignment: .center)
            .overlay(content: {
                
                Path() { path in
                    path.move(to: CGPoint(x: self.needlesDimension.width/2, y: 0))
                    path.addLine(to: CGPoint(x: self.needlesDimension.width, y: (self.needlesDimension.height/2)+3))
                    path.addLine(to: CGPoint(x: self.needlesDimension.width/2, y: self.needlesDimension.height))
                    path.addLine(to: CGPoint(x: 0, y: (self.needlesDimension.height/2)+3))
                    path.closeSubpath()
                }
                .fill(Color.black.opacity(0.4))
                .blur(radius: 3)
                .offset(x: 0, y: 2)
                
                Path() { path in
                    path.move(to: CGPoint(x: self.needlesDimension.width/2, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: self.needlesDimension.height/2))
                    path.addLine(to: CGPoint(x: self.needlesDimension.width/2, y: self.needlesDimension.height))
                    path.closeSubpath()
                }
                .fill(Color.ui.cultured)

                Path() { path in
                    path.move(to: CGPoint(x: self.needlesDimension.width/2, y: 0))
                    path.addLine(to: CGPoint(x: self.needlesDimension.width, y: self.needlesDimension.height/2))
                    path.addLine(to: CGPoint(x: self.needlesDimension.width/2, y: self.needlesDimension.height))
                    path.closeSubpath()
                }
                .fill(Color.ui.tartOrange)

                Path() { path in
                    path.move(to: CGPoint(x: self.needlesDimension.width/2, y: self.needlesDimension.height/2))
                    path.addLine(to: CGPoint(x: 0, y: self.needlesDimension.height/2))
                    path.addLine(to: CGPoint(x: self.needlesDimension.width/2, y: self.needlesDimension.height))
                    path.closeSubpath()
                }
                .fill(Color.ui.grayX)

                Path() { path in
                    path.move(to: CGPoint(x: self.needlesDimension.width/2, y: self.needlesDimension.height/2))
                    path.addLine(to: CGPoint(x: self.needlesDimension.width, y: self.needlesDimension.height/2))
                    path.addLine(to: CGPoint(x: self.needlesDimension.width/2, y: self.needlesDimension.height))
                    path.closeSubpath()
                }
                .fill(Color.ui.maximumRed)
            })
    }
    
    var body: some View {
        ZStack {
            self.outsideView
            self.insideView
            self.linesView.rotationEffect(Angle(degrees: 4))
            self.needlesView.rotationEffect(Angle(degrees: -45))
        }
        .frame(width: self.radioOutside, height: self.radioOutside, alignment: .center)
        .background(.clear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
