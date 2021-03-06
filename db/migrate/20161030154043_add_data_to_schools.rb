class AddDataToSchools < ActiveRecord::Migration
  def change
    require "rubygems"
    require "json"
    require "net/http"
    require "uri"
    require "certified"

    uri = URI.parse("http://data.phl.opendata.arcgis.com/datasets/d46a7e59e2c246c891fbee778759717e_0.geojson")

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)

    if response.code == "200"
      result = JSON.parse(response.body)
      if School.all.size == 0 then
          result["features"].each { |r|
            new_record = School.new
            new_record["name"] = r["properties"]["FACIL_NAME"]
            new_record["address"] = r["properties"]["FACIL_ADDRESS"]
            new_record["zipcode"] = r["properties"]["ZIPCODE"]
            
            if r["properties"]["GRADE_LEVEL"] then
              if ['elem','pre','mid', 'high'].any? { |word| r["properties"]["GRADE_LEVEL"].downcase.include? word} then
                new_record["grade_level"] = r["properties"]["GRADE_LEVEL"]
              end
            end
            
            new_record["school_type"] = r["properties"]["TYPE"]
            new_record["longitude"] = r["geometry"]["coordinates"][0]
            new_record["latitude"] = r["geometry"]["coordinates"][1]
            new_record.save
          }
      end
    end
  end
end
