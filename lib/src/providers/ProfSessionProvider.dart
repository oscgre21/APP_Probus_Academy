import 'package:probusaca/src/helpers/ijsontobject.dart';
import 'package:probusaca/src/model/ResultObject.dart';
import 'package:probusaca/src/model/StreamResultObject.dart';
import 'package:probusaca/src/model/result/ResultAsistenciaSessionProf.dart'; 
import 'package:probusaca/src/providers/GenericStreamProvider.dart';
import 'package:probusaca/src/viewModels/AsignaturaListViewModel.dart'; 

class ProfSessionProvider extends GenericStreamProvider<StreamResultObject<IResultObject>,ResultAsistenciaSessionProf>{ 

    String lastUrlRest="";
    void requestNewData(endPoint,token){  
      lastUrlRest=endPoint;
      this.postWithdowDataMap(endPoint,token,this);
    }

     void putAsistencia(endPoint,token, PutPeriodoViewModel periodo){      
      var data=this.postAsistencia(endPoint,token,this,periodo);
      data.then((value) => {
          
        this.postWithdowDataMap(lastUrlRest,token,this)
 
      });
    }

}

class PutPeriodoViewModel{
    int estudianteAsistenciaId=0;
    int periodoAcademicoId;
    int seccionAsignaturaId;
    int ano;
    int mes;
    int dia;
    int hora;
    int min;
    String tipoHora;
    List<AsignaturaListViewModel> asistencias;
 
    Map<String, dynamic> toJson(){
      var data={
            "periodoAcademicoId": periodoAcademicoId,
            "seccionAsignaturaId": seccionAsignaturaId,
            "ano": ano,
            "mes": mes,
            "dia": dia,
            "hora": hora,
            "min": min,
            "tipoHora": tipoHora,
            "asistencias": List<dynamic>.from(asistencias.map((x) => x.toJson())), 
        }; 
        if (estudianteAsistenciaId>0){
          data['estudianteAsistenciaId']=estudianteAsistenciaId;
        }
        return data;
    }

}