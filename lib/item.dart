import 'package:flutter/material.dart';

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name)
  // To make the sample app look nicer, each item is given one of the
  // Material Design primary colors.
      : color = Colors.primaries[id % Colors.primaries.length];


  //In Dart, hashCode is a method defined in the Object class,
  // which is the root of the Dart class hierarchy.
  // The hashCode method is used to generate a hash code value for an object,
  // which can be used to identify the object in hash-based data structures like HashSet and HashMap.
  @override
  int get hashCode
  {
    return id;
  }

  // @override
  // bool operator ==(Object other) => other is Item && other.id == id;

  @override
  bool operator ==(Object other) {
    if (other is Item) {
      return other.id == id;
    }
    return false;
  }

//In Dart, the == operator is used to test whether two objects are equal.
//By default, the == operator checks whether two objects are the same instance,
// which means that it returns true if and only if
// the two object references point to the same object in memory.
//
// In the code you provided, the == operator is overridden in the Item class to implement a custom equality check.
// The implementation checks whether the other object is an Item object
// and whether its id field is equal to the id field of the current Item object.
// If both conditions are true, the == operator returns true,
// indicating that the two Item objects are equal according to this definition of equality.
//
// By providing a custom implementation of the == operator,
// you can define equality for objects based on their contents rather than their memory addresses.
// This is useful in many situations,
// especially when working with collections of objects where you want to be able to compare objects based on their values
// rather than their references.
}