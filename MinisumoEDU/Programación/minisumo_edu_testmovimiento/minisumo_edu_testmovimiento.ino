/*
Test de los motores:
cuando apretamos cualquier pulsador:
adelante
atras
giro derecha
giro izquierda
pivota en sentido horario
pivota en sentido antihorario

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


volatile int velocidad=50;

void setup() {
  //Entradas
pinMode(PUSH1,INPUT_PULLUP);
pinMode(PUSH2,INPUT_PULLUP);
pinMode(SF,INPUT);
pinMode(SLT,INPUT);
pinMode(SIZ,INPUT);
pinMode(SLIZ,INPUT);
pinMode(IR,INPUT);

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

   adelante();
   delay(1000);
   para();
   delay(200);
   atras();
   delay(1000);
   para();
   delay(200);
   giro_derecha();
   delay(1000);
   para();
   delay(200);
   giro_izquierda();
   delay(1000);
   para();
   delay(200);
   pivota_h();
   delay(1000);
      para();
   delay(200);
   pivota_ah();
   delay(1000);
      para();
   delay(200);

 
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
