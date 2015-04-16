module TypeHelper

  def type_for(column)
    if column.name.include?('id')
      'select'
    elsif column.name.include?('type')
      'radio'
    elsif column.type == :textarea
      'textarea'
    else
      'text'
    end
  end

  def key_name(key)
    if key.include?('id')
      key.gsub('_id', '')
    else
      key
    end
  end

end
