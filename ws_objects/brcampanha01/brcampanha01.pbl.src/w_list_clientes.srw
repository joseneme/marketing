$PBExportHeader$w_list_clientes.srw
forward
global type w_list_clientes from w_mnt_std
end type
type dw_fil from uo_fil_cmp within w_list_clientes
end type
end forward

global type w_list_clientes from w_mnt_std
string title = "Listado de Clientes"
dw_fil dw_fil
end type
global w_list_clientes w_list_clientes

type variables

end variables

on w_list_clientes.create
int iCurrent
call super::create
this.dw_fil=create dw_fil
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_fil
end on

on w_list_clientes.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_fil)
end on

event ue_postopen;dw_fil.uf_ini(sqlca)

end event

event ue_menu_buscar;if dw_fil.visible then
	ib_menu_buscar = true
	dw_maestro.trigger event ue_refrescar(true)
	dw_fil.visible=false
else
	dw_fil.visible=true
	dw_fil.setfocus()
end if

end event

event open;call super::open;ist_par.parstring1 = sqlca.logid

choose case ii_tipo 
	case 0, 1, 2, 3
		dw_maestro.dataobject = 'd_lis_cmp_actualizacion'
		
end choose
//f_tl_dw(dw_maestro)
//f_tl_dw(dw_fil)
//f_tl_window(this)

//f_tl_menu(this.menuid, upper(this.menuid.classname()), '','')
end event

type dw_maestro from w_mnt_std`dw_maestro within w_list_clientes
string dataobject = "d_lis_cmp_actualizacion"
end type

event dw_maestro::doubleclicked;call super::doubleclicked;window w_ventana
st_par lst_par
w_campanhas_principal w_ventana1

if row > 0 then 
	
	lst_par.parstring1 = dw_maestro.getitemstring(row,'codcli')
	lst_par.parlong2 = dw_maestro.getitemnumber(row,'idinstancia')
	
	if Not isnull(lst_par.parstring1) and Not isnull(lst_par.parlong2) then 

		lst_par.updwprop = true
		lst_par.guardar = this.guardar
		lst_par.nuevo = false
		lst_par.borrar = false	
		lst_par.insertar = true	
		lst_par.suprimir = true	
		lst_par.tipo = 0
		OpenSheetWithparm (w_ventana, lst_par, "w_campanhas_principal", Parentwindow(), 1, Original!)
		//openwithparm(w_ventana1,lst_par)
	end if

end if
end event

event dw_maestro::ue_retrieve;long ll_1

SQL_FILTRO=dw_fil.uf_getsql()
ll_1 = this.retrieve()
return ll_1
end event

type dw_fil from uo_fil_cmp within w_list_clientes
integer x = 635
integer y = 360
integer width = 1723
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string title = "Filtro"
string dataobject = "d_fil_campanha_tmp"
boolean ib_ini = false
end type

event ue_getsql;
int i
i=this.accepttext()

is_sql = ""

// Busquedas fijas segun el tipo
//if ii_tipo = 0 then // usuario
//	is_sql = is_sql + " and rqit.usureq = user "
//elseif ii_tipo = 1 then // supervisor
//	is_sql = is_sql + " and rqit.responsable = user "
//elseif ii_tipo = 3 then // administrador
//	is_sql = is_sql + " and rqit.usureqapr = user "
//end if

if uf_flag('f_idinstancia') then
	is_sql = is_sql + " and  cli.idinstancia = " + string(this.getitemnumber(1,'idinstancia'))+" "
end if

if uf_flag('f_nomcli') then
	is_sql = is_sql + " and  cli.nomcli like " + " '%"+ string(this.getitemstring(1,'nomcli'))+"%' "
end if

if uf_flag('f_ntdide') then
	is_sql = is_sql + " and  cli.ntdide = " + string(this.getitemstring(1,'ntdide'))+" "
end if

if uf_flag('f_nomdst') then
	is_sql = is_sql + " and  dst.distrito_desc like " + " '%"+ string(this.getitemstring(1,'distrito_desc'))+"%' "
end if

if uf_flag('f_codsecmark') then
	is_sql = is_sql + " and  cli.codsecmark = " + string(this.getitemnumber(1,'codsecmark'))+" "
end if

if uf_flag('f_codsegmark') then
	is_sql = is_sql + " and  cli.codsegmark = " + string(this.getitemnumber(1,'codsegmark'))+" "
end if

if uf_flag('f_codgirmark') then
	is_sql = is_sql + " and  cli.codgirmark = " + string(this.getitemstring(1,'codgirmark'))+" "
end if

return is_sql
end event

event clicked;call super::clicked;if dwo.name = 'b_aceptar' then
   parent.trigger event ue_menu_buscar()
end if

if dwo.name = 'b_cancelar' then
	dw_fil.hide()
end if
end event

