
##| ---------------------AGUA---------------------------- |##

marimba = "/Users/juandherrera/Google Drive/015_THESIS 2/Midterm Presentation/samples/marimba.flac"
palomino = "/Users/juandherrera/Google Drive/015_THESIS 2/Midterm Presentation/samples/palomino.flac"
tamb1 = "/Users/juandherrera/Google Drive/015_THESIS 2/Midterm Presentation/samples/tambourine2.flac"

use_debug false
use_bpm 128

in_thread do
  live_loop :mtro do
    sleep 1
  end
end

in_thread do
  live_loop :mtroFaster do
    sleep 0.50
  end
end


##| ---------------------MASTER---------------------------- |##

##| INTRO
palominoTrack = 0
marimbaTrack = 0
glitchTrack = 0

##| BASS
bassOneTrack = 0
bassTwoTrack = 0
bassThreeTrack = 1

##| SYNTHS
synthOneTrack = 0
synthTwoTrack = 0


##| ---------------------MAIN---------------------------- |##


in_thread do
  1.times do
    stop if palominoTrack < 1
    sample palomino, attack: 0, release: 50, amp: 0.09
    sleep sample_duration palomino
  end
end


in_thread do
  live_loop :bassOne do
    sync :mtro
    stop if bassOneTrack < 1
    sample :elec_fuzz_tom, attack: 1, rate: 1, start: 0.4, finish: 0.8, amp: 0.1
    sample tamb1, amp: 0.6
    sleep 0.50
    sample :bd_haus, amp: 0.5
    sleep 0.25
  end
end

in_thread do
  live_loop :bassTwoTrack do
    sync :mtro
    stop if bassOneTrack < 1
    1.times do
      use_synth :sine
      play chord(:G3, :major7), amp: 0.3, attack: 0.1, sustain: 1.1
      sleep 2
      play chord(:G3, :major7), amp: 0.3, attack: 0.1, sustain: 1.1
      sleep 2
    end
    use_synth :sine
    play chord(:c3, :major7), amp: 0.3, release: 8
    sleep 8
    use_synth :sine
    play chord(:d3, :major7), amp: 0.3, release: 8
    sleep 8
    use_synth :sine
    play chord(:g3, :major7), amp: 0.3, release: 8
    sleep 8
    use_synth :sine
    play chord(:c3, :major7), amp: 0.2, release: 10
    sleep 16
  end
end

ringBass = (ring
            (ring :e3, :g3, :b3, :d4, :e4, :g4, :b4, :d5),
            (ring :d5, :b4, :g4, :e4, :d4, :b3, :g3, :e3))

in_thread do
  live_loop :bassThree do
    stop if bassThreeTrack < 1
    sync :mtro
    sleep 1
    4.times do
      with_fx :lpf, cutoff: 120 do
        use_synth :dark_ambience
        play chord(:c2, :major7), amp: 1
        sample :elec_fuzz_tom, attack: 0.2, rate: 1.2, start: 0.8, finish: 0.6, amp: 4
        sleep 0.5
      end
    end
    16.times do
      with_fx :reverb do
        c = (line 60, 100, steps: 32).reflect.look
        a = 0.2
        use_synth :fm
        play (ring :e3, :g3, :b3, :d4, :e4, :g4, :b4, :d5).tick, cutoff: c, amp: a
        sleep 0.25
      end
    end
    2.times do
      with_fx :lpf, cutoff: 120 do
        use_synth :dark_ambience
        play chord(:c2, :major7), amp: 0.9
        sample :elec_fuzz_tom, attack: 0.2, rate: 1.2, start: 0.8, finish: 0.6, amp: 8
        sleep 0.5
      end
    end
  end
end

in_thread do
  live_loop :glitchAgua do
    sync :mtro
    stop if glitchTrack < 1
    with_fx :distortion, distort: 0.01 do
      sample :glitch_perc4, amp: 0.2
      sleep choose.([16, 32, 40])
    end
  end
end

melody = (ring
          (ring :g3, :g4, :g5),
          (ring :d3, :d4, :d5),
          (ring :c3, :c4, :c5))

live_loop :mainMelody do
  stop if synthOneTrack < 1
  sync :mtro
  8.times do
    play chord(melody[1].tick, :major7), release: 0.1, pan: choose.([1, -1]) #alternate between 0 and 1 in the array
    sleep 0.5
  end
  sleep 1
  4.times do
    play chord(melody[2].tick, :major7), release: 0.1, pan: choose.([1, -1]) #alternate between 0 and 1 in the array
    sleep 0.5
  end
  sleep 4
  4.times do
    play chord(melody[2].tick, :major7), release: 0.1, pan: choose.([1, -1]) #alternate between 0 and 1 in the array
    sleep 0.5
  end
  sleep 0.5
  4.times do
    play chord(melody[0].tick, :major7), release: 0.1, pan: choose.([1, -1]) #alternate between 0 and 1 in the array
    sleep 0.5
  end
  sleep 4
end

in_thread do
  live_loop :synthAguaOne do
    stop if synthTwoTrack < 1
    sync :mtro
    use_synth :hollow
    4.times do
      play chord(:g3, :major7), release: 1, amp: 1.8
      sleep 1
    end
    4.times do
      play chord(:d3, :major), release: 1, amp: 1.8
      sleep 1
    end
    8.times do
      play chord(:c3, :major7), release: 1.2, amp: 1.5
      sleep 0.5
    end
    2.times do
      play chord(:g3, :major7), release: 1.2, amp: 1.5
      sleep 2
    end
    sleep 4
  end
end
