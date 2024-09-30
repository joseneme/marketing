$PBExportHeader$w_contacto_medio_temp.srw
forward
global type w_contacto_medio_temp from window
end type
type uo_1 from uo_campanhas_medio_comunicacion_contacto within w_contacto_medio_temp
end type
end forward

global type w_contacto_medio_temp from window
integer width = 2158
integer height = 1140
boolean titlebar = true
string title = "Medio Comunicación -  Contactos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
event ue_nuevo2 ( )
uo_1 uo_1
end type
global w_contacto_medio_temp w_contacto_medio_temp

type variables
st_par ist_par2
int ii_instancia
string is_codcnt
end variables

event ue_nuevo2;int m
m = uo_1.dw_1.insertrow(0)
uo_1.dw_1.object.idinstancia[m] = ii_instancia
uo_1.dw_1.object.codcnt[m] = is_codcnt

integer li_find
li_find = uo_1.dw_1.rowcount() +1

uo_1.dw_1.SelectRow(li_find, true)
uo_1.dw_1.scrolltorow(li_find)
end event

on w_contacto_medio_temp.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on w_contacto_medio_temp.destroy
destroy(this.uo_1)
end on

event open;ist_par2 = Message.PowerObjectParm
uo_1.dw_1.settransobject(sqlca) 
uo_1.dw_1.retrieve(ist_par2.parstring1,ist_par2.parlong2) 

ii_instancia= ist_par2.parlong2
is_codcnt = ist_par2.parstring1  


end event

type uo_1 from uo_campanhas_medio_comunicacion_contacto within w_contacto_medio_temp
event destroy ( )
integer x = 14
integer y = 24
integer height = 964
integer taborder = 20
end type

on uo_1.destroy
call uo_campanhas_medio_comunicacion_contacto::destroy
end on

