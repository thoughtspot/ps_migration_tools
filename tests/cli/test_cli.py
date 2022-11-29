import os

from ward import test

from tests.fixtures import runner, entrypoint


@test("test deltas")
def test_app(cli=runner, app=entrypoint):
    cmd = [
        "migration_tools",
        "deltas",
        "--source-ts-url",
        os.environ["TEST_SOURCE_TS_URL"],
        "--source-username",
        os.environ["TEST_SOURCE_USERNAME"],
        "--source-password",
        os.environ["TEST_SOURCE_PASSWORD"],
        "--data-dir",
        os.environ["TEST_SOURCE_DATA_DIR"],
    ]
    result = cli.invoke(app, cmd)
    print(result.stdout)
    assert result.exit_code == 0
    # assert "Calculating deltas since" in result.stdout
