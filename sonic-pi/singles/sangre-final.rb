
##| ---------------------SANGRE---------------------------- |##

gol = "/Users/juandherrera/Google Drive/015_THESIS 2/Midterm Presentation/samples/gol.flac"
salsa = "/Users/juandherrera/Google Drive/015_THESIS 2/Midterm Presentation/samples/salsa.flac"
sampleShrt = "/Users/juandherrera/Google Drive/015_THESIS 2/Midterm Presentation/samples/salsa_short.flac"
escobar = "/Users/juandherrera/Google Drive/015_THESIS 2/Midterm Presentation/samples/Escobar.flac"
palomino = "/Users/juandherrera/Google Drive/015_THESIS 2/Midterm Presentation/samples/palomino.flac"

#G Major
use_debug false
use_bpm 128

live_loop :mtro do
  sleep 1
end


##| ---------------------MASTER---------------------------- |##

##| INTRO
hissTrack = 1
vinascoChe = 1
bassOne = 1
gunshot = 0
golTrack = 0

##| Synths
synthOneTrack = 0
synthTwoTrack = 1
synthThreeTrack = 0


golSliceTrack = 0
salsaSliceTrack = 0

escobarTrack = 0
euclidTrack = 0

palominoTrack = 0

##| ---------------------MAIN---------------------------- |##

live_loop :hiss do
  stop if hissTrack < 1
  sample :vinyl_hiss,attack: 2, release: 2, amp: 0.3
  sleep sample_duration :vinyl_hiss
end

live_loop :vinasco do
  stop if vinascoChe < 1
  1.times do
    print sample_duration gol
    sleep 8
    sample gol, amp: 1, attack: 2
    sleep 16
  end
end

in_thread do
  sync :mtro
  1.times do
    stop if gunshot < 1
    with_fx :echo, mix: 1, phase: 0.25, decay: 8 do
      use_synth :gnoise
      play chord(:g1, :major), amp: 0.5, release: 1.2
      sleep 2
    end
  end
end

in_thread do
  live_loop :bassSangre do
    stop if bassOne < 1
    sync :mtro
    sample :bd_haus, amp: rrand(0.9,0.8)
    play :fs1, sustain: 0.02, release: 0.1, amp: 0.8
    
    ##| sleep 0.5
    with_fx :lpf, cutoff: 130 do
      sample :elec_fuzz_tom, attack: 0.02, rate: 1.2, start: 0.8, finish: 0.65, amp: 0.4
    end
    
    sample :drum_cymbal_closed, amp: 1.5, attack: 1
    play :fs1, attack: 0.2, release: 0.02, amp: 0.05
    sleep choose([0.125, 0.25])
    sleep 0.5
  end
end

live_loop :gol do
  stop if golTrack < 1
  sample gol, start: 0.90, finish: 1, rate: 1.2, pitch: 0.3, amp: 9, attack: 0.001, release: 0.04
  sleep choose.([8, 8, 8])
end

in_thread do
  live_loop :synthOne do
    sync :mtro
    stop if synthOneTrack < 1
    with_fx :wobble do
      use_synth :sine
      c = 120
      a = 0.3
      play choose([:g5, :d5, :g5, :c5]), amp: 0.15, cutoff: c, sustain_level: 2
      sleep 2
      play :d4, amp: a, cutoff: c
      sleep 4
      play :e4, amp: a, cutoff: c
      sleep 2
      play :d4, amp: a, cutoff: c, sustain: 3
      sleep 8
    end
  end
end

live_loop :synthTwo do
  stop if synthTwoTrack < 1
  sync :mtro
  2.times do
    sample :tabla_tun2, amp: 0.6, rate: 0.3, attack: 0.8, sustain_level: 4, release: 1 if one_in(2)
    sleep 0.25
    sample :tabla_tun2, amp: 0.6, rate: 0.3, attack: 0.8, sustain_level: 1, release: 1 if one_in(2)
    sleep 0.25
    sample :tabla_tun3, amp: 0.6, rate: 0.3 if one_in(2)
    sleep 0.50
    sample :tabla_tun3, amp: rrand(0.5, 0.3), rate: 0.4 if one_in(2)
    sleep 2
    sample :tabla_tun2, amp: 0.5, rate: 0.4, attack: 2, sustain_level: 1, release: 1 if one_in(2)
    sleep 0.25
    sample :tabla_tun2, amp: 0.5, rate: 0.4, attack: 2, sustain_level: 1, release: 1 if one_in(2)
    sleep 0.25
    sample :tabla_tun3, amp: rrand(0.3, 0.2), rate: 0.6 if one_in(2)
    sleep 0.50
    sample :tabla_tun3, amp: rrand(0.2, 0.2), rate: 0.4 if one_in(2)
    sleep 3
  end
  1.times do
    stop if synthTwoTrack < 1
    sample :tabla_tun2, amp: 0.3, rate: 0.8, attack: 0.8, sustain_level: 1, release: 0.8
    sleep 2
    sample :tabla_tun2, amp: 0.3, rate: 0.4, attack: 0.8, sustain_level: 1, release: 0.8
    sleep 0.25
    sample :tabla_tun3, amp: 0.3, rate: 0.2
    sleep 0.25
    sample :tabla_tun3, amp: 0.4, rate: 0.3
    sleep 2
  end
end

live_loop :synthThree do
  sync :mtro
  stop if synthThreeTrack < 1
  with_fx :echo do
    use_synth :square
    8.times do
      n = (ring :g1, :g2, :g3).tick
      play n, release: 0.125, cutoff: 120, res: 0.8, wave: 0, amp: 0.8
      sleep 0.25
    end
    4.times do
      n = (ring :g1, :g2, :g3).tick
      play n, release: 0.125, cutoff: 120, res: 0.8, wave: 0, amp: 0.8
      sleep 0.25
    end
    2.times do
      n = (ring :a1, :a2, :a3).tick
      play n, release: 0.125, cutoff: 120, res: 0.8, wave: 0, amp: 1
      sleep 0.25
    end
    8.times do
      n = (ring :fs1, :fs2, :fs3).tick
      play n, release: 0.125, cutoff: 120, res: 0.8, wave: 0, amp: 1
      sleep 0.25
    end
  end
  sleep 8
end

live_loop :Golslice do
  stop if golSliceTrack < 1
  slice_idx = rand_i(16)
  slice_size = 0.03125
  s = slice_idx * slice_size
  f = s + slice_size
  sample gol, start: s, finish: f, amp: 4.5, rate: 0.6, pan: (rrand(1,-1)) if one_in(2)
  sleep sample_duration gol, start: s, finish: f if one_in(8)
  sleep 0.125
  sample gol, start: s, finish: f, amp: 4.5, rate: 0.6 if one_in(2)
  sleep sample_duration gol, start: s, finish: f
  sleep 16
end

live_loop :salsaSlice do
  stop if salsaSliceTrack < 1
  slice_idx = rand_i(6)
  slice_size = 0.1666
  s = slice_idx * slice_size
  f = s + slice_size
  sample sampleShrt, start: s, finish: f, amp: 5, rate: 1
  sleep sample_duration sampleShrt, start: s, finish: f
  sleep 16
end

in_thread do
  live_loop :euclidBeat do
    stop if euclidTrack < 1
    sync :mtro
    tick
    sample :bd_haus if (spread 2, 7).look amp: 0.2
    sleep 0.75
    with_fx :echo do
      sample :bd_haus if (spread 2, 7).look amp: 0.2
    end
    sleep 8
  end
end


live_loop :escobar do
  with_fx :lpf, cutoff: 75 do
    stop if escobarTrack < 1
    sample escobar, attack: 2, release: 2, amp: 1
    sleep sample_duration escobar
    sample escobar, start: 0.8, attack: 2, release: 2, amp: 1
    sample escobar, start: 0.8, attack: 2, release: 2, amp: 0.8
    sleep 2
    sample escobar, start: 0.8, attack: 2, release: 2, amp: 0.6
    sleep 2
    sample escobar, start: 0.8, attack: 2, release: 2, amp: 0.4
    sleep 2
    sample escobar, start: 0.8, attack: 2, release: 2, amp: 0.2
    sleep 8
  end
end

##| ---------------------OUTRO---------------------------- |##

in_thread do
  1.times do
    stop if palominoTrack < 1
    sample palomino, attack: 0, release: 50, amp: 0.2
    sleep sample_duration palomino
  end
end







