fprintf('******************Battleship MATLAB Edition******************')
fprintf('\n\nYou have the following five ships');
fprintf(' to place with their respective length:');
fprintf('\n\nCarrier = 5\n');
fprintf('Destroyer = 4\n');
fprintf('Battleship = 3\n');
fprintf('Submarine = 3\n');
fprintf('Patrol Boat = 2\n');
fprintf('\nFYI: Ships are put left to right and top to bottom!');
fprintf('\nHappy Hunting!!');

%Loads a 10 x 10 matrix 
%Initializes xValue counter
for xVal = 1:1:10
    %Initializes yValue counter
    for yVal = 1:1:10
        playerArr(xVal, yVal) = 0;
    end
end

load Battleship % Loads both player (Player_Board) and CPU
%(Opponent_Board) boards (10×10 cell matricies)

subplot(2,1,1); imshow([Opponent_Board{1,:};Opponent_Board{2,:};
Opponent_Board{3,:};Opponent_Board{4,:};Opponent_Board{5,:};
Opponent_Board{6,:};Opponent_Board{7,:};Opponent_Board{8,:};
Opponent_Board{9,:};Opponent_Board{10,:}], 'InitialMagnification', 200);
subplot(2,1,2); imshow([Player_Board{1,:};Player_Board{2,:};
Player_Board{3,:};Player_Board{4,:};Player_Board{5,:};Player_Board{6,:};
Player_Board{7,:};Player_Board{8,:};Player_Board{9,:};Player_Board{10,:}],'InitialMagnification', 200);

Locations = Setup();

%%
%Initializes xValue counter
for xVal = 1:1:10
    %Initializes yValue counter
    for yVal = 1:1:10
        CPUArr(xVal, yVal) = 0;
    end
end

numSpots = 5;
threeCount = 0;

for counter = 1:1:5
    if numSpots == 3
        threeCount = threeCount + 1;
    end
    zero = 0;
    x = Locations(counter, 4);
    y = Locations(counter, 3);
    if Locations(counter, 2) == 1
        while zero < numSpots
            CPUArr(y,x) = 1;
            y = y+1;
            zero = zero + 1;
        end
    else
        while zero < numSpots
            CPUArr(y,x) = 1;
            x = x+1;
            zero = zero + 1;
        end
    end
    if numSpots == 5
        numSpots = numSpots - 1;
    elseif numSpots == 4
        numSpots = numSpots - 1;
    elseif numSpots == 3 && threeCount == 1
        numSpots = numSpots;
    elseif numSpots == 3 && threeCount == 2
        numSpots = numSpots - 1;
    else
        numSpots = numSpots;
    end
end

CPUArr;

%% Carrier Placement 

fprintf('\n\n******************Carrier******************\n')

shipOrientation=input('\nEnter a 0 for a horizontal placement or a 1 for a vertical placement of the carrier:');

while shipOrientation>1 || shipOrientation<0
    shipOrientation=input('\nEnter a 0 for a horizontal placement or a 1 for a vertical placement of the carrier:');
end

% 1 is a vertical placement
if shipOrientation==1
    x=input('\nEnter a x coordinate from 1-6 for the carrier:');
    y=input('\nEnter a y coordinate from 1-6 coordinate for the carrier:');
    while x>6 || x<0
        fprintf('\nINVALID COLUMN COORDINATE')
        x=input('\nPlease enter a starting x coordinate from 1-6 for the carrier:');
    end
    while y>6 || y<0
        fprintf('\nINVALID ROW COORDINATE')
        y=input('\nPlease enter a starting y coordinate from 1-6 for the carrier:');
    end

    Player_Board{y,x} = Boat_FrontBack_2;
    playerArr(y,x) = 1;
    y=y+1;
    Player_Board{y,x} = Boat_Mid_vert;
    playerArr(y,x) = 1;
    y=y+1;
    Player_Board{y,x} = Boat_Mid_vert;
    playerArr(y,x) = 1;
    y=y+1;
    Player_Board{y,x} = Boat_Mid_vert;
    playerArr(y,x) = 1;
    y=y+1;
    Player_Board{y,x} = Boat_FrontBack_1;
    playerArr(y,x) = 1;

    % 0 is a horizontal placement
    elseif shipOrientation==0
        x=input('\nEnter a x coordinate from 1-6 for the carrier:');
        y=input('\nEnter a y coordinate from 1-6 coordinate for the carrier:');
    while x>6 || x<0
        fprintf('\nINVALID COLUMN COORDINATE!!! ')
        x=input('\nPlease Enter a starting x coordinate from 1-6 for the carrier:');
    end
    while y>6 || y<0
        fprintf('\nINVALID ROW COORDINATE!!!')
        y=input('\nPlease Enter a starting y coordinate from 1-6 for the carrier:');
    end

    Player_Board{y,x} = Boat_FrontBack_3;
    playerArr(y,x) = 1;
    x=x+1;
    Player_Board{y,x} = Boat_Mid_hor;
    playerArr(y,x) = 1;
    x=x+1;
    Player_Board{y,x} = Boat_Mid_hor;
    playerArr(y,x) = 1;
    x=x+1;
    Player_Board{y,x} = Boat_Mid_hor;
    playerArr(y,x) = 1;
    x=x+1;
    Player_Board{y,x} = Boat_FrontBack_4;
    playerArr(y,x) = 1;
end

subplot(2,1,1); imshow([Opponent_Board{1,:};Opponent_Board{2,:};
Opponent_Board{3,:};Opponent_Board{4,:};Opponent_Board{5,:};
Opponent_Board{6,:};Opponent_Board{7,:};Opponent_Board{8,:};
Opponent_Board{9,:};Opponent_Board{10,:}], 'InitialMagnification', 200);
subplot(2,1,2); imshow([Player_Board{1,:};Player_Board{2,:};
Player_Board{3,:};Player_Board{4,:};Player_Board{5,:};Player_Board{6,:};
Player_Board{7,:};Player_Board{8,:};Player_Board{9,:};Player_Board{10,:}],'InitialMagnification', 200);

%% Battleship Placement

fprintf('\n\n******************Destroyer******************\n')

shipOrientation=input('\nEnter a 0 for a horizontal placement or a 1 for a vertical placement of the battleship:');

while shipOrientation>1 || shipOrientation<0
    shipOrientation=input('\nEnter a 0 for a horizontal placement or a 1 for a vertical placement of the battleship:');
end

%Enter BoolFlag
thereIsShip = 1;

while thereIsShip
    x=input('\nEnter a x coordinate number from 1-7 for the battleship:');
    y=input('\nEnter a y coordinate number from 1-7 coordinate for the battleship:');
    while x>7 || x<0
        fprintf('\nINVALID COLUMN COORDINATE!!! ')
        x=input('\nPlease Enter a starting x coordinate from 1-7 for the battleship:');
    end
    while y>7 || y<0
        fprintf('\nINVALID ROW COORDINATE!!!')
        y=input('\nPlease Enter a starting y coordinate from 1-7 for the battleship:');
    end
    %Vertical Placement
    if shipOrientation == 1
        if playerArr(y,x) || playerArr(y+1,x) || playerArr(y+2,x) || playerArr(y+3,x) == 1
            fprintf('\nA boat is already placed there! Please pick different coordinates!\n');
            thereIsShip = 1;
        else
            thereIsShip = 0;
        end
    elseif shipOrientation == 0
        if playerArr(y,x) || playerArr(y,x+1) || playerArr(y,x+2) || playerArr(y,x+3) == 1
            fprintf('\nA boat is already placed there! Please pick another!\n');
            thereIsShip = 1;
        else
            thereIsShip = 0;
        end
    end
end

if shipOrientation == 0
    Player_Board{y,x} = Boat_FrontBack_3;
    playerArr(y,x) = 1;
    x=x+1;
    Player_Board{y,x} = Boat_Mid_hor;
    playerArr(y,x) = 1;
    x=x+1;
    Player_Board{y,x} = Boat_Mid_hor;
    playerArr(y,x) = 1;
    x=x+1;
    Player_Board{y,x} = Boat_FrontBack_4;
    playerArr(y,x) = 1;

elseif shipOrientation == 1
    Player_Board{y,x} = Boat_FrontBack_2;
    playerArr(y,x) = 1;
    y=y+1;
    Player_Board{y,x} = Boat_Mid_vert;
    playerArr(y,x) = 1;
    y=y+1;
    Player_Board{y,x} = Boat_Mid_vert;
    playerArr(y,x) = 1;
    y=y+1;
    Player_Board{y,x} = Boat_FrontBack_1;
    playerArr(y,x) = 1;
end

subplot(2,1,1); imshow([Opponent_Board{1,:};Opponent_Board{2,:};
Opponent_Board{3,:};Opponent_Board{4,:};Opponent_Board{5,:};
Opponent_Board{6,:};Opponent_Board{7,:};Opponent_Board{8,:};
Opponent_Board{9,:};Opponent_Board{10,:}], 'InitialMagnification', 200);
subplot(2,1,2); imshow([Player_Board{1,:};Player_Board{2,:};
Player_Board{3,:};Player_Board{4,:};Player_Board{5,:};Player_Board{6,:};
Player_Board{7,:};Player_Board{8,:};Player_Board{9,:};Player_Board{10,:}],'InitialMagnification', 200);

%% Destroyer Placement

fprintf('\n\n******************Battleship******************')

shipOrientation=input('\nEnter a 0 for a horizontal placement or a 1 for a vertical placement of the destroyer:');

while shipOrientation>1 || shipOrientation<0
    shipOrientation=input('\nEnter a 0 for a horizontal placement or a 1 for a vertical placement of the destroyer:');
end

%Enter BoolFlag
thereIsShip = 1;

while thereIsShip
    x=input('\nEnter a x coordinate from 1-8 for the destroyer:');
    y=input('\nEnter a y coordinate from 1-8 for the destroyer:');
    while x>8 || x<0
        fprintf('\nINVALID COLUMN COORDINATE!!! ')
        x=input('\nPlease Enter a starting x coordinate from 1-8 for the destroyer:');
    end
    while y>8 || y<0
        fprintf('\nINVALID ROW COORDINATE!!!')
        y=input('\nPlease Enter a starting y coordinate from 1-8 for the destroyer:');
    end
    %Vertical Placement
    if shipOrientation == 1
        if playerArr(y,x) || playerArr(y+1,x) || playerArr(y+2,x) == 1
            fprintf('\nA boat is already placed there! Please pick different coordinates!\n');
            thereIsShip = 1;
        else
            thereIsShip = 0;
        end
    %Horizontal Placement
    elseif shipOrientation == 0
        if playerArr(y,x) || playerArr(y,x+1) || playerArr(y,x+2) == 1
            fprintf('\nA boat is already placed there! Please pick another!\n');
            thereIsShip = 1;
        else
            thereIsShip = 0;
        end
    end
end

if shipOrientation == 0
    Player_Board{y,x} = Boat_FrontBack_3;
    playerArr(y,x) = 1;
    x=x+1;
    Player_Board{y,x} = Boat_Mid_hor;
    playerArr(y,x) = 1;
    x=x+1;
    Player_Board{y,x} = Boat_FrontBack_4;
    playerArr(y,x) = 1;
elseif shipOrientation == 1
    Player_Board{y,x} = Boat_FrontBack_2;
    playerArr(y,x) = 1;
    y=y+1;
    Player_Board{y,x} = Boat_Mid_vert;
    playerArr(y,x) = 1;
    y=y+1;
    Player_Board{y,x} = Boat_FrontBack_1;
    playerArr(y,x) = 1;
end

subplot(2,1,1); imshow([Opponent_Board{1,:};Opponent_Board{2,:};
Opponent_Board{3,:};Opponent_Board{4,:};Opponent_Board{5,:};
Opponent_Board{6,:};Opponent_Board{7,:};Opponent_Board{8,:};
Opponent_Board{9,:};Opponent_Board{10,:}], 'InitialMagnification', 200);
subplot(2,1,2); imshow([Player_Board{1,:};Player_Board{2,:};
Player_Board{3,:};Player_Board{4,:};Player_Board{5,:};Player_Board{6,:};
Player_Board{7,:};Player_Board{8,:};Player_Board{9,:};Player_Board{10,:}],'InitialMagnification', 200);

%% Submarine Placement

fprintf('\n\n******************Submarine******************')
shipOrientation=input('\nEnter a 0 for a horizontal placement or a 1 for a vertical placement of the submarine:');

while shipOrientation>1 || shipOrientation<0
    shipOrientation=input('\nEnter a 0 for a horizontal placement or a 1 for a vertical placement of the submarine:');
end

%Enter BoolFlag
thereIsShip = 1;

while thereIsShip
    x=input('\nEnter a x coordinate from 1-8 for the submarine:');
    y=input('\nEnter a y coordinate from 1-8 coordinate for the submarine:');
    while x>8 || x<0
        fprintf('\nINVALID COLUMN COORDINATE!!! ')
        x=input('\nPlease Enter a starting x coordinate from 1-8 for the submarine:');
    end
        while y>8 || y<0
            fprintf('\nINVALID ROW COORDINATE!!!')
            y=input('\nPlease Enter a starting y coordinate from 1-8 for the submarine:');
        end

    %Vertical Placement
    if shipOrientation == 1
        if playerArr(y,x) || playerArr(y+1,x) || playerArr(y+2,x) == 1
            fprintf('\nA boat is already placed there! Please pick different coordinates!\n');
            thereIsShip = 1;
        else
            thereIsShip = 0;
        end
    %Horizontal Placement
    elseif shipOrientation == 0
        if playerArr(y,x) || playerArr(y,x+1) || playerArr(y,x+2) == 1
            fprintf('\nA boat is already placed there! Please pick another!\n');
            thereIsShip = 1;
        else
            thereIsShip = 0;
        end
    end
end

if shipOrientation == 0
    Player_Board{y,x} = Boat_FrontBack_3;
    playerArr(y,x) = 1;
    x=x+1;
    Player_Board{y,x} = Boat_Mid_hor;
    playerArr(y,x) = 1;
    x=x+1;
    Player_Board{y,x} = Boat_FrontBack_4;
    playerArr(y,x) = 1;
elseif shipOrientation == 1
    Player_Board{y,x} = Boat_FrontBack_2;
    playerArr(y,x) = 1;
    y=y+1;
    Player_Board{y,x} = Boat_Mid_vert;
    playerArr(y,x) = 1;
    y=y+1;
    Player_Board{y,x} = Boat_FrontBack_1;
    playerArr(y,x) = 1;
end

subplot(2,1,1); imshow([Opponent_Board{1,:};Opponent_Board{2,:};
Opponent_Board{3,:};Opponent_Board{4,:};Opponent_Board{5,:};
Opponent_Board{6,:};Opponent_Board{7,:};Opponent_Board{8,:};
Opponent_Board{9,:};Opponent_Board{10,:}], 'InitialMagnification', 200);
subplot(2,1,2); imshow([Player_Board{1,:};Player_Board{2,:};
Player_Board{3,:};Player_Board{4,:};Player_Board{5,:};Player_Board{6,:};
Player_Board{7,:};Player_Board{8,:};Player_Board{9,:};Player_Board{10,:}],'InitialMagnification', 200);

%% Patrol Boat Placement

fprintf('******************Patrol Boat******************')

shipOrientation=input('\nEnter a 0 for a horizontal placement or a 1 for a vertical placement of the patrol boat:');

while shipOrientation>1 || shipOrientation<0
    shipOrientation=input('\nEnter a 0 for a horizontal placement or a 1 for a vertical placement of the patrol boat:');
end

%Enter BoolFlag
thereIsShip = 1;

while thereIsShip
    x=input('\nEnter a x coordinate from 1-9 for the patrol boat:');
    y=input('\nEnter a y coordinate from 1-9 coordinate for the patrol boat:');
    while x>9 || x<0
        fprintf('\nINVALID COLUMN COORDINATE!!! ')
        x=input('\nPlease Enter a starting x coordinate from 1-9 for the patrol boat:');
    end
    while y>9 || y<0
        fprintf('\nINVALID ROW COORDINATE!!!')
        y=input('\nPlease Enter a starting y coordinate from 1-9 for the patrol boat:');
    end
    %Vertical Placement
    if shipOrientation == 1
        if playerArr(y,x) || playerArr(y+1,x) == 1
            fprintf('\n A boat is already placed there! Please pick different coordinates!\n');
            thereIsShip = 1;
        else
            thereIsShip = 0;
        end
    %Horizontal Placement
    elseif shipOrientation == 0
        if playerArr(y,x) || playerArr(y,x+1) == 1
            fprintf('\n A boat is already placed there! Please pick another!\n');
            thereIsShip = 1;
        else
            thereIsShip = 0;
        end
    end
end

if shipOrientation == 0
    Player_Board{y,x} = Boat_FrontBack_3;
    playerArr(y,x) = 1;
    x=x+1;
    Player_Board{y,x} = Boat_FrontBack_4;
    playerArr(y,x) = 1;
elseif shipOrientation == 1
    Player_Board{y,x} = Boat_FrontBack_2;
    playerArr(y,x) = 1;
    y=y+1;
    Player_Board{y,x} = Boat_FrontBack_1;
    playerArr(y,x) = 1;
end

subplot(2,1,1); imshow([Opponent_Board{1,:};Opponent_Board{2,:};
Opponent_Board{3,:};Opponent_Board{4,:};Opponent_Board{5,:};
Opponent_Board{6,:};Opponent_Board{7,:};Opponent_Board{8,:};
Opponent_Board{9,:};Opponent_Board{10,:}], 'InitialMagnification', 200);
subplot(2,1,2); imshow([Player_Board{1,:};Player_Board{2,:};
Player_Board{3,:};Player_Board{4,:};Player_Board{5,:};Player_Board{6,:};
Player_Board{7,:};Player_Board{8,:};Player_Board{9,:};Player_Board{10,:}],'InitialMagnification', 200);

%% Shell Placement

% Intialize booleans for CPU and Player ships
P1ShipRemaining = 1;
CPUShipRemaining = 1;

% Game runs until no ships remain
while P1ShipRemaining == 1 && CPUShipRemaining == 1
    % Take and check row input
    x = input('\nEnter a x coordinate (1-10): ');
    while x < 1 || x > 10
        x = input('ERROR!! Enter a x coordinate (1-10): ');
    end
    % Take and check column input
    y = input('Enter a y coordinate (1-10): ');
    while y < 1 || y > 10
        y = input('ERROR!! Enter a y coordinate (1-10): ');
    end
% Test if coordinate is new
    while ~(CPUArr(x,y) == 0 || CPUArr(x,y) == 1);
        fprintf('Coordinate has already been tried.\n\n')
        % Take and check row input
        x = input('Enter a row (1-10): ');
        while x < 1 || x > 10
            x = input('ERROR. Enter a row (1-10): ');
        end
        % Take and check column input
        y = input('Enter a column (1-10): ');
        while y < 1 || y > 10
            y = input('ERROR. Enter a column (1-10): ');
        end
    end
    
% Modify board
CPUArr(x,y) = CPUArr(x,y) + 2;
% 0 = Water, 1 = Ship (No Hit), 2 = Miss, 3 = Hit
% Display miss or hit
if CPUArr(x,y) == 2
    Opponent_Board{x, y} = Miss;
    fprintf('Miss!\n')
else
    Opponent_Board{x, y} = Hit;
    fprintf('Hit!\n')
end

subplot(2,1,1); imshow([Opponent_Board{1,:};Opponent_Board{2,:};
Opponent_Board{3,:};Opponent_Board{4,:};Opponent_Board{5,:};
Opponent_Board{6,:};Opponent_Board{7,:};Opponent_Board{8,:};
Opponent_Board{9,:};Opponent_Board{10,:}], 'InitialMagnification', 200);
subplot(2,1,2); imshow([Player_Board{1,:};Player_Board{2,:};
Player_Board{3,:};Player_Board{4,:};Player_Board{5,:};Player_Board{6,:};
Player_Board{7,:};Player_Board{8,:};Player_Board{9,:};Player_Board{10,:}],'InitialMagnification', 200);

% Test for remaining CPU ships
CPUShipRemaining = 0;
for i = 1:10
    for j = 1:10
        if CPUArr(i,j) == 1
            CPUShipRemaining = 1;
        end
    end
    clear j
end
    clear i

    % Run if CPU still has ships
    if CPUShipRemaining == 1
        % Choose x and y coordinates
        x = randi(10);
        y = randi(10);

        % Test if coordinate is new
        while ~(playerArr(x,y) == 0 || playerArr(x,y) == 1)
            % Choose new x and y coordinates
            x = randi(10);
            y = randi(10);
        end

    % Modify board
    playerArr(x,y) = playerArr(x,y) + 2;

    % Display miss or hit
    if playerArr(x,y) == 2
        Player_Board{x, y} = Miss;
    else
        Player_Board{x, y} = Hit;
        fprintf('\nYou got hit!\n')
    end

subplot(2,1,1); imshow([Opponent_Board{1,:};Opponent_Board{2,:};
Opponent_Board{3,:};Opponent_Board{4,:};Opponent_Board{5,:};
Opponent_Board{6,:};Opponent_Board{7,:};Opponent_Board{8,:};
Opponent_Board{9,:};Opponent_Board{10,:}], 'InitialMagnification', 200);
subplot(2,1,2); imshow([Player_Board{1,:};Player_Board{2,:};
Player_Board{3,:};Player_Board{4,:};Player_Board{5,:};Player_Board{6,:};
Player_Board{7,:};Player_Board{8,:};Player_Board{9,:};Player_Board{10,:}],'InitialMagnification', 200);

%Checks for any remaining player ships
P1ShipRemaining = 0;
    for i = 1:10
        for j = 1:10
            if playerArr(i,j) == 1
                P1ShipRemaining = 1;
            end
        end
        clear j
    end
    clear i
    end
end

%% End Game

% Prints end game message
if CPUShipRemaining == 0
    fprintf('\nGreat Shooting! You win!')
else
    fprintf('\nHold this L real quick. Better luck next time.')
end
%Return to MATLAB
input('\nHit enter to return to MATLAB.');