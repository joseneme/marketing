HA$PBExportHeader$w_lis_regcompetencia_mi.srw
$PBExportComments$20050616
forward
global type w_lis_regcompetencia_mi from w_mnt_std
end type
type dw_filtro from uo_dw_fil within w_lis_regcompetencia_mi
end type
end forward

global type w_lis_regcompetencia_mi from w_mnt_std
boolean nuevo = true
dw_filtro dw_filtro
end type
global w_lis_regcompetencia_mi w_lis_regcompetencia_mi

on w_lis_regcompetencia_mi.create
int iCurrent
call super::create
this.dw_filtro=create dw_filtro
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_filtro
end on

on w_lis_regcompetencia_mi.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_filtro)
end on

event close;call super::close;dw_filtro.uf_save()
end event

event open;call super::open;dw_filtro.setfocus()
end event

event ue_menu_buscar;if dw_filtro.visible then
	ib_menu_buscar = true
	dw_maestro.trigger event ue_refrescar(true)
	dw_filtro.visible=false
else
	dw_filtro.visible=true
	dw_filtro.setfocus()
end if
end event

event ue_postopen;dw_filtro.uf_ini(sqlca)
dw_filtro.uf_getsql()
m_mnt_std lmenu1
lmenu1 = this.menuid
lmenu1.uf_set_dw(dw_maestro)

this.post event ue_permisos()
this.post event ue_permisos_menu()

dw_filtro.setfocus()
end event

type dw_maestro from w_mnt_std`dw_maestro within w_lis_regcompetencia_mi
string dataobject = "d_lis_regcompetencia_mi"
end type

event dw_maestro::doubleclicked;call super::doubleclicked;window w_ventana
st_par lst_par

if row<0 then return

lst_par.parlong1=this.getitemnumber(row,'idregcomp')

CHOOSE CASE ii_tipo
CASE 4   //consulta
   lst_par.updwprop = true
	lst_par.guardar  = false
	lst_par.nuevo    = false
	lst_par.borrar   = false	
	lst_par.insertar = false	
	lst_par.suprimir = false
	lst_par.tipo     = ii_tipo
	lst_par.titulo   = ist_par.titulo
	//openwithparm(w_ventana1,lst_par)
	OpenWithParm(w_ventana, lst_par, "w_mnt_regcompetencia_mi")
END CHOOSE
end event

event dw_maestro::ue_retrieve;//if ii_tipo = 0 then
//	setfilter(' estviamt = 2 ')
//	filter()
//end if
SQL_FILTRO = dw_filtro.uf_getsql()
//if ii_tipo = 0 then
//	SQL_FILTRO = SQL_FILTRO + ' and mtvia.ESTVIAOPEMTGEN <> 4 '
//end if
return retrieve()
end event

event dw_maestro::ue_insertar;setpointer(hourglass!)
st_par lst_par
window w_ventana

	lst_par.updwprop = true
	lst_par.guardar = true
	lst_par.nuevo = false
	lst_par.borrar = false
	lst_par.insertar = true
	lst_par.suprimir = false
	lst_par.tipo = 1 //opcion de generar 1 consultar

//openwithparm(w_mnt_oportunidad_venta,lst_par)
OpenWithParm(w_ventana, lst_par, "w_mnt_regcompetencia_mi")
end event

type dw_filtro from uo_dw_fil within w_lis_regcompetencia_mi
event ue_keydown pbm_dwnkey
integer x = 622
integer y = 416
integer width = 1609
integer height = 384
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string title = "Filtro"
string dataobject = "d_fil_regcompetencia_mi"
boolean controlmenu = true
end type

event ue_keydown;if keydown(keyenter!) then
	event ue_menu_buscar()
end if
end event

event ue_getsql;this.accepttext()
is_sql = ""
if uf_flag('f_idoperador') then
	is_sql = is_sql + " and a.idoperador = " + string(this.getitemnumber(this.getrow(),'idoperador'))
end if
if uf_flag('f_tipsrv') then
	is_sql = is_sql + " and a.tipsrv  like '%" + UPPER(this.getitemstring(this.getrow(),'tipsrv')) +"%'"
end if
if uf_flag('f_fecha') then
	is_sql = is_sql + " and c.Fec_registro between to_date('"+string(this.getitemdatetime(1,'fecini'),'dd/mm/yyyy')+"','dd/mm/yyyy') "
	is_sql = is_sql + " and to_date('"+string(this.getitemdatetime(1,'fecfin'),'dd/mm/yyyy')+"','dd/mm/yyyy') + 1"		
end if

return is_sql


end event

