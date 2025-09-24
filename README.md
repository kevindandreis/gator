# Gator - RSS Feed Aggregator

Gator is a command-line RSS feed aggregator that helps you follow and read your favorite RSS feeds from the terminal.

## Prerequisites

- [Go](https://golang.org/dl/) (version 1.21 or later)
- [PostgreSQL](https://www.postgresql.org/download/) (version 13 or later)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/gator.git
   cd gator
   ```

2. Install the Gator CLI:
   ```bash
   go install github.com/yourusername/gator@latest
   ```

   This will install the `gator` binary to your `$GOPATH/bin` directory. Make sure `$GOPATH/bin` is in your system's PATH.

## Configuration

1. Create a `.gatorconfig.json` file in the root directory with the following content:
   ```json
   {
       "port": "8080",
       "env": "development",
       "db": {
           "host": "localhost",
           "port": "5432",
           "user": "your_username",
           "password": "your_password",
           "dbname": "gator"
       },
       "jwt_secret": "your-secret-key-here"
   }
   ```

2. Create a PostgreSQL database named `gator` (or your preferred database name):
   ```bash
   createdb gator
   ```

## Available Commands

### Authentication
- `gator register <email> <password>` - Register a new user
- `gator login <email> <password>` - Log in to your account
- `gator reset` - Reset your password

### Feed Management
- `gator addfeed <url>` - Add a new RSS feed to follow
- `gator feeds` - List all available feeds
- `gator follow <feed-id>` - Start following a feed
- `gator following` - List all feeds you're following
- `gator unfollow <feed-id>` - Stop following a feed

### Content Browsing
- `gator browse` - Browse your feed content
- `gator agg` - Aggregate and display latest content from your feeds

## Development

1. Clone the repository
2. Install dependencies:
   ```bash
   go mod download
   ```
3. Build the project:
   ```bash
   go build -o gator .
   ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
