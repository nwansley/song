
use_bpm 120

define :looper do |a, b, y, x|
  play a, amp: 1.4
  sleep y
  play b, amp: 1.4
  sleep x
end

define :notes do |a, b, c, d, e, f, g, h, y|
  play a
  sleep y
  play b
  sleep y
  play c
  sleep y
  play d
  sleep y
  play e
  sleep y
  play f
  sleep y
  play g
  sleep y
  play h
  sleep y
end
x = 0.5
define :a do
  play :a5,amp: x
  play :a6,amp: x
  sleep 0.7
end
define :c do
  play :c6,amp: x
  play :c7,amp: x
  sleep 0.7
end
define :g do
  play :g5,amp: x
  play :g6,amp: x
  sleep 0.7
end
define :f do
  play :f5,amp: x
  play :f6,amp: x
  sleep 0.7
end
define :d do
  play :d6,amp: x
  play :d7,amp: x
  sleep 0.7
end
define :e do
  play :e6,amp: x
  play :e7,amp: x
  sleep 0.7
end
define :b do
  play :b5,amp: x
  play :b6,amp: x
  sleep 0.7
end

live_loop:intro do
  2.times do
    use_synth  :prophet
    a
    a
    c
    a
    d
    a
    e
    d
    
    2.times do
      c
    end
    
    e
    c
    a
    e
    a
    g
    g
    b
    g
    c
    g
    d
    c
    f
    f
    c
    f
    c
    f
    c
    b
    print x
  end
  1.times do
    a
    x = x - 0.025
    a
    c
    x = x - 0.025
    a
    d
    x = x - 0.025
    a
    e
    x = x - 0.025
    d
    
    2.times do
      play c
    end
    
    e
    x = x - 0.025
    c
    a
    x = x - 0.064
    e
    a
    x = x - 0.025
    g
    g
    x = x - 0.025
    b
    g
    x = x - 0.025
    c
    g
    x = x - 0.05
    d
    c
    x = x - 0.025
    f
    f
    x = x - 0.05
    c
    f
    x = x - 0.03
    c
    f
    x = x - 0.03
    c
    b
    print x
  end
  stop
end
q = 0
live_loop:q do
  q = q + 1
  sleep 4
  print q
end
sleep 9.5
live_loop:para do
  2.times do
    if q < 24
      use_synth :pulse
      notes :c1, :e1, :g1, :b1, :c2, :b1, :g1, :e1, 2.8
    else
      sleep 1
    end
  end
  2.times do
    if q < 24
      use_synth  :dsaw
      notes :c1, :e1, :g1, :b1, :c2, :d2, :e2, :f2, 2.8
    else
      sleep 1
    end
  end
end
sleep 10.7

live_loop:loop do
  if q < 24
    use_synth :dark_ambience
    use_synth_defaults sustain: 0.25
    looper :a5, :b6, 0.42, 2.38
  else
    sleep 1
  end
end
live_loop:bass do
  a = [:e3, :e3, :g3, :e3, 0, :d3, :c3, :b2]
  if x == 0.05099999999999984
    n = 0
    define :sus do
      play a[n], amp: 0.6
      sleep 0.4
      n = n + 1
    end
    define :suss do
      play a[n], amp: 0.6
      sleep 1
      n = n + 1
    end
    8.times do
      if q < 24
        use_synth :fm
        use_synth_defaults sustain: 0.25
        sus
        suss
        sus
        suss
        if n == 8
          n = 0
        end
      else
        sleep 1
      end
    end
    n = 0
  end
  sleep 0.1
end

sleep 9.5
live_loop:woah do
  
  u = 0
  t = 0
  if x == 0.05099999999999984
    sleep 9.5
    t = 1
    print t
  end
  12.times do
    if t == 1
      if u == 0
        use_synth :growl
        d = 2
      end
      if u == 4
        use_synth :bnoise
        d = 2
      end
      if u == 8
        use_synth :square
        d = 1
        
      end
      if q < 24
        play :g1, attack: 2, sustain: 0.4, relax_time: 2, release: d
        sleep 2.8
        u = u + 1
        print u
      else
        sleep 1
      end
    end
  end
  sleep 0.1
end
live_loop:random do
  use_synth :fm
  if q > 25
    if q < 31
      play choose ([:e4, :e4, :g4, :e5, :d2, :d4, :c4, :b3])
      sleep rand
    end
  end
  sleep 0.1
end
live_loop:outro do
  if q > 28
    if q < 33
      1.times do
        use_synth  :prophet
        a
        x = x + 0.025
        a
        c
        x = x + 0.025
        a
        d
        x = x + 0.025
        a
        e
        x = x + 0.025
        d
        
        2.times do
          c
        end
        
        e
        x = x + 0.025
        c
        a
        x = x + 0.064
        e
        a
        x = x + 0.025
        g
        g
        x = x + 0.025
        b
        g
        x = x + 0.025
        c
        g
        x = x + 0.05
        d
        c
        x = x + 0.025
        f
        f
        x = x + 0.05
        c
        f
        x = x + 0.03
        c
        f
        x = x + 0.03
        c
        b
        print x
      end
    end
  else
    sleep 0.1
  end
  sleep 1
end