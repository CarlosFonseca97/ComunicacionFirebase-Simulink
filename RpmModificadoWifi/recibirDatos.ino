void LecturaFirebase() {
  String path1 = "/Activar - Desactivar ";
  String path0 = "/Variables";
  /*
     if (Firebase.setBool(firebaseData,path1+"/ESTADO PROCESO",false))
     {
       Serial.print("Estado enviado");
     }
     if (Firebase.setInt(firebaseData,path0+"/Fc",1))
     {
       Serial.print("Tipo de alarma Enviada");
     }
     if (Firebase.setInt(firebaseData,path0+"/F",2))
     {
       Serial.print("Tipo de alarma Enviada");
     }
     if (Firebase.setInt(firebaseData,path0+"/Dir",3)) //ADMIN1 ES EL NOMBRE DE USUARIO Y 123 ES LA CLAVE
     {
       Serial.print("Tipo de alarma Enviada");
     }
      if (Firebase.setInt(firebaseData,path0+"/m",4))
     {
       Serial.print("Tipo de alarma Enviada");
     }
      if (Firebase.setInt(firebaseData,path0+"/Vl",5))
     {
       Serial.print("Tipo de alarma Enviada");
     }
      if (Firebase.setInt(firebaseData,path0+"/Tm",6))
     {
       Serial.print("Tipo de alarma Enviada");
     }
    }
  */

  //Serial.println("Estoy en la funcion Lectura de firebase");
  //Fc , F, Dir, m, Vl, Tm

  if (Firebase.getString(firebaseData, path0 + "/Fc"))
  {
    String sFc = firebaseData.stringData();
    Fc = sFc.toInt();

  }
  if (Firebase.getString(firebaseData, path0 + "/F"))
  {
    String sF = firebaseData.stringData();
    F = sF.toInt();

  }
  if (Firebase.getString(firebaseData, path0 + "/Dir"))
  {
    String sDir = firebaseData.stringData();
    Dir = sDir.toInt();


  }
  if (Firebase.getString(firebaseData, path0 + "/m"))
  {
    String sm = firebaseData.stringData();
    m = sm.toInt();

  }
  if (Firebase.getString(firebaseData, path0 + "/Vl"))
  {
    String sVl = firebaseData.stringData();
    Vl = sVl.toInt();


  }
  if (Firebase.getString(firebaseData, path0 + "/Tm"))
  {
    String sTm = firebaseData.stringData();
    Tm = sTm.toInt();

  }
  if (Firebase.getBool(firebaseData, path1 + "/ESTADO PROCESO"))
  {
    estadoProceso = firebaseData.boolData();
    Serial.print(estadoProceso);
    Serial.print (" ");
    if ((estadoProceso == false)) {
      EstP = 0;
      //Serial.println("El proceso no ah iniciado");
    }
    else {
      EstP = 1;
      Serial.print(Fc);
      Serial.print (" ");
      Serial.print(F);
      Serial.print (" ");
      Serial.print(Dir);
      Serial.print (" ");
      Serial.print(m);
      Serial.print (" ");
      Serial.print(Vl);
      Serial.print (" ");
      Serial.print(Tm);
      Serial.println (" ");
      //Serial.println("El proceso ah iniciado");
    }
  }
}
