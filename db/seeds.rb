retro = Retroard::Retrospective.new
well = Retroard::Category.new({:title => 'Well'})
less_well = Retroard::Category.new({:title => 'Less Well'})
idea = Retroard::Category.new({:title => 'Idea'})
puzzle = Retroard::Category.new({:title => 'Puzzle'})
retro.categories += [well, less_well, idea, puzzle]
retro.save