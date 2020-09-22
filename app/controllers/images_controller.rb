class ImagesController < ApplicationController
  def update
    success = Image.find(params['id'])&.update(image_params)

    if success
      render json: {
        updated: true,
        image: success
      }, status: :ok
    else
      render json: {
        updated: false,
        message: 'id the id correct?'
      }, status: :no_content
    end
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end
end
