//
//  PatternsDemo.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/7/22.
//

import Foundation
/**
 ### There are three main types of design patterns:
 1. Structural design pattern: Describes how objects are composed and combined to form larger structures.
 Examples of structural design patterns include Model- View-Controller (MVC), Model-View-ViewModel (MVVM) and Facade.
 
 2. Behavioral design pattern: Describes how objects communicate with each other.
 Examples of behavioral design patterns are Delegation, Strategy and Observer.
 
 3. Creational design pattern: Describes how to create or instantiate objects.
 Examples of creational patterns are Builder, Singleton and Prototype.
 
 
 
 ### Class Diagram Essentials
 Inheritance - IS A
 Dog IS A Animal

 Association - HAS A
 Dog HAS A Owner

 Implements / Conform to - protocol
 Owner implements PetOwning(protocol)

 Dependancy(uses) / Delegates to -
 Dog delegates to(uses) PetOwning
 
 
 
 ### Disign Patterns
1. MVC
 The model-view-controller (MVC) pattern separates objects into three distinct types. Yep, you guessed it: the three types are models, views and controllers!
 Here's how these types are related:
 • Models hold application data. They are usually structs or simple classes.
 • Views display visual elements and controls on screen. They are usually subclasses of UIView.
 • Controllers coordinate between models and views. They are usually subclasses of UIViewController.
 
 Controllers are allowed to have strong properties for their model and view so they can be accessed directly. Controllers may also have more than one model and/or view.
 Conversely, models and views should not hold a strong reference to their owning controller. This would cause a retain cycle.
 Instead, models communicate to their controller via property observing, which you’ll learn in depth in a later chapter, and views communicate to their controller via IBActions.
 
 Usage -
 Default pattern for UIKit classes
 
 
 
2. Delegation
 The delegation pattern enables an object to use another “helper” object to provide data or perform a task rather than do the task itself. This pattern has three parts:
 • An object needing a delegate, also known as the delegating object. It’s the object that has a delegate. The delegate is usually held as a weak property to avoid a retain cycle where the delegating object retains the delegate, which retains the delegating object.
 • A delegate protocol, which defines the methods a delegate may or should implement.
 • A delegate, which is the helper object that implements the delegate protocol. (object action as delegate)
 
 Usage -
 Use this pattern to break up large classes or create generic, reusable components. Delegate relationships are common throughout Apple frameworks, especially UIKit.
 Both DataSource- and Delegate-named objects actually follow the delegation
 
 
 
3. Strategy
 The strategy pattern defines a family of interchangeable objects that can be set or switched at runtime. This pattern has three parts:
 • The object using a strategy. This is most often a view controller when the pattern is used in iOS app development, but it can technically be any kind of object that needs interchangeable behavior.
 • The strategy protocol defines methods that every strategy must implement.
 • The strategies are objects that conform to the strategy protocol.
 
 Usage -
 Use the strategy pattern when you have two or more different behaviors that are interchangeable.
 This pattern is similar to the delegation pattern: both patterns rely on a protocol instead of concrete objects for increased flexibility. Consequently, any object that implements the strategy protocol can be used as a strategy at runtime.
 Unlike delegation, the strategy pattern uses a family of objects.
 Delegates are often fixed at runtime. For example, the dataSource and delegate for a UITableView can be set from Interface Builder, and it’s rare for these to change during runtime.
 Strategies, however, are intended to be easily interchangeable at runtime.

 

 4. Singleton
 The singleton pattern restricts a class to only one instance. Every reference to the class refers to the same underlying instance.
 The “singleton plus” pattern is also common, which provides a shared singleton instance that allows other instances to be created, too.
 
 Usage -
 Use the singleton pattern when having more than one instance of a class would cause problems, or when it just wouldn’t be logical.
 Use the singleton plus pattern if a shared instance is useful most of the time, but you also want to allow custom instances to be created. An example of this is FileManager, which handles everything to do with filesystem access. There is a “default” instance which is a singleton, or you can create your own. You would usually create your own if you’re using it on a background thread.
 
 
 
 5. Memento
 The memento pattern allows an object to be saved and restored. It has three parts:
 1. The originator is the object to be saved or restored.
 2. The memento represents a stored state.
 3. The caretaker requests a save from the originator and receives a memento in response. The caretaker is responsible for persisting the memento and, later on, providing the memento back to the originator to restore the originator’s state.
 
 While not strictly required, iOS apps typically use an Encoder to encode an originator’s state into a memento, and a Decoder to decode a memento back to an originator. This allows encoding and decoding logic to be reused across originators. For example, JSONEncoder and JSONDecoder allow an object to be encoded into and decoded from JSON data respectively.
 
 Usage -
 Use the memento pattern whenever you want to save and later restore an object’s state.
 For example, you can use this pattern to implement a save game system, where the originator is the game state (such as level, health, number of lives, etc), the memento is saved data, and the caretaker is the gaming system.
 You can also persist an array of mementos, representing a stack of previous states. You can use this to implement features such as undo/redo stacks in IDEs or graphics software.
 
 
 6. Observer
 
 

 7. Builder
 
 
 */
