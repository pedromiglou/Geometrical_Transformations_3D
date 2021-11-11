function T = roty(a)
% Returns rotation matrix around y

T = [ cos(a)  0 sin(a)  0
      0       1 0       0
      -sin(a) 0 cos(a)  0
      0       0 0       1
    ];
end
