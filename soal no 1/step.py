def howManyStep(discs):
    # Jumlah minimal langkah untuk memindahkan n disk adalah 2^n - 1
    return 2 ** discs - 1

discs = int(input("Masukkan jumlah disk: "))
step = howManyStep(discs)

print("Jumlah minimal langkah untuk memindahkan", discs, "disk adalah", step)
