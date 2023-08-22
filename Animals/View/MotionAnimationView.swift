//
//  MotionAnimationView.swift
//  Animals
//
//  Created by Aayam Adhikari on 22/08/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    
    //MARK: - PROPERTIES
    
    // to create multiple circles on the screen
    @State private var randomCircle = Int.random(in: 12...16)
    
    @State private var isAnimating: Bool = false
    
    
    
    //MARK: - FUNCTIONS
    
    // 1. RANDOM COORDINATE
    
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // 2. RANDOM SIZE
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))  // generate different sizes randomly from 10 points to 300 points
    }
    
    // 3. RANDOM SCALE
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. RANDOM SPEED
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    // 5. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
    //MARK: - BODY
    var body: some View {
        
        // With GeometryReader container we can measure the screen size or any view's size if we wish. It gives us access to the size and position of the parent view
        GeometryReader { geometry in
            
            // Origin point of any view inside a geomerty reader will be changed from center to the top left
        
//            Text("Width: \(Int(geometry.size.width)) Height: \(Int(geometry.size.height))")  // gives exact size of the screen in points
            
            ZStack {
                
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                            , value: isAnimating)
                        .onAppear{
                            isAnimating = true
                        }
                }  //: LOOP
                
                //                // The content to appear above circle moves according to the position of the circle as in ZSTACK objects are above another object
                //                Text("Width: \(Int(geometry.size.width)) Height: \(Int(geometry.size.height))")  // gives exact size of the screen in points
                
            }  // ZSTACK
            .drawingGroup()  // complex rendering consumes more power, so to not hamper any motion of the circles, we add this modifier to the ZSTACK
            
        }  //: GEOMETRY
    }
}

//MARK: - PREVIEW
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
