
class PropertyUtil:
    @staticmethod
    def getPropertyString():
        server_name = "AMITAC\SQLEXPRESS"
        database_name = "HMbank"
        trusted_connection = "yes"
        return f"Driver={{SQL Server}};Server={server_name};Database={database_name};Trusted_Connection={trusted_connection};"
