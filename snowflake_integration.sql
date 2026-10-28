CREATE OR REPLACE API INTEGRATION github_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/your-org/your-repo')
  ENABLED = TRUE;


CREATE OR REPLACE GIT REPOSITORY github_repo
  API_INTEGRATION = github_api_integration
  ORIGIN = 'https://github.com/your-org/your-repo.git';

ALTER GIT REPOSITORY github_repo FETCH;

SHOW GIT BRANCHES IN github_repo;

LS @github_repo/branches/main;

EXECUTE IMMEDIATE FROM
  @github_repo/branches/main/sql/create_tables.sql;
