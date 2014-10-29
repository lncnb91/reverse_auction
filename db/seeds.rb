# encoding: utf-8
require "master_importer/csv_importer"

if Rails.env.development?
  [User, AuctionItem].each do |model|
    MasterImporter::CSVImporter.new(model).execute unless model.send(:all).present?
  end

  Admin.create admin_name: "admin", password: "123456789"
end
