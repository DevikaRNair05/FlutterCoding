class Car {
  String brand;
  String model;
  int year;

    Car(this.brand, this.model, this.year);
}

void main() {
   var myCar = Car('Toyota', 'Carolla', 2020);
  print('Car Details:');
  print('Brand: ${myCar.brand}');
  print('Model: ${myCar.model}');
  print('Year: ${myCar.year}');
}