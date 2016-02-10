double val;
const int led = 11;           // the pin that the LED is attached to
const int greenLed=10;
const int led2=5;
const int greenLed2=3;
int brightness = 0;    // how bright the LED is
int fadeAmount = 5;    // how many points to fade the LED by
// the setup routine runs once when you press reset:
void setup()  { 
  Serial.begin(9600);
  
  pinMode(led, OUTPUT);
  pinMode(greenLed,OUTPUT);
  pinMode(led2,OUTPUT);
  pinMode(greenLed2,OUTPUT);
} 
// the loop routine runs over and over again forever:
void loop()  {

   if (Serial.available() == '\n') { //  Check if there is a new message
      val=Serial.read();
    //  1st fragment
     if (val<50) {
     digitalWrite(greenLed,HIGH);
     digitalWrite(greenLed2,HIGH);
     //digitalWrite(led,LOW); 
     }
     if (val>50) {
     //   digitalWrite(led,HIGH);
        digitalWrite(greenLed,LOW);
        digitalWrite(greenLed2,LOW); 
      } 
    // 2nd fragment
    if (val<50){val = map(val, 0, 100, 0, 70); // map(value, fromLow, fromHigh, toLow, toHigh)
    analogWrite(led, val);
    analogWrite(led2,val);}
    //if
    //analogWrite(greenLed,val);
    //analogWrite(greenLed2,val);
    
}}
