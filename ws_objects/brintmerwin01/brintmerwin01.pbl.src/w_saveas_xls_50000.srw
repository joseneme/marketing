$PBExportHeader$w_saveas_xls_50000.srw
forward
global type w_saveas_xls_50000 from window
end type
type st_4 from statictext within w_saveas_xls_50000
end type
type st_3 from statictext within w_saveas_xls_50000
end type
type cb_2 from commandbutton within w_saveas_xls_50000
end type
type cb_1 from commandbutton within w_saveas_xls_50000
end type
type st_2 from statictext within w_saveas_xls_50000
end type
type st_1 from statictext within w_saveas_xls_50000
end type
type sle_1 from singlelineedit within w_saveas_xls_50000
end type
type lb_filelist from listbox within w_saveas_xls_50000
end type
end forward

global type w_saveas_xls_50000 from window
integer width = 1399
integer height = 1424
boolean titlebar = true
string title = "Guardar como Excel"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
st_4 st_4
st_3 st_3
cb_2 cb_2
cb_1 cb_1
st_2 st_2
st_1 st_1
sle_1 sle_1
lb_filelist lb_filelist
end type
global w_saveas_xls_50000 w_saveas_xls_50000

on w_saveas_xls_50000.create
this.st_4=create st_4
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.lb_filelist=create lb_filelist
this.Control[]={this.st_4,&
this.st_3,&
this.cb_2,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.sle_1,&
this.lb_filelist}
end on

on w_saveas_xls_50000.destroy
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.lb_filelist)
end on

event open;lb_filelist.DirList("*.XLS", 16400, st_3)
sle_1.text = "*.XLS"

end event

type st_4 from statictext within w_saveas_xls_50000
integer x = 37
integer y = 1096
integer width = 951
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "x No coloque la extensión del archivo."
boolean focusrectangle = false
end type

type st_3 from statictext within w_saveas_xls_50000
integer x = 32
integer y = 92
integer width = 1330
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_saveas_xls_50000
integer x = 731
integer y = 1184
integer width = 384
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_saveas_xls_50000
integer x = 297
integer y = 1184
integer width = 384
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;st_par lst_par
if trim(sle_1.text)<>'' then
	lst_par.parstring2 = sle_1.text
	lst_par.parstring1 = st_3.text
	closewithreturn(parent, lst_par)
else
	messagebox('Error','Ingrese un nombre de archivo válido.')
	return
end if 
end event

type st_2 from statictext within w_saveas_xls_50000
integer x = 32
integer y = 36
integer width = 384
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Directorio:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_saveas_xls_50000
integer x = 32
integer y = 960
integer width = 421
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre Archivo:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_saveas_xls_50000
integer x = 32
integer y = 1016
integer width = 1330
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type lb_filelist from listbox within w_saveas_xls_50000
integer x = 27
integer y = 168
integer width = 1330
integer height = 768
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_filename, ls_filespec = "*.XLS", ls_archivo

IF lb_FileList.DirSelect(ls_filename) THEN
	//If ls_filename is not a file, append directory to ls_filespec.
	ls_filename = ls_filename + ls_filespec
	lb_filelist.DirList(ls_filename, 16400, st_3)
else
	sle_1.text = ls_filename
END IF
end event

