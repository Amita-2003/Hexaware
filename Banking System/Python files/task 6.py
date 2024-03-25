def display_transaction_history(transaction_history):
    print("Transaction History:")
    print("----------------------------")
    print("Type\tAmount")
    print("----------------------------")
    for transaction in transaction_history:
        print(f"{transaction[0]}\t${transaction[1]}")
    print("----------------------------")

transaction_history = []

while True:
    transaction_type = input("Enter transaction type (deposit/withdrawl) or 'exit' to quit: ").lower()

    if transaction_type == 'exit':
        break

    if transaction_type not in ['deposit', 'withdrawl']:
        print("Invalid transaction type. Please enter 'deposit' or 'withdrawl'.")
        continue

    amount = float(input("Enter transaction amount: $"))

    transaction_history.append((transaction_type.capitalize(), amount))

display_transaction_history(transaction_history)
