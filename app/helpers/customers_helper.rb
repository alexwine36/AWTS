module CustomersHelper
  def tel_link_to(text)
    groups = text.to_s.scan(/(?:^\+)?\d+/)
    link_to text, "tel:#{groups.join '-'}"
  end
  def tel_link(text)
    groups = text.to_s.scan(/(?:^\+)?\d+/)
    phone = "tel:#{groups.join '-'}"
    return phone
    
  end
end
