import os

agents = os.listdir("agents")
maps = os.listdir("maps")

i=1
z=1
for a in agents:
    for m in maps:
        with open("start.bat","w") as f:
            f.write(f"(load 0_Main.clp)\n(load 1_Env.clp)\n(load maps/{m})\n(load agents/{a})\n(reset)\n(run)\n(exit)")
        os.system(f'cmd /c "CLIPSDOS.exe -f start.bat > results/{z}_{i}.txt"')
        i=i+1
    z= z+1
    i=1
        