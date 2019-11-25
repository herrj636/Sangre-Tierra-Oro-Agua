in_thread do
  ##| the hollow synth is applied to hoo1, hoo2, & hoo3
  use_synth :hollow
  
  ##| hoo 1 plays 3 times
  hoo1 :c1, 3
  
  ##| hoo2 plays 6 times
  hoo2 :c2, 6
  
  ##| hoo3 plays 12 times
  hoo3 :c4, 12
  
  ##| spooky_player repeats 25 times
  spooky_player :c1, 25
  
  sample :ambi_choir, rate: -0.5  
end

define :spooky_player do |root, repeats|
  use_synth :growl
  repeats.times do
    play chord(root, :minor7), decay: 0.625, release: 0.5
    sleep 0.125
  end
end

define :hoo1 do |root, repeats|
  repeats.times do
    play chord(root, :maj9), attack: 0.0625, release: 4
    sleep 1
  end
end

define :hoo2 do |root, repeats|
  repeats.times do
    play chord(root, :minor7), release: 2
    sleep 0.5
  end
end

define :hoo3 do |root, repeats|
  repeats.times do
    play chord(root, :maj9), sustain: 0.5
    sleep 0.25
  end
end

