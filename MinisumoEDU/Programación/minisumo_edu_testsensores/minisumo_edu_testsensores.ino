/*
Programa simple de test de sensores de distancia.
Es necesario apretar un pulsador para iniciar el progama, luego hay un bip de un segundo.
Se chequean primero los sensores de distancia:
Si un sensor detecta presencia, se enciende el led correspondiente.
Si se aprietan los dos pulsadores al mismo tiempo, se pasa a comprobar los sensores de linea.
Si un sensor detecta blanco, se enciende el led correspondiente.
Es necesario apretar los dos pulsadores al mismo tiempo para volver a los sensores de distancia.
Los sensors de linea leen valores analogicos y por tanto se recomienda ajustar los limites marcados en el programa.
*/



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
pinMode(Led3,OUTPUT);
pinMode(BUZZ,OUTPUT);
pinMode(AIN1,OUTPUT);
pinMode(AIN2,OUTPUT);
pinMode(BIN1,OUTPUT);
pinMode(BIN2,OUTPUT);
pinMode(PWMA,OUTPUT);
pinMode(PWMB,OUTPUT);


}

void loop() {
 while (digitalRead(PUSH1)&&digitalRead(PUSH2));
 bip(1);
 delay(1000);
 bip(0);
 delay(500);
 while (1)
 {
///Analizamos primero los sensores de distancia
     while (digitalRead(PUSH1)||digitalRead(PUSH2)){
      if (digitalRead(SIZ)&&digitalRead(SF)&&analogRead(SD)>100) // no detectamos ningun sensor
     {
      led_off(2);
      led_off(1);
      led_off(0);
     }   
   if (!digitalRead(SIZ)&&digitalRead(SF)&&analogRead(SD)>100) // solo izquierda
     {
      led_off(2);
      led_off(1);
      led_on(0);
     }
   if (!digitalRead(SIZ)&&!digitalRead(SF)&&analogRead(SD)>100) // izquierda - centro
     {
      led_on(2);
      led_off(1);
      led_on(0);
     }
   if (!digitalRead(SIZ)&&!digitalRead(SF)&&analogRead(SD)<100) // todos 
   {
      led_on(2);
      led_on(1);
      led_on(0);
   }  
  if (digitalRead(SIZ)&&!digitalRead(SF)&&analogRead(SD)>100) //  solo centro
  {
      led_on(2);
      led_off(1);
      led_off(0);
  }
   if (digitalRead(SIZ)&&!digitalRead(SF)&&analogRead(SD)<100) // derecha - centro
    {
      led_on(2);
      led_off(0);
      led_on(1); 
 } 
   if (digitalRead(SIZ)&&digitalRead(SF)&&analogRead(SD)<100) // solo derecha
   {
      led_off(2);
      led_off(0);
      led_on(1);      
   }
 }
 led_off(0);
 led_off(1);
 led_off(2);
 delay(1000);
 // Ahora los sensores de linea

    while (digitalRead(PUSH1)||digitalRead(PUSH2)){
      if ((analogRead(SLD)>350)&&(analogRead(SLT)>700)&&(analogRead(SLIZ)>350)) // todo negro
     {
      led_off(2);
      led_off(1);
      led_off(0);
     }   
   if ((analogRead(SLD)>350)&&(analogRead(SLT)>700)&&(analogRead(SLIZ)<100)) // solo izquierda blanco
     {
      led_off(2);
      led_off(1);
      led_on(0);
     }
   if ((analogRead(SLD)>350)&&(analogRead(SLT)<100)&&(analogRead(SLIZ)<100)) // izquierda - trasero blancos
     {
      led_on(2);
      led_off(1);
      led_on(0);
     }
   if ((analogRead(SLD)<100)&&(analogRead(SLT)<100)&&(analogRead(SLIZ)<100)) // todos blancos
   {
      led_on(2);
      led_on(1);
      led_on(0);
   }  
  if ((analogRead(SLD)>350)&&(analogRead(SLT)<100)&&(analogRead(SLIZ)>350)) //  solo trasero blanco
  {
      led_on(2);
      led_off(1);
      led_off(0);
  }
   if ((analogRead(SLD)<100)&&(analogRead(SLT)<100)&&(analogRead(SLIZ)>350)) // derecha - centro blancos
    {
      led_on(2);
      led_off(0);
      led_on(1); 
 } 
   if ((analogRead(SLD)<100)&&(analogRead(SLT)>700)&&(analogRead(SLIZ)>350)) // solo derecha blanco
   {
      led_off(2);
      led_off(0);
      led_on(1);      
   }
      if ((analogRead(SLD)<100)&&(analogRead(SLT)>700)&&(analogRead(SLIZ)<100)) // izquierda - derecha blanco
   {
      led_off(2);
      led_on(0);
      led_on(1);      
   }
 }
 led_off(0);
 led_off(1);
 led_off(2);
 delay(1000);
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
  case 0:    // your hand is on the sensor
    digitalWrite(Led1,LOW);
    break;
  case 1:    // your hand is close to the sensor
    digitalWrite(Led2,LOW);
    break;
  case 2:    // your hand is a few inches from the sensor
    digitalWrite(Led3,LOW);
    break;
    }
}

void bip(char estat)
{
 if (estat==1)
    digitalWrite(BUZZ,HIGH); // canviar 13 -- BUZZ
 else
    digitalWrite(BUZZ,LOW); 
}

