$PBExportHeader$uo_fil_cmp.sru
forward
global type uo_fil_cmp from datawindow
end type
end forward

global type uo_fil_cmp from datawindow
integer width = 1120
integer height = 952
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event type string ue_getsql ( )
event type string ue_getsql_nada ( )
end type
global uo_fil_cmp uo_fil_cmp

type variables
string is_sql
st_par ist_par
boolean ib_ini = true

end variables

forward prototypes
public subroutine uf_ini (transaction atr)
public function boolean uf_flag (string as_col)
public subroutine uf_save ()
public function string uf_getsql ()
end prototypes

event ue_getsql;this.accepttext()
return ''


//// Ejemplo de codigo que puede ir en esta evento
//ist_par.valido = true
//ist_par.parboolean1 = wf_flag('f_numserie')
//ist_par.parboolean2 = wf_flag('f_cid')
//ist_par.parboolean3 = wf_flag('f_codubired')
//ist_par.parboolean4 = wf_flag('f_equipo')
//ist_par.parboolean5 = wf_flag('f_slotxchasis_tipo')
//ist_par.parboolean9 = wf_flag('f_cliente')
//
//ist_par.parstring1 = dw.getitemstring(1,'cliente')
//ist_par.parstring2 = dw.getitemstring(1,'numserie')
//ist_par.parstring3 = dw.getitemstring(1,'equipo')
//ist_par.parstring4 = dw.getitemstring(1,'slotxchasis_tipo')
//ist_par.pardec1 = dw.getitemnumber(1,'cid')
//ist_par.pardec2 = dw.getitemnumber(1,'codubired')
//
//
//is_sql = ""
//if lst_par_out.parboolean9 then
//	ls_newsql = ls_newsql + " and vtatabcli.nomcli like '%"+lst_par_out.parstring1+"%' "
//end if
//if lst_par_out.parboolean1 then
//	ls_newsql = ls_newsql + " and slotxchasis.numserie like '%"+lst_par_out.parstring2+"%' "
//end if
//if lst_par_out.parboolean2 then
//	ls_newsql = ls_newsql + " and slotxchasis.cid = "+string(lst_par_out.pardec1)+ " "
//end if
//if lst_par_out.parboolean3 then
//	ls_newsql = ls_newsql + " and ubired.codubired = "+string(lst_par_out.pardec2)+ " "
//end if
//if lst_par_out.parboolean4 then
//	ls_newsql = ls_newsql + " and upper(chasis.abrevi) like '%"+lst_par_out.parstring3+"%' "
//end if
//if lst_par_out.parboolean5 then
//	ls_newsql = ls_newsql + " and slotxchasis.tipo = '"+lst_par_out.parstring4+"' "
//end if
//if lst_par_out.parboolean6 then
//	ls_newsql = ls_newsql + " and acceso.codprd = "+string(lst_par_out.pardec3)+ " "
//end if
//
//return ls_newsql
//
end event

event ue_getsql_nada;return ' and 1<>1 '

end event

public subroutine uf_ini (transaction atr);String ls_dw
long ll_error
int li_column_count,li_counter
string 	ls_column_name
string ls_col_type

string ls_valor
datetime ldt_valor

this.settransobject(atr)
this.insertrow(0)

ls_dw = this.dataobject
ls_dw = gsRutaReg +'\'+ls_dw

li_column_count = Integer(this.Object.DataWindow.Column.Count)

For li_counter =  li_column_count to 1 step -1
	ls_column_name = this.Describe("#"+string(li_counter)+".Name")
	ls_col_type = this.Describe(ls_column_name + ".ColType")
	if left(ls_col_type,4) = "char" then
		ls_col_type = "char"
	elseif left(ls_col_type,7) = "decimal" then
		ls_col_type = "decimal"
	end if
	ls_valor = ''
	ll_error = RegistryGet( ls_dw, ls_column_name, RegString!, ls_valor)
	
	choose case ls_col_type
		case "char"
			this.setitem(1,ls_column_name,ls_valor)
		case  "number", "decimal"
			if not isNull(ls_valor) then
				if isnumber(ls_valor) then	
					this.setitem(1,ls_column_name,dec(ls_valor))
				end if
			end if
		case  "datetime"
			if not isNull(ls_valor) then
				if isDate(ls_valor) then	
					ldt_valor = datetime(date(ls_valor),time(0,0,0))
					this.setitem(1,ls_column_name,ldt_valor)
				end if
			end if
	end choose
Next

return

end subroutine

public function boolean uf_flag (string as_col);
if isnull(this.getitemnumber(1,as_col)) then
	this.setitem(1,as_col,1)
	return false
else
	if this.getitemnumber(1,as_col) = 1  then
		return false
	else
		return true
	end if
end if

end function

public subroutine uf_save ();String ls_dw
long ll_error
int li_column_count,li_counter
string 	ls_column_name
string ls_col_type

string ls_valor
datetime ldt_valor
dec ld_valor

this.accepttext()
ls_dw = this.dataobject
ls_dw = gsRutaReg +'\'+ls_dw

li_column_count = Integer(this.Object.DataWindow.Column.Count)

For li_counter =  li_column_count to 1 step -1
	ls_column_name = this.Describe("#"+string(li_counter)+".Name")
	ls_col_type = this.Describe(ls_column_name + ".ColType")
	if left(ls_col_type,4) = "char" then
		ls_col_type = "char"
	elseif left(ls_col_type,7) = "decimal" then
		ls_col_type = "decimal"
	end if

	choose case ls_col_type
		case "char"
			ls_valor = this.getitemstring(1,ls_column_name)
			if not isNull(ls_valor) then
			else
				ls_valor = ''
			end if				
			RegistrySet( ls_dw, ls_column_name, RegString!,ls_valor)
		case  "number", "decimal"
			ld_valor = this.getitemnumber(1,ls_column_name)
			if not isNull(ld_valor) then
				ls_valor = string(ld_valor)
			else
				ls_valor = ''
			end if				
			RegistrySet( ls_dw, ls_column_name, RegString!,ls_valor)
		case  "datetime"
			ldt_valor = this.getitemdatetime(1,ls_column_name)
			if not isNull(ldt_valor) then
				ls_valor = string(ldt_valor, 'dd/mm/yyyy')
			else
				ls_valor = ''
			end if				
			RegistrySet( ls_dw, ls_column_name, RegString!,ls_valor)
	end choose
Next

return

end subroutine

public function string uf_getsql ();if ib_ini then
	ib_ini = false
	return trigger event ue_getsql_nada()
else
	return trigger event ue_getsql()
end if

end function

on uo_fil_cmp.create
end on

on uo_fil_cmp.destroy
end on

