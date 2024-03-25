class Customer:
    def __init__(self, customer_id=None, first_name=None, last_name=None, email=None, phone_number=None, address=None):
        self.customer_id = customer_id
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.phone_number = phone_number
        self.address = address

    def __str__(self):
        return f"Customer ID: {self.customer_id}\n" \
               f"First Name: {self.first_name}\n" \
               f"Last Name: {self.last_name}\n" \
               f"Email Address: {self.email}\n" \
               f"Phone Number: {self.phone_number}\n" \
               f"Address: {self.address}"

    # Getter and setter methods
    def get_customer_id(self):
        return self.customer_id

    def set_customer_id(self, customer_id):
        self.customer_id = customer_id

    def get_first_name(self):
        return self.first_name

    def set_first_name(self, first_name):
        self.first_name = first_name

    def get_last_name(self):
        return self.last_name

    def set_last_name(self, last_name):
        self.last_name = last_name

    def get_email(self):
        return self.email

    def set_email(self, email):
        self.email = email

    def get_phone_number(self):
        return self.phone_number

    def set_phone_number(self, phone_number):
        self.phone_number = phone_number

    def get_address(self):
        return self.address

    def set_address(self, address):
        self.address = address


class Account:
    def __init__(self, account_number=None, account_type=None, balance=0):
        self.account_number = account_number
        self.account_type = account_type
        self.balance = balance

    def __str__(self):
        return f"Account Number: {self.account_number}\n" \
               f"Account Type: {self.account_type}\n" \
               f"Balance: {self.balance}"

    # Getter and setter methods
    def get_account_number(self):
        return self.account_number

    def set_account_number(self, account_number):
        self.account_number = account_number

    def get_account_type(self):
        return self.account_type

    def set_account_type(self, account_type):
        self.account_type = account_type

    def get_balance(self):
        return self.balance

    def set_balance(self, balance):
        self.balance = balance

    # Methods for deposits, withdrawals, and interest calculation
    def deposit(self, amount):
        self.balance += amount

    def withdraw(self, amount):
        if self.balance >= amount:
            self.balance -= amount
            return True
        else:
            print("Insufficient balance.")
            return False

    def calculate_interest(self):
        if self.account_type == "Savings":
            interest = self.balance * 0.045
            self.balance += interest
            return interest
        else:
            print("Interest calculation not applicable for this account type.")
            return 0


class Bank:
    @staticmethod
    def deposit(account, amount):
        account.deposit(amount)
        print(f"Deposited {amount} into Account {account.get_account_number()}. New balance: {account.get_balance()}")

    @staticmethod
    def withdraw(account, amount):
        if account.withdraw(amount):
            print(f"Withdrew {amount} from Account {account.get_account_number()}. New balance: {account.get_balance()}")

    @staticmethod
    def calculate_interest(account):
        interest = account.calculate_interest()
        print(f"Interest calculated for Account {account.get_account_number()}: {interest}. New balance: {account.get_balance()}")


# Example usage:
#if __name__ == "__main__":
    # Creating Customer
    #customer1 = Customer(1, "John", "Doe", "john@example.com", "1234567890", "123 Main Street")
    #print(customer1)
    # Creating Account
    #account1 = Account(101, "Savings", 5000)
    #print(account1)
    # Depositing into Account
    #Bank.deposit(account1, 1000)
    # Withdrawing from Account
    #Bank.withdraw(account1, 2000)
    # Calculating Interest for Savings Account
    #Bank.calculate_interest(account1)
