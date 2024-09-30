$PBExportHeader$modintmer.sra
$PBExportComments$Generated Application Object
forward
global type modintmer from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
// transaction
transaction SQLCA_BILL

string gsrutareg
// MI
string gsPais
// Usado en el comun.pbl
long vhelp		//No definido
string gsNomSis		//Código del Módulo … MODVTA, MODPIN
string gsNomApl		//Nombre Largo del Módulo …. Módulo de Ventas
string gsNomIni		//Calculado en w_segur, Nombre del ini con ruta completa (Ruta + gsNomSis + ‘.Ini’)
string gsrutabmp

string gsDw		//Para el mantenimiento, Nombre del Datawindow
string gsTMnt		//Título del mantenimiento
string gsDw1		//Para el mantenimiento Cabecera-Detalle, Nombre del Datawindow Detalle
string gsDwPrint		//Para el mantenimiento, Nombre del Datawindow de Impresión

string gs_arcini, gs_titprin,&
         gscodcia, vnomapl, vnomsis, vnomini, &
         gs_nommod,gs_exampledir, &
         ge_environment, gs_codcnt, gtipo

long glest, valor

date gd_fecini, gdfecini,gd_fecfin, gdfecfin
integer gi_idloc
datawindowchild dwc

// Para el forecast
s_prm_forcast gs_prm_forcast

// Variables creadas despues de la reestructuracion (19/11/1999)

long gl_codcli
string gs_ckt
integer gi_codemp,gi_anoemp,gi_mesemp

st_factura_imprimir st_param_fac


real gr_tipo_cambio

string gs_codemp,gs_nomemp

double gd_monbasdol

integer ginumano,gi_ind

string gs_nrotel,gs_dea,gs_cliente,gsnumpsp
long	gl_carta

long gl_carta_1,gl_carta1[]
string gs_nrotel1[]

string gsnumsut,gssersut
long glidcon

str_atecli_his str_atecli_his
str_reportes_atecli str_reportes_atecli

//Variables creadas para SGA-Web. 14/09/2004
window gw_ventana
String Username, Userpass, Connectionstring

end variables

global type modintmer from application
string appname = "modintmer"
boolean toolbarusercontrol = false
end type
global modintmer modintmer

type prototypes
Function Long ShellExecuteA (Long hwnd, string lpOperation, String lpFile, String lpParameters, String lpDirectory , Long nShowCmd) Library "shell32.dll" alias for "ShellExecuteA;Ansi"

end prototypes

type variables
int ii_app = 0
string is_valor
end variables

on modintmer.create
appname="modintmer"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on modintmer.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;gsNomSis  = 'MODINTMER'
gsNomApl = "Módulo Inteligencia de Mercado"
window w_ventana

string lsUser, lsClave, lsConex
int liArgs 

liArgs = f_get_parametro_modulo(lsUser, lsClave, lsConex, ii_app, is_valor)

if liArgs = -1 then
   messagebox(gsNomApl,'Modo de acceso inválido')
   return
end if

if liArgs = 0 then
   open(w_segur)
else
   if f_conecta(lsUser, lsClave, lsConex) = -1 then
      messagebox('Aviso','Error al Conectarse a la Base de Datos')
      return
   end if
end if

gsPais = f_str_cfg_pais()

//PARA ATC
st_par lst_par

CHOOSE CASE ii_app
  CASE 1 
	  lst_par.updwprop = true
	  lst_par.guardar  = false
	  lst_par.nuevo 	 = true 
	  lst_par.borrar 	 = true 
	  lst_par.insertar = true 
	  lst_par.suprimir = true
	  lst_par.titulo 	 = "Listado de Direcciones"
	  lst_par.tipo 	 = 1
     OpenWithparm (w_cs_carga_sucursales,lst_par) 
END CHOOSE
//fin

open (w_main_intmer)
gw_ventana = w_main_intmer //para web funciones    


end event

event systemerror;If f_errlog('modvta',sqlca.userid) = 1 Then
	messagebox('Error','Ha ocurrido un error..., Llamar a Sistemas',Stopsign!)
	Halt
End If
end event

