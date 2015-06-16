ThinkingSphinx::Index.define :song, :with => :active_record do
  indexes title, :sortable => true
  indexes artist
  indexes year
  indexes artist
  indexes album
  indexes track_nr
  indexes genre
end