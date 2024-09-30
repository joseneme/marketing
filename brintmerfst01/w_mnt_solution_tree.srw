HA$PBExportHeader$w_mnt_solution_tree.srw
$PBExportComments$Ventana tipo navegador con Datawindow * para el control de los caminos
forward
global type w_mnt_solution_tree from w_md_std
end type
type tv_arbol from treeview within w_mnt_solution_tree
end type
type uo_splitbar1 from u_splitbar within w_mnt_solution_tree
end type
end forward

global type w_mnt_solution_tree from w_md_std
integer width = 3593
integer height = 2712
string title = "Anormalidades"
string menuname = "m_mnt_anormalidades"
event ue_populate ( )
event type integer ue_add_tv_items ( long al_parent,  integer ai_level,  integer ai_rows )
event ue_set_tv_item ( integer ai_level,  integer ai_row,  readonly treeviewitem atvi_new )
event ue_close ( )
event type integer ue_retrieve_data ( long al_handle )
event ue_menu_activar ( )
event ue_menu_desactivar ( )
tv_arbol tv_arbol
uo_splitbar1 uo_splitbar1
end type
global w_mnt_solution_tree w_mnt_solution_tree

type variables
protected:
string is_data
string is_label
string is_raiz
string is_codcli
string is_nomcli
integer ii_nivel
datastore ids_Data[]
integer ii_niveles = 8
string is_titulo[8]
public:
// permisos
/*boolean nuevo = false
boolean guardar = true
boolean insertar = true
boolean borrar = true
boolean suprimir = true
boolean querymode = true*/
end variables

forward prototypes
public function string f_descripcion_nivel (integer an_level)
public function integer f_obtiene_level_solution ()
end prototypes

event ue_populate();Long ll_Root
TreeViewItem ltvi_Root
// Adiciona el item como raiz del Treeview
is_raiz =f_descripcion_nivel(1)// "Problemas"
ltvi_Root.Label = is_raiz
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
	if tv_arbol.insertitemlast(al_parent, ltvi_new) < 1 then
		messagebox("Error", "error al insertar item en el treeview", exclamation!)
		return -1
	end if
next
return ai_rows
end event

event ue_set_tv_item(integer ai_level, integer ai_row, readonly treeviewitem atvi_new);integer li_hijos
integer li_tipo,li_levelsolution
atvi_New.PictureIndex = 2
atvi_New.SelectedPictureIndex = 3
atvi_New.Children = true
li_hijos = integer(ids_Data[1].Object.hijos[ai_Row])


li_levelsolution=f_obtiene_level_solution();
//
//Choose Case ai_Level
//	Case 2,3,4,5,6,7,8
if ai_level>1 or ai_level<=li_levelsolution then
		atvi_New.Data  = string(ids_Data[1].Object.id_solution[ai_Row])
		/**/
		if integer(ids_Data[1].Object.active[ai_Row])=0 then
			atvi_New.PictureIndex = 2
		else	
			atvi_New.PictureIndex = 4
		end if	
		/**/
		//if ai_level <> 8 then
		if ai_level <>li_levelsolution then
			if li_hijos = 0 then 
				atvi_New.Label = string(ids_Data[1].Object.code[ai_Row]) + '  ' + string(ids_Data[1].Object.description[ai_Row])
				atvi_New.bold = true
				atvi_New.children = false
			else
				atvi_New.Label = string(ids_Data[1].Object.code[ai_Row]) + '  ' + string(ids_Data[1].Object.description[ai_Row]) + '  (' + string(ids_Data[1].Object.hijos[ai_Row]) + ')'
					atvi_New.bold = false
					atvi_New.children = true
			end if
		else
			atvi_New.Label = string(ids_Data[1].Object.code[ai_Row]) + '  ' + string(ids_Data[1].Object.description[ai_Row])
			atvi_New.bold = false
			atvi_New.children = false
		end if
end if
//End Choose
end event

event ue_close;close(this)
end event

event type integer ue_retrieve_data(long al_handle);integer li_level,li_levelsolution
long ll_return
long ll_idpath
integer li_pos
long ll_parent
dec ld_codcab
dec ld_codgrupo
string ls_retrieve
treeviewitem ltvi_current
tv_arbol.getitem(al_handle, ltvi_current)
li_level = ltvi_current.level


li_levelsolution=f_obtiene_level_solution();
if li_level=1 then 
	setnull(ll_return)
	return ids_data[1].retrieve(ll_return)
else
	if li_level>1 and li_level<=li_levelsolution then
		return ids_data[1].retrieve(long(ltvi_current.data))
	end if 
end if 	
	
//choose case li_level
//	case 1
//		setnull(ll_return)
//		return ids_data[1].retrieve(ll_return)
//	case 2,3,4,5,6,7,8
//		return ids_data[1].retrieve(long(ltvi_current.data))
//end choose
end event

event ue_menu_activar();treeviewitem	ltvi_current, ltvi_parent
string ls_path, ls_aux, ls_retrieve
long ll_tv_newitem,  ll_aux, ll_fila
long ll_tvi, ll_id,ll_count


ll_tvi = tv_arbol.FindItem(CurrentTreeItem!, 0)
if tv_arbol.getitem(ll_tvi,ltvi_current)=-1 then
	return 
end if
ll_id = long(ltvi_current.data)

ll_count=0

if ltvi_current.level>2 then

 select count(*) into :ll_count
 from solution_tree
 where id_solution in 
   (select idpath 
    from solution_tree 
    where id_solution=:ll_id)
 and active=1;
end if

if ll_count > 0  then
	messagebox("Anormalidades","No se puede activar porque el nodo padre no est$$HEX2$$e1002000$$ENDHEX$$activo.")
	return 
end if
select count(*) into :ll_count
from abnormality_tree  
where status=1
and id= :ll_id	;

if ll_count>0 then
  update solution_tree  
  set active = 0  //activo
  where id_solution= :ll_id;
  commit;
  messagebox("Anormalidades","Se activ$$HEX2$$f3002000$$ENDHEX$$el nodo.")
end if

ll_tvi=tv_arbol.FindItem(RootTreeItem!, 0)
tv_arbol.DeleteItem(ll_tvi)
this.event ue_populate()


end event

event ue_menu_desactivar();treeviewitem	ltvi_current, ltvi_parent
string ls_path, ls_aux, ls_retrieve
long ll_tv_newitem,  ll_aux, ll_fila
long ll_tvi, ll_id,ll_count


ll_tvi = tv_arbol.FindItem(CurrentTreeItem!, 0)
if tv_arbol.getitem(ll_tvi,ltvi_current)=-1 then
	return 
end if
ll_id = long(ltvi_current.data)

select count(*) into :ll_count
from solution_tree
where idpath= :ll_id
and active=0 ;

if ll_count > 0  then
	messagebox("Anormalidades","No se puede borrar porque el nodo seleccionado tiene hijos activos.")
	return 
end if
select count(*) into :ll_count
from solution_tree  
where active=0
and id_solution= :ll_id	;

if ll_count>0 then
  update solution_tree  
  set active = 1  //desactivo
  where id_solution= :ll_id;
  commit;
  messagebox("Anormalidades","Se desactiv$$HEX2$$f3002000$$ENDHEX$$el nodo.")
end if

ll_tvi=tv_arbol.FindItem(RootTreeItem!, 0)
tv_arbol.DeleteItem(ll_tvi)
this.event ue_populate()


end event

public function string f_descripcion_nivel (integer an_level);string ls_description
select description
into :ls_description
from level_tree
where id_tipo=2
and id_level= :an_level;
return ls_description
end function

public function integer f_obtiene_level_solution ();integer li_level
select value
into :li_level
from atcparameter
where  codparameter = 'LEVEL_SOLUTION';

return li_level
end function

on w_mnt_solution_tree.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_mnt_anormalidades" then this.MenuID = create m_mnt_anormalidades
this.tv_arbol=create tv_arbol
this.uo_splitbar1=create uo_splitbar1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_arbol
this.Control[iCurrent+2]=this.uo_splitbar1
end on

on w_mnt_solution_tree.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tv_arbol)
destroy(this.uo_splitbar1)
end on

event open;Integer li_cnt,li_levelsolution
ist_par = message.powerobjectparm
if isnull(ist_par) or not isvalid(ist_par) then
	close(this)
end if

dw_maestro.settransobject(sqlca)
//td.tp2.dw2.settransobject(sqlca)
td.tp1.dw1.settransobject(sqlca)
ii_tipo = ist_par.tipo

li_levelsolution=f_obtiene_level_solution();

SetPointer(HourGlass!)
SetMicroHelp('Recuperando...')
ii_niveles = li_levelsolution//N$$HEX1$$fa00$$ENDHEX$$mero de niveles del TreeView
//is_raiz    = Cadena conteniendo el nombre de la raiz del 1
//ii_picture_select =  Numero del icono que sera usado cuando se selecciona un item del arbol
// Crea DataStores para almacenar los datos del explorer
ids_Data[1] = Create DataStore
ids_Data[1].DataObject = 'd_mnt_solution_tree'

for li_Cnt = 1 To 1
	ids_Data[li_Cnt].SetTransObject(sqlca)
next

for li_cnt =1 to li_levelsolution
	is_titulo[li_cnt]=f_descripcion_nivel(li_cnt)
next 	


//is_titulo[1] = "Anormalidades"
//is_titulo[2] = "Area"
//is_titulo[3] = "Responsable"
//is_titulo[4] = "Causa"
//is_titulo[5] = "Equipo"
//is_titulo[6] = "Subcausa"
//is_titulo[7] = "Detalle"
//is_titulo[8] = "Detalle2"

this.postevent("ue_postopen")
/*DAJ. Correcci$$HEX1$$f300$$ENDHEX$$n Web*/
post event ue_populate()





end event

event resize;Long ll_ancho
setredraw(false)

ll_ancho = width - tv_arbol.width - uo_splitbar1.width - 100
td.width = ll_ancho

dw_maestro.height = height - 390
tv_arbol.height = height - 390
td.height = dw_maestro.height
uo_splitbar1.height = dw_maestro.height

td.tp1.dw1.trigger event ue_resize(newwidth,NewHeight)
//td.tp2.dw2.trigger event ue_resize(newwidth,NewHeight)
setredraw(true)
end event

event ue_postopen;m_mnt_std lmenu1
lmenu1 = this.menuid
lmenu1.uf_set_dw(dw_maestro)
//td.tp2.dw2.trigger event ue_retrieve()
this.post event ue_cargar()
this.post event ue_permisos()
this.post event ue_permisos_menu()

end event

event ue_menu_nuevo;st_par lst_par
long ll_tvi
long ll_tviaux, ll_tviparent//ROVB
integer li_id
integer li_levelparent//ROVB
integer li_tipo
integer li_hijos, li_levelsolution
String ls_code
String ls_description
String ls_label
String ls_levelfather//ROVB
treeviewitem ltvi_current
treeviewitem ltvi_insert
treeviewitem ltvi_parent//ROVB

window w_ventana
li_levelsolution=f_obtiene_level_solution()
/*Para el item seleccionado*/
ll_tvi = tv_arbol.FindItem(CurrentTreeItem!, 0)
tv_arbol.getitem(ll_tvi,ltvi_current)
li_id = long(ltvi_current.data)
/*Modificado por ROVB 09/05/2004 El levelfather contiene '00' si el nodo es hijo de uno la raiz(nivel 1) en caso contrario 
es el code del nivel 2 del arbol*/
if ltvi_current.level>2 then
	li_levelparent=0
	ll_tviaux=ll_tvi
	/*Busca el nodo del nivel 2 relacionado al nodo seleccionado*/
	DO UNTIL li_levelparent=2
		ll_tviparent= tv_arbol.FindItem(ParentTreeItem!,ll_tviaux)
		tv_arbol.getitem(ll_tviparent,ltvi_parent)
		li_levelparent= ltvi_parent.level
		ll_tviaux=ll_tviparent
		ls_levelfather=mid(ltvi_parent.label,1,2)
	LOOP
else
	if ltvi_current.level=1 then
		ls_levelfather='00'
	else
		ls_levelfather=mid(ltvi_current.label,1,2)
	end if	
end if	
/******/
ls_label = ltvi_current.label

if ltvi_current.children then
	if not ltvi_current.expanded then
		if ltvi_current.level<>1 then
			return
		end if	
	end if
end if
if ltvi_current.level = li_levelsolution then
	messagebox('Advertencia','No se puede insertar un nivel mas')
	return
end if
lst_par.tipo = 2		//Nuevo
lst_par.parstring1 = string(ltvi_current.data)
lst_par.parstring2 = mid(ltvi_current.label,1,2)
lst_par.pardec1 = ltvi_current.level
lst_par.titulo = is_titulo[ltvi_current.level + 1]
/*LevelFather Modificado por ROVB 09/05/2004*/
lst_par.parstring3 = ls_levelfather
/**/

openwithparm(w_mnt_solution,lst_par)//webresponse

lst_par = message.powerobjectparm
if not isvalid(lst_par) then return
if not lst_par.valido then return
tv_arbol.setredraw(false)
ltvi_current.bold = false
ltvi_current.Expanded	= true
select count(*) into :li_hijos from solution_tree where idpath = :li_id;
select code, description into :ls_code, :ls_description from solution_tree where id_solution = :li_id;
ltvi_current.Label = ls_code + '  ' + ls_description + '  (' + string(li_hijos) + ')'
ltvi_current.Label = ls_label

tv_arbol.setitem(ll_tvi,ltvi_current)
//ltvi_current.label = ltvi_parent.label + "1"
//tv_arbol.deleteItem(1)
//tv_arbol.trigger event itempopulate(1)
//long ll_tvparent
//ll_tvparent = tv_arbol.FindItem(parenttreeitem!,ll_tvi)
//tv_arbol.getitem(ll_tvparent,ltvi_parent)
ltvi_insert.label = lst_par.parstring3 + " " + lst_par.parstring4
ltvi_insert.data= lst_par.parlong1
ltvi_insert.children = false



if ltvi_current.level = (li_levelsolution - 1) then
	ltvi_insert.bold = false
else
	ltvi_insert.bold = true
end if
ltvi_insert.PictureIndex = 2
ltvi_insert.SelectedPictureIndex = 3
tv_arbol.InsertItemlast(ll_tvi, ltvi_insert)
//triggerevent('ue_populate')
//td.tp2.dw2.trigger event ue_retrieve()
tv_arbol.setredraw(true)
end event

event ue_menu_borrar;integer li_op
integer li_nivel
string ls_path
string ls_code
string ls_description
long ll_tvicurrent
long ll_tviparent
integer li_id
integer li_idparent
integer li_hijos
treeviewitem ltvi_current
treeviewitem ltvi_parent
SetPointer(HourGlass!)
ll_tvicurrent = tv_arbol.FindItem(CurrentTreeItem!, 0)
tv_arbol.getitem(ll_tvicurrent,ltvi_current)
if ltvi_current.level = 1 then
	messagebox("Advertencia","No puede eliminar este item")
	return
end if

li_nivel = ltvi_current.level  - 1
li_id = long(ltvi_current.data)

if ltvi_current.bold then//Negrita
else//No negrita
	if ltvi_current.level = 8 then
		//No negrita y ultimo nivel
	else
		//No negrita nivel diferente de 8
		messagebox("Advertencia","No puede eliminar por que tiene ~nreferencia a otros registros")
		return
	end if
end if
li_op = MessageBox("Advertencia", "Esta seguro de Eliminar?",Exclamation!, yesno!, 2)
if li_op = 2 then return

delete from solution_tree where id_solution = :li_id;
commit;
if sqlca.sqlcode = -1 then return
ll_tviparent = tv_arbol.FindItem(parenttreeitem!,ll_tvicurrent)
tv_arbol.getItem(ll_tviparent, ltvi_parent)
tv_arbol.deleteItem(ll_tvicurrent)

li_idparent = long(ltvi_parent.data)
select count(*) into :li_hijos from solution_tree where idpath = :li_idparent;
select code, description into :ls_code, :ls_description from solution_tree where id_solution = :li_idparent;
if li_hijos = 0 then
	ltvi_parent.Label = ls_code + '  ' + ls_description
	ltvi_parent.bold = true
else
	ltvi_parent.Label = ls_code + '  ' + ls_description + '  (' + string(li_hijos) + ')'
	ltvi_parent.bold = false
end if
tv_arbol.setitem(ll_tviparent,ltvi_parent)
//td.tp2.dw2.trigger event ue_retrieve()
SetPointer(arrow!)
end event

type dw_maestro from w_md_std`dw_maestro within w_mnt_solution_tree
boolean visible = false
integer y = 4
integer width = 1088
integer height = 1272
end type

event dw_maestro::ue_retrieve;return 0
end event

type td from w_md_std`td within w_mnt_solution_tree
event ue_resize pbm_size
integer x = 1705
integer y = 0
integer width = 1559
integer height = 1412
end type

event td::selectionchanged;call super::selectionchanged;CHOOSE CASE newindex
	CASE 2
//		td.tp2.dw2.trigger event ue_retrieve()
END CHOOSE		

end event

type tp1 from w_md_std`tp1 within td
event ue_resize pbm_size
integer width = 1522
integer height = 1292
string text = "Etiquetas"
end type

event tp1::ue_resize;td.tp1.dw1.Height = newHeight
td.tp1.dw1.width = newwidth
end event

type dw1 from w_md_std`dw1 within tp1
integer y = 12
integer width = 1349
integer height = 1248
string dataobject = "d_mnt_solution_tree"
boolean guardar = false
boolean insertar = false
boolean borrar = false
end type

event dw1::ue_retrieve;call super::ue_retrieve;long ll_tvi
integer li_detalle
treeviewitem ltvi_current

ll_tvi = tv_arbol.FindItem(CurrentTreeItem!, 0)
tv_arbol.getitem(ll_tvi,ltvi_current)
 if ltvi_current.level = 1 then
	setnull(li_detalle)
	return retrieve(li_detalle)	
else
	return retrieve(long(ltvi_current.data))
end if
end event

event dw1::doubleclicked;call super::doubleclicked;window w_ventana
st_par lst_par
if row = 0 then return

lst_par.tipo = 1	//Actualizar
lst_par.titulo = is_titulo[ii_nivel + 1]
lst_par.parlong1 = object.id_solution[row]
openwithparm(w_mnt_solution, lst_par)//webresponse

lst_par = message.powerobjectparm
if not isvalid(lst_par) then return
if not lst_par.valido then return
td.tp1.dw1.triggerevent('ue_retrieve')
end event

type tv_arbol from treeview within w_mnt_solution_tree
event rclicked pbm_tvnrclicked
integer width = 1691
integer height = 1412
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
boolean fullrowselect = true
string picturename[] = {"Database!","RegistrationDir5!","RegistrationDir!","FullBuild!","Custom050!","CheckOut5!","CheckIn5!"}
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

//if ltvi_Current.bold or not ltvi_Current.expanded then return
if ltvi_Current.bold then return
li_Level = ltvi_Current.Level
// Recupera los datos
li_Rows = Parent.event ue_retrieve_data(handle)
// Adiciona los items al TreeView
Parent.event ue_add_tv_items(handle, li_Level + 1, li_Rows)

end event

event rightclicked;If handle > 0  Then //Selecciono un Item
	tv_arbol.SelectItem(handle)
	menuid.item[2].popMenu(parent.pointerx(),parent.pointery())
End If
end event

event selectionchanged;Integer	li_detalle,li_levelsolution
Integer li_Rows
integer li_id
string ls_tipnumtel
string ls_retrieve
string ls_clipboard
TreeViewItem ltvi_Current
listviewitem	llvi_new
SetPointer(HourGlass!)
// Obtiene el nivel actual del item de treeview
GetItem(newhandle, ltvi_Current)
ii_nivel = ltvi_Current.Level
li_Rows = Parent.event ue_retrieve_data(newhandle)
menuid.item[2].item[1].visible = false
menuid.item[2].item[2].visible = false
menuid.item[2].item[3].visible = false

li_levelsolution=f_obtiene_level_solution();

if ltvi_current.level > 1 then
	li_id = integer(ltvi_current.data)
	select f_obt_cadena_solution(id_solution) into :ls_clipboard from solution_tree where id_solution = :li_id;
	clipboard(ls_clipboard)
end if

//choose case ii_nivel
//	case 1
if ii_nivel=1 then 
		setnull(li_detalle)
		td.tp1.dw1.dataobject = 'd_mnt_solution_tree'
		td.tp1.dw1.settransobject(sqlca)
		td.tp1.dw1.retrieve(li_detalle)
else 
	if ii_nivel>1 and ii_nivel<li_levelsolution then
		//case 2,3,4,5,6,7
		td.tp1.dw1.dataobject = 'd_mnt_solution_tree'
		td.tp1.dw1.settransobject(sqlca)
		td.tp1.dw1.retrieve(long(ltvi_current.data))
	else 	
	//case else
	  if ii_nivel=li_levelsolution then
				td.tp1.dw1.reset()
     end if			
	end if  
end if  
//end choose

parent.title = is_titulo[ii_nivel]
end event

type uo_splitbar1 from u_splitbar within w_mnt_solution_tree
integer x = 1687
integer width = 18
integer height = 1412
boolean bringtotop = true
fontcharset fontcharset = ansi!
long backcolor = 79741120
end type

event constructor;call super::constructor;this.of_register(tv_arbol,left)
this.of_register(td,right)
this.of_setminobjectsize(250)
end event

event lbuttonup;call super::lbuttonup;BringToTop =false
end event

