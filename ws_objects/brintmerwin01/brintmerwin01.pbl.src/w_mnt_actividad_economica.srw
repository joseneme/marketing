$PBExportHeader$w_mnt_actividad_economica.srw
forward
global type w_mnt_actividad_economica from w_mnt_std
end type
end forward

global type w_mnt_actividad_economica from w_mnt_std
end type
global w_mnt_actividad_economica w_mnt_actividad_economica

type variables

end variables

on w_mnt_actividad_economica.create
call super::create
end on

on w_mnt_actividad_economica.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event ue_menu_grabar;call super::ue_menu_grabar;dw_maestro.postevent("ue_retrieve")
end event

type dw_maestro from w_mnt_std`dw_maestro within w_mnt_actividad_economica
end type

event dw_maestro::ue_update_pre_row;if row>0 then
	CHOOSE CASE dw_maestro.dataobject
		CASE "dw_actividad_economica"
			if isnull(dw_maestro.getitemstring(row,'cnae')) then
				Messagebox('Alerta', 'No se ha ingresado el CIIU')
				return false
			end if
			if isnull(dw_maestro.getitemstring(row,'descripcion')) then
				Messagebox('Alerta', 'No se ha ingresado la Actividad Economica')
				return false
			end if
			if isnull(dw_maestro.getitemstring(row,'codgirmark')) then
				Messagebox('Alerta', 'No se ha ingresado el Subsector')
				return false
			end if

	END CHOOSE
end if

return true
end event

event dw_maestro::ue_valores_iniciales;call super::ue_valores_iniciales;//if al_row>0 then
//	CHOOSE CASE dw_maestro.dataobject
//		CASE "dw_categoria"
//			dw_maestro.setitem(al_row,'descripcion','')
//		CASE "dw_gr_calificacion_visual"
//			dw_maestro.setitem(al_row,'calificacion','')
//		CASE "dw_gr_estado_calificacion"
//			dw_maestro.setitem(al_row,'calificacion','')
//		CASE "dw_estadoservicio"
//			dw_maestro.setitem(al_row,'descripcion','')
//		CASE "dw_grupoeconomico"
//			dw_maestro.setitem(al_row,'nombre','')
//		CASE "dw_giromark"	
//			dw_maestro.setitem(al_row,'dscgirmark','')
//		CASE "dw_sectormark"	
//			dw_maestro.setitem(al_row,'dscsecmark','')
//		CASE "dw_segmentomark"
//			dw_maestro.setitem(al_row,'dscsegmark','')
//		CASE "dw_mnt_tipemp"
//			dw_maestro.setitem(al_row,'desctipemp','')
//		CASE "dw_gr_areaxcontacto"
//			dw_maestro.setitem(al_row,'descripcion','')
//		CASE "dw_gr_medio_comunicacion"
//			dw_maestro.setitem(al_row,'medcom','')
//		CASE "dw_gr_cargoxcontacto"
//			dw_maestro.setitem(al_row,'descripcion','')
//		CASE "dw_gr_tipo_contacto"
//			dw_maestro.setitem(al_row,'dsccnt','')
//		CASE "dw_gr_tipo_decisor"
//			dw_maestro.setitem(al_row,'descripcion','')
//		CASE "dw_gr_contratista"
//			dw_maestro.setitem(al_row,'contratista','')
//		CASE "dw_gr_operador_telecom"
//			dw_maestro.setitem(al_row,'operador','')
//		CASE "dw_gr_tipo_sucursal"
//			dw_maestro.setitem(al_row,'dsctipsuc','')
//			dw_maestro.setitem(al_row,'nomabr','')
//	END CHOOSE
//end if
end event

event dw_maestro::ue_valida_dato;call super::ue_valida_dato;st_par lst_par_in, lst_par_out	

choose case as_columna
	case 'sector_subsector'
		lst_par_in.titulo = 'Busqueda de Subsector'	
		openwithparm(w_bus_subsector, lst_par_in)
		lst_par_out = message.powerobjectparm
		if isvalid(lst_par_in) then
				this.setitem(al_row,"sector_subsector",lst_par_out.parstring6+' - '+lst_par_out.parstring5)
				this.setitem(al_row,"codgirmark",lst_par_out.parstring3)
      end if
end choose
return 0



end event

