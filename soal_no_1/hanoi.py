def tower_of_hanoi(n, source, target, auxiliary):
    if n == 1:
        print("Pindahkan disk 1 dari", source, "ke", target)
        return
    tower_of_hanoi(n-1, source, auxiliary, target)
    print("Pindahkan disk", n, "dari", source, "ke", target)
    tower_of_hanoi(n-1, auxiliary, target, source)

# contoh pemanggilan fungsi
tower_of_hanoi(3, 'A', 'C', 'B')
