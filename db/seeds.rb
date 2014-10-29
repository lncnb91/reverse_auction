# encoding: utf-8
require "master_importer/csv_importer"

if Rails.env.development?
  [Kitty].each do |model|
    MasterImporter::CSVImporter.new(model).execute unless model.send(:all).present?
  end

  Admin.create admin_name: "hellokitty-admin", password: "dapchaih4n01"
end
