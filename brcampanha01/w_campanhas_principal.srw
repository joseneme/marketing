HA$PBExportHeader$w_campanhas_principal.srw
forward
global type w_campanhas_principal from window
end type
type tab_1 from tab within w_campanhas_principal
end type
type tp_clientes from uo_campanhas_clientes within tab_1
end type
type tp_clientes from uo_campanhas_clientes within tab_1
end type
type tp_medio_clientes from uo_campanhas_medio_comunicacion_cliente within tab_1
end type
type tp_medio_clientes from uo_campanhas_medio_comunicacion_cliente within tab_1
end type
type tp_contactos from uo_campanhas_contactos within tab_1
end type
type tp_contactos from uo_campanhas_contactos within tab_1
end type
type tp_sucursal from uo_campanhas_sucursales within tab_1
end type
type tp_sucursal from uo_campanhas_sucursales within tab_1
end type
type tp_proveedor from uo_campanhas_proveedores within tab_1
end type
type tp_proveedor from uo_campanhas_proveedores within tab_1
end type
type tab_1 from tab within w_campanhas_principal
tp_clientes tp_clientes
tp_medio_clientes tp_medio_clientes
tp_contactos tp_contactos
tp_sucursal tp_sucursal
tp_proveedor tp_proveedor
end type
end forward

global type w_campanhas_principal from window
integer width = 4649
integer height = 2960
boolean titlebar = true
string title = "Campanhas"
string menuname = "m_mnt_std"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
tab_1 tab_1
end type
global w_campanhas_principal w_campanhas_principal

type variables
st_par ist_par2
String is_nomcli, is_codcli
Integer ii_instancia

end variables

on w_campanhas_principal.create
if this.MenuName = "m_mnt_std" then this.MenuID = create m_mnt_std
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_campanhas_principal.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tab_1)
end on

event open;//clientes
ist_par2 = Message.PowerObjectParm
is_codcli = ist_par2.parstring1
ii_instancia = ist_par2.parlong2
tab_1.tp_clientes.dw_1.settransobject(sqlca)   
tab_1.tp_clientes.dw_1.retrieve(is_codcli, ii_instancia)

//clientes_comple
tab_1.tp_clientes.dw_2.settransobject(sqlca)
tab_1.tp_clientes.dw_2.retrieve(is_codcli)


//titulo ventana con Identificaci$$HEX1$$f300$$ENDHEX$$n del Cliente
if tab_1.tp_clientes.dw_1.rowcount() > 0 then
	is_nomcli = tab_1.tp_clientes.dw_2.getitemstring(1,'nomcli')
	this.title = "Campanhas - " + is_codcli + " " + is_nomcli
end if



end event

type tab_1 from tab within w_campanhas_principal
integer x = 23
integer y = 8
integer width = 4498
integer height = 2720
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tp_clientes tp_clientes
tp_medio_clientes tp_medio_clientes
tp_contactos tp_contactos
tp_sucursal tp_sucursal
tp_proveedor tp_proveedor
end type

on tab_1.create
this.tp_clientes=create tp_clientes
this.tp_medio_clientes=create tp_medio_clientes
this.tp_contactos=create tp_contactos
this.tp_sucursal=create tp_sucursal
this.tp_proveedor=create tp_proveedor
this.Control[]={this.tp_clientes,&
this.tp_medio_clientes,&
this.tp_contactos,&
this.tp_sucursal,&
this.tp_proveedor}
end on

on tab_1.destroy
destroy(this.tp_clientes)
destroy(this.tp_medio_clientes)
destroy(this.tp_contactos)
destroy(this.tp_sucursal)
destroy(this.tp_proveedor)
end on

event selectionchanged;is_codcli = ist_par2.parstring1
ii_instancia = ist_par2.parlong2

choose case newindex
	case 2  
		//Medio_comunicacion_clientes
tab_1.tp_medio_clientes.dw_1.settransobject(sqlca)
tab_1.tp_medio_clientes.dw_1.retrieve(is_codcli, ii_instancia)
//Medio_comunicacion_clientes_comple
tab_1.tp_medio_clientes.dw_2.settransobject(sqlca)
tab_1.tp_medio_clientes.dw_2.retrieve(is_codcli)
	case 3
		//contactos
tab_1.tp_contactos.dw_1.settransobject(sqlca)
tab_1.tp_contactos.dw_1.retrieve(is_codcli, ii_instancia)
//contactos_comple
tab_1.tp_contactos.dw_2.settransobject(sqlca)
tab_1.tp_contactos.dw_2.retrieve(is_codcli)

case 4
	//sucursal
tab_1.tp_sucursal.dw_1.settransobject(sqlca)
tab_1.tp_sucursal.dw_1.retrieve(is_codcli, ii_instancia) 
//sucursal_comple
tab_1.tp_sucursal.dw_2.settransobject(sqlca)
tab_1.tp_sucursal.dw_2.retrieve(is_codcli) 
	
case 5
	//proveedor
is_codcli = ist_par2.parstring1
ii_instancia = ist_par2.parlong2
tab_1.tp_proveedor.dw_1.settransobject(sqlca)
tab_1.tp_proveedor.dw_1.retrieve(is_codcli, ii_instancia)
//proveedor_complemento
tab_1.tp_proveedor.dw_2.settransobject(sqlca)
tab_1.tp_proveedor.dw_2.retrieve(is_codcli)


end choose







end event

type tp_clientes from uo_campanhas_clientes within tab_1
integer x = 18
integer y = 112
integer width = 4462
integer height = 2592
string text = "Clientes"
string picturename = "Picture!"
end type

type tp_medio_clientes from uo_campanhas_medio_comunicacion_cliente within tab_1
integer x = 18
integer y = 112
integer width = 4462
integer height = 2592
string text = "Medio de Comunicaci$$HEX1$$f300$$ENDHEX$$n - Clientes"
string picturename = "Custom020!"
end type

event ue_nuevo;call super::ue_nuevo;int m
m = tab_1.tp_medio_clientes.dw_1.insertrow(0)
tab_1.tp_medio_clientes.dw_1.object.codcli[m] = is_codcli
tab_1.tp_medio_clientes.dw_1.object.idinstancia[m] = ii_instancia

end event

type tp_contactos from uo_campanhas_contactos within tab_1
integer x = 18
integer y = 112
integer width = 4462
integer height = 2592
string text = "Contactos"
string picturename = "Custom026!"
end type

event ue_nuevo;call super::ue_nuevo;is_codcli = ist_par2.parstring1
ii_instancia = ist_par2.parlong2
int m
m = tab_1.tp_contactos.dw_1.insertrow(0)
tab_1.tp_contactos.dw_1.object.codcli[m] = is_codcli
tab_1.tp_contactos.dw_1.object.idinstancia[m] = ii_instancia
end event

type tp_sucursal from uo_campanhas_sucursales within tab_1
integer x = 18
integer y = 112
integer width = 4462
integer height = 2592
boolean enabled = false
string text = "Sucursal"
string picturename = "SetDefaultClass!"
end type

type tp_proveedor from uo_campanhas_proveedores within tab_1
integer x = 18
integer y = 112
integer width = 4462
integer height = 2592
string text = "Proveedor"
string picturename = "Custom076!"
end type

event ue_nuevo;call super::ue_nuevo;int m
m = tab_1.tp_proveedor.dw_1.insertrow(0)
tab_1.tp_proveedor.dw_1.object.codcli[m] = is_codcli
tab_1.tp_proveedor.dw_1.object.idinstancia[m] = ii_instancia
end event

