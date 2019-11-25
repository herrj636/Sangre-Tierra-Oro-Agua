gol = "/Users/juandherrera/Google Drive/015_THESIS 2/Midterm Presentation/samples/gol.flac"
salsa = "/Users/juandherrera/Google Drive/015_THESIS 2/Midterm Presentation/samples/salsa.flac"
sampleShrt = "/Users/juandherrera/Google Drive/015_THESIS 2/Midterm Presentation/samples/salsa_short.flac"

use_bpm 128

live_loop :mtro do
  sleep 1
end

live_loop :hiss do
  sample :vinyl_hiss,attack: 2, release: 2, amp: 0.3
  sleep sample_duration :vinyl_hiss
end

1.times do
  print sample_duration gol
  sleep 8
  sample gol, amp: 2, attack: 2
end

##| in_thread do
##|   sync :mtro
##|   1.times do
##|     with_fx :echo, mix: 1, phase: 0.25, decay: 8 do
##|       use_synth :gnoise
##|       play :g1, amp: 0.3, release: 1.2
##|       sleep 2
##|     end
##|   end
##|   1.times do
##|     with_fx :echo, mix: 1, phase: 0.25, decay: 8 do
##|       use_synth :gnoise
##|       play :c1, amp: 0.3, release: 1.2
##|     end
##|   end
##| end

in_thread do
  live_loop :cymbal do
    sample :bd_haus, amp: rrand(0.6,0.8)
    ##| play :fs2, sustain: 0.02, release: 0.1, amp: 0.8
    ##| sleep 0.5
    sync :mtro
    with_fx :lpf, cutoff: 130 do
      sample :elec_fuzz_tom, attack: 0.02, rate: 1.2, start: 0.8, finish: 0.6, amp: 2
    end
    sample :drum_cymbal_closed, amp: rrand(0.2, 0.4)
    ##| play :fs1, attack: 0.2, release: 0.02, amp: 0.8
    sleep 0.5
  end
end

live_loop :gol do
  stop
  sample gol, start: 0.90, finish: 1, rate: 1.2, pitch: 0.3, amp: 4, attack: 0.001, release: 0.04
  sleep choose.([4, 8, 12])
end

live_loop :synthOne do
  sync :mtro
  with_fx :reverb do
    use_synth :sine
    play choose(scale(:g1, :major)), attack: 0.8, release: 0.8, amp: rrand(0.8,0.9)
    sleep choose([0, 8])
    play choose(scale(:g1, :major)), attack: 0.8, release: 0.8, amp: rrand(1.1,1.2)
    sleep rrand(0, 8)
  end
end

live_loop :synthTwo do
  sync :mtro
  live_loop :optOne do
    stop
    sample :tabla_tun2, amp: 1, rate: 0.9, attack: 0.8, sustain_level: 4, release: 1 if one_in(2)
    sleep 0.25
    sample :tabla_tun2, amp: 1, rate: 0.6, attack: 0.8, sustain_level: 1, release: 1 if one_in(2)
    sleep 0.25
    sample :tabla_tun3, amp: 1, rate: 0.6 if one_in(2)
    sleep 0.50
    sample :tabla_tun3, amp: rrand(0.8, 1), rate: 0.4 if one_in(2)
    sleep 2
    sample :tabla_tun2, amp: 0.8, rate: 0.9, attack: 2, sustain_level: 1, release: 1 if one_in(2)
    sleep 0.25
    sample :tabla_tun2, amp: 0.6, rate: 0.6, attack: 2, sustain_level: 1, release: 1 if one_in(2)
    sleep 0.25
    sample :tabla_tun3, amp: rrand(0.8, 1), rate: 0.6 if one_in(2)
    sleep 0.50
    sample :tabla_tun3, amp: rrand(0.8, 1), rate: 0.4 if one_in(2)
    sleep 3
  end
  live_loop :optTwo do
    stop
    sample :tabla_tun2, amp: 0.8, rate: 0.4, attack: 2, sustain_level: 1, release: 1
    sleep 1
    sample :tabla_tun2, amp: 0.6, rate: 0.4, attack: 2, sustain_level: 1, release: 1
    sleep 0.25
    sample :tabla_tun3, amp: 0.6, rate: 0.2
    sleep 0.50
    sample :tabla_tun3, amp: 0.5, rate: 0.3
    sleep 3
  end
end

live_loop :Golslice do
  stop
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

##| live_loop :salsaSlice do
##|   slice_idx = rand_i(6)
##|   slice_size = 0.1666
##|   s = slice_idx * slice_size
##|   f = s + slice_size
##|   sample sampleShrt, start: s, finish: f, amp: 4.5, rate: 1
##|   sleep sample_duration sampleShrt, start: s, finish: f
##|   sleep 8
##| end

##| live_loop :euclidBeat do
##|   sync :mtro
##|   tick
##|   sample :drum_snare_soft if (spread 3, 8).look
##|   sample :perc_snap2 if (spread 7, 11).look
##|   sample :bd_haus if (spread 2, 7).look
##|   sleep 4
##| end


