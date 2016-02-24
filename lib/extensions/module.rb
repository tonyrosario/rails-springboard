class Module
  def constant_values
    constants.map { |constant| const_get(constant) }.sort
  end
end
