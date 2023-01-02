from ward import fixture
import typer.testing

from cli.__main__ import app, _load_environment_defaults


@fixture(scope="global")
def runner():
    return typer.testing.CliRunner()


@fixture
def entrypoint():
    _load_environment_defaults(context_settings=app.info.context_settings)
    return app
