$PBExportHeader$w_visor_comun_in.srw
forward
global type w_visor_comun_in from w_visor_comun
end type
type dw_1 from uo_dw_std within w_visor_comun_in
end type
end forward

global type w_visor_comun_in from w_visor_comun
dw_1 dw_1
end type
global w_visor_comun_in w_visor_comun_in

type variables

end variables

on w_visor_comun_in.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_visor_comun_in.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
end on

event ue_postopen;//str_busvenmascas lstr_busca
string ls_tipoact
long ll_sit
st_par lst_par

datawindow ldw_par
dw_maestro.reset()
dw_maestro.settransobject(SQLCA)


// Dependiendo del tipo de reporte se ejecuta automaticamente un retrieve
// tipo = 0 significa que el codigo se ejecuta en un hijo
if ii_tipo <> 0 then
	CHOOSE CASE ii_tipo
	CASE 1	//Reporte sin parametros
		dw_maestro.retrieve()
	CASE 2	//Reporte con 1 parametro tipo Long
		dw_maestro.retrieve(ist_par.parLong1)
	CASE 3	//Reporte con 1 parametro tipo string
		dw_maestro.retrieve(ist_par.parString1)
	CASE 4	//Reporte con 1 parametro tipo Int
		dw_maestro.retrieve(ist_par.parInteger1)
	CASE 5	//Reporte con 1 parametro tipo Date
		dw_maestro.retrieve(ist_par.parDate1)
	CASE 6  // se hace copia del dw recibido como parametro
		ldw_par = ist_par.pardw1
		ldw_par.RowsCopy(1,ldw_par.RowCount(), Primary!, dw_maestro, 1, Primary!)
	CASE 7	//Reporte con 2 parametro tipo string
		dw_maestro.retrieve(ist_par.parString1,ist_par.parString2)
	CASE 8	//Reporte con 3 parametro tipo string
		dw_maestro.retrieve(ist_par.parString1,ist_par.parString2,ist_par.parString3)
	CASE 9	//Reporte con 2 parametro tipo Date
		dw_maestro.retrieve(ist_par.parDatetime1,ist_par.parDatetime2)
//	case 10 
//		setpointer(hourglass!)
//		open(w_televendedora_reporte)
//      lstr_busca=Message.PowerObjectParm
//		if isvalid(lstr_busca) then
//			dw_maestro.retrieve(lstr_busca.ad_fecini,lstr_busca.ad_fecfin,lstr_busca.as_idvendea)
//		end if
//	CASE 11	//Reporte con 2 parametro tipo Datetime con ventana de fechas
//		open(w_fechas)
//		ist_par=Message.PowerObjectParm
//		if isvalid(ist_par) then
//			dw_maestro.Object.DataWindow.QueryMode = "yes"
//			dw_maestro.retrieve(ist_par.parDatetime1,ist_par.parDatetime2)	
//			dw_maestro.Object.DataWindow.QueryMode = "no"
//		end if
//	CASE 12	//Reporte con 2 parametro tipo string con ventana de fechas
//		open(w_fechas_string)
//		ist_par=Message.PowerObjectParm
//		if isvalid(ist_par) then
//			dw_maestro.retrieve(ist_par.parstring1,ist_par.parstring2)	
//		end if
	CASE 13 //Reporte con 4 parametro tipo string 		
		dw_maestro.retrieve(ist_par.parString1,ist_par.parString2,ist_par.parString3,ist_par.parString4)
//	CASE 14	//Reporte con 8 parametro tipo string con ventana de fechas
//		open(w_reportes_modintmer)
//		ist_par=Message.PowerObjectParm
//		if isvalid(ist_par) then
//			dw_maestro.retrieve(ist_par.parstring1,ist_par.parstring4)	
//		end if
//	CASE 15	//Reporte con 8 parametro tipo string con ventana de fechas
//		open(w_reportes_modintmer_fechas)
//		ist_par=Message.PowerObjectParm
//		if isvalid(ist_par) then
//			dw_maestro.retrieve(ist_par.parstring1,ist_par.parstring2,ist_par.parstring3)	
//		end if
	CASE 16	//Reporte con 8 parametro tipo string con ventana de fechas
		open(w_act_cliente)
		ls_tipoact=Message.stringparm
		if not isnull(ls_tipoact) then
			dw_maestro.retrieve(long(ls_tipoact))	
		end if
	case 17
		open (w_tipo_servicio)
		ist_par=Message.PowerObjectParm
		if isvalid(ist_par) then
			dw_maestro.retrieve(ist_par.parstring1,ist_par.parstring2,ist_par.pararraystring1,ist_par.parinteger1)
		end if
//	case 18
//		open (w_cliente_nuevo_perdido)
//		ist_par=Message.PowerObjectParm
//		if isvalid(ist_par) then
//			dw_maestro.retrieve(ist_par.parstring1,ist_par.parstring2,ist_par.parstring5,ist_par.parstring3,ist_par.parstring4)
//		end if		
	CASE 19	//Reporte con 1 parametro tipo Array Long
		dw_maestro.retrieve(ist_par.pararraylong1)
	CASE 20	//Reporte con 1 parametro tipo Array Long y 2 tipo Long
		dw_maestro.retrieve(ist_par.pararraylong1,ist_par.parlong1,ist_par.parlong2)
	CASE 21	//Reporte con 8 parametro tipo string con ventana de fechas
		open(w_fil_sit_cliente)
		ll_sit=Message.doubleparm
		if not isnull(ls_tipoact) then
			dw_maestro.retrieve(ll_sit)
		end if
	CASE 22
		open(w_filtrar_rep_edificio_estado_activacion)
		lst_par = Message.PowerObjectParm
		if isvalid(lst_par) then
			dw_maestro.retrieve(lst_par.parinteger1, lst_par.parstring1, lst_par.parstring2)
		end if
	CASE 23
		open(w_filtrar_rep_sucursal_x_edificio)
		lst_par = Message.PowerObjectParm
		if isvalid(lst_par) then
			dw_maestro.retrieve(lst_par.parinteger1, lst_par.parstring1, lst_par.parstring3, lst_par.parstring2)
		end if
	CASE 24
		open(w_filtrar_rep_cliente_x_sucursal)
		lst_par = Message.PowerObjectParm
		if isvalid(lst_par) then
			dw_maestro.retrieve(lst_par.parinteger1, lst_par.parinteger2, lst_par.parstring1, lst_par.parstring2)
		end if
	CASE 25
		open(w_filtrar_rep_contacto_x_sucursal)
		lst_par = Message.PowerObjectParm
		if isvalid(lst_par) then
			dw_maestro.retrieve(lst_par.parstring1, lst_par.parstring2, lst_par.parstring3)
		end if
	CASE 30 		// sector y segmento, giro y segmento, industry sector y go to market segmentation 
		open(w_filtro_cliente_situacion_producto)
		lst_par = Message.PowerObjectParm
		if isvalid(lst_par) then
			dw_maestro.retrieve(lst_par.parinteger1, lst_par.parstring1, lst_par.parstring2)
		end if
	CASE 31 		// CLIENTES X SERVICIO 
		dw_maestro.retrieve(ist_par.parinteger1, ist_par.parstring1, ist_par.parstring2, ist_par.parstring3)
	CASE 32
		open(w_filtro_fechas_persona)
		lst_par = Message.PowerObjectParm
		if isvalid(lst_par) then
			dw_maestro.retrieve(lst_par.pardatetime1, lst_par.pardatetime2, lst_par.parstring1)
		end if
	CASE 33 // listado de clientes
		open(w_filtrar_cliente_stpar)
		lst_par = Message.PowerObjectParm
		if isvalid(lst_par) then
			dw_maestro.retrieve(lst_par.parstring1, lst_par.parstring2, lst_par.parstring3)
		end if
	CASE 34 // listado de equipos
		open(w_fil_equcomercial)
		lst_par = message.PowerObjectParm
		if isvalid(lst_par) then
			string ls_codequcom, ls_descrip
			dec ls_marca
			ls_codequcom = lst_par.parstring1
			ls_descrip = lst_par.parstring2
			ls_marca = lst_par.pardec1
			if IsNull(ls_codequcom) or trim(ls_codequcom)='' 	or not lst_par.parboolean1 then ls_codequcom = '*'
			if IsNull(ls_descrip)	or trim(ls_descrip)=''		or not lst_par.parboolean2 then ls_descrip = '*'
			if IsNull(ls_marca)											or not lst_par.parboolean3 then ls_marca = -1
			dw_maestro.retrieve(ls_codequcom, ls_descrip, ls_marca)
		end if
	CASE 35	//Reporte sin parametros
		dw_maestro.retrieve()
	CASE 36
		open(w_filtro_fechas_servicio_topn)
		lst_par = Message.PowerObjectParm
		if isvalid(lst_par) then
			dw_maestro.retrieve(lst_par.pardatetime1, lst_par.pardatetime2, lst_par.parlong1, lst_par.parstring1)
		end if
	CASE 37
		open(w_filtro_mes_anyo)
		lst_par = Message.PowerObjectParm
		if isvalid(lst_par) then
			dw_maestro.retrieve(lst_par.parstring1)
		end if
	CASE 38 //Reporte Cartera
		open(w_filtrar_cartera)
		lst_par = Message.PowerObjectParm
		if isvalid(lst_par) then
			if lst_par.parstring1<>'-1' and  lst_par.parstring2<>'-1'  and  lst_par.parstring3<>'-1'  and  lst_par.parstring4<>'-1'  and  lst_par.parstring5<>'-1' then
				dw_maestro.retrieve(lst_par.parstring1, lst_par.parstring2, lst_par.parstring3, lst_par.parstring4, lst_par.parstring5, lst_par.parstring6)
			end if
		end if
END CHOOSE
end if


end event

event ue_guardar_xls;// Jaime Marroquín 20030327
	long ll_filas, li_tamano_hoja = 50000
	integer ll_hojas, i
	st_par lst_par
	ll_filas = dw_maestro.rowcount()
	if ll_filas<li_tamano_hoja then
		dw_maestro.saveas("",Excel!, true)
		return
	else
		ll_hojas = ceiling(ll_filas/li_tamano_hoja)
	end if
	open(w_saveas_xls_50000)
	lst_par = message.powerobjectparm
	if not isvalid(lst_par) then
		messagebox('Error','Vuelva a Seleccionar el Directorio y Nombre de archivo.')
		return
	end if
	// grabar de li_tamano_hoja en li_tamano_hoja filas
	dw_1.dataobject = dw_maestro.dataobject
	FOR i=1 TO ll_hojas
		dw_1.uf_ini()
		dw_maestro.RowsCopy(li_tamano_hoja*(i - 1) + 1, li_tamano_hoja*i , Primary!, dw_1, 1, Primary!)
		dw_1.saveas(lst_par.parstring1 + '\' + lst_par.parstring2 + '_' + right('00000' + string(i),5) + ".xls",Excel!, true )
	NEXT

end event

type dw_maestro from w_visor_comun`dw_maestro within w_visor_comun_in
integer y = 12
end type

type dw_1 from uo_dw_std within w_visor_comun_in
boolean visible = false
integer x = 658
integer y = 96
integer taborder = 10
boolean bringtotop = true
end type

