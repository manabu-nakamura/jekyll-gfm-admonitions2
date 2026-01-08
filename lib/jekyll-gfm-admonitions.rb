# frozen_string_literal: true

require 'octicons'
require 'cssminify'

ADMONITION_ja = {
  'important' => '重要',
  'note' => 'メモ',
  'tip' => 'ヒント',
  'warning' => '警告',
  'caution' => '注意'
}.freeze

ADMONITION_ICONS = {
  'important' => 'report',
  'note' => 'info',
  'tip' => 'light-bulb',
  'warning' => 'alert',
  'caution' => 'stop'
}.freeze

module JekyllGFMAdmonitions
  class GFMAdmonitionConverter < Jekyll::Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.(md|markdown)$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      original_content = content.dup
      content.gsub!(/<blockquote>\s*<p>\s*\[!(IMPORTANT|NOTE|WARNING|TIP|CAUTION)\](.*?)\n(.*?)\s*<\/p>\s*<\/blockquote>/m) do
        type  = ::Regexp.last_match(1).downcase
        t     = ::Regexp.last_match(2)
        title = (t.empty? || t == '<br />' || t == '</p>') ? type.capitalize     : t
#       title = (t.empty? || t == '<br />' || t == '</p>') ? ADMONITION_ja[type] : t
        text  = ::Regexp.last_match(3)
        icon  = Octicons::Octicon.new(ADMONITION_ICONS[type]).to_svg
        admonition_html(type, title, text, icon)
      end
      if content != original_content
        css = File.read(File.expand_path('../assets/admonitions.css', __dir__))
        content = "<head><style>#{CSSminify.compress(css)}</style></head>" + content
      end
      content
    end

    def admonition_html(type, title, text, icon)
      "<div class='markdown-alert markdown-alert-#{type}'>" \
        "<p class='markdown-alert-title'>#{icon} #{title}</p>" \
        "#{text}" \
      "</div>"
    end
  end
end