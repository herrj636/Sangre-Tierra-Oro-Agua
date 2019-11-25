use_bpm 100

##mixing board
bassDrum = 1
snareDrum = 1
bass = 1
arp = 1
lead = 1

live_loop :bassDrum do
  sample :bd_haus
  sleep 1
end

live_loop :snareDrum do
  sleep 1
  sample :drum_snare_hard, rate: 0.7, amp: 0.5
  sleep 1
end

live_loop :bass do
  play :g2
  sleep 4
  play :e2
  sleep 4
end

live_loop :arp do
  c = (line 60, 100, steps: 32).reflect.look
  a = 0.2
  with_fx :reverb do
    use_synth :fm
    play (ring :e3, :g3, :b3, :d4, :e4, :g4, :b4, :d5).tick, cutoff: c, amp: a
    sleep 0.25
  end
end

live_loop :lead do
  with_fx :wobble do
    use_synth :sine
    c = 90
    a = 0.3
    play choose([:g5, :b5, :gb5, :a5]), amp: 0.15, cutoff: c
    sleep 0.25
    play :d4, amp: a, cutoff: c
    sleep 0.5
    play :e4, amp: a, cutoff: c
    sleep 0.25
    play :d4, amp: a, cutoff: c
    sleep 0.5
  end
end