HA$PBExportHeader$w_mnt_vtatabhorario1.srw
forward
global type w_mnt_vtatabhorario1 from w_md_std
end type
end forward

global type w_mnt_vtatabhorario1 from w_md_std
integer width = 3090
integer height = 2112
end type
global w_mnt_vtatabhorario1 w_mnt_vtatabhorario1

on w_mnt_vtatabhorario1.create
call super::create
end on

on w_mnt_vtatabhorario1.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_maestro from w_md_std`dw_maestro within w_mnt_vtatabhorario1
integer width = 2231
integer height = 672
string dataobject = "dw_mnt_vtatabhorario"
end type

event dw_maestro::ue_retrieve;return this.retrieve()
end event

type td from w_md_std`td within w_mnt_vtatabhorario1
integer y = 708
end type

type tp1 from w_md_std`tp1 within td
string text = "D$$HEX1$$ed00$$ENDHEX$$as"
end type

type dw1 from w_md_std`dw1 within tp1
string dataobject = "dw_mnt_vtadethorario"
end type

event dw1::ue_retrieve;long ll_row
long ll_idhorario

ll_row = dw_maestro.getrow()
if ll_row > 0 then
	ll_idhorario = dw_maestro.GetItemNumber(ll_row,'idhorario')
	return this.retrieve(ll_idhorario)
else
	return 0
end if
end event

event dw1::ue_valores_iniciales;call super::ue_valores_iniciales;//
Long ll_idhorario

ll_idhorario = dw_maestro.GetItemNumber(DW_MAESTRO.GetRow(),'idhorario')

SetItem(al_row,'idhorario', ll_idhorario)
end event

