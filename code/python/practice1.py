def hs(n):
    c = 1
    if(0 < n and n % 1 == 0):
        if (n != 1):
            if (n % 2 == 0):
                print(n)
                while (n % 2 == 0 or n == 1):
                    n = n//2
                    print(n)
                    c += 1
                    if(n == 1):
                        print("None")
                        print("length of sequence is", c)
                        break
                    while (n % 2 != 0 and n != 1):
                        n = 3*n + 1
                        print(n)
                        c += 1
            else:
                print (n)
                while (n % 2 != 0 or n == 1):
                    if(n == 1):
                        print("None")
                        print("length of sequence is", c)
                        break
                    n = 3*n + 1
                    print(n)
                    c += 1
                    while (n % 2 == 0):
                        n = n//2
                        print(n)
                        c += 1
        else:
            print("1")
            print("None")
            print("length of sequence is 1")
    else:
        print("Error: enter a whole number between (including) 1 and infinity")
