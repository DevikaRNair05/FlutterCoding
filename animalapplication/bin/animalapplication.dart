 

class Animal {
  void makeSound() {
    print("Generic animal sound");
  }
}

class Dog extends Animal
 {
   @override
  void makeSound() {
    print("Bark");
  }
}

void main() {
    var myDog = Dog();
    myDog.makeSound();
}
