# PWNMuseum

> A curated museum documenting the evolution of console security exploits through an interactive timeline.

PWNMuseum preserves the history of privilege escalation in gaming consoles, from early user-mode exploits to bootrom-level vulnerabilities. The application demonstrates production-grade Rails architecture with domain-driven design principles, comprehensive testing, and security-first development practices.

---

## Executive Summary

### Problem Statement

Console security research represents a critical field in cybersecurity, yet historical exploit data remains fragmented across forums, wikis, and documentation. PWNMuseum centralizes this information in a structured, queryable format while maintaining technical accuracy and historical context.

### Solution

A monolithic Rails 8 application featuring:
- Interactive timeline visualization with impact-based color coding
- RESTful API architecture with slug-based routing
- Full CRUD operations for platforms, exploits, and hacker credits
- Production-grade security practices (input sanitization, CSP headers)
- Comprehensive test coverage (TDD methodology with RSpec)

### Key Metrics

- **Test Coverage**: 88 RSpec examples covering models, controllers, and helpers
- **Security**: Brakeman-compliant, bundler-audit verified, CSP headers enforced
- **Code Quality**: rubocop-rails-omakase compliant (Rails Foundation style guide)
- **Database**: PostgreSQL with referential integrity constraints at DB level

---

## Screenshots

### Platform Overview
Browse all gaming platforms with their release dates and exploit counts.

![Platform Overview](app/assets/images/screenshots/platforms-overview.png)

### Interactive Timeline
Visualize exploits chronologically with color-coded impact levels (green: user mode, yellow: kernel mode, orange: hypervisor, red: bootrom).

![Timeline](app/assets/images/screenshots/timeline.png)

### Exploit Details
View detailed information about each exploit including description, discoverers, and technical impact.

![Exploit Details](app/assets/images/screenshots/exploit-details.png)

---

## Technical Stack

### Core Technologies

| Component | Technology | Version | Justification |
|-----------|-----------|---------|---------------|
| **Runtime** | Ruby | 3.4.8 | Latest stable with PRISM parser (faster compilation, better error messages) |
| **Framework** | Rails | 8.1.2 | Current stable release with solid_async and authentication generator |
| **Database** | PostgreSQL | Latest | ACID compliance, foreign key constraints, production-grade integrity |
| **Testing** | RSpec + FactoryBot | Latest | Industry standard for Rails testing |
| **Styling** | TailwindCSS | Latest | Utility-first CSS with JIT compilation |
| **Frontend** | Stimulus + Turbo | Latest | Hotwire stack for reactive UX without JavaScript bloat |

### Development Tools

- **Linting**: rubocop-rails-omakase (Rails Foundation official style)
- **Security Scanning**: Brakeman (static analysis), bundler-audit (dependency vulnerabilities)
- **Containerization**: Docker multi-stage build for production deployments
- **CI/CD**: GitHub Actions with cached RuboCop execution

---

## Architecture

### Domain Model

```mermaid
erDiagram
    Platform ||--o{ Exploit : "has many"
    Hacker ||--o{ Credit : "has many"
    Exploit ||--o{ Credit : "has many"
    Hacker }o--o{ Exploit : "credited via"

    Platform {
        string slug PK
        string name
        string manufacturer
        date release_date
        integer generation
    }

    Exploit {
        bigint id PK
        string title
        date date_discovered
        integer impact_level
        text description
        string cve_id
        string media_url
        bigint platform_id FK
    }

    Hacker {
        bigint id PK
        string handle UK
        boolean team
    }

    Credit {
        bigint exploit_id FK
        bigint hacker_id FK
        }
```

### Design Patterns

#### 1. Slug-Based Routing
Platforms use human-readable URLs instead of numeric IDs for SEO and user experience:

```ruby
# config/routes.rb
resources :platforms, param: :slug, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]
```

#### 2. Enum-Based Impact Classification
Exploit severity is enforced at the database level with Rails enum mapping:

```ruby
enum :impact_level, {
  user_mode: 0,
  kernel_mode: 1,
  hypervisor: 2,
  bootrom: 3
}, prefix: true
```

#### 3. Many-to-Many with Join Attributes
The `Credit` model enables proper many-to-many relationships between hackers and exploits while allowing future attribution metadata (date discovered, contribution type, etc.).

#### 4. XSS Prevention via Sanitization
User-submitted HTML descriptions are sanitized using Rails' built-in `SafeListSanitizer` (Loofah-based):

```ruby
def sanitize_description
  sanitizer = Rails::Html::SafeListSanitizer.new
  self.description = sanitizer.sanitize(
    description,
    tags: %w[p br strong em a ul ol li h1 h2 h3 h4 h5 h6 blockquote code pre],
    attributes: %w[href title]
  )
end
```

---

## Installation

### Prerequisites

- Ruby 3.4.8+ (install via rbenv, rvm, or chruby)
- PostgreSQL 14+ (for local development)
- Node.js 18+ (for TailwindCSS compilation)

### Local Development Setup

```bash
# Clone repository
git clone https://github.com/yourusername/pwnmuseum.git
cd pwnmuseum

# Install Ruby dependencies
gem install bundler
bundle install

# Configure database (edit config/database.yml if needed)
cp .env.example .env

# Create and migrate database
rails db:create
rails db:migrate

# Optional: Load production-like seed data
rails db:seed

# Start development server
rails server

# Visit http://localhost:3000
```

### Docker Deployment

#### Important: Database Requirements

The Dockerfile contains **only the Rails application**, not PostgreSQL. You have two options:

**Option 1: Docker Compose (Recommended for Development)**

A `docker-compose.yml` file is included in this repository. Simply run:

```bash
# Set your master key in .env or pass it directly
export RAILS_MASTER_KEY=$(cat config/master.key)

# Start all services
docker-compose up

# Or run in detached mode
docker-compose up -d

# Visit http://localhost:3000
```

The docker-compose configuration includes:
- PostgreSQL 16 with health checks
- Volume persistence for database data
- Proper service dependencies (web waits for db to be healthy)

**Option 2: External Database (Production)**
Connect to an external PostgreSQL instance using environment variables:

```bash
# Build image
docker build -t pwnmuseum .

# Run container connected to external database
docker run -d \
  -p 80:80 \
  -e RAILS_MASTER_KEY=<your-master-key> \
  -e DATABASE_URL="postgres://user:pass@host:5432/pwnmuseum_production" \
  --name pwnmuseum \
  pwnmuseum
```

#### Environment Variables

Configure these variables in `.env` or pass them at runtime:

| Variable | Description | Required |
|----------|-------------|----------|
| `RAILS_MASTER_KEY` | Key to decrypt credentials.yml.enc | Yes (production) |
| `DATABASE_URL` | Full PostgreSQL connection string | Yes (if not using individual vars) |
| `POSTGRES_HOST` | Database hostname | Yes |
| `POSTGRES_USER` | Database username | Yes |
| `POSTGRES_PASSWORD` | Database password | Yes |
| `POSTGRES_PORT` | Database port (default: 5432) | Optional |
| `RAILS_MAX_THREADS` | Database connection pool size | Optional (default: 5) |

---

## Quality Assurance & Testing

### Test-Driven Development (TDD) Workflow

This project follows strict TDD principles:

1. **Red**: Write failing test spec
2. **Green**: Implement minimum code to pass test
3. **Refactor**: Improve code while maintaining test coverage

### Testing Strategy

| Layer | Tool | Coverage Areas |
|-------|------|----------------|
| **Model** | RSpec | Validations, scopes, enums, associations |
| **Controller** | RSpec | CRUD actions, authorization, response formats |
| **Helper** | RSpec | View helper methods |
| **System** | (Not implemented) | End-to-end user flows |

### Running Tests

```bash
# Full test suite
bundle exec rspec

# Specific test file
bundle exec rspec spec/models/exploit_spec.rb

# With documentation format
bundle exec rspec --format documentation

# Coverage report (requires simplecov gem)
COVERAGE=true bundle exec rspec
```

### Static Analysis & Security Scanning

```bash
# RuboCop linting (Rails Foundation style)
bundle exec rubocop

# Security vulnerability scan (Brakeman)
bundle exec brakeman --no-pager

# Dependency vulnerability scan (bundler-audit)
bundle exec bundler-audit

# JavaScript dependency audit (importmap)
bin/importmap audit
```

### CI/CD Pipeline

The `.github/workflows/ci.yml` pipeline executes on every push and PR:

1. **Security Scans**: Brakeman, bundler-audit, importmap audit
2. **Linting**: RuboCop with GitHub Actions cache for performance
3. **Testing**: RSpec suite execution (when PostgreSQL is available)

---

## Project Structure

```
pwnmuseum/
├── app/
│   ├── controllers/          # Skinny controllers (orchestration only)
│   │   ├── application_controller.rb
│   │   ├── exploits_controller.rb
│   │   ├── hackers_controller.rb
│   │   └── platforms_controller.rb
│   ├── models/               # Business logic layer
│   │   ├── application_record.rb
│   │   ├── credit.rb         # Join table for exploits <-> hackers
│   │   ├── exploit.rb        # XSS sanitization, enums, scopes
│   │   ├── hacker.rb         # Unique handle constraint
│   │   └── platform.rb       # Slug generation, chronological scopes
│   ├── views/                # ERB templates with TailwindCSS
│   └── helpers/              # View helper methods
├── config/
│   ├── routes.rb             # RESTful resource routing
│   └── database.yml          # PostgreSQL configuration
├── db/
│   ├── migrate/              # Schema migrations with foreign keys
│   ├── schema.rb             # Database structure definition
│   └── seeds.rb              # Historical exploit data
├── spec/                     # RSpec test suite (TDD)
│   ├── controllers/          # Controller specs
│   ├── factories/            # FactoryBot definitions
│   ├── models/               # Model specs (validations, scopes)
│   └── rails_helper.rb       # RSpec configuration
├── .github/workflows/        # CI/CD pipeline
├── Dockerfile                # Production-optimized container
└── README.md                 # This file
```

---

## Database Schema

### Key Constraints

1. **Platforms**: `slug` must be unique (URL routing requirement)
2. **Hackers**: `handle` must be unique (identity requirement)
3. **Credits**: Composite unique index on `(exploit_id, hacker_id)` (prevents duplicate attribution)
4. **Exploits**: Foreign key to `platforms` with `CASCADE` delete
5. **Credits**: Foreign keys to both `exploits` and `hackers` with `CASCADE` delete

### Index Strategy

- `index_credits_on_exploit_id_and_hacker_id`: Composite index for join queries + uniqueness
- `index_exploits_on_date_discovered`: Chronological ordering performance
- `index_exploits_on_impact_level`: Filtering by severity
- `index_platforms_on_slug`: URL lookup performance

---

## Security Considerations

### Implemented Measures

1. **XSS Prevention**: HTML sanitization via `SafeListSanitizer`
2. **SQL Injection Prevention**: ActiveRecord parameterized queries (no string interpolation)
3. **CSRF Protection**: Rails built-in `protect_from_forgery`
4. **Content Security Policy**: CSP headers restricting script sources
5. **Strong Parameters**: Controller-level parameter whitelisting
6. **Dependency Scanning**: Automated via CI/CD (bundler-audit, Brakeman)

### Future Enhancements

- [ ] Authentication system (Rails 8 generator)
- [ ] Role-based access control (admin vs. contributor)
- [ ] Rate limiting for API endpoints
- [ ] Audit logging for content modifications
- [ ] PGP signatures for exploit code submissions

---

## Performance Optimization

### Current Optimizations

1. **Bootsnap**: Precompiled gem code and app code for faster boot times
2. **Database Indexes**: All foreign keys and frequently queried columns indexed
3. **Image Optimization**: Screenshot assets pre-compressed
4. **Asset Compilation**: TailwindCSS JIT compilation in production

### Monitoring Recommendations

- [ ] APM integration (New Relic, Skylight, or Scout)
- [ ] Database query monitoring (PgHero)
- [ ] Error tracking (Sentry or Honeybadger)
- [ ] Uptime monitoring (Pingdom or UptimeRobot)

---

## Contributing

### Development Workflow

1. Fork repository and create feature branch
2. Write tests for new functionality (Red phase)
3. Implement functionality (Green phase)
4. Refactor while maintaining test coverage (Refactor phase)
5. Run full test suite: `bundle exec rspec`
6. Run RuboCop: `bundle exec rubocop`
7. Submit pull request with description of changes

### Code Style

This project follows `rubocop-rails-omakase` (Rails Foundation official style guide). Ensure your editor is configured with:

- **Indentation**: 2 spaces (no tabs)
- **Line Length**: 120 characters
- **Array Literals**: Spaces inside brackets `[1, 2, 3]`
- **String Literals**: Double quotes by default

---

## Deployment

### Production Checklist

- [ ] Set `RAILS_ENV=production`
- [ ] Configure `RAILS_MASTER_KEY` (credentials.yml.enc decryption)
- [ ] Set database URL (`DATABASE_URL`)
- [ ] Precompile assets (`rails assets:precompile`)
- [ ] Configure reverse proxy (Nginx/Apache)
- [ ] Enable SSL/TLS (Let's Encrypt recommended)
- [ ] Set up log rotation (logrotate)
- [ ] Configure backup strategy (pg_dump for database)

### Kamal Deployment (Recommended)

```bash
# Install Kamal
gem install kamal

# Deploy to servers
kamal setup
kamal deploy
```

---

## License

GNU General Public License v3.0 - See [LICENSE](LICENSE) for details.

This license ensures that:
- The software remains free and open-source
- Derivative works must also be GPL-licensed
- Users have freedom to study, modify, and distribute the code

---

## Acknowledgments

- **Rails Foundation**: For rubocop-rails-omakase style guide
- **Console Security Community**: For documenting exploit history
- **geohot, fail0verflow, and others**: For pioneering console homebrew
