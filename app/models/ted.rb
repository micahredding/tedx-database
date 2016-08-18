class Ted < ApplicationRecord
  def status_enum
    [nil, 'contacted', 'corresponding', 'applied', 'rejected', 'accepted', 'try again next year']
  end

  def type_enum
    [nil, 'Standard', 'University', 'Youth', 'Salon', 'TedXLive', 'Internal', 'TedX in a Box', 'Library', 'ED', 'Level 2']
  end

  class DateConverter
    def self.convert(value)
      Date.strptime( value, '%m/%d/%Y')
    end
  end

  def self.import_from_csv(filepath)
    options = {:value_converters => {:event_date => DateConverter, :submission_deadline => DateConverter}}
    hashes = SmarterCSV.process(filepath, options)
    hashes.each do |values|
      notes = [
        values[:notes],
        values[:notes_2],
        values[:notes_3]
      ].join("\n\n")
      values[:notes] = notes
      values.delete(:notes_2)
      values.delete(:notes_3)
      Ted.create(values)
    end
  end
end
