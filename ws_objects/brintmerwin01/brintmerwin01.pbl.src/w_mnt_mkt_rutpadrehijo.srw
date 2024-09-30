$PBExportHeader$w_mnt_mkt_rutpadrehijo.srw
forward
global type w_mnt_mkt_rutpadrehijo from w_mnt_std
end type
type dw_fil_rutpadrehijo from uo_dw_fil within w_mnt_mkt_rutpadrehijo
end type
end forward

global type w_mnt_mkt_rutpadrehijo from w_mnt_std
boolean borrar = false
dw_fil_rutpadrehijo dw_fil_rutpadrehijo
end type
global w_mnt_mkt_rutpadrehijo w_mnt_mkt_rutpadrehijo

type variables
string is_sql
end variables

on w_mnt_mkt_rutpadrehijo.create
int iCurrent
call super::create
this.dw_fil_rutpadrehijo=create dw_fil_rutpadrehijo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_fil_rutpadrehijo
end on

on w_mnt_mkt_rutpadrehijo.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_fil_rutpadrehijo)
end on

event close;call super::close;dw_fil_rutpadrehijo.uf_save()
end event

event open;call super::open;dw_fil_rutpadrehijo.setfocus()
end event

event ue_menu_buscar;if dw_fil_rutpadrehijo.visible then
	ib_menu_buscar = true
	dw_maestro.trigger event ue_refrescar(true)
	dw_fil_rutpadrehijo.visible = false
else
	dw_fil_rutpadrehijo.visible = true
	dw_fil_rutpadrehijo.setfocus()
end if
end event

event ue_postopen;call super::ue_postopen;dw_fil_rutpadrehijo.uf_ini(sqlca)
end event

event ue_menu_grabar;long ll_row
ll_row = dw_maestro.getrow()

if not this.guardar then
	f_msg('Esta ventana es de solo lectura.')
	return
end if
if dw_maestro.trigger event ue_guardar(false) then
	commit;
	if SQLCA.sqlcode = 0 then
		dw_maestro.uf_resetupdate()
		f_msg('Se grabaron los datos.')
	else
		f_msg_sqlerr(sqlca,true)
	end if
else
	rollback;
end if

trigger event ue_menu_refrescar()
if ll_row <= dw_maestro.rowcount() then
	dw_maestro.setrow(ll_row)
end if
end event

type dw_maestro from w_mnt_std`dw_maestro within w_mnt_mkt_rutpadrehijo
string dataobject = "d_mnt_mkt_rutpadrehijo"
boolean borrar = false
end type

event dw_maestro::ue_retrieve;long ll_fila
SQL_FILTRO = dw_fil_rutpadrehijo.uf_getsql()
is_sql = sql_filtro

ll_fila = retrieve()

return ll_fila
end event

event dw_maestro::ue_update_pre_row;DWItemStatus l_status
string ls_rutpadre, ls_ruthijo
long ll_cont, ll_flgactivo

this.accepttext()
ls_rutpadre = this.getitemstring(row, 'rut_padre')
ls_ruthijo = this.getitemstring(row, 'rut_hijo')
ll_flgactivo = this.getitemnumber(row, 'flgactivo')

l_status = this.getitemstatus(row,0,primary!)
If l_status = NewModified! or l_status = DataModified!  THEN
	if ll_flgactivo = 1 then		
		select count(1) into :ll_cont from portalvta.cl_Rut_padre_hijo 
		where rut_padre = trim(:ls_rutpadre) and
		rut_hijo = trim(:ls_ruthijo)  and flgactivo=1;
		
		if ll_cont>0 then
			f_msg('Ya existe dicha tupla padre hijo')
			return false
		end if
		
		select count(1) into :ll_cont from portalvta.cl_Rut_padre_hijo 
		where rut_hijo = trim(:ls_ruthijo) ;
		
		if ll_cont>0 then
			f_msg('El RUT Hijo esta asociado a otro RUT Padre')
			return false
		end if
		
	end if
end if	

return true
end event

event dw_maestro::ue_update_post_row;call super::ue_update_post_row;if this.getrow()<1 then return false

string ls_rutpadre, ls_ruthijo,ls_mensaje
long ll_coderror
DWItemStatus l_status
ls_rutpadre = this.getitemstring(row,'rut_padre')
ls_ruthijo = this.getitemstring(row,'rut_hijo')

l_status = this.getitemstatus(row,0,primary!)
If l_status = NewModified! or l_status = DataModified!  THEN

	DECLARE p_vta_upd_rutpadrehijo PROCEDURE FOR sales.PQ_VTA_CLINIC.p_vta_upd_rutpadrehijo(:ls_rutpadre, :ls_ruthijo);
	setpointer(hourglass!)
	execute p_vta_upd_rutpadrehijo;
	
	if SQLCA.sqlcode < 0 then
		MessageBox("Error",sqlca.sqlerrtext,Information!,Ok!,1)
		rollback;              
	else 
		 fetch p_vta_upd_rutpadrehijo into  :ls_mensaje, :ll_coderror;
		 if SQLCA.sqlcode < 0 then
			MessageBox("Error",sqlca.sqlerrtext,Information!,Ok!,1)
			rollback;
		 else 
			if ll_coderror = 0 then
				commit;
			else
				messagebox("Aviso",ls_mensaje + ' en fila ' + string(row), Exclamation!)
				rollback;
				return false
			end if
		 end if
		 
	 end if
end if

close p_vta_upd_rutpadrehijo;

return true
end event

event dw_maestro::rowfocuschanging;if this.getrow()>0 then
	DWItemStatus l_status, l_status2
	string ls_rutpadre, ls_ruthijo
	long ll_cont
	
	this.accepttext()
	//l_status = this.getitemstatus(row,0,primary!)
	ls_rutpadre = this.getitemstring(currentrow, 'rut_padre')
	ls_ruthijo = this.getitemstring(currentrow, 'rut_hijo')
	l_status = this.getitemstatus(currentrow,0,primary!)
	
	If l_status = NewModified! or l_status = DataModified!  THEN
		select count(1) into :ll_cont from portalvta.cl_Rut_padre_hijo 
		where rut_padre = trim(:ls_rutpadre) and
		rut_hijo = trim(:ls_ruthijo);
		
		if ll_cont>0 then
			f_msg('Ya existe dicha tupla padre hijo')
			this.SelectRow(currentrow,True)
			this.SelectRow(newrow,false)
			this.setfocus()
			return 0
		end if
	end if
end if
end event

event dw_maestro::rowfocuschanged;//
end event

type dw_fil_rutpadrehijo from uo_dw_fil within w_mnt_mkt_rutpadrehijo
event ue_keydown pbm_dwnkey
integer x = 174
integer y = 156
integer height = 308
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "Filtro"
string dataobject = "d_fil_rutpadrehijo"
boolean controlmenu = true
end type

event ue_keydown;if keydown(keyenter!) then
	event ue_menu_buscar()
end if
end event

event ue_getsql;accepttext()
is_sql = ""

if uf_flag('f_rutpadre') then
	is_sql = is_sql + " and rut_padre = '" + object.rut_padre[1] + "'"
end if
if uf_flag('f_ruthijo') then
	is_sql = is_sql + " and rut_hijo = '" + object.rut_hijo[1] + "'"
end if
return is_sql

end event

