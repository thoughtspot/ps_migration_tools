import os


class ENonCriticalError(Exception):

    def __init__(self):
        self.message = ""
        pass

    def __str__(self):
        return repr(self.message)


class EDBSchemaNotInstalled(ENonCriticalError):
    def __init__(self):
        super().__init__()
        self.message = "This command requires an instance of DBSchema to be installed." + \
            "If you don't have it installed please use csv files instead."


class EInvalidDataTypes(ENonCriticalError):

    def __init__(self, invalid_data_types, location):
        super().__init__()
        self.message = f"Invalid target data types encountered in {location}:\n"
        for idt in invalid_data_types:
            self.message += f'Invalid data type: {idt["db"]}.{idt["s"]}.{idt["t"]}.{idt["c"]} => {idt["dt"]}\n'


class EModelValidationError(ENonCriticalError):

    def __init__(self, issue_count, general_config):
        super().__init__()
        self.message(
            (f"\nThe DDL Comparison raised {issue_count} issues.",
                "Please resolve those first before migrating. The comparison report can be found in ",
                f"{general_config.get('FILE_LOCATIONS').get('DDL_COMPARISON_REPORT')} and suggestions have ",
                f"been made in {general_config.get('FILE_LOCATIONS').get('MANUAL_OVERRIDES')}. You can ",
                "review and update these suggestions and confirm by changing status to OVERRIDE"))


class EYAMLValidationError(ENonCriticalError):

    def __init__(self, general_config):
        super().__init__()
        self.message = ''.join(("There are still issues with the YAML file, or confirmations are needed, please ",
                                "review the override file, which can be found here: ",
                                f'{os.getcwd()}/{general_config["FILE_LOCATIONS"]["MANUAL_OVERRIDES"][2:]}. ',
                                'Additional errors can be found in the log file.'))


class EYAMLPreparationError(ENonCriticalError):

    def __init__(self, error_list):
        super().__init__()
        self.message = "Errors occurred during YAML preparation:\n"
        for e in error_list:
            self.message += {e} + "\n"
