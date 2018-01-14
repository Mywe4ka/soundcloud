ThinkingSphinx::Index.define :song, :with => :real_time do
  indexes title, :sortable => true
  indexes artist
  indexes year
  indexes album
  indexes track_nr
  indexes genre
end