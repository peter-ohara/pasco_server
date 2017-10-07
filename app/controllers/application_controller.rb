class ApplicationController < ActionController::API
  include Knock::Authenticable

  def meta_attributes(collection, extra_meta = {})
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }.merge(extra_meta)
  end

  private
  # Define unauthorized access json response
  def unauthorized_entity(entity_name)
    render json: { error: "Unauthorized request" }, status:
        :unauthorized
  end
end
