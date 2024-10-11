//
//  Home.swift
//  xWallet
//
//  Created by Joshua Wegener on 10/10/24.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        VStack(spacing: 20.0) {
            //MARK: - AppBar
            appBar
            //MARK: - Card view
            VStack {
                CardView(color: Color.mint.opacity(0.2), shapeAngle: .degrees(0.0))
                CardView(color: .black, shapeAngle: .degrees(180.0))
                    .foregroundStyle(Color.white)
            }
            .overlay {
                CardOverlay
            }
            
            //MARK: - List View
            ListHeader
            
            List(0..<10) { index in
                HStack(alignment: .center, spacing: 10.0) {
                    Image(systemName: index % 3 == 0 ? "arrow.up" : "arrow.down")
                        .font(.system(size: 10, weight: .bold))
                    VStack(alignment: .leading) {
                        Text("Grocery Shopping")
                            .font(.system(size: 12, weight: .medium))
                        Text("4/3/2024")
                            .font(.system(size: 10, weight: .regular))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("-50.00")
                        .font(.system(size: 10, weight: .medium))
                }
                .frame(maxWidth: .infinity)
                .padding(8.0)
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(index.isMultiple(of: 3) ? Color.red.opacity(0.4) : Color.green.opacity(0.4))
                        .shadow(color: Color.black.opacity(0.4), radius: 2.0, x: 0.0, y: 2.0)
                        .padding(.vertical, 3.0)
                        .padding(.horizontal, 20.0)
                )
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    //MARK: - AppBar Declaration
    var appBar: some View {
        HStack(alignment: .center, spacing: 0.0) {
            Text("xWallet")
                .font(.title2.bold())
            Spacer(minLength: 0.0)
            Button {
                print("Clicked")
            } label: {
                Image(systemName: "bell")
                    .font(.system(size: 20.0))
                    .foregroundStyle(Color.black)
            }
        }
        .padding(.horizontal)
    }
    
    func CardView(color: Color, shapeAngle: Angle) -> some View {
        VStack(alignment: .center) {
            Text("You Pay")
                .font(.system(size: 14.0, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30.0)
                .padding(.top, 20.0)
            HStack(alignment: .center, spacing: 5.0) {
                Image("dollar")
                    .padding(15.0)
                    .background(Color.white.opacity(0.7))
                    .clipShape(Circle())
                Text("USDT")
                    .font(.system(size: 12.0, weight: .bold))
                Image(systemName: "chevron.down")
                    .font(.system(size: 12.0, weight: .bold))
                Spacer()
                Text("452.00")
                    .font(.system(size: 20.0, weight: .heavy))
                Text("USDT")
                    .font(.system(size: 12.0, weight: .medium))
                    
            }
            .padding(.top, 10.0)
            .padding(.horizontal, 10.0)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150, alignment: .top)
        .background(
            CardCustomShape()
                .fill(color)
                .rotationEffect(shapeAngle)
        )
        .padding(.horizontal, 20.0)
    }
    
    var CardOverlay: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Text("Half")
                    .font(.system(size: 13.0, weight: .medium))
                    .padding(5.0)
                    .background(Color.orange.opacity(0.6))
                    .clipShape(Capsule())
                Text("Max")
                        .font(.system(size: 13.0, weight: .medium))
                        .padding(5.0)
                        .background(Color.purple.opacity(0.6))
                        .clipShape(Capsule())
            }
            .padding(.top, 10.0)
            Spacer()
            ZStack {
                Circle()
                    .stroke(lineWidth: 1.5)
                    .frame(width: 55.0, height: 55.0)
                Image(systemName: "arrow.clockwise.circle.fill")
                    .resizable()
                    .frame(width: 45.0, height: 45.0)
            }
            Spacer()
            HStack {
                Text("Overview")
                    .font(.system(size: 12.0, weight: .medium))
                Image(systemName: "chevron.down")
                    .font(.system(size: 12.0, weight: .medium))
            }
            .foregroundStyle(Color.white)
            .frame(width: 90.0, height: 25.0)
            .background(Color.black.opacity(0.9 ))
            .clipShape(Capsule())
            .padding(.bottom, 10.0)
        }
    }
    
    var ListHeader: some View {
        HStack(alignment: .bottom) {
            Text("Recent Transactions")
                .font(.callout.bold())
            Spacer()
            Text("See all")
                .font(.footnote.bold())
                .foregroundStyle(Color.blue)
        }
        .padding(.horizontal, 20.0)
    }
}

struct CardCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 20.0, y: 0.0))
            
            //center left notch
            path.addLine(to: CGPoint(x: (rect.width / 2.0) - 70.0, y: 0.0))
            path.addQuadCurve(to: CGPoint(x: (rect.width / 2.0) - 50.0, y: 20.0), control: CGPoint(x: (rect.width / 2.0) - 50.0, y: 0.0))
            
            path.addQuadCurve(to: CGPoint(x: (rect.width / 2.0) - 30.0, y: 40.0), control: CGPoint(x: (rect.width / 2.0) - 50.0, y: 40.0))
            
            path.addLine(to: CGPoint(x: (rect.width / 2) + 30.0, y: 40.0))
            path.addQuadCurve(to: CGPoint(x: (rect.width / 2.0) + 50.0, y: 20.0), control: CGPoint(x: (rect.width / 2.0) + 50.0, y: 40.0))
            
            path.addQuadCurve(to: CGPoint(x: (rect.width / 2) + 70.0, y: 0.0), control: CGPoint(x: (rect.width / 2.0) + 50.0, y: 0.0))
            
            //top right curve
            
            path.addLine(to: CGPoint(x: rect.width - 20.0, y: 0.0))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: 20.0), control: CGPoint(x: rect.width, y: 0.0))
            
            
            //bottom right curve
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - 20.0))
            path.addQuadCurve(to: CGPoint(x: rect.width - 20.0, y: rect.height), control: CGPoint(x: rect.width, y: rect.height))
            
            //code for center arc
            
            path.addLine(to: CGPoint(x: (rect.width / 2.0) + 60.0, y: rect.height))
            
            path.addCurve(to: CGPoint(x: (rect.width / 2.0), y: rect.height - 30.0), control1: CGPoint(x: (rect.width / 2.0) + 10.0, y: rect.height), control2: CGPoint(x: (rect.width / 2.0) + 40.0, y: rect.height - 25.0))
            
            path.addCurve(to: CGPoint(x: (rect.width / 2.0) - 60.0, y: rect.height), control1: CGPoint(x: (rect.width / 2.0) - 40.0, y: rect.height - 25.0), control2: CGPoint(x: (rect.width / 2.0) - 10.0, y: rect.height))
            path.addLine(to: CGPoint(x: 20.0, y: rect.height))
            
            //bottom left curve
            
            path.addLine(to: CGPoint(x: 20.0, y: rect.height))
            path.addQuadCurve(to: CGPoint(x: 0.0, y: rect.height - 20.0), control: CGPoint(x: 0.0, y: rect.height))
            
            //top left curve
            
            path.addLine(to: CGPoint(x: 0.0, y: 20.0))
            path.addQuadCurve(to: CGPoint(x: 20.0, y: 0.0), control: CGPoint.zero)
        }
    }
}
