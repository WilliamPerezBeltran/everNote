module NotesHelper
	def button_text_note(action)
		action == 'new' ? 'Crear nota': 'Editar nota'
	end
end
