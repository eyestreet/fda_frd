#
# FDA Enforcement Reports CSV Processor Utilities
#
# NOTE: Download CSV exports of Recall Events from -> http://www.fda.gov/%20Safety/Recalls/EnforcementReports/default.htm
# and put the files in tmp/data directory.  Importer will process all files in the directory and expects the files to have
# a header line.
#
# Run this util with:
# $ rails r lib/utils/enforcement_report.rb
#
# Header Mapping
#
# City -> city
# Classification -> classification
# Code Info and Code Info (Continued) -> code_info
# Country -> country
# Distribution Pattern -> distribution_pattern
# Event ID -> event_id
# Initial Firm Notification of Consignee or Public -> initial_firm_notification
# Product Type -> product_type
# Product Description -> product_description
# Product Quantity -> product_quantity  NOTE: This field includes a space before the column name
# Reason for Recall -> reason_for_recall
# Recall Initiation Date -> recall_initiation_date
# Recall Number -> recall_number
# Recalling Firm -> recalling_firm
# Report Date -> report_date
# State -> state
# Status -> status
# Voluntary/Mandated -> initiated_by

# require 'CSV'

# state_data = {}
# CSV.foreach 'tmp/state-data/state_latlon.csv', headers: true do |row|
#   state_data[row['state']] = { lat: row['latitude'], lon: row['longitude'] }
# end

# geo_data = {}
# state_data.keys.each do |state|
#   puts state
#   r = Geocoder.search "state #{state}, USA"
#   pp r
#   geo_data[state] = r
#   sleep 2
# end

# geo_data['US'] = Geocoder.search 'USA'

# File.open('tmp/geo_data.yaml', 'w') { |file| file.puts geo_data.to_yaml }

GEO = YAML.load(File.read('tmp/geo_data.yaml'))

STATE_MAPPING = {
  'Alabama' => 'AL',
  'Alaska' => 'AK',
  'Arizona' => 'AZ',
  'Arkansas' => 'AR',
  'California' => 'CA',
  'Colorado' => 'CO',
  'Connecticut' => 'CT',
  'Delaware' => 'DE',
  'Florida' => 'FL',
  'Georgia' => 'GA',
  'Hawaii' => 'HI',
  'Idaho' => 'ID',
  'Illinois' => 'IL',
  'Indiana' => 'IN',
  'Iowa' => 'IA',
  'Kansas' => 'KS',
  'Kentucky' => 'KY',
  'Louisiana' => 'LA',
  'Maine' => 'ME',
  'Maryland' => 'MD',
  'Massachusetts' => 'MA',
  'Michigan' => 'MI',
  'Minnesota' => 'MN',
  'Mississippi' => 'MS',
  'Missouri' => 'MO',
  'Montana' => 'MT',
  'Nebraska' => 'NE',
  'Nevada' => 'NV',
  'New Hampshire' => 'NH',
  'New Jersey' => 'NJ',
  'New Mexico' => 'NM',
  'New York' => 'NY',
  'North Carolina' => 'NC',
  'North Dakota' => 'ND',
  'Ohio' => 'OH',
  'Oklahoma' => 'OK',
  'Oregon' => 'OR',
  'Pennsylvania' => 'PA',
  'Rhode Island' => 'RI',
  'South Carolina' => 'SC',
  'South Dakota' => 'SD',
  'Tennessee' => 'TN',
  'Texas' => 'TX',
  'Utah' => 'UT',
  'Vermont' => 'VT',
  'Virginia' => 'VA',
  'Washington' => 'WA',
  'West Virginia' => 'WV',
  'Wisconsin' => 'WI',
  'Wyoming' => 'WY'
}

def parse_distribution_pattern(dp)
  # puts "parsing Distribution Pattern: #{dp}"

  locations = []

  if dp =~ /\b(nationwide|us|usa)\b/i
    locations << Location.new(
      long_name: GEO['US'].first.data['address_components'].first['long_name'],
      short_name: GEO['US'].first.data['address_components'].first['short_name'],
      coordinates: [
        GEO['US'].first.data['geometry']['location']['lng'],
        GEO['US'].first.data['geometry']['location']['lat']
      ]
    )
  else
    states = []

    dp.strip().split(/\W+/).join(' ').scan(/\b(AL|AK|AZ|AR|CA|CO|CT|DE|FL|GA|HI|ID|IL|IN|IA|KS|KY|LA|ME|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VT|VA|WA|WV|WI|WY|DC)\b/).flatten.each do |state|
      states << state
    end

    dp.strip().split(/\W+/).join(' ').scan(/\b(Alabama|Alaska|Arizona|Arkansas|California|Colorado|Connecticut|Delaware|Florida|Georgia|Hawaii|Idaho|Illinois|Indiana|Iowa|Kansas|Kentucky|Louisiana|Maine|Maryland|Massachusetts|Michigan|Minnesota|Mississippi|Missouri|Montana|Nebraska|Nevada|New Hampshire|New Jersey|New Mexico|New York|North Carolina|North Dakota|Ohio|Oklahoma|Oregon|Pennsylvania|Rhode Island|South Carolina|South Dakota|Tennessee|Texas|Utah|Vermont|Virginia|Washington|West Virginia|Wisconsin|Wyoming)\b/).flatten.each do |state|
      states << STATE_MAPPING[state]
    end

    states.uniq.sort.each do |state|
      locations << Location.new(
        long_name: GEO[state].first.data['address_components'].first['long_name'],
        short_name: GEO[state].first.data['address_components'].first['short_name'],
        coordinates: [
          GEO[state].first.data['geometry']['location']['lng'],
          GEO[state].first.data['geometry']['location']['lat']
        ]
      )
    end
  end

  locations
end

Dir.glob('tmp/data/*.csv') do |file|
  puts "Processing: #{file}"

  CSV.foreach file, headers: true do |row|
    # puts "row: #{row}"

    if row['Product Type'] == 'Food'

      next if RecallEvent.where(event_id: row['Event ID'], recall_number: row['Recall Number']).exists?

      code_info = row['Code Info']
      code_info += row['Code Info (Continued)'] if row['Code Info (Continued)'].present?

      recall_initiation_date = Date.strptime(row['Recall Initiation Date'], '%m/%d/%Y') if row['Recall Initiation Date'].present?
      report_date = Date.strptime(row['Report Date'], '%m/%d/%Y') if row['Report Date'].present?

      RecallEvent.create!(
        city: row['City'],
        classification: row['Classification'],
        code_info: code_info,
        country: row['Country'],
        distribution_pattern: row['Distribution Pattern'],
        event_id: row['Event ID'],
        initial_firm_notification: row['Initial Firm Notification of Consignee or Public'],
        product_type: row['Product Type'],
        product_description: row['Product Description'],
        product_quantity: row[' Product Quantity'],
        reason_for_recall: row['Reason for Recall'],
        recall_initiation_date: recall_initiation_date,
        recall_number: row['Recall Number'],
        recalling_firm: row['Recalling Firm'],
        report_date: report_date,
        state: row['State'],
        status: row['Status'],
        initiated_by: row['Voluntary/Mandated'],
        locations: parse_distribution_pattern(row['Distribution Pattern'])
      )

      # puts
    end
  end
end
