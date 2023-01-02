import logging
from pathlib import Path

from rich.console import Console
from rich.style import Style

from rich.theme import Theme
from rich.logging import RichHandler
import pandas as pd
import inspect
import sys
from rich.panel import Panel
import traceback

console = Console(
    width=120,
    theme=Theme({
        "debug": "#cccccc",
        "info": "white",
        "warning": "yellow",
        "error": "bold red",
        "critical": "bold red",
        "success": "bold green",
        "repr.ellipsis": "medium_purple1"}),
)


def output_message(msg, msg_style="debug"):
    EMOJIS = {
        "debug": ":eyes:",
        "info": ":information:",
        "warning": ":warning:",
        "error": ":prohibited:",
        "critical": ":x:",
        "success": ":thumbs_up:"}

    last_line_no = inspect.currentframe().f_back.f_lineno
    func = inspect.currentframe().f_back.f_code
    log_msg = f"{msg}: [{func.co_name} in {func.co_filename}:{last_line_no}]"

    if msg_style == "debug":
        logging.debug(log_msg)
    elif msg_style == "info":
        logging.info(log_msg)
    elif msg_style == "warning":
        logging.warning("WARNING: " + log_msg)
    elif msg_style == "error":
        logging.error("ERROR:" + log_msg)
    elif msg_style == "critical":
        # print(sys.exc_info())
        # print("\n".join(sys.exc_info()[1].args))
        logging.error("CRITICAL:" + log_msg)
        logging.error("ERROR:" + "\n".join(sys.exc_info()[1].args))
        # logging.error("VALUE:" + sys.exc_info()[0])
        tb_list = traceback.extract_tb(sys.exc_info()[2])
        tb_list = traceback.format_list(tb_list)
        logging.error("TRACEBACK:" + "\n".join(tb_list))

    elif msg_style == "success":
        logging.info(log_msg)

    if msg_style != "debug":
        if msg_style in EMOJIS:
            msg = f"{EMOJIS[msg_style]} {msg}"
        console.print(Panel(f"{msg}", style=msg_style))

    if msg_style == 'critical':
        sys.exit()


def ensure_directories(data_dir: Path) -> None:
    """
    Creates the directory structure required.

    < data-dir >
    ├─ new/
    │  ├─ ...
    │  └─ ___.csv
    ├─ cs_tools_cloud/
    │  ├─ ...
    │  └─ ___.csv
    ├─ cs_tools_falcon/
    │  ├─ ...
    │  └─ ___.csv
    ├─ info/
    │  ├─ ...
    │  └─ ___.csv
    ├─ modified/
    │  ├─ ...
    │  └─ ___.csv
    ├─ ...
    └─ ___.csv


    Parameters
    ---------
    data_dir : pathlib.Path

    """
    Path(data_dir).joinpath("new").mkdir(parents=True, exist_ok=True)
    Path(data_dir).joinpath("modified").mkdir(parents=True, exist_ok=True)
    Path(data_dir).joinpath("cs_tools_falcon").mkdir(parents=True, exist_ok=True)
    Path(data_dir).joinpath("cs_tools_cloud").mkdir(parents=True, exist_ok=True)


def comment(df: pd.DataFrame, *, msg: str, level: str = "INFO", **extra) -> pd.DataFrame:
    """
    Log a message.

    Parameters
    ----------
    df : pandas.DataFrame
      dataframe to inject into log messages

    msg : str
      string to write to log messages

    level : str = INFO
      logging levelname

    **extra
      locals to pass into the message format
    """
    extra["df"] = df
    lvl = logging.getLevelName(level)
    logging.log(lvl, msg.format(**extra))
    return df
