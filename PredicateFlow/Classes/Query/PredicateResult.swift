//
// Created by Andrea Del Fante on 17/02/18.
//

import Foundation

/**
The result protocol of a predicate query.
*/
public protocol PredicateResult: CustomStringConvertible, CustomDebugStringConvertible {
	/**
	The predicate.
	*/
	var predicate: NSPredicate { get }
	
	/**
	The string format of this predicate result.
	*/
	var stringFormat: String { get }
	
	/**
	The arguments of this predicate results.
	*/
	var arguments: [Any] { get }
}

public extension PredicateResult {
	
	/**
	Alias for predicate.
	*/
	public func query() -> NSPredicate {
		return predicate
	}

    public var description: String {
        return predicate.description
    }

    public var debugDescription: String {
        return predicate.debugDescription
    }
}

internal struct ConcretePredicateResult: PredicateResult {
	private(set) var stringFormat: String
	private(set) var arguments: [Any]
	
	init(_ format: String, _ args: Any...) {
		self.stringFormat = format
		self.arguments = args
	}
	
	var predicate: NSPredicate {
		return NSPredicate(format: stringFormat, argumentArray: arguments)
	}
}
