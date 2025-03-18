# Orbit# Orbit - News Aggregator

A comprehensive news aggregation system featuring circular visualization and temporal organization.

## Quick Start

```bash
# Clone repository
git clone https://github.com/shroudcamo6/orbit.git

# Run setup script
cd orbit
npm run setup
```

## Features

- Circular visualization of news articles
- Temporal organization with 7-day clustering
- RSS feed integration
- MongoDB storage
- Responsive design
- GitHub Pages deployment

## Project Structure

```plaintext
orbit/
├── src/
│   ├── components/
│   │   ├── CircularTimeline.js
│   │   ├── ArticleCard.js
│   │   └── KeywordCloud.js
│   ├── services/
│   │   ├── rssService.js
│   │   ├── database.js
│   │   └── temporalOrganizer.js
│   └── App.js
├── package.json
├── README.md
└── setup.sh
```

## Environment Variables

Create a `.env` file with the following format:

```bash
MONGODB_URI=mongodb://localhost/orbit
RSS_FEEDS=https://feeds.bbci.co.uk/news/rss.xml,https://www.nytimes.com/services/xml/rss/nyt/HomePage.xml
```

## Deployment

1. Install dependencies: `npm install`
2. Start development server: `npm start`
3. Deploy to GitHub Pages: `npm run deploy`

The application will be available at [https://shroudcamo6.github.io/orbit](https://shroudcamo6.github.io/orbit)
