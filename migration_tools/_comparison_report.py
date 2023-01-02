from rich.console import Console
from rich.table import Table, Column, Row
from rich.style import Style
from rich import box
from cli._ux import console
from datetime import datetime
from rich.panel import Panel


class report_section_title:

    def __init__(self, section_title, emphasis=False):
        self._section_title = section_title
        self._emphasis = emphasis

    def output_to_console(self, use_console):
        if self._section_title != '':
            if self._emphasis:
                use_console.rule("")
            else:
                use_console.print("")
            use_console.rule(self._section_title)
            if self._emphasis:
                use_console.rule("")
            else:
                use_console.print("")


class table_general(Table):
    ZEBRA_ROWS = ["", "dim"]

    def __init__(self, **kwargs):
        self._clarification = kwargs.get('clarification', '')
        self._msg_if_empty = kwargs.get('msg_if_empty', '')
        show_header = kwargs.get('show_header', True)
        show_footer = kwargs.get('show_footer', False)
        expand = kwargs.get('expand', True)
        row_styles = kwargs.get('row_styles', self.ZEBRA_ROWS)
        title_style = kwargs.get('title_style', Style(color="blue", bold=True))
        header_style = kwargs.get('header_style', Style(color="red", bold=True))
        caption_style = kwargs.get('caption_style', Style(italic=True, overline=True))

        headers = kwargs.get('headers', [])
        footers = kwargs.get('footers', [])
        data = kwargs.get('data', [])

        for kw in [kw for kw in kwargs if kw in ['show_header', 'show_footer', 'expand', 'row_styles', 'title_style',
                                                 'header_style', 'box', 'headers', 'footers', 'data', 'msg_if_empty', 'caption_style', 'clarification']]:
            del kwargs[kw]

        super().__init__(
            show_header=show_header,
            show_footer=show_footer,
            expand=expand,
            row_styles=row_styles,
            title_style=title_style,
            header_style=header_style,
            caption_style=caption_style,
            box=box.MINIMAL_DOUBLE_HEAD,
            **kwargs)

        justification = ["left"] * len(headers)
        for row_idx, data_row in enumerate(data):
            for col_idx, data_col in enumerate(data[row_idx]):
                if not isinstance(data_col, str):
                    justification[col_idx] = 'right'

        for idx, header in enumerate(headers):
            self.add_column(
                header=header,
                footer=str(footers[idx]) if len(footers) > idx else '',
                justify=justification[idx] if len(justification) > idx else 'left',
                no_wrap=(
                    idx == 0), overflow="fold"
            )

        for data_row in data:
            self.add_row(*(map(str, data_row)))


class table_file_list(table_general):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)


class table_comparison_summary(table_general):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)


class table_current_mappings(table_general):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)


class table_issue_summary(table_general):

    def __init__(self, **kwargs):
        show_footer = kwargs.get('show_footer', True)

        for kw in [kw for kw in kwargs if kw in ['show_footer']]:
            del kwargs[kw]
        super().__init__(show_footer=show_footer, **kwargs)


class table_issue_detail(table_general):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)


class table_issue_list(table_general):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)


class table_info_list(table_general):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)


class comparison_report:

    def __init__(self, general_config):
        self._general_config = general_config
        self._report_elements = []

    def add_report_element(self, report_element):
        self._report_elements.append(report_element)

    def output_to_console(self, use_console):
        NL = "\n"
        use_console.print(
            Panel(
                f"Source Database Platform: {self._general_config.get('MIGRATION').get('SOURCE_PLATFORM')}\nTarget Database Platform: {self._general_config.get('MIGRATION').get('TARGET_PLATFORM')}",
                title="Model Comparison Report"))
        for report_element in self._report_elements:
            if isinstance(report_element, Table):
                if report_element.row_count > 0:
                    use_console.print(report_element)
                    if report_element._clarification != '':
                        use_console.print(
                            Panel(
                                report_element._clarification,
                                title="Clarification",
                                padding=1))
                    use_console.print("")
                elif report_element._msg_if_empty != "":
                    use_console.print(" . " + report_element._msg_if_empty)
            elif isinstance(report_element, report_section_title):
                report_element.output_to_console(use_console)

    def to_screen(self):
        self.output_to_console(console)

    def to_file(self):
        generation_timestamp = datetime.now().ctime()
        with open(self._general_config.get('FILE_LOCATIONS').get('DDL_COMPARISON_REPORT'), 'wt') as report_file:
            file_console = Console(file=report_file, width=self._general_config.get(
                'MODEL_VALIDATION').get('REPORT_WIDTH_COLS'))
            file_console.rule(f"Report Generated {generation_timestamp}")
            file_console.print("")
            self.output_to_console(file_console)
            file_console.print("")
            file_console.rule(f"Report Generated {generation_timestamp}")
