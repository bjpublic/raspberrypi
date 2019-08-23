#include <SPI.h>
#include <LoRa.h>
String myString =" ";
String myStringReversed =" ";

void setup() 
{
  pinMode(4, OUTPUT);
  pinMode(LED_BUILTIN, OUTPUT);
  tone(5,1000,1000);
  digitalWrite(LED_BUILTIN, HIGH);
  digitalWrite(4, HIGH);
  delay(1000);
  digitalWrite(LED_BUILTIN, LOW);
  digitalWrite(4, LOW);
  Serial.begin(9600);
//  while (!Serial);

  Serial.println("LoRa Receiver");

  if (!LoRa.begin(8690E5)) {
    Serial.println("Starting LoRa failed!");
    while (1);
  }
}

void loop() 
{
  //delay (1000);
  // try to parse packet
  int packetSize = LoRa.parsePacket();
  if (packetSize) 
  {
    // received a packet
    Serial.print("Received packet '");
  digitalWrite(LED_BUILTIN, HIGH);
  digitalWrite(4, HIGH);
  delay(100);
  digitalWrite(LED_BUILTIN, LOW);
  digitalWrite(4, LOW);
    // read packet
    myString =" ";
    myStringReversed =" ";
    int i = 0;
    char c;
    while (LoRa.available()) 
    {
      //c[i] = (char)LoRa.read();
      //Serial.print((char)LoRa.read());
      myString = (char)LoRa.read() + myString;
      i++;
      //Reverse the string:
      c = myString.charAt(0);
      myStringReversed = myStringReversed + c;
    }
    processString();
    //Serial.print("My string: ");Serial.print(myString);
    // print RSSI of packet
    //Serial.print("' with RSSI ");
    //Serial.println(LoRa.packetRssi());

  }
}
void processString()
{
    Serial.print("My string reversed:");Serial.print(myStringReversed);
    // print RSSI of packet
    Serial.print("' with RSSI ");
    Serial.println(LoRa.packetRssi());
    int len = myStringReversed.length();
    int j=0;
    char a,b,c,d;
    String coord1 = " ";
    String coord2 = " ";
    String coord3 = " ";
    String coord4 = " ";
    int k =0;
    char x = ',';
    int z=1;
    int y=1;
    int r=1;
    int s=1;
    int v=0;
    while (j < len) 
    {
      a = myStringReversed.charAt(j);
      b = myStringReversed.charAt(j+1);
      c = myStringReversed.charAt(j+2);
      if((a=='B')&&(b=='o')&&(c=='x'))                           // The word 'box' has been identified in the string - k is now greater than 0.
      {
        k = j+5;
        Serial.print("Character B was found at: ");Serial.println(j);
      }
      j++;
    }
    if (k>0)
    {
      v =0;                                                      // int V stops perpetual loops occurring.
      while((z==1)&&(v<200))
      {
        if(myStringReversed.charAt(k)==x)                        // Build up string 'coord' until a comma is reached.
        {
          Serial.print("k");Serial.println(k);
          z=0;
        }
        else
        {
        coord1 = coord1 + myStringReversed.charAt(k);
        k++;
        v++;
        //Serial.print("coord1: ");Serial.println(coord1); 
        }
      } 
      v =0; 
      k++;
      while((y==1)&&(v<200))
      {
        if(myStringReversed.charAt(k)==')')                        // Build up string 'coord' until a comma is reached.
        {
          Serial.print("k");Serial.println(k);
          y=0;
        }
        else
        {
        coord2 = coord2 + myStringReversed.charAt(k);
        k++;
        v++;
        //Serial.print("coord2: ");Serial.println(coord2); 
        }
      }  
      v =0;
      k=k+3;                                                     // Takes account of two brackets and a comma.
      while((r==1)&&(v<200))
      {
        if(myStringReversed.charAt(k)==x)                        // Build up string 'coord' until a comma is reached.
        {
          Serial.print("k");Serial.println(k);
          r=0;
        }
        else
        {
        coord3 = coord3 + myStringReversed.charAt(k);
        k++;
        v++;
        //Serial.print("coord3: ");Serial.println(coord3); 
        }
      }  
      v =0;
      k++;
      while((s==1)&&(v<200))
      {
        if(myStringReversed.charAt(k)==')')                        // Build up string 'coord' until a comma is reached.
        {
          Serial.print("k");Serial.println(k);
          s=0;
        }
        else
        {
        coord4 = coord4 + myStringReversed.charAt(k);
        k++;
        v++;
        //Serial.print("coord4: ");Serial.println(coord4); 
        }
      }  
    }
    Serial.print("coord1: ");Serial.println(coord1);
    Serial.print("coord2: ");Serial.println(coord2);
    Serial.print("coord3: ");Serial.println(coord3);
    Serial.print("coord4: ");Serial.println(coord4);
    int coord10 = coord1.toInt();
    int coord20 = coord2.toInt();
    int coord30 = coord3.toInt();
    int coord40 = coord4.toInt();
    
    int area = (coord40 - coord20) * (coord30 - coord10);
    tone(5,(area/100)+200,100);
    Serial.print("Box area: ");Serial.println(area);
}






