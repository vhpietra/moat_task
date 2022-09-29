class ArtistsController < ApplicationController
  def list; end

  def search
    artist = find_artist(params[:artist_id])

    unless artist
      flash[:alert] = 'Artist not found'
      render action: :index
    end
  end

  private

  def request_api(url)
    response = Excon.get(
      url,
      headers: {
        'Basic' => 'ZGV2ZWxvcGVyOlpHVjJaV3h2Y0dWeQ=='
      }
    )
    return nil if response.status != 200

    JSON.parse(response.body)
  end

  def list_artists
    request_api(
      'https://europe-west1-madesimplegroup-151616.cloudfunctions.net/artists-api-controller'
    )
  end

  def find_artist(artist_id)
    request_api(
      'https://europe-west1-madesimplegroup-151616.cloudfunctions.net/artists-api-controller?artist_id=' + artist_id.to_s
    )
  end
end
