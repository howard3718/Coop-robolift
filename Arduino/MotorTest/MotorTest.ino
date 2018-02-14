
#include <cstdint>

const int8_t PWMpin = 10;
const int8_t DirPin = 5;

void setup()
{
    pinMode(DirPin, OUTPUT);
    digitalWrite(DirPin, 0);
}

void loop()
{
    analogWrite(PWMpin, 255);
}
