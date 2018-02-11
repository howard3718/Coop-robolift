#include <Arduino.h>
#line 1 "c:\\Users\\Alex\\OneDrive - Imperial College London\\ME3\\DMT\\Coop-robolift\\Arduino\\MotorTest\\MotorTest.ino"
#line 1 "c:\\Users\\Alex\\OneDrive - Imperial College London\\ME3\\DMT\\Coop-robolift\\Arduino\\MotorTest\\MotorTest.ino"

#include <cstdint>

const int8_t PWMpin = 10;
const int8_t DirPin = 5;

#line 7 "c:\\Users\\Alex\\OneDrive - Imperial College London\\ME3\\DMT\\Coop-robolift\\Arduino\\MotorTest\\MotorTest.ino"
void setup();
#line 12 "c:\\Users\\Alex\\OneDrive - Imperial College London\\ME3\\DMT\\Coop-robolift\\Arduino\\MotorTest\\MotorTest.ino"
void loop();
#line 7 "c:\\Users\\Alex\\OneDrive - Imperial College London\\ME3\\DMT\\Coop-robolift\\Arduino\\MotorTest\\MotorTest.ino"
void setup()
{
    pinMode(DirPin, OUTPUT);
}

void loop()
{
    analogWrite(PWMpin, 255);
    for (int8_t i = 0; i < 255 / 5; i = i + 1)
    {
        analogWrite(PWMpin, 255 - 5 * i);
        delayMicroseconds(200);
    }
}
