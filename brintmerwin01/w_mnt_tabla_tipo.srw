HA$PBExportHeader$w_mnt_tabla_tipo.srw
forward
global type w_mnt_tabla_tipo from w_mnt_std
end type
end forward

global type w_mnt_tabla_tipo from w_mnt_std
event ue_redimensiona_width ( )
end type
global w_mnt_tabla_tipo w_mnt_tabla_tipo

type variables

end variables

event ue_redimensiona_width();long ll_indice, ll_ncol, ll_ancho
string ll_colname

if not isnull(ist_par.tipoabrirventana) then
	if(ist_par.tipoabrirventana=1)then
		//This.WindowState = Maximized!
		ll_ncol    = integer(dw_maestro.Object.DataWindow.Column.Count)
		ll_ancho = 0
		for ll_indice=1 TO ll_ncol 
				ll_colname = dw_maestro.Describe("#" + String( ll_indice ) + ".Name")

				if Long( dw_maestro.Describe( ll_colname + ".Visible") ) > 0 THEN
					ll_Ancho = ll_Ancho + Long(dw_maestro.Describe(ll_colname+'.width'))
				end if
				
		next
		
		if ll_Ancho>0 then
				this.width= ll_Ancho* ist_par.pardouble1
				this.center = true
		end if
		
	end if
end if
end event

on w_mnt_tabla_tipo.create
call super::create
end on

on w_mnt_tabla_tipo.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event ue_menu_grabar;call super::ue_menu_grabar;dw_maestro.postevent("ue_retrieve")
end event

event open;call super::open;trigger event ue_redimensiona_width()
end event

type dw_maestro from w_mnt_std`dw_maestro within w_mnt_tabla_tipo
end type

event dw_maestro::ue_update_pre_row;if row>0 then
	CHOOSE CASE dw_maestro.dataobject
		CASE "dw_categoria"
			if isnull(dw_maestro.getitemstring(row,'descripcion')) then
				Messagebox('Categor$$HEX1$$ed00$$ENDHEX$$a de Cliente', 'La descripci$$HEX1$$f300$$ENDHEX$$n de la categoria no puede~r~n' + &
								'ser vac$$HEX1$$ed00$$ENDHEX$$a.~r~nError en la fila: ' + string(row) )
				return false
			end if
			if trim(dw_maestro.getitemstring(row,'descripcion'))='' then
				Messagebox('Categor$$HEX1$$ed00$$ENDHEX$$a de Cliente', 'La descripci$$HEX1$$f300$$ENDHEX$$n de la categoria no puede~r~n' + &
								'ser espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_gr_calificacion_visual"
			if isnull(dw_maestro.getitemstring(row,'calificacion')) or &
				trim(dw_maestro.getitemstring(row,'calificacion'))='' then
				Messagebox('Calificaci$$HEX1$$f300$$ENDHEX$$n Visual', 'La Calificaci$$HEX1$$f300$$ENDHEX$$n Visual no puede~r~n' + &
								'ser vac$$HEX1$$ed00$$ENDHEX$$a o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_gr_estado_calificacion"
			if isnull(dw_maestro.getitemstring(row,'calificacion')) or &
				trim(dw_maestro.getitemstring(row,'calificacion'))='' then
				Messagebox('Estatus Calificaci$$HEX1$$f300$$ENDHEX$$n', 'El Estatus Calificaci$$HEX1$$f300$$ENDHEX$$n no puede~r~n' + &
								'ser vac$$HEX1$$ed00$$ENDHEX$$a o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_estadoservicio"
			if isnull(dw_maestro.getitemstring(row,'descripcion')) or &
				trim(dw_maestro.getitemstring(row,'descripcion'))='' then
				Messagebox('Estado de Clientes', 'El Estado de Cliente no puede~r~n' + &
								'ser vac$$HEX1$$ed00$$ENDHEX$$a o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_grupoeconomico"
			if isnull(dw_maestro.getitemstring(row,'nombre')) or &
				trim(dw_maestro.getitemstring(row,'nombre'))='' then
				Messagebox('Grupo Econ$$HEX1$$f300$$ENDHEX$$mico', 'El Grupo Econ$$HEX1$$f300$$ENDHEX$$mico no puede~r~n' + &
								'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_giromark"	
			if isnull(dw_maestro.getitemstring(row,'dscgirmark')) or &
				trim(dw_maestro.getitemstring(row,'dscgirmark'))='' then
				Messagebox('Giro de Mercado', 'El Giro de Mercado no puede~r~n' + &
								'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_sectormark"	
			if isnull(dw_maestro.getitemstring(row,'dscsecmark')) or &
				trim(dw_maestro.getitemstring(row,'dscsecmark'))='' then
				Messagebox('Sector de Mercado', 'El Sector de Mercado no puede~r~n' + &
								'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_segmentomark"
			if isnull(dw_maestro.getitemstring(row,'dscsegmark')) or &
				trim(dw_maestro.getitemstring(row,'dscsegmark'))='' then
				Messagebox('Segmento de Venta', 'El Segmento de Venta no puede~r~n' + &
							'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_mnt_tipemp"
			if isnull(dw_maestro.getitemstring(row,'desctipemp')) or &
				trim(dw_maestro.getitemstring(row,'desctipemp'))='' then
				Messagebox('Tipo de Empresa', 'El Tipo de Empresa no puede~r~n' + &
							'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_gr_areaxcontacto"
			if isnull(dw_maestro.getitemstring(row,'descripcion')) or &
				trim(dw_maestro.getitemstring(row,'descripcion'))='' then
				Messagebox('Area de Responsabilidad', 'El Area de Responsabilidad no puede~r~n' + &
							'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_gr_medio_comunicacion"
			if isnull(dw_maestro.getitemstring(row,'medcom')) or &
				trim(dw_maestro.getitemstring(row,'medcom'))='' then
				Messagebox('Medio de Comunicaci$$HEX1$$f300$$ENDHEX$$n', 'El Medio de Comunicaci$$HEX1$$f300$$ENDHEX$$n no puede~r~n' + &
							'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_gr_cargoxcontacto"
			if isnull(dw_maestro.getitemstring(row,'descripcion')) or &
				trim(dw_maestro.getitemstring(row,'descripcion'))='' then
				Messagebox('Cargo por Contacto', 'El Cargo por Contacto no puede~r~n' + &
							'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if		
		CASE "dw_gr_tipo_contacto"
			if isnull(dw_maestro.getitemstring(row,'dsccnt')) or &
				trim(dw_maestro.getitemstring(row,'dsccnt'))='' then
				Messagebox('Tipo de Contacto', 'El Tipo de Contacto no puede~r~n' + &
							'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if		
		CASE "dw_gr_tipo_decisor"
			if isnull(dw_maestro.getitemstring(row,'descripcion')) or &
				trim(dw_maestro.getitemstring(row,'descripcion'))='' then
				Messagebox('Tipo de Decisor', 'El Tipo de Decisor no puede~r~n' + &
							'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_gr_estado_activacion"
			if isnull(dw_maestro.getitemstring(row,'descripcion')) or &
				trim(dw_maestro.getitemstring(row,'descripcion'))='' then
				Messagebox('Estatus de Activaci$$HEX1$$f300$$ENDHEX$$n', 'El Estatus de Activaci$$HEX1$$f300$$ENDHEX$$n no puede~r~n' + &
							'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_gr_contratista"
			if isnull(dw_maestro.getitemstring(row,'contratista')) or &
				trim(dw_maestro.getitemstring(row,'contratista'))='' then
				Messagebox('Contratistas', 'El Contratista no puede~r~n' + &
							'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_gr_operador_telecom"
			if isnull(dw_maestro.getitemstring(row,'operador')) or &
				trim(dw_maestro.getitemstring(row,'operador'))='' then
				Messagebox('Operador de Telecomunicaciones', 'El Operador no puede~r~n' + &
							'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
		CASE "dw_gr_tipo_sucursal"
			if isnull(dw_maestro.getitemstring(row,'dsctipsuc')) or &
				trim(dw_maestro.getitemstring(row,'dsctipsuc'))='' then
				Messagebox('Tipo de Sucursal', 'El Tipo de Sucursal no puede~r~n' + &
					'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
			if isnull(dw_maestro.getitemstring(row,'nomabr')) or &
				trim(dw_maestro.getitemstring(row,'nomabr'))='' then
				Messagebox('Tipo de Sucursal', 'La Abrev. del Tipo de Sucursal no puede~r~n' + &
				'ser vac$$HEX1$$ed00$$ENDHEX$$o o espacios en blanco.~r~nError en la fila: ' + string(row) )
				return false
			end if
	END CHOOSE
end if

return true
end event

event dw_maestro::ue_valores_iniciales;call super::ue_valores_iniciales;if al_row>0 then
	CHOOSE CASE dw_maestro.dataobject
		CASE "dw_categoria"
			dw_maestro.setitem(al_row,'descripcion','')
		CASE "dw_gr_calificacion_visual"
			dw_maestro.setitem(al_row,'calificacion','')
		CASE "dw_gr_estado_calificacion"
			dw_maestro.setitem(al_row,'calificacion','')
		CASE "dw_estadoservicio"
			dw_maestro.setitem(al_row,'descripcion','')
		CASE "dw_grupoeconomico"
			dw_maestro.setitem(al_row,'nombre','')
		CASE "dw_giromark"	
			dw_maestro.setitem(al_row,'dscgirmark','')
		CASE "dw_sectormark"	
			dw_maestro.setitem(al_row,'dscsecmark','')
		CASE "dw_segmentomark"
			dw_maestro.setitem(al_row,'dscsegmark','')
		CASE "dw_mnt_tipemp"
			dw_maestro.setitem(al_row,'desctipemp','')
		CASE "dw_gr_areaxcontacto"
			dw_maestro.setitem(al_row,'descripcion','')
		CASE "dw_gr_medio_comunicacion"
			dw_maestro.setitem(al_row,'medcom','')
		CASE "dw_gr_cargoxcontacto"
			dw_maestro.setitem(al_row,'descripcion','')
		CASE "dw_gr_tipo_contacto"
			dw_maestro.setitem(al_row,'dsccnt','')
		CASE "dw_gr_tipo_decisor"
			dw_maestro.setitem(al_row,'descripcion','')
		CASE "dw_gr_contratista"
			dw_maestro.setitem(al_row,'contratista','')
		CASE "dw_gr_operador_telecom"
			dw_maestro.setitem(al_row,'operador','')
		CASE "dw_gr_tipo_sucursal"
			dw_maestro.setitem(al_row,'dsctipsuc','')
			dw_maestro.setitem(al_row,'nomabr','')
	END CHOOSE
end if
end event

