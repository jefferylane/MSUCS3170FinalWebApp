module ApplicationHelper
  def human_readable_file_type(content_type)
    case content_type
    when 'application/octet-stream'
      'GLB File'
    else
      content_type
    end
  end
end
