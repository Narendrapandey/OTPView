//
//  ContentView.swift
//  OTPViewExample
//
//  Created by Priyanka Pandey on 15/10/24.
//

extension String {
    public subscript(_ idx: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: idx)]
    }
}
