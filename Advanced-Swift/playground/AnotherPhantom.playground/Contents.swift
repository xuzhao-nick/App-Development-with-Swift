// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGPoint
import struct CoreGraphics.CGSize
import struct CoreGraphics.CGRect

/*
 Old implementation
struct Shape {
  
  enum `Type` {
    case circle
    case square
    case rotatedSquare
    case rect
    case rotatedRect
    case ellipse
    case rotatedEllipse
  }
  
  var shapeType: Type
  var rect: CGRect
  var angle: CGAngle
}
 // Make a circle with a center at the origin and radius of 10
 
 let center = CGPoint.zero
 let radius: CGFloat = 10


 let circle = Shape(shapeType: .circle,
                    rect: CGRect(x: center.x - radius,
                                 y: center.y - radius,
                                 width: radius*2,
                                 height: radius*2),
                    angle: angle)
  
 */


//Phantom implementation

struct CGAngle {
  var radians: CGFloat
}


extension CGAngle {
  @inlinable init(degrees: CGFloat) {
    radians = degrees / 180.0 * CGFloat.pi
  }
  @inlinable var degrees: CGFloat {
    get {
      return radians / CGFloat.pi * 180.0
    }
    set {
      radians = newValue / 180.0
    }
  }
}

extension CGAngle: CustomStringConvertible {
  var description: String {
    return String(format: "%0.2f°", degrees)
  }
}

let angle = CGAngle(radians: .pi)


enum Shape {
  case circle(center: CGPoint, radius: CGFloat)
  case square(origin: CGPoint, size: CGFloat)
  case rotatedSquare(origin: CGPoint, size: CGFloat, angle: CGAngle)
  case rect(CGRect)
  case rotatedRect(CGRect, CGAngle)
  case ellipse(CGRect)
  case rotatedEllipse(CGRect, CGAngle)
  
  var area: CGFloat {
    switch self {
    case .circle(center:_, radius: let radius):
      return radius * radius * .pi
    case .square(origin: _, size: let size):
      return size * size
    case .rotatedSquare(origin: _, size: let size, angle: _):
      return size * size
    case .rect(let rect):
      return rect.size.width * rect.size.height
    case .rotatedRect(let rect, _):
      return rect.size.width * rect.size.height
    case .ellipse(let rect):
      return rect.width * rect.height * .pi / 4.0
    case .rotatedEllipse(let rect, _):
      return rect.width * rect.height * .pi / 4.0
    }
  }
}


// Make a circle with a center at the origin and radius of 10
let circle = Shape.circle(center: .zero, radius: 10)
circle.area
let rectangle = Shape.rect(CGRect.init(x: 0, y: 0, width: 10, height: 20))
rectangle.area
