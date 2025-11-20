# Repository Guidelines

## Project Structure & Module Organization
- Single Spring Boot module targeting Java 21; main code lives in `src/main/java/com/smu/l04_jpa_km_coding`.
- Domain model is under `.../entity`, with persistence interfaces in `.../repository`.
- Configuration/resources live in `src/main/resources` (Oracle datasource in `application.yaml`).
- Database reference schemas are stored at the repo root as `km_coding.sql` and `km_coding_dummy.sql`.
- Tests belong in `src/test/java` mirroring the main package path.

## Build, Test, and Development Commands
- `./gradlew bootRun` — start the API with the current Oracle datasource settings.
- `./gradlew build` — compile and run the full verification pipeline, producing an artifact in `build/libs`.
- `./gradlew test` — run the JUnit-based test suite only.
- `./gradlew clean` — drop Gradle build outputs if you need a fresh build.

## Coding Style & Naming Conventions
- Follow Spring conventions: 4-space indentation, package-private where possible, and clear method names.
- Entities use Lombok (`@Getter`, `@Builder`, etc.); keep immutability where practical and avoid field injection.
- Keep package layout consistent: `entity/`, `repository/`, and future `service/` or `controller/` layers.
- Prefer descriptive names for IDs and relationships (e.g., `infoPostId`, `memberId`), matching the schema in `README.md`.

## Testing Guidelines
- Use JUnit 5 via `spring-boot-starter-test`; place specs under `src/test/java` with `*Test` suffix.
- Aim to cover repository queries and entity mappings against an Oracle-compatible test setup; stub or use containers as needed.
- Run `./gradlew test` before pushing; add focused tests for new behaviors or schema changes.

## Data & Configuration Notes
- Oracle datasource defaults are in `src/main/resources/application.yaml` (`jdbc:oracle:thin:@//localhost:1521/XEPDB1`, user `km_coding`). Override locally with environment variables or profile-specific YAML to avoid committing secrets.
- Keep `ddl-auto` at `none`; apply schema changes via the provided SQL scripts or migrations you add.

## Commit & Pull Request Guidelines
- History uses short, present-tense summaries (e.g., `sql 및 스프링 설정`); follow that style with concise scope-first messages.
- Reference related issues in the PR description, outline schema or API impacts, and include screenshots for UI-facing changes if added later.
- Ensure the branch is build-clean (`./gradlew build`) and tests pass; describe any test gaps or manual checks performed.
