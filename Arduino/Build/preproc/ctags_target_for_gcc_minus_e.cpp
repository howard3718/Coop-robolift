# 1 "c:\\Users\\Alex\\OneDrive - Imperial College London\\ME3\\DMT\\Coop-robolift\\Arduino\\MotorTest\\MotorTest.ino"
# 1 "c:\\Users\\Alex\\OneDrive - Imperial College London\\ME3\\DMT\\Coop-robolift\\Arduino\\MotorTest\\MotorTest.ino"

# 3 "c:\\Users\\Alex\\OneDrive - Imperial College London\\ME3\\DMT\\Coop-robolift\\Arduino\\MotorTest\\MotorTest.ino" 2

const int8_t PWMpin = 10;
const int8_t DirPin = 5;

void setup()
{
    pinMode(DirPin, (0x1));
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
