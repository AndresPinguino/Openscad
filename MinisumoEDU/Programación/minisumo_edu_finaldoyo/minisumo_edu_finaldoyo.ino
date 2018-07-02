/*
Comprobamos el comportamiento del robot delate un objeto. 
Cuando iniciamos (con cualquier pulsador), se oye un pitido y luego el robot mira de que color es el suelo. 
Si es blanco o negro, inicia la busqueda de objetos y los empuja hasta el final del doyo (hasta que encuentra un límite de color diferente al inicial).Luego se para. 
No es un programa completo de minisumo.

*/
#include <IRremote.h>



#define SD A7
#define SLD A6
#define SF A5
#define SLT A4
#define SIZ A3
#define SLIZ A2
#define VREF A1
#define PUSH1 A0
#define AIN2 2
#define AIN1 3
#define BIN1 4
#define PWMA 5
#define PWMB 6
#define BIN2 7
#define IR 8
#define BUZZ 9
#define Led1 10
#define Led2 11
#define PUSH2 12
#define Led3 13


volatile int velocidad=50;
int fondo[3]={0,0,0};
bool color_fondo=0;

void setup() {
  //Entradas
pinMode(PUSH1,INPUT_PULLUP);
pinMode(PUSH2,INPUT_PULLUP);
pinMode(SF,INPUT);
pinMode(SLT,INPUT);
pinMode(SIZ,INPUT);
pinMode(SLIZ,INPUT);
//pinMode(IR,INPUT);

// Salidas
pinMode(Led1,OUTPUT);
pinMode(Led2,OUTPUT);
pinMode(BUZZ,OUTPUT);
pinMode(AIN1,OUTPUT);
pinMode(AIN2,OUTPUT);
pinMode(BIN1,OUTPUT);
pinMode(BIN2,OUTPUT);
pinMode(PWMA,OUTPUT);
pinMode(PWMB,OUTPUT);
pinMode(13,OUTPUT);

//Comunicaciones
Serial.begin(9600);


}

void loop() {
 while (digitalRead(PUSH1)&&digitalRead(PUSH2));
 bip(1);
 delay(1000);
 bip(0);
 bool inicio=1;
 while (inicio)
 {

for (unsigned char i=0;i<10;i++)
{
  fondo[0]+=analogRead(SLD);
  fondo[1]+=analogRead(SLT); 
  fondo[2]+=analogRead(SLIZ);
}
for (unsigned char j=0;j<3;j++)
  fondo[j]=fondo[j]/10;
 delay(500);
 Serial.print(fondo[0]);
 Serial.print(" ");
  Serial.print(fondo[1]);
 Serial.print(" ");
  Serial.println(fondo[2]);
 if ((fondo[0]<100)&&(fondo[1]<100)&&(fondo[2]<100))
 {
   Serial.println("Fondo blanco");
   color_fondo=1;
   inicio=0;
 }
 else
 {
   if ((fondo[0]>150)&&(fondo[1]>600)&&(fondo[2]>150))
   {
      Serial.println("Fondo negro");
      color_fondo=0;
      inicio=0;
   }
   else
     Serial.println("Fondo no homogeneo");
 }
 }
 
if (color_fondo==0) // fondo negro
{
    while (1){
      if  ((analogRead(SLD)>250)&&(analogRead(SLT)>600)&&(analogRead(SLIZ)>250))
      {
         ataca(); 
      }
      else
      {
         para(); 
      }
     }
}
else // fondo blanco
{
      while (1){
      if  ((analogRead(SLD)<100)&&(analogRead(SLT)<100)&&(analogRead(SLIZ)<100))
      {
         ataca(); 
      }
      else
      {
         para(); 
      }
  
      }
}
 para();
 delay(1000);
 
}

void ataca(void)
{
     if (!digitalRead(SIZ)&&digitalRead(SF)&&analogRead(SD)>100) // solo izquierda
     {
      pivota_ah();
      led_off(2);
      led_off(1);
      led_on(0);
     }
   if (!digitalRead(SIZ)&&!digitalRead(SF)&&analogRead(SD)>100) // izquierda - centro
     {
      giro_izquierda();
      led_on(2);
      led_off(1);
      led_on(0);
     }
   if (!digitalRead(SIZ)&&!digitalRead(SF)&&analogRead(SD)<100) // todos
   {
      adelante();
      led_on(2);
      led_on(1);
      led_on(0);
   }  
  if (digitalRead(SIZ)&&!digitalRead(SF)&&analogRead(SD)>100) // solo centro
  {
      adelante();
      led_on(2);
      led_off(1);
      led_off(0);
  }
   if (digitalRead(SIZ)&&!digitalRead(SF)&&analogRead(SD)<100) // derecha - centro
    {
      giro_derecha();  
      led_on(2);
      led_off(0);
      led_on(1); 
 } 
   if (digitalRead(SIZ)&&digitalRead(SF)&&analogRead(SD)<100) // solo derecha
   {
      pivota_h();
      led_off(2);
      led_off(0);
      led_on(1);      
   }
  
}
void led_on(char nled)
{
    switch (nled) {
  case 0:    // your hand is on the sensor
    digitalWrite(Led1,HIGH);
    break;
  case 1:    // your hand is close to the sensor
    digitalWrite(Led2,HIGH);
    break;
  case 2:    // your hand is a few inches from the sensor
    digitalWrite(Led3,HIGH);
    break;
    }
}

void led_off(char nled)
{
    switch (nled) {
  case 0:    
    digitalWrite(Led1,LOW);
    break;
  case 1:    
    digitalWrite(Led2,LOW);
    break;
  case 2:    
    digitalWrite(Led3,LOW);
    break;
    }
}

void bip(char estado)
{
 if (estado==1)
    digitalWrite(BUZZ,HIGH);
 else
    digitalWrite(BUZZ,LOW); 
}

void adelante(void)
{
 digitalWrite(AIN2,HIGH);
 digitalWrite(AIN1,LOW);
 analogWrite(PWMA,velocidad);
  digitalWrite(BIN1,HIGH);
 digitalWrite(BIN2,LOW);
 analogWrite(PWMB,velocidad);
}

void atras(void)
{
 digitalWrite(AIN1,HIGH);
 digitalWrite(AIN2,LOW);
 analogWrite(PWMA,velocidad);
 digitalWrite(BIN2,HIGH);
 digitalWrite(BIN1,LOW);
 analogWrite(PWMB,velocidad);
  
}
void giro_derecha(void)
{
   digitalWrite(AIN2,HIGH);
 digitalWrite(AIN1,LOW);
 analogWrite(PWMA,0);
  digitalWrite(BIN1,HIGH);
 digitalWrite(BIN2,LOW);
 analogWrite(PWMB,velocidad);
  
}

void giro_izquierda(void)
{
   digitalWrite(AIN2,HIGH);
 digitalWrite(AIN1,LOW);
 analogWrite(PWMA,velocidad);
  digitalWrite(BIN1,HIGH);
 digitalWrite(BIN2,LOW);
 analogWrite(PWMB,0);
}

void pivota_h(void)
{
  digitalWrite(AIN1,HIGH);
 digitalWrite(AIN2,LOW);
 analogWrite(PWMA,velocidad);
  digitalWrite(BIN1,HIGH);
 digitalWrite(BIN2,LOW);
 analogWrite(PWMB,velocidad); 
}

void pivota_ah()
{
  digitalWrite(AIN2,HIGH);
 digitalWrite(AIN1,LOW);
 analogWrite(PWMA,velocidad);
  digitalWrite(BIN2,HIGH);
 digitalWrite(BIN1,LOW);
 analogWrite(PWMB,velocidad); 
}

void para(void)
{
  digitalWrite(AIN1,HIGH);
 digitalWrite(AIN2,LOW);
 analogWrite(PWMA,0);
   digitalWrite(BIN1,HIGH);
 digitalWrite(BIN2,LOW);
 analogWrite(PWMB,0);
  
}
