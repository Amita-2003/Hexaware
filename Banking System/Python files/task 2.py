balance = float(input("Enter your current balance: "))
option = input("Choose an option - Check Balance, Withdraw, Deposit: ")

if option == "Check Balance":
    print("Your current balance is: ", balance)
elif option == "Withdraw":
    amount = float(input("Enter the amount to withdraw: "))
    if amount > balance:
        print("Insufficient balance.")
    elif amount % 100 != 0 and amount % 500 != 0:
        print("Withdrawal amount must be in multiples of 100 or 500.")
    else:
        balance -= amount
        print("Withdrawal successful. Your new balance is: ", balance)
elif option == "Deposit":
    amount = float(input("Enter the amount to deposit: "))
    balance += amount
    print("Deposit successful. Your new balance is: ", balance)
else:
    print("Invalid option.")
