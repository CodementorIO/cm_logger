## 0.0.2
- **BREAKING CHANGE** Adjust `CmLogger::SidekiqFormatter` implementation, extends from `Sidekiq::Logger::Formatters::Base` to avoid exposing details. Require sidekiq 6