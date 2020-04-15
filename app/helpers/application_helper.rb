# ArgumentError in Notes#show
# Showing /home/user/Desktop/software/proyectos_ruby_on_rails_2020/everNote/app/views/notes/show.html.erb where line #11 raised:

# Symbol or String expected, but NilClass given.

# Actually, this is a problem with CodeRay, not with Redcarpet.
#  You didn't provide any Markdown but I guess you didn't specify 
#  the language using a fenced code block and language ends up being 
#  nil when block_code is called. You should certainly rather define a 
#  default language to pass to CodeRay in case you didn't specify it in 
#  	your Markdown or use the plain-old indented code blocks:

# CodeRay.scan(code, language || :text).div

module ApplicationHelper
	class CodeRayify < Redcarpet::Render::HTML
		def block_code(code, language)
			# CodeRay.scan(code, language).div
			CodeRay.scan(code, language || :text).div
		end
	end

	def markdown(text)
		coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
		options = {
			:fenced_code_blocks => true,
			:no_intra_emphasis => true,
			:autolink => true,
			:strikethrough => true,
			:lax_html_blocks => true,
			:superscript => true,
			:tables => true,
			:quote => true,
		}
		markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
		markdown_to_html.render(text).html_safe
	end
end
