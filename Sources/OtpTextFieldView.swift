//
//  ContentView.swift
//  OTPViewExample
//
//  Created by Priyanka Pandey on 15/10/24.
//

import SwiftUI
import Combine

public struct OTPTextFieldView: View {
    @State private var verificationCode = ""
    @FocusState private var focusedField: FocusField?
    
    public var pinLength: Int = 6
    public var keyboardType: UIKeyboardType = .numberPad
    public var onComplete: (String) -> ()
    
    public init(pinLength: Int, keyboardType: UIKeyboardType, onComplete: @escaping (String) -> Void) {
        self.pinLength = pinLength
        self.keyboardType = keyboardType
        self.onComplete = onComplete
    }
    
    public var body: some View {
        ZStack(alignment: .center) {
            OTPTextField(verificationCode: $verificationCode, pinLength: pinLength, keyboardType: keyboardType) {
                onComplete(verificationCode)
            }
            HStack {
                ForEach(0..<pinLength, id: \.self) { index in
                    ZStack {
                        Text(getPin(at: index))
                            .font(.custom(
                                "AmericanTypewriter",
                                fixedSize: 35))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Primary"))

                        Rectangle()
                            .frame(height: 3)
                            .foregroundColor(Color("Primary"))
                            .padding(.trailing, 5)
                            .padding(.leading, 5)
                            .opacity(verificationCode.count <= index ? 1 : 0)
                    }
                }
            }
        }.onAppear{
            UITextField.appearance().clearButtonMode = .never
            UITextField.appearance().tintColor = UIColor.clear
        }
    }
    
    func getPin(at index: Int) -> String {
        guard self.verificationCode.count > index else {
            return ""
        }
        
        return String(verificationCode[index])
    }
    
    
}
