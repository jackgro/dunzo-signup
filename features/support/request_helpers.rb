module RequestHelpers
  def accept_confirm_dialog
    if Capybara.current_driver == :selenium
      page.driver.browser.manage.window.maximize
      page.driver.browser.switch_to.alert.accept
    elsif Capybara.current_driver == :webkit
      page.driver.accept_js_confirms!
    end
  end
end

World(RequestHelpers)
