# frozen_string_literal: true

require 'rack_session_access/capybara'
require 'capybara/rails'

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(args: %w(--no-sandbox --disable-gpu --window-size=1400,2000))
  options.add_argument("--headless") unless ENV["VISIBLE_CHROME"].present?

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_selector = :css
Capybara.default_max_wait_time = 10
Capybara.automatic_label_click = true

class Capybara::Node::Element
  def style
    css = self[:style] || ""
    css.split(/;/).map(&:strip).each_with_object({}) do |pair, acc|
      if pair =~ /\A([^:]+):(.+)\Z/
        key = $1.strip
        value = $2.strip
        acc[key] = value
      end
    end
  end

  def styles
    return {} unless self["style"]

    styles = self["style"].strip.split(";", 0).map { |s| s.split(":") }.to_h

    if styles["background-color"]
      styles["background-color"] = "%02x%02x%02x" % styles["background-color"].match(/rgb\((\d+, \d+, \d+)\)/)[1].split(",")
    end

    styles
  end
end

module RackSessionAccess
  class Middleware
    def edit(request)
      [200, {"content-type" => "text/html"}, ["
        <html>
        <head>
          <title>Rack</title>
        </head>
        <body>
        <form id=\"form\" action=\"#{action_path(:update)}\" method=\"post\">
          <input type=\"hidden\" name=\"_method\" value=\"put\">
          <input id=\"data\" name=\"data\" value=\"#{Addressable::URI.unescape(request.env["QUERY_STRING"])}\">
          <button>submit</button>
        </form>
        </body>
        </html>
      "]]
    end
  end

  module Capybara
    def set_rack_session(session_data_hash)
      data = RackSessionAccess.encode(session_data_hash)
      visit "#{RackSessionAccess.edit_path}?#{data}"

      find('button').click

      assert_text "Rack session data", exact: false
    end
  end
end
