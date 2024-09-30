HA$PBExportHeader$w_mnt_ubicaciones.srw
$PBExportComments$Ventana tipo navegador con Datawindow * para el control de los caminos
forward
global type w_mnt_ubicaciones from w_md_std_old
end type
type tv_arbol from treeview within w_mnt_ubicaciones
end type
type st_3 from u_splitbar within w_mnt_ubicaciones
end type
type st_2 from u_splitbar within w_mnt_ubicaciones
end type
type dw_detalle from uo_dw_std within w_mnt_ubicaciones
end type
type dw_cont from datawindow within w_mnt_ubicaciones
end type
type st_titulo from statictext within w_mnt_ubicaciones
end type
type st_localidades from u_splitbar within w_mnt_ubicaciones
end type
type dw_loc from uo_dw_std within w_mnt_ubicaciones
end type
end forward

global type w_mnt_ubicaciones from w_md_std_old
integer width = 3753
integer height = 2700
string title = "Ubicaciones"
string menuname = "m_mnt_ubicaciones"
event ue_populate ( )
event type integer ue_add_tv_items ( long al_parent,  integer ai_level,  integer ai_rows )
event ue_set_tv_item ( integer ai_level,  integer ai_row,  readonly treeviewitem atvi_new )
event ue_close ( )
event type integer ue_retrieve_data ( long al_handle )
tv_arbol tv_arbol
st_3 st_3
st_2 st_2
dw_detalle dw_detalle
dw_cont dw_cont
st_titulo st_titulo
st_localidades st_localidades
dw_loc dw_loc
end type
global w_mnt_ubicaciones w_mnt_ubicaciones

type variables
protected:
string is_data
string is_label
string is_raiz
integer ii_nivel
datastore ids_Data[]
integer ii_niveles = 5
string is_codpai
string is_codpvc
string is_codest
public:
// permisos
/*boolean nuevo = false
boolean guardar = true
boolean insertar = true
boolean borrar = true
boolean suprimir = true
boolean querymode = true*/
end variables

event ue_populate;Long ll_Root
TreeViewItem ltvi_Root
// Adiciona el item como raiz del Treeview
ltvi_Root.Label = "PAISES"
ltvi_Root.PictureIndex = 1
ltvi_Root.SelectedPictureIndex = 1
ltvi_Root.Children = True

// Inserta un item treeview en el TreeView
ll_Root = tv_arbol.InsertItemLast(0, ltvi_Root)
// Expande un nivel. Activa el evento itempopulate
tv_arbol.ExpandItem(ll_Root)
// Selecciona un registro del TreeView. Activa el evento selectionchanged
tv_arbol.SelectItem(ll_Root)
end event

event ue_add_tv_items;integer		li_cnt
treeviewitem	ltvi_new

// adiciona cada item al treeview
for li_cnt = 1 to ai_rows
	// llama a una funcion para setear los valores al item del treeview
	// desde los datos del datastore 
	this.event ue_set_tv_item(ai_level, li_cnt, ltvi_new)	
	// adiciona el item despues del ultimo hijo
	if ltvi_new.pictureindex <> 99 then
		if tv_arbol.insertitemlast(al_parent, ltvi_new) < 1 then
			messagebox("Error", "error al insertar item en el treeview", exclamation!)
			return -1
		end if
	end if
next
return ai_rows
end event

event ue_set_tv_item(integer ai_level, integer ai_row, readonly treeviewitem atvi_new);integer li_Picture
Choose Case ai_Level
	Case 2	//Pais
		atvi_New.Label = string(ids_Data[1].Object.nompai[ai_Row])
		atvi_New.Data  = string(ids_Data[1].Object.codpai[ai_Row])
		choose case trim(ids_Data[1].Object.codpai[ai_Row])
			case '141'	//Argentina
				atvi_New.PictureIndex = 4
				atvi_New.SelectedPictureIndex = 4
			case '142'	//Brasil
				atvi_New.PictureIndex = 5
				atvi_New.SelectedPictureIndex = 5
			case '056'	//Chile
				atvi_New.PictureIndex = 6
				atvi_New.SelectedPictureIndex = 6
			case '144'	//Colombia
				atvi_New.PictureIndex = 7
				atvi_New.SelectedPictureIndex = 7
			case '138'	//Mexico
				atvi_New.PictureIndex = 8
				atvi_New.SelectedPictureIndex = 8
			case '143'	//Peru
				atvi_New.PictureIndex = 9
				atvi_New.SelectedPictureIndex = 9
			case '136'	//USA
				atvi_New.PictureIndex = 10
				atvi_New.SelectedPictureIndex = 10
			case else
				atvi_New.PictureIndex = 1
				atvi_New.SelectedPictureIndex = 1
		end choose		
		if ids_Data[1].Object.visible[ai_Row] = 0 then
			atvi_New.PictureIndex = 99
		end if
	Case 3	//Estado
		atvi_New.Label = string(ids_Data[2].Object.nomest[ai_Row])
		atvi_New.Data  = string(ids_Data[2].Object.codpai[ai_Row]) + "-" + string(ids_Data[2].Object.codest[ai_Row]) 
		atvi_New.PictureIndex = 2
		atvi_New.SelectedPictureIndex = 2
	Case 4	//Provincia
		atvi_New.Label = string(ids_Data[3].Object.nompvc[ai_Row])
		atvi_New.Data  = string(ids_Data[3].Object.codpai[ai_Row]) + "-" + string(ids_Data[3].Object.codest[ai_Row]) + "-" + string(ids_Data[3].Object.codpvc[ai_Row])
		atvi_New.PictureIndex = 2
		atvi_New.SelectedPictureIndex = 2
	Case 5	//Distrito
		atvi_New.Label = string(ids_Data[4].Object.nomdst[ai_Row])
		atvi_New.Data  = string(ids_Data[4].Object.codpai[ai_Row]) + "-" + string(ids_Data[4].Object.codest[ai_Row]) + "-" + string(ids_Data[4].Object.codpvc[ai_Row]) + "-" + string(ids_Data[4].Object.coddst[ai_Row])
		atvi_New.PictureIndex = 2
		atvi_New.SelectedPictureIndex = 2
End Choose
// Setea el ultimo nivel
if ai_Level < ii_niveles then
	atvi_New.Children = true
else
	atvi_New.Children = false
end If
end event

event ue_close;close(this)
end event

event ue_retrieve_data;integer li_level
integer li_pos
long ll_parent
string ls_codpai
string ls_codest
treeviewitem ltvi_current
treeviewitem ltvi_parent
// determina el nivel
tv_arbol.getitem(al_handle, ltvi_current)
li_level = ltvi_current.level
if li_level = 4 then
	ll_parent = tv_arbol.finditem(CurrentTreeItem!, al_handle)
	tv_arbol.getitem(ll_parent, ltvi_parent)
end if
choose case li_level
	case 1
		ids_data[1].reset()
		return ids_data[1].retrieve()
	case 2
		ids_data[li_level].reset()
		return ids_data[2].retrieve(ltvi_current.data)
	case 3
		li_pos = pos(ltvi_current.data, "-")
		ls_codpai = left(ltvi_current.data,li_pos - 1)
		ls_codest = right(ltvi_current.data, len(string(ltvi_current.data)) - li_pos )
		ids_data[li_level].reset()		
		return ids_data[3].retrieve(ls_codpai,ls_codest)
end choose
return 0
end event

on w_mnt_ubicaciones.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_mnt_ubicaciones" then this.MenuID = create m_mnt_ubicaciones
this.tv_arbol=create tv_arbol
this.st_3=create st_3
this.st_2=create st_2
this.dw_detalle=create dw_detalle
this.dw_cont=create dw_cont
this.st_titulo=create st_titulo
this.st_localidades=create st_localidades
this.dw_loc=create dw_loc
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_arbol
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.dw_detalle
this.Control[iCurrent+5]=this.dw_cont
this.Control[iCurrent+6]=this.st_titulo
this.Control[iCurrent+7]=this.st_localidades
this.Control[iCurrent+8]=this.dw_loc
end on

on w_mnt_ubicaciones.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tv_arbol)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_detalle)
destroy(this.dw_cont)
destroy(this.st_titulo)
destroy(this.st_localidades)
destroy(this.dw_loc)
end on

event open;Integer li_cnt

dw_maestro.uf_set_hijo(dw_detalle)

ist_par = message.powerobjectparm
if isnull(ist_par) or not isvalid(ist_par) then
	close(this)
end if
dw_maestro.settransobject(sqlca)

this.postevent("ue_postopen")
SetPointer(HourGlass!)
SetMicroHelp('Recuperando...')
ii_niveles = 4	//N$$HEX1$$fa00$$ENDHEX$$mero de niveles del TreeView
is_raiz    = "Ubicaciones"
//ii_picture_select =  Numero del icono que sera usado cuando se selecciona un item del arbol
// Crea DataStores para almacenar los datos del explorer
ids_Data[1] = Create DataStore
ids_Data[1].DataObject = 'd_lis_pai'
ids_Data[2] = Create DataStore
ids_Data[2].DataObject = 'd_lis_estxpai'
ids_Data[3] = Create DataStore
ids_Data[3].DataObject = 'd_lis_pvcxest'
ids_Data[4] = Create DataStore
ids_Data[4].DataObject = 'd_lis_dstxpvc'

for li_Cnt = 1 To 4
	ids_Data[li_Cnt].SetTransObject(sqlca)
next

ids_Data[1].retrieve()
post event ue_populate()
end event

event resize;//1.2 Portabilidad Cruzada 17/03/2016 CGK

long ll_ancho
long ll_altura
//setredraw(false)
//uo_panel.setredraw(false)

//uo_cont.setredraw(false)
 
//Ancho de cont
ll_ancho = width - 60 - tv_arbol.width
dw_cont.width = ll_ancho
 
//Altura de objetos
ll_altura = height - 315
tv_arbol.height = ll_altura
dw_cont.height = ll_altura
st_2.height = tv_arbol.height

//SGA Web. MAH 04/01/2005
dw_maestro.x= dw_cont.x
dw_maestro.width = dw_cont.width
st_titulo.x = dw_cont.x
st_titulo.width = dw_cont.width

dw_detalle.x= dw_cont.x
dw_detalle.width = dw_cont.width
st_3.x= dw_cont.x 
st_3.width = dw_cont.width
dw_detalle.height = dw_cont.height - dw_maestro.height - st_3.height

//1.2
if dw_loc.visible = true then 
	dw_detalle.width = dw_maestro.width/2
	st_3.width = dw_detalle.width
end if
//dw_loc.width = this.width - tv_arbol.width - st_2.width - dw_detalle.width
dw_loc.width = ll_ancho - dw_detalle.width
dw_loc.x = dw_detalle.x + dw_detalle.width
st_localidades.width = dw_loc.width
dw_loc.height = dw_cont.height - dw_maestro.height - st_localidades.height
st_localidades.x = dw_loc.x

dw_cont.setredraw(true)
setredraw(true)
end event

event ue_postopen;m_mnt_std lmenu1
lmenu1 = this.menuid
lmenu1.uf_set_dw(dw_maestro)
this.post event ue_cargar()
this.post event ue_permisos()
this.post event ue_permisos_menu()
end event

event ue_menu_grabar;call super::ue_menu_grabar;//dw_maestro.postevent("ue_retrieve")
dw_maestro.trigger event ue_refrescar(true)
end event

type dw_maestro from w_md_std_old`dw_maestro within w_mnt_ubicaciones
integer x = 1102
integer y = 116
integer width = 1664
integer height = 960
end type

event dw_maestro::ue_retrieve;If DataObject = 'd_lis_dstxpvc' Then
//	dw_maestro.settransobject(sqlca)
	return retrieve(is_codpai,is_codest,is_codpvc)	
End If

return 0

end event

event dw_maestro::rowfocuschanged;call super::rowfocuschanged;//1.2 Portabilidad Cruzada 17/03/2016 CGK

dw_detalle.reset()
if currentrow = 0 then return
dw_detalle.settransobject(sqlca)
dw_loc.settransobject(sqlca)
choose case dataobject
	case 'd_lis_pai'	//Pais
		dw_detalle.retrieve(object.codpai[currentrow])
		dw_loc.visible = false //1.2
		st_localidades.visible = false //1.2
		dw_detalle.width = dw_cont.width //1.2
	case 'd_lis_estxpai'	//Estado
		dw_detalle.retrieve(object.codpai[currentrow],object.codest[currentrow])
		dw_loc.visible = false //1.2
		st_localidades.visible = false //1.2
		dw_detalle.width = dw_cont.width //1.2
	case 'd_lis_pvcxest'	//Provincia
		dw_detalle.retrieve(object.codpai[currentrow],object.codest[currentrow],object.codpvc[currentrow])
		dw_loc.visible = false //1.2
		st_localidades.visible = false //1.2
		dw_detalle.width = dw_cont.width //1.2
	case 'd_lis_dstxpvc'	//Distrito
		dw_detalle.retrieve(object.codpai[currentrow],object.codest[currentrow],object.codpvc[currentrow],object.codubi[currentrow])
		//1.2
			dw_loc.visible = true
			st_localidades.visible = true
			dw_loc.event ue_resize_localidad( )
//			dw_detalle.width = dw_maestro.width/2
//			st_3.width = dw_detalle.width
//			dw_loc.width = parent.width - tv_arbol.width - st_2.width - dw_detalle.width
//			dw_loc.x = dw_detalle.x + dw_detalle.width
//			st_localidades.width = dw_loc.width
//			dw_loc.height = dw_cont.height - dw_maestro.height - st_localidades.height
//			st_localidades.x = dw_loc.x
			dw_loc.retrieve(this.getitemstring( currentrow, 'codubi'))
	end choose
end event

event dw_maestro::ue_valores_iniciales;call super::ue_valores_iniciales;choose case dataobject
	case 'd_lis_estxpai'
		object.codpai[al_row] = is_codpai
	case 'd_lis_pvcxest'
		object.codpai[al_row] = is_codpai
		object.codest[al_row] = is_codest
	case 'd_lis_dstxpvc'
		object.codpai[al_row] = is_codpai
		object.codest[al_row] = is_codest
		object.codpvc[al_row] = is_codpvc
end choose
end event

event dw_maestro::ue_update_post;call super::ue_update_post;if not this.dataobject = 'd_lis_dstxpvc' then
	tv_arbol.setredraw(false)
	tv_arbol.deleteItem(1)
	parent.triggerevent('ue_populate')
	tv_arbol.setredraw(true)
//else
//	tv_arbol.triggerevent('selectionchanged')
end if
return true
end event

type td from w_md_std_old`td within w_mnt_ubicaciones
event ue_resize pbm_size
boolean visible = false
integer x = -32768
integer y = 132
integer width = 1394
integer height = 1412
end type

type tp1 from w_md_std_old`tp1 within td
event ue_resize pbm_size
integer width = 1358
integer height = 1292
string text = "PRI"
end type

event tp1::ue_resize;td.tp1.dw1.Height = newHeight
td.tp1.dw1.width = newwidth
end event

type dw1 from w_md_std_old`dw1 within tp1
integer x = 5
integer y = 24
integer width = 1353
integer height = 1248
string dataobject = "d_lis_pritelxhuntingxcodcab"
boolean insertar = false
boolean borrar = false
end type

type tv_arbol from treeview within w_mnt_ubicaciones
event rclicked pbm_tvnrclicked
integer x = 9
integer y = 16
integer width = 1065
integer height = 2460
integer taborder = 50
boolean dragauto = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean disabledragdrop = false
string picturename[] = {"I:\iconos\att.ico","Custom039!","Custom050!","I:\iconos\Argentina.gif","I:\iconos\Brasil.gif","I:\iconos\Chile.gif","I:\iconos\Colombia.gif","I:\iconos\Mexico.gif","I:\iconos\Peru.gif","I:\iconos\USA.gif"}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event itempopulate;integer li_Rows
integer li_Level
treeviewitem ltvi_Current

SetPointer(HourGlass!)
// Recupera informacion de estado del TreeView tv_1 en ltvi_current
// Captura el nivel del item actual del TreeView
GetItem(handle, ltvi_Current)
li_Level = ltvi_Current.Level
// Recupera los datos
li_Rows = Parent.event ue_retrieve_data(handle)
// Adiciona los items al TreeView
Parent.event ue_add_tv_items(handle, li_Level + 1, li_Rows)
end event

event rightclicked;tv_arbol.SelectItem(handle)
menuid.item[2].popMenu(parent.pointerx(),parent.pointery())

end event

event selectionchanged;Integer	li_detalle
Integer	li_Rows
integer	li_Level
integer li_pos
string ls_tipnumtel
TreeViewItem	ltvi_Current
listviewitem	llvi_new
SetPointer(HourGlass!)
// Obtiene el nivel actual del item de treeview
GetItem(newhandle, ltvi_Current)
li_Level = ltvi_Current.Level
li_Rows = Parent.event ue_retrieve_data(newhandle)
menuid.item[2].item[1].visible = false
dw_maestro.reset()
dw_detalle.reset()
choose case li_level
	case 1
		dw_detalle.dataobject = 'd_lis_estxpai'
		dw_maestro.dataobject = 'd_lis_pai'
		dw_maestro.settransobject(sqlca)
		dw_maestro.retrieve()
		st_titulo.text = "Listado de Paises"
		st_3.text = "Listado de Estados"
//		menuid.item[2].item[7].enabled = true
	case 2
		dw_detalle.dataobject = 'd_lis_pvcxest'
		dw_maestro.dataobject = 'd_lis_estxpai'
		dw_maestro.settransobject(sqlca)
		is_codpai = ltvi_current.data
		dw_maestro.retrieve(is_codpai)
		st_titulo.text = "Listado de Estados"
		st_3.text = "Listado de Provincias"
//		menuid.item[2].item[7].enabled = false
	case 3
		li_pos = pos(ltvi_current.data, "-")
		is_codpai = left(ltvi_current.data,li_pos - 1)
		is_codest = right(ltvi_current.data, len(string(ltvi_current.data)) - li_pos )
		dw_detalle.dataobject = 'd_lis_dstxpvc'
		dw_maestro.dataobject = 'd_lis_pvcxest'
		dw_maestro.settransobject(sqlca)
		dw_maestro.retrieve(is_codpai,is_codest)
		st_titulo.text = "Listado de Provincias"
		st_3.text = "Listado de Distritos"
//		menuid.item[2].item[7].enabled = false
	case 4
		li_pos = pos(ltvi_current.data, "-")
		is_codpai = left(ltvi_current.data,li_pos - 1)
		is_codest = mid(ltvi_current.data, li_pos + 1, 3)
		li_pos = pos(ltvi_current.data, "-",li_pos + 1)
		is_codpvc = right(ltvi_current.data, len(string(ltvi_current.data)) - li_pos )
		dw_detalle.dataobject = 'd_mnt_distrito'
		dw_maestro.dataobject = 'd_lis_dstxpvc'
		dw_maestro.settransobject(sqlca)
		dw_maestro.retrieve(is_codpai,is_codest,is_codpvc)
		st_titulo.text = "Listado de Distritos"
		st_3.text = "Detalle de Distrito"
//		menuid.item[2].item[7].enabled = false

	case else
//		dw_maestro.reset()
end choose
end event

type st_3 from u_splitbar within w_mnt_ubicaciones
integer x = 1102
integer y = 1076
integer width = 1664
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
long textcolor = 1090519039
long backcolor = 8421504
string text = "Listado de Estados"
end type

event constructor;call super::constructor;this.of_register(dw_maestro,above)
this.of_register(dw_detalle,below)
this.of_setminobjectsize(150)
this.of_setbarcolor(st_titulo.backcolor)
//this.of_setbarcolor(78682240)
end event

type st_2 from u_splitbar within w_mnt_ubicaciones
integer x = 1079
integer y = 16
integer width = 23
integer height = 2460
boolean bringtotop = true
long backcolor = 8421504
end type

event constructor;call super::constructor;this.of_register(tv_arbol,left)
this.of_register(dw_cont,right)
this.of_setminobjectsize(250)
end event

type dw_detalle from uo_dw_std within w_mnt_ubicaciones
integer x = 1102
integer y = 1136
integer width = 1664
integer height = 1340
integer taborder = 30
boolean insertar = false
boolean borrar = false
boolean seleccionar = false
end type

event rowfocuschanged;call super::rowfocuschanged;DataWindowChild ldwc_1

If DataObject = 'd_mnt_distrito' Then
	dw_detalle.GetChild('codest',ldwc_1)
	ldwc_1.SetTransObject(SQLCA)
	ldwc_1.Retrieve(is_codpai)
	
	dw_detalle.GetChild('codpvc',ldwc_1)
	ldwc_1.SetTransObject(SQLCA)
	ldwc_1.Retrieve(is_codpai,is_codest)
End If
end event

event itemchanged;call super::itemchanged;DataWindowChild ldwc_1
String ls_null

If DataObject = 'd_mnt_distrito' Then
	SetNull(ls_null)
	Choose case dwo.name
		case 'codest'
			dw_detalle.GetChild('codpvc',ldwc_1)
			dw_detalle.SetItem(row,'codpvc',ls_null)
			ldwc_1.SetTransObject(SQLCA)
			ldwc_1.Retrieve(is_codpai,String(data))
	End choose

End If
end event

event ue_update_pre_row;call super::ue_update_pre_row;String ls_codpvc

If DataObject = 'd_mnt_distrito' Then
	ls_codpvc = this.GetItemString(row,'codpvc')
	If Isnull(ls_codpvc) or ls_codpvc = '' Then
		Messagebox('Aviso','Debe seleccionar una provincia antes de grabar',Exclamation!)
		this.SetFocus()
		Return False
	End If
End If
Return True
end event

type dw_cont from datawindow within w_mnt_ubicaciones
event size pbm_size
boolean visible = false
integer x = 1102
integer y = 16
integer width = 1664
integer height = 2460
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event size;setredraw(false)

//SGA Web. MAH 04/01/2005. Codigo ahora sera invocado en evento resize de la ventana
/*dw_maestro.x= x
dw_maestro.width = width
st_titulo.x = x
st_titulo.width = width

dw_detalle.x= x
dw_detalle.width = width
st_3.x= x 
st_3.width = width
dw_detalle.height = dw_cont.height - dw_maestro.height - st_3.height*/

setredraw(true)
end event

type st_titulo from statictext within w_mnt_ubicaciones
integer x = 1102
integer y = 16
integer width = 1664
integer height = 100
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 1090519039
long backcolor = 8421504
string text = "Listado de Paises"
boolean focusrectangle = false
end type

type st_localidades from u_splitbar within w_mnt_ubicaciones
boolean visible = false
integer x = 2770
integer y = 1076
integer width = 1664
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
long backcolor = 8421504
string text = "Listado Localidades"
end type

type dw_loc from uo_dw_std within w_mnt_ubicaciones
event type any ue_retrieve_localidad ( )
event ue_resize_localidad ( )
boolean visible = false
integer x = 2770
integer y = 1136
integer width = 1664
integer height = 1340
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_lis_localidades"
end type

event ue_resize_localidad();dw_detalle.width = dw_maestro.width/2
st_3.width = dw_detalle.width
//dw_loc.width = parent.width - tv_arbol.width - st_2.width - dw_detalle.width
dw_loc.width = dw_cont.width - dw_detalle.width
dw_loc.x = dw_detalle.x + dw_detalle.width
st_localidades.width = dw_loc.width
dw_loc.height = dw_cont.height - dw_maestro.height - st_localidades.height
st_localidades.x = dw_loc.x
end event

