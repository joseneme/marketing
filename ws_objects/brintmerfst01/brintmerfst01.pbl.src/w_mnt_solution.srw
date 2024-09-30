$PBExportHeader$w_mnt_solution.srw
forward
global type w_mnt_solution from w_mnt_std
end type
type cb_1 from commandbutton within w_mnt_solution
end type
type cb_2 from commandbutton within w_mnt_solution
end type
end forward

global type w_mnt_solution from w_mnt_std
integer width = 1417
integer height = 800
string title = "Anormalidades"
string menuname = ""
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
cb_1 cb_1
cb_2 cb_2
end type
global w_mnt_solution w_mnt_solution

type variables
long il_id
end variables

on w_mnt_solution.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_2
end on

on w_mnt_solution.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;call super::open;ist_par = message.powerobjectparm
dw_maestro.settransobject(sqlca)
//Webf_centrar_ventana(this)
il_id = ist_par.parlong1


end event

event resize;//
end event

event ue_postopen;long ll_nivel
if ist_par.tipo = 2 then
	dw_maestro.insertrow(0)
	dw_maestro.object.nivel[1]=ist_par.pardec1
	dw_maestro.object.idpath[1] = long(ist_par.parstring1)
else
	dw_maestro.retrieve(ist_par.parlong1)
end if
end event

event closequery;//
end event

type dw_maestro from w_mnt_std`dw_maestro within w_mnt_solution
integer x = 32
integer y = 16
integer width = 1262
integer height = 496
string dataobject = "d_mnt_solution"
boolean hscrollbar = false
boolean vscrollbar = false
boolean seleccionar = false
end type

event dw_maestro::ue_update_pre;call super::ue_update_pre;long ll_id
long ll_idpath
integer li_count
string ls_code
accepttext() 
ll_idpath = long(ist_par.parstring1)
if ist_par.tipo = 2 then
	select nvl(max(id_solution),0)+1 into :ll_id from solution_tree;
	object.id_solution[1] = ll_id
	object.idpath[1] = ll_idpath
end if

ls_code = object.code[1]
//if isnull(ls_code) or len(ls_code) = 0 or len(ls_code) = 1 then
//	messagebox("Advertencia","Ingrese code correcto")
//	return false
//else
	select count(*) into :li_count from solution_tree where idpath =:ll_idpath and code = :ls_code;
	if li_count >0 then
		messagebox("Advertencia","El code ingresado ya existe para este nivel")
		return false
	end if
//end if
return true
end event

event dw_maestro::ue_retrieve;call super::ue_retrieve;return retrieve(il_id)
end event

type cb_1 from commandbutton within w_mnt_solution
integer x = 544
integer y = 588
integer width = 375
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
boolean default = true
end type

event clicked;DWItemStatus l_status
st_par lst_par
integer li_tipo_new,li_tipo_old,li_res,ll_id,ll_numlevel
long ll_maxid

li_tipo_new = dw_maestro.GetItemNumber(1,'active')
ll_id = dw_maestro.GetItemNumber(1,'id_solution')

//select numlevel into :ll_numlevel from abnormality_tree where id = :il_id;
ll_numlevel = ist_par.pardec1 

select active into :li_tipo_old from solution_tree where id_solution = :ll_id;

li_res = 1
if li_tipo_old = 1 and li_tipo_new = 0 then
	li_res = MessageBox('Aviso', 'El cambio del Tipo desactivara la restriccion definida para este registro', Question!, OKCancel!, 2)
end if

IF li_res = 1 THEN
	if  (ll_numlevel<>0 )then
		dw_maestro.setitem(1,'numlevel',ll_numlevel)
	end if	
	/*Modificado por ROVB 09/05/2004*/
	if (ist_par.parstring3<>'') then
		dw_maestro.setitem(1,'levelfather', ist_par.parstring3)
	end if	
	/**/
	if dw_maestro.trigger event ue_guardar(false) then
		l_status = dw_maestro.getitemstatus(1,0,primary!)



		if l_status = NewModified!	or l_status = DataModified! then
			commit;
			if SQLCA.sqlcode = 0 then
				dw_maestro.uf_resetupdate()
			else
				messagebox(gsnomapl,'Error al grabar los datos.')
				rollback;
			end if
			messagebox(gsnomapl,'Se grabaron los datos.')
			lst_par.valido = true
			lst_par.parstring3 = dw_maestro.object.code[1]
			lst_par.parstring4 = dw_maestro.object.description[1]
			lst_par.parinteger1 = dw_maestro.object.active[1]
			select max(id_solution) into :ll_maxid from solution_tree;
//			lst_par.parlong1 = dw_maestro.object.id[1]
			lst_par.parlong1 = ll_maxid
			closewithreturn(Parent,lst_par)
		end if
	end if
END IF
end event

type cb_2 from commandbutton within w_mnt_solution
integer x = 997
integer y = 588
integer width = 375
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Salir"
boolean cancel = true
end type

event clicked;st_par lst_par
lst_par.valido = false
closewithreturn(Parent,lst_par)
end event

