import itertools

board = [
    ['_','_','_','_','_','_','_','_','_','_','_','_'],
    ['_','w','w','w','w','w','w','w','w','w','w','_'],
    ['_','w','w','w','w','w','w','w','w','w','w','_'],
    ['_','w','w','w','w','w','w','w','w','w','w','_'],
    ['_','w','w','w','w','w','w','w','w','w','w','_'],
    ['_','w','w','w','w','w','w','w','w','w','w','_'],
    ['_','w','w','w','w','w','w','w','w','w','w','_'],
    ['_','w','w','w','w','w','w','w','w','w','w','_'],
    ['_','w','w','w','w','w','w','w','w','w','w','_'],
    ['_','w','w','w','w','w','w','w','w','w','w','_'],
    ['_','w','w','w','w','w','w','w','w','w','w','_'],
    ['_','_','_','_','_','_','_','_','_','_','_','_'],
]
infos = {
    'boat-hor': [], # Item (x, [ys]), in the same form boat-hor contains subs
    'boat-ver': []  # Item ([xs], y)
    }

k_row = []
k_col = []
k_cell = set() # tuples (x, y, cont)

def print_board():
    for row in board:
        for cell in row:
            print(f'{cell:6s}', end=' ')
        print()

def output():
    print_board()

    res = '(deffacts battle-field\n'
    for x, row in enumerate(board[1:-1]):
        for y, cell in enumerate(row[1:-1]):
            res += f'(cell (x {x}) (y {y}) (content {"water" if cell == "w" else "boat"}) (status none))\n'
    n = 0
    for hor in infos['boat-hor']:
        res += f'(boat-hor (name nav{n}) (x {hor[0]}) (y {" ".join(str(x) for x in hor[1])}) (size {len(hor[1])}) (status {"safe "*len(hor[1])}))\n'
        n += 1
    for ver in infos['boat-ver']:
        res += f'(boat-ver (name nav{n}) (x {" ".join([str(x) for x in ver[0]])}) (y {ver[1]}) (size {len(ver[0])}) (status {" ".join(["safe" for _ in ver[0]])}))\n'
        n += 1
    for k in k_cell:
        res += f'(k-cell (x {k[0]}) (y {k[1]}) (content {k[2]}))\n'
    for i, k in enumerate(k_row):
        res += f'(k-per-row (row {i}) (num {k}))\n'
    for i, k in enumerate(k_col):
        res += f'(k-per-col (col {i}) (num {k}))\n'
    res += ')'
    
    with open('map.clp', 'w') as f:
        f.write(res)

def sub_positioning(n):
    print('\nSub positioning\n')
    is_valid_pos = False
    for _ in range(n):
        while not is_valid_pos:
            print('Current board')
            print_board()
            try:
                x_pos, y_pos = [int(p)+1 for p in input('Starting cell (format: x, y): ').split(',')]
            except Exception:
                continue
            if not (1 <= x_pos <= 10 and 1 <= y_pos <= 10):
                continue
            if board[x_pos][y_pos] != 'w':
                continue
            is_valid_pos = True
            for x, y in itertools.product(range(x_pos - 1, x_pos + 2), range(y_pos - 1, y_pos + 2)):
                is_valid_pos = is_valid_pos and board[x][y] in ['w', '_']
            if is_valid_pos:
                board[x_pos][y_pos] = 'sub'
                infos['boat-hor'].append((x_pos, [y_pos]))
        is_valid_pos = False

def dir_selection():
    dirs = ['up', 'down', 'left', 'right']
    for i, d in enumerate(dirs):
        print(f'{i}: {d}')
    return dirs[int(input('Select direction: '))]

def wrong_dir(direction, x_pos, y_pos, length):
    if direction == 'up':
        return not 1 <= x_pos - length <= 10
    elif direction == 'down':
        return not 1 <= x_pos + length <= 10
    elif direction == 'left':
        return not 1 <= y_pos - length <= 10
    else:
        return not 1 <= y_pos + length <= 10

def put_vertical_ship(xs, y):
    success = True
    for i, x in enumerate(xs):
        if not 1 <= x <= 10:
            success = False
            continue
        if i == 0:
            success = success and board[x][y] == 'w' and board[x - 1][y - 1] in ['w', '_'] and board[x - 1][y] in ['w', '_'] and board[x - 1][y + 1] in ['w', '_']
        elif i == (len(xs) - 1):
            success = success and board[x][y] == 'w' and board[x + 1][y - 1] in ['w', '_'] and board[x + 1][y] in ['w', '_'] and board[x + 1][y + 1] in ['w', '_']
        else:
            success = success and board[x][y] == 'w' and board[x][y - 1] in ['w', '_'] and board[x][y + 1] in ['w', '_']
    if success:
        for i, x in enumerate(xs):
            if i == 0:
                board[x][y] = 'top'
            elif i == (len(xs) - 1):
                board[x][y] = 'bot'
            else:
                board[x][y] = 'middle'
        infos['boat-ver'].append(([x - 1 for x in xs], y - 1))
    return success

def put_horizontal_ship(x, ys):
    success = True
    for i, y in enumerate(ys):
        if i == 0:
            success = success and board[x][y] == 'w' and board[x - 1][y - 1] in ['w', '_'] and board[x][y - 1] in ['w', '_'] and board[x + 1][y - 1] in ['w', '_']
        elif i == (len(ys) - 1):
            success = success and board[x][y] == 'w' and board[x - 1][y + 1] in ['w', '_'] and board[x][y + 1] in ['w', '_'] and board[x + 1][y + 1] in ['w', '_']
        else:
            success = success and board[x][y] == 'w' and board[x - 1][y] in ['w', '_'] and board[x + 1][y] in ['w', '_']
    if success:
        for i, y in enumerate(ys):
            if i == 0:
                board[x][y] = 'left'
            elif i == (len(ys) - 1):
                board[x][y] = 'right'
            else:
                board[x][y] = 'middle'
        infos['boat-hor'].append((x - 1, [y - 1 for y in ys]))
    return success

def ship_positioning(length, n):
    print(f'\nLen {length} ship positioning\n')
    is_valid_pos = False
    for _ in range(n):
        while not is_valid_pos:
            print('Current board')
            print_board()
            try:
                x_pos, y_pos = [int(p)+1 for p in input('Starting cell (format: x, y): ').split(',')]
            except Exception:
                continue
            if not (1 <= x_pos <= 10 and 1 <= y_pos <= 10):
                continue
            direction = dir_selection()
            if wrong_dir(direction, x_pos, y_pos, length):
                continue
            if direction == 'up':
                xs = list(range(x_pos - length + 1, x_pos + 1))
                is_valid_pos = put_vertical_ship(xs, y_pos)
            elif direction == 'down':
                xs = list(range(x_pos, x_pos + length))
                is_valid_pos = put_vertical_ship(xs, y_pos)
            elif direction == 'left':
                ys = list(range(y_pos - length + 1, y_pos + 1))
                is_valid_pos = put_horizontal_ship(x_pos, ys)
            else:
                ys = list(range(y_pos, y_pos + length))
                is_valid_pos = put_horizontal_ship(x_pos, ys)
        is_valid_pos = False

if __name__=='__main__':
    print('Coordinates from (0, 0), top-left corner, to (9, 9), bottom-right corner')
    
    sub_positioning(n=4)
    ship_positioning(length=2, n=3)
    ship_positioning(length=3, n=2)
    ship_positioning(length=4, n=1)
    
    for row in board[1:-1]:
        k_row.append(sum(1 for cell in row[1:-1] if cell != 'w'))
    
    for col_idx in range(len(board[0]) - 2):
        k_col.append(sum(1 for row in board[1:-1] if row[col_idx + 1] != 'w'))

    n = -1
    while n < 0:
        try:
            n = int(input('How many cells reveal from the beggining?: '))
        except Exception:
            continue

    while len(k_cell) != n:
        try:
            x_pos, y_pos = [int(p)+1 for p in input('Known cell (format: x, y): ').split(',')]
            if not (1 <= x_pos <= 10 and 1 <= y_pos <= 10):
                continue
            k_cell.add((x_pos-1, y_pos-1, board[x_pos][y_pos]))
        except Exception:
            continue

    output()
