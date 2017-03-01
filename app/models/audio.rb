class Audio < Sequel::Model
  include FileUploader[:file]
end
