//
//  UnderclassMyUIView.swift
//  LABKA3
//
//  Created by Aplyn on 25.04.2021.
//

import Foundation
import UIKit


enum Art {
    case graphic;
    case diagram;
}

class UnderclassMyUIView: UIView {
    var currentArt: Art?
    
    override func draw(_ rect: CGRect) {
        
        guard let currentArt = currentArt else {
            drawGraphic()
            return
        }
        switch currentArt {
            case .graphic:
                drawGraphic()
            case .diagram:
                drawDiagram()
        }
    }
    
    func drawXOrdinate(lineXY:UIBezierPath, leftCentralPoint: CGPoint, rightCentralPoint: CGPoint, onePointVector: CGFloat) {
        
        lineXY.move(to: leftCentralPoint);
        lineXY.addLine(to: rightCentralPoint);

        lineXY.addLine(
            to: CGPoint(
                x: rightCentralPoint.x - 22,
                y: rightCentralPoint.y + 10
            )
        )
        lineXY.move(to: rightCentralPoint);
        lineXY.addLine(
            to: CGPoint(
                x: rightCentralPoint.x - 22,
                y: rightCentralPoint.y - 10
            )
        )

        lineXY.move(
            to: CGPoint(
                x: bounds.size.width / 2 + onePointVector,
                y: bounds.size.height / 2 - 8
            )
        )
        lineXY.addLine(
            to: CGPoint(
                x: bounds.size.width / 2 + onePointVector,
                y: bounds.size.height / 2 + 8
            )
        )
    }
    
    func drawYOrdinate(lineXY:UIBezierPath, bottomCentralPoint: CGPoint, topCentralPoint: CGPoint, onePointVector: CGFloat) {
        
        lineXY.move(to: bottomCentralPoint);
        lineXY.addLine(to: topCentralPoint);

        lineXY.addLine(
            to: CGPoint(
                x: topCentralPoint.x - 10,
                y: topCentralPoint.y + 22
            )
        )
        lineXY.move(to: topCentralPoint);
        lineXY.addLine(
            to: CGPoint(
                x: topCentralPoint.x + 10,
                y: topCentralPoint.y + 22
            )
        )

        lineXY.move(
            to: CGPoint(
                x: bounds.size.width / 2 - 8,
                y: bounds.size.height / 2 - onePointVector
            )
        )
        lineXY.addLine(
            to: CGPoint(
                x: bounds.size.width / 2 + 8,
                y: bounds.size.height / 2 - onePointVector
            )
        )
    }
    
    func drawCoordinateNet(onePointVector: CGFloat) {
        
        let leftCentralPoint = CGPoint(
            x: bounds.size.width/2 - onePointVector * CGFloat(Double.pi),
            y: bounds.size.height/2
        )
        let rightCentralPoint = CGPoint(
            x: bounds.size.width/2 + onePointVector * CGFloat(Double.pi),
            y: bounds.size.height/2
        )
        let bottomCentralPoint = CGPoint(
            x: bounds.size.width / 2,
            y: bounds.size.height / 2 + 2.5 * onePointVector
        )
        let topCentralPoint = CGPoint(
            x: bounds.size.width / 2,
            y: bounds.size.height / 2 - 2.5 * onePointVector
        )
        let lineXY = UIBezierPath();

        UIColor.black.setStroke()
        
        drawXOrdinate(lineXY: lineXY, leftCentralPoint: leftCentralPoint, rightCentralPoint: rightCentralPoint, onePointVector: onePointVector)
        
        drawYOrdinate(lineXY: lineXY, bottomCentralPoint: bottomCentralPoint, topCentralPoint: topCentralPoint, onePointVector: onePointVector)
        
        lineXY.stroke()
    }
    
    private func drawGraphic(){
        
        let onePointVector: CGFloat = 38
        
        drawCoordinateNet(onePointVector: onePointVector)
        
        let leftCentralPoint = CGPoint(
            x: bounds.size.width/2 - onePointVector * CGFloat(Double.pi),
            y: bounds.size.height/2
        )
        let path = UIBezierPath();

        UIColor.blue.setStroke()
        path.move(to:
                    CGPoint(
                        x:leftCentralPoint.x,
                        y:leftCentralPoint.y + CGFloat(onePointVector)
                    )
        )
        for point in 1...Int(Double(onePointVector) * 2.0 * Double.pi) {
            path.addLine(
                to: CGPoint(
                    x: leftCentralPoint.x + CGFloat(point),
                    y: leftCentralPoint.y - CGFloat(
                        cos(
                            CGFloat(-1 * Double.pi + Double(point)/Double(onePointVector))
                        ) * onePointVector
                    )
                )
            )
        }
        path.stroke()
    }
    
    
    private func drawDiagram(){
        
        let fullCircle = 2 * Float.pi
        
        let blueSegment = UIBezierPath();
        blueSegment.lineWidth = 60
        blueSegment.addArc(
            withCenter: CGPoint(x: bounds.size.width/2,y:bounds.size.height/2),
            radius: CGFloat(60),
            startAngle: CGFloat(0),
            endAngle: CGFloat(0.45 * fullCircle),
            clockwise: true
        )

        UIColor.blue.setStroke()
        blueSegment.stroke()
        
        let purpleSegment = UIBezierPath();
        purpleSegment.lineWidth = 60
        purpleSegment.addArc(
            withCenter: CGPoint(x: bounds.size.width/2,y:bounds.size.height/2),
            radius: CGFloat(60),
            startAngle: CGFloat(0.45 * fullCircle),
            endAngle: CGFloat(0.5 * fullCircle),
            clockwise: true
        )

        UIColor.purple.setStroke()
        purpleSegment.stroke()
        
        let yellowSegment = UIBezierPath();
        yellowSegment.lineWidth = 60
        yellowSegment.addArc(
            withCenter: CGPoint(x: bounds.size.width/2,y:bounds.size.height/2),
            radius: CGFloat(60),
            startAngle: CGFloat(0.5 * fullCircle),
            endAngle: CGFloat(0.75 * fullCircle),
            clockwise: true
        )
        
        UIColor.yellow.setStroke()
        yellowSegment.stroke()
        
        let graySegment = UIBezierPath();
        graySegment.lineWidth = 60
        graySegment.addArc(
            withCenter: CGPoint(x: bounds.size.width/2,y:bounds.size.height/2),
            radius: CGFloat(60),
            startAngle: CGFloat(0.75 * fullCircle),
            endAngle: CGFloat(fullCircle),
            clockwise: true
        )

        UIColor.gray.setStroke()
        graySegment.stroke()
    }
    
    func drawArt(art: Art) {
        currentArt = art
        setNeedsDisplay()
    }
}
