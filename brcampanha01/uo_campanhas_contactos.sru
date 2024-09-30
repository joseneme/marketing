HA$PBExportHeader$uo_campanhas_contactos.sru
forward
global type uo_campanhas_contactos from uo_comun_campanhas
end type
end forward

global type uo_campanhas_contactos from uo_comun_campanhas
integer width = 3369
integer height = 2544
event ue_nuevo ( )
end type
global uo_campanhas_contactos uo_campanhas_contactos

type variables
String is_nomcli, is_codcli
Integer ii_instancia

end variables

on uo_campanhas_contactos.create
call super::create
end on

on uo_campanhas_contactos.destroy
call super::destroy
end on

type cb_2 from uo_comun_campanhas`cb_2 within uo_campanhas_contactos
integer textsize = -8
end type

event cb_2::clicked;call super::clicked;parent.event ue_nuevo()

integer li_find
li_find = dw_1.rowcount() +1
dw_1.SelectRow(li_find, true)
dw_1.scrolltorow(li_find)
end event

type cb_1 from uo_comun_campanhas`cb_1 within uo_campanhas_contactos
integer textsize = -8
end type

event cb_1::clicked;call super::clicked;dw_1.update()

if sqlca.sqlcode = -1 then
	messagebox("Error", sqlca.sqlErrtext) 
	Rollback;
else 
	commit;
	 messagebox( "Mensaje", "Se actualizo los campos con exito")
end if
end event

type dw_2 from uo_comun_campanhas`dw_2 within uo_campanhas_contactos
integer y = 1260
integer width = 3287
integer height = 1204
string dataobject = "d_tel_mnt_gen_contactos_vtatab"
end type

type dw_1 from uo_comun_campanhas`dw_1 within uo_campanhas_contactos
integer width = 3296
integer height = 1032
string dataobject = "d_tel_mnt_gen_contactos"
end type

event dw_1::clicked;call super::clicked;integer li, li_total, li_find
string ls_codcnt, ls_find
//Contactos del Cliente en base 
li_total = dw_2.RowCount()

if row > 0  then
	//selecciona el Codcnt a comparar
	this.SelectRow(0, false)
	this.SelectRow(row, TRUE)
	// si hay Codcnt en base para comparar
	if li_total > 0 then
		dw_2.SelectRow(0, false)
		//Almacena el Codcnt
		ls_codcnt = this.object.codcnt[row]
		//Busca el Codcnt seleccionado en base
		ls_find = " vtatabcntcli_codcnt = '" + ls_codcnt + "'"
		li_find = dw_2.Find(ls_find, 1, li_total)
		//Selecciona el Codcnt que est$$HEX2$$e1002000$$ENDHEX$$en base
		dw_2.SelectRow(li_find, true)
		dw_2.scrolltorow(li_find)
	end if
end if





end event

event dw_1::doubleclicked;call super::doubleclicked;st_par ist_par

if row > 0 then 
	ist_par.parstring1 = dw_1.object.codcnt[row]
	ist_par.parlong2 = dw_1.object.idinstancia[row]
	openwithparm(w_contacto_medio_temp, ist_par)
end if
end event

event dw_1::ue_insertar;
parent.event ue_nuevo()

integer li_find
li_find = dw_1.rowcount() +1
dw_1.SelectRow(li_find, true)
dw_1.scrolltorow(li_find)
end event

event dw_1::ue_valida_dato;call super::ue_valida_dato;CHOOSE CASE as_columna
	CASE 'dircnt'
		
			st_par lst_par_in, lst_par_out	
	
			lst_par_in.parstring1 = trim(dw_1.getitemstring(al_row,"codcli"))
	
	      openwithparm(w_buscar_direccion, lst_par_in)

	      lst_par_out=message.powerobjectparm
		
		if isvalid(lst_par_out) then
				
				dw_1.setitem(al_row,"v_ubicaciones_distrito_desc",lst_par_out.parstring7)
				dw_1.setitem(al_row,"dircnt",lst_par_out.parstring8)				
		end if
	
END CHOOSE
return 0
end event

