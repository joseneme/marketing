$PBExportHeader$w_lead.srw
forward
global type w_lead from w_md_comun
end type
type lds_vtaclicobprod from datawindow within tabpage_1
end type
type tabpage_2 from userobject within tab_det
end type
type dw_carga from uo_dw_md within tabpage_2
end type
type tabpage_2 from userobject within tab_det
dw_carga dw_carga
end type
end forward

global type w_lead from w_md_comun
integer width = 3506
integer height = 2440
string title = "Lead Clientes"
string menuname = "m_mnt_lead"
boolean querymode = false
event ue_menu_cargardbf ( )
event ue_menu_verificardbf ( )
event ue_menu_transferirlead ( )
end type
global w_lead w_lead

type variables
dec id_codlead
end variables

event ue_menu_cargardbf;string ls_archivo

integer i

setnull(ls_archivo)

tab_det.selecttab("tabpage_2")

i=tab_det.tabpage_2.dw_carga.importfile(ls_archivo)
end event

event ue_menu_verificardbf;long ll_numcli, i
string ls_codcli, ls_nomdst, ls_obs,ls_nomcli,ls_codubi,ls_tipdide,ls_ntdide,ls_dircli
integer li_contcli, li_contdst,li_contcliins
datawindow dw_carga

dw_carga=tab_det.tabpage_2.dw_carga

setpointer(hourglass!)
ll_numcli=dw_carga.rowcount()

for i=1 to ll_numcli

	ls_obs=''
	
	ls_codcli=dw_carga.getitemstring(i,'codcli')
	
	select count(*) into :li_contcli from vtatabcli where codcli=:ls_codcli ;

	 
	ls_nomdst=upper(trim(dw_carga.getitemstring(i,'nomdst')))
	
	select count(*),codubi into :li_contdst,:ls_codubi 
	from vtatabdst 
	where upper(ltrim(rtrim(nomdst))) like :ls_nomdst and codpai=51 and codest=1 and codpvc=1
	group by codubi;
	
	if li_contcli=0 then
		ls_obs=' Cliente no existe.'
	end if;
	
	if li_contdst=0 then
		ls_obs=ls_obs+' Distrito no existe.'
	end if;
	

	if li_contcli=0 or li_contdst=0 then
		dw_carga.setitem(i,"check1",'1')
		dw_carga.setitem(i,"observacion",ls_obs)
	end if
	
next
end event

event ue_menu_transferirlead;long ll_numcli, i
string ls_codcli, ls_nomdst, ls_obs,ls_nomcli,ls_codubi,ls_tipdide,ls_ntdide,ls_dircli,ls_seg,ls_ect
integer li_contcli, li_contdst,li_contcliins

datawindow dw_carga

dw_carga=tab_det.tabpage_2.dw_carga

setpointer(hourglass!)
ll_numcli=dw_carga.rowcount()

for i=1 to ll_numcli

	ls_codcli=dw_carga.getitemstring(i,'codcli')
	
	select nomcli into :ls_nomcli from vtatabcli where codcli=:ls_codcli ;
	
	ls_nomdst=upper(trim(dw_carga.getitemstring(i,'nomdst')))
	
   select codubi into :ls_codubi 
	from vtatabdst 
	where upper(ltrim(rtrim(nomdst))) like :ls_nomdst and codpai=51 and codest=1 and codpvc in (1,2);
	
	
	select nvl(tipdide,'') into :ls_tipdide from vtatabcli where codcli=:ls_codcli ;
	
	select nvl(ntdide,'') into :ls_ntdide from vtatabcli where codcli=:ls_codcli ;
	
	select nvl(ntdide,'') into :ls_ntdide from vtatabcli where codcli=:ls_codcli ;
	
	select nvl(b.dscseg,'') into :ls_seg from vtatabcli a,vtatabseg b where a.codseg=b.codseg and codcli=:ls_codcli ;
	
	select nvl(b.nomect, '') into :ls_ect from vtatabcli a,vtatabect b where a.codect=b.codect and codcli=:ls_codcli ;
	
	ls_dircli=upper(dw_carga.getitemstring(i,'dircli'))
	
	
	li_contcliins=tab_det.tabpage_1.dw_det1.insertrow(0)
	
	tab_det.tabpage_1.dw_det1.setitem(li_contcliins,'codigo_cliente',ls_codcli)
	tab_det.tabpage_1.dw_det1.setitem(li_contcliins,'cliente',ls_nomcli)
	tab_det.tabpage_1.dw_det1.setitem(li_contcliins,'tipo_documento',ls_tipdide)
	tab_det.tabpage_1.dw_det1.setitem(li_contcliins,'documento',ls_ntdide)
	tab_det.tabpage_1.dw_det1.setitem(li_contcliins,'direccion',ls_dircli)
	tab_det.tabpage_1.dw_det1.setitem(li_contcliins,'distrito',ls_codubi)
	tab_det.tabpage_1.dw_det1.setitem(li_contcliins,'segmento',ls_seg)
	tab_det.tabpage_1.dw_det1.setitem(li_contcliins,'consultor',ls_ect)
	
	
	
next

	
	

end event

on w_lead.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_mnt_lead" then this.MenuID = create m_mnt_lead
end on

on w_lead.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;/*dw_1.settransobject(sqlca)
//dw_cab.retrieve()
dw_1.insertrow(0)
dw_1.setitem(1,"fecusu",datetime(today()))
dw_1.setitem(1,"codusu",sqlca.userid)
//tab_det.SelectTab(2)

*/
id_codlead=ist_par.pardec1

dw_maestro.trigger event ue_set_hijo(tab_det.tabpage_2.dw_carga)


end event

event ue_postopen;dw_maestro.setfocus()
//Nuevo Lead
if ii_tipo = 1 then
	dw_maestro.trigger event ue_insertar()
else   
	this.post event ue_cargar()
end if

this.post event ue_permisos()
this.post event ue_permisos_menu()

end event

event ue_permisos;call super::ue_permisos;//los permisos son de acuerdo al ii_tipo

//im
if ii_tipo=1 or ii_tipo=6 then
	tab_det.tabpage_1.dw_det1.object.ventas.protect=1
	tab_det.tabpage_1.dw_det1.object.observaciones_venta.protect=1
	tab_det.tabpage_1.dw_det1.object.dias_instalaciones.protect=1
		tab_det.tabpage_1.dw_det1.object.producto.protect=1
end if
//creditos	
if ii_tipo=4 then
	tab_det.tabpage_2.visible = false
	tab_det.tabpage_1.dw_det1.object.DataWindow.readonly="Yes"
	dw_maestro.object.observacion.protect=1
	dw_maestro.object.estlead.protect=0
end if	

//ventas
if ii_tipo=2 then
	tab_det.tabpage_2.visible = false
	dw_maestro.object.observacion.protect=1
	dw_maestro.object.estlead.protect=0
	
	tab_det.tabpage_1.dw_det1.object.codigo_cliente.protect=1
	tab_det.tabpage_1.dw_det1.object.distrito.protect=1
	tab_det.tabpage_1.dw_det1.object.direccion.protect=1
	tab_det.tabpage_1.dw_det1.object.ventas.protect=0
	tab_det.tabpage_1.dw_det1.object.observaciones_venta.protect=0
	tab_det.tabpage_1.dw_det1.object.dias_instalaciones.protect=1
	tab_det.tabpage_1.dw_det1.object.producto.protect=0
end if	

//instalaciones
if ii_tipo=3 then
	tab_det.tabpage_2.visible = false
	dw_maestro.object.observacion.protect=1
	dw_maestro.object.estlead.protect=0
	
	tab_det.tabpage_1.dw_det1.object.codigo_cliente.protect=1
	tab_det.tabpage_1.dw_det1.object.distrito.protect=1
	tab_det.tabpage_1.dw_det1.object.direccion.protect=1
	tab_det.tabpage_1.dw_det1.object.ventas.protect=1
	tab_det.tabpage_1.dw_det1.object.observaciones_venta.protect=1

	tab_det.tabpage_1.dw_det1.object.dias_instalaciones.protect=0
	tab_det.tabpage_1.dw_det1.object.producto.protect=1
	
end if	

//consultas
if ii_tipo=5 then
	tab_det.tabpage_2.visible = false
	dw_maestro.object.DataWindow.readonly="Yes"
	tab_det.tabpage_1.dw_det1.object.DataWindow.readonly="Yes"
end if	

end event

event ue_menu_imprimir;window w_ventana
st_par lst_par
w_visor_comun_in w_visor1

lst_par.dw_maestro = 'd_rep_lead'
lst_par.tipo = 4
lst_par.titulo = 'Lead de Clientes'
lst_par.parinteger1=id_codlead

OpenSheetWithparm (w_ventana, lst_par, "w_visor_comun_in", Parentwindow(), 1, Original!)
//openwithparm(w_visor1, lst_par)
end event

type dw_maestro from w_md_comun`dw_maestro within w_lead
integer x = 50
integer y = 16
integer width = 3365
integer height = 556
string dataobject = "d_lead_cabecera"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event dw_maestro::ue_update_pre_row;dec ld_lead
DWItemStatus l_status

l_status = this.getitemstatus(row,0,primary!)
if l_status = NewModified!	then
	select max(codlead) into :ld_lead from lead;
	if sqlca.sqlcode = 0 then
		id_codlead = ld_lead+1
		this.setitem(row,'codlead',id_codlead)
		return true
	else
		messagebox(gsNomApl,'Imposible Obtener un número de Lead')
		return false
	end if
else
	return true
end if
end event

event dw_maestro::ue_actualizar_pk;call super::ue_actualizar_pk;//saca la llave primaria
/*integer ln_codlead,ln_cantidad,ln_ind

ln_codlead=dw_1.getitemnumber(1,'codlead')

if isnull(ln_codlead) then
		select nvl(max(codlead),0) into :ln_codlead from lead;
		ln_codlead=ln_codlead+1;		
		dw_1.setitem(1,'codlead',ln_codlead)
		//para el detalle
		ln_cantidad=tab_det.tabpage_1.dw_det1.rowcount()
		
		for ln_ind=1 to ln_cantidad
			tab_det.tabpage_1.dw_det1.setitem(ln_ind,'codlead',ln_codlead)
		next
end if;*/
end event

event dw_maestro::ue_valores_iniciales;
string  ls_usuario




SELECT user INTO :ls_usuario FROM DUAL;

dw_maestro.setitem(al_row,'codusu',ls_usuario)

end event

event dw_maestro::ue_retrieve;string ls_tipo
long ll_row

ll_row = this.retrieve(id_codlead)

tab_det.tabpage_1.dw_det1.retrieve(id_codlead)

return ll_row
end event

type tab_det from w_md_comun`tab_det within w_lead
integer x = 73
integer y = 588
integer width = 3296
integer height = 1340
tabpage_2 tabpage_2
end type

on tab_det.create
this.tabpage_2=create tabpage_2
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tabpage_2
end on

on tab_det.destroy
call super::destroy
destroy(this.tabpage_2)
end on

type tabpage_1 from w_md_comun`tabpage_1 within tab_det
integer width = 3259
integer height = 1220
string text = "Detalle"
lds_vtaclicobprod lds_vtaclicobprod
end type

on tabpage_1.create
this.lds_vtaclicobprod=create lds_vtaclicobprod
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lds_vtaclicobprod
end on

on tabpage_1.destroy
call super::destroy
destroy(this.lds_vtaclicobprod)
end on

type dw_det1 from w_md_comun`dw_det1 within tabpage_1
integer x = 32
integer y = 4
integer width = 3150
integer height = 1172
string dataobject = "d_vtaclicobprod"
end type

event dw_det1::ue_update_pre_row;DWItemStatus l_status

long ll_row
long ll_clave
ll_row = dw_maestro.getrow()
if ll_row > 0 then
	l_status = this.getitemstatus(row,0,primary!)
	if l_status = NewModified!	then
		ll_clave = dw_maestro.getitemnumber(ll_row,'codlead')
		this.setitem(row,'codigo_lead',ll_clave)
	end if
	return true
else
	return false
end if
end event

event dw_det1::ue_valida_dato;call super::ue_valida_dato;st_par lst_par_in,lst_par_out

string ls_codcli,ls_tipdide,ls_ntdide,ls_seg,ls_ect, ls_dircli, ls_codubi
accepttext()

choose case as_columna
	case 'codigo_cliente'
		if (isnull(this.getitemstring(al_row,'codigo_cliente'))) then
			openwithparm(w_lov_cliente, lst_par_in)
			lst_par_out = message.powerobjectparm
			if isvalid(lst_par_out) then
				
					this.setitem(al_row,'codigo_cliente',lst_par_out.parstring1)
					this.setitem(al_row,'cliente',lst_par_out.parstring2)
					
					ls_codcli=lst_par_out.parstring1
					
					select nvl(tipdide,'') into :ls_tipdide from vtatabcli where codcli=:ls_codcli ;
	
					select nvl(ntdide,'') into :ls_ntdide from vtatabcli where codcli=:ls_codcli ;
	
					select nvl(dircli,'') into :ls_dircli from vtatabcli where codcli=:ls_codcli ;		//edwin

					select nvl(codubi,'') into :ls_codubi from vtatabcli where codcli=:ls_codcli ;		//edwin					
		
					select nvl(b.dscseg,'') into :ls_seg from vtatabcli a,vtatabseg b where a.codseg=b.codseg and codcli=:ls_codcli ;
	
					select nvl(b.nomect, '') into :ls_ect from vtatabcli a,vtatabect b where a.codect=b.codect and codcli=:ls_codcli ;
	
					this.setitem(al_row,'segmento',ls_seg)
					this.setitem(al_row,'consultor',ls_ect)
	
					this.setitem(al_row,'tipo_documento',ls_tipdide)
					this.setitem(al_row,'documento',ls_ntdide)
					this.setitem(al_row,'direccion',ls_dircli)			//edwin
					this.setitem(al_row,'distrito',ls_codubi)			//edwin					
	
/*					this.setitem(al_row,'codsuc',lst_par_out.parstring3)
					this.setitem(al_row,'nomsuc',lst_par_out.parstring4)
					this.setitem(al_row,'dirsuc',lst_par_out.parstring5)
					this.setitem(al_row,'ubisuc',lst_par_out.parstring6)
					this.setitem(al_row,'estado',lst_par_out.pardec1)
					this.setitem(al_row,'codedi',dw_maestro.getitemnumber(dw_maestro.getrow(),'codigo'))*/
			end if
		else
			messagebox('Error','Se tiene que borrar el registro y agregar uno nuevo si se quiere actualizar')
			return 0
		end if

		
end choose		

return 0
end event

event dw_det1::ue_retrieve;call super::ue_retrieve;long ll_row
long ll_clave
ll_row = dw_maestro.getrow()
if ll_row > 0 then
	ll_clave = dw_maestro.getitemnumber(ll_row,'codLEAD')
	return this.retrieve(ll_clave)
else
	return 0
end if
end event

event dw_det1::ue_exportar;/*
Comentariar todo y darle check a 'extend ancestor script' para que sea como siempre
*/

//datastore lds_vtaclicobprod
//
//lds_vtaclicobprod = create datastore
//
//lds_vtaclicobprod.DataObject = 'd_vtaclicobprod_export'
lds_vtaclicobprod.SetTransObject(SQLCA)
lds_vtaclicobprod.Retrieve(id_codlead)

lds_vtaclicobprod.AcceptText()
lds_vtaclicobprod.saveas()
//
//destroy lds_vtaclicobprod

end event

type lds_vtaclicobprod from datawindow within tabpage_1
boolean visible = false
integer x = 265
integer y = 48
integer width = 411
integer height = 432
integer taborder = 20
string title = "none"
string dataobject = "d_vtaclicobprod_export"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_det
integer x = 18
integer y = 104
integer width = 3259
integer height = 1220
long backcolor = 79741120
string text = "Archivo"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_carga dw_carga
end type

on tabpage_2.create
this.dw_carga=create dw_carga
this.Control[]={this.dw_carga}
end on

on tabpage_2.destroy
destroy(this.dw_carga)
end on

type dw_carga from uo_dw_md within tabpage_2
integer x = 46
integer y = 20
integer width = 3150
integer height = 1120
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_lead_carga1"
boolean guardar = false
end type

