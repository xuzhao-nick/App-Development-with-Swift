# Advanced Topic of Swift

## [Generic type and Associated type](documents/GenericAndAssociatedType.md)
- Generic enables you to write flexible, reusable functions and types that can work with any type.
- Associated type gives a placeholder name to a type that is used as part of the protocol. 

## [Opaque type and 'some' keyword](documents/Some.md)
- <b>Opaque type</b> can be thought of as “a concrete type that implements this protocol”. 
- <b>Opaque type</b> is denoted with `some Protocol` in function’s interface

## [Phantom type](documents/Phantom.md)
- The basic definition of a phantom type is: a type that doesn’t use at least one of its generic type parameters. 
- Phantom types are a powerful way to give the Swift compiler extra information about our code so that it can stop us from making mistakes and validate different variants of a given value. 

## [Recursive Enumerations](documents/RecursiveEnum.md)
- A `recursive enumeration` is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing `indirect` before it, which tells the compiler to insert the necessary layer of indirection.

## [Error Handling](documents/ErrorHandling.md)
