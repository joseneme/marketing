$PBExportHeader$w_mnt_categoria2.srw
forward
global type w_mnt_categoria2 from w_md_std
end type
type tp2 from userobject within td
end type
type dw2 from uo_dw_std within tp2
end type
type tp2 from userobject within td
dw2 dw2
end type
end forward

global type w_mnt_categoria2 from w_md_std
integer width = 3173
integer height = 2732
end type
global w_mnt_categoria2 w_mnt_categoria2

on w_mnt_categoria2.create
int iCurrent
call super::create
end on

on w_mnt_categoria2.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event resize;call super::resize;td.tp2.dw2.trigger event ue_resize(newwidth,NewHeight)
end event

event open;call super::open;dw_maestro.uf_set_hijo(td.tp2.dw2)

end event

type dw_maestro from w_md_std`dw_maestro within w_mnt_categoria2
integer width = 2231
integer height = 1216
string dataobject = "d_mnt_categoria"
end type

event dw_maestro::ue_retrieve;return this.retrieve()
end event

event dw_maestro::clicked;call super::clicked;st_par lst_par
window w_ventana
accepttext()
choose case dwo.name
	case 'rr_1'
		lst_par.parlong1	= tHIS.object.color[row]
		lst_par.updwprop 	= true
		lst_par.guardar 	= true
		lst_par.nuevo 		= true	
		lst_par.borrar 		= true
		lst_par.insertar 	= false	
		lst_par.suprimir 	= false
		
		OpenWithParm(w_bpm_color, lst_par)
		lst_par = message.powerobjectparm
		if isvalid(lst_par) and not IsNull(lst_par) then
			this.setitem(row, 'color', lst_par.parlong1)
			//dw_maestro.update()
		end if
		//dw_maestro.triggerevent('ue_retrieve')
end choose



end event

type td from w_md_std`td within w_mnt_categoria2
integer x = 0
integer y = 1248
integer width = 2633
integer height = 1152
tp2 tp2
end type

on td.create
this.tp2=create tp2
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tp2
end on

on td.destroy
call super::destroy
destroy(this.tp2)
end on

type tp1 from w_md_std`tp1 within td
integer width = 2597
integer height = 1032
string text = "Subcategoría"
end type

type dw1 from w_md_std`dw1 within tp1
string dataobject = "d_mnt_subcategoria"
end type

event dw1::ue_retrieve;long ll_row
long ll_idcategoria

ll_row = dw_maestro.getrow()
if ll_row > 0 then
	ll_idcategoria = dw_maestro.GetItemNumber(ll_row,'idcategoria')
	return this.retrieve(ll_idcategoria)
else
	return 0
end if
end event

event dw1::ue_valores_iniciales;call super::ue_valores_iniciales;//
Long ll_idcategoria

ll_idcategoria = dw_maestro.GetItemNumber(DW_MAESTRO.GetRow(),'idcategoria')

SetItem(al_row,'idcategoria', ll_idcategoria)
end event

type tp2 from userobject within td
integer x = 18
integer y = 104
integer width = 2597
integer height = 1032
long backcolor = 79741120
string text = "Departamento"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw2 dw2
end type

on tp2.create
this.dw2=create dw2
this.Control[]={this.dw2}
end on

on tp2.destroy
destroy(this.dw2)
end on

type dw2 from uo_dw_std within tp2
integer taborder = 50
string dataobject = "d_mnt_categoria_seg"
end type

event ue_retrieve;call super::ue_retrieve;long ll_row
long ll_idcategoria

ll_row = dw_maestro.getrow()
if ll_row > 0 then
	ll_idcategoria = dw_maestro.GetItemNumber(ll_row,'idcategoria')
	return this.retrieve(ll_idcategoria)
else
	return 0
end if
end event

event ue_valores_iniciales;call super::ue_valores_iniciales;//
Long ll_idcategoria

ll_idcategoria = dw_maestro.GetItemNumber(DW_MAESTRO.GetRow(),'idcategoria')

SetItem(al_row,'idcategoria', ll_idcategoria)
end event

