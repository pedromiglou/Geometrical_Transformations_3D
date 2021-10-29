classdef Cube
    % Class to represent the Cube solid
    
    properties
        faces
    end
    
    methods
        function obj = Cube(size)
            % Construct an instance of this class
            obj.faces = [Square(size, 0, 0, 0, 0, 0, 0), Square(size, 1, 0, 0, 0, 0, 0), Square(size, 2, 0, 0, 0, 0, 0) ...
                Square(size, 3, 0, 0, 0, 0, 0), Square(size, 1, 1, 0, 0, 0, 0), Square(size, 1, -1, 0, 0, 0, 0)];
        end
        
        %{
        function obj = move(obj, path)
            % move cube
            for i=1:6
                obj.faces(i) = obj.faces(i).move(path);
            end
        end

        function obj = moveSlowly(obj, path)
            % move cube
            N=100;
            for n=1:N
                obj = obj.move(path/N);
                pause(0.02)
            end
        end
        %}

        function obj = close(obj)
            N=100;
            
            for n=1:N
                obj.faces(1) = obj.faces(1).rotate(obj.faces(2).Points, -pi/2/N, []);
                
                dependentFaces = [obj.faces(4)];
                [obj.faces(3), dependentFaces] = obj.faces(3).rotate(obj.faces(2).Points, pi/2/N, dependentFaces);
                obj.faces(4) = dependentFaces(1);

                obj.faces(4) = obj.faces(4).rotate(obj.faces(3).Points, pi/2/N, []);

                obj.faces(5) = obj.faces(5).rotate(obj.faces(2).Points, -pi/2/N, []);
                obj.faces(6) = obj.faces(6).rotate(obj.faces(2).Points, pi/2/N, []);
                pause(0.02)
            end

            %{
            for n=1:N
                obj.faces(4) = obj.faces(4).move([-1 0 -1  0 0 0]);
                obj.faces(4) = obj.faces(4).move([0 0 0  0 -pi/2 0]/N);
                obj.faces(4) = obj.faces(4).move([1 0 1  0 0 0]);
                pause(0.02)
            end
            %}
        end
    end
end

