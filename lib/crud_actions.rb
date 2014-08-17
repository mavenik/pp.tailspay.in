module CRUDActions
  def new
    @resource = api_resource.new
  end

  def edit
    @resource = api_resource.find(params[:id])
  end

  def index
    render json: api_resource.where(params[:query_options]).all.to_json(include: params[:include])
  end

  def show
    render json: api_resource.find(params[:id]).to_json(include: params[:include])
  end

  def create
    resource = api_resource.create(params.require(api_resource_name).permit(permitted_attributes))
    if resource.errors.blank?
      render json: resource
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  def update
    resource = api_resource.update(params[:id], params.require(api_resource_name).permit(permitted_attributes))

    if resource.errors.blank?
    render json: resource
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: api_resource.destroy(params[:id])
  end

  def api_resource_name
    api_resource.name.underscore
  end

  def api_resource
    raise NotImplementedError
  end
end
