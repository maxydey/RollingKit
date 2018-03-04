//
//  PropertyStoring.swift
//  RollingKit
//
//
//  this code with slight modifications was taken from this website:
// https://marcosantadev.com/stored-properties-swift-extensions

import Foundation

public protocol PropertyStoring {

    associatedtype T

    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T
    func setAssociatedObject(_ key: UnsafeRawPointer!, newValue: T)
}

public extension PropertyStoring {
  
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T {
        guard let value = objc_getAssociatedObject(self, key) as? T else {
            return defaultValue
        }
        return value
    }
    
    func setAssociatedObject(_ key: UnsafeRawPointer!, newValue: T) {
        
        objc_setAssociatedObject(self, key, newValue, .OBJC_ASSOCIATION_RETAIN)
    }
}
