list_of_n = []
if (1 <= n and n % 1 == 0):
    if(n != 1):
        if (n % 2 == 0):
            while (n % 2 == 0):
                n = n//2
                while (n % 2 != 0 and n != 1):
                    n = 3*n + 1
                list_of_n.append(n)
            print(list_of_n)
            print(len(list_of_n))
        else:
            while (n % 2 != 0 and n != 1):
                n = 3*n + 1
                while (n % 2 == 0):
                    n = n//2
                list_of_n.append(n)
            print(list_of_n)
            print(len(list_of_n))
    else:
        print("1")
else:
    print("Error")















































