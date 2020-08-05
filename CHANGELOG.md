## 0.0.3
- fix Gemfile.lock

## 0.0.2
- **BREAKING CHANGE** Adjust `CmLogger::SidekiqFormatter` implementation, extends from `Sidekiq::Logger::Formatters::Base` to avoid exposing details. Require sidekiq 6