# kbot

DevOps application from scratch.

## Introduction

kbot is a simple Telegram bot that will respond with a greeting, can answer how he's doing (he's always doing fine) and tell a joke.

## Commands

The following commands are supported:

- `/start hello` - The bot says hello and tells you what version it's currently on. 
- `/start how are you?` - The bot replies how he's doing (he's always fine)
- `/start tell me a joke` - The bot tells a joke

## How it works

The bot interacts with users through a Telegram interface. Click the link below to start chatting:

[Telegram Bot Link](https://t.me/danielm342_bot)

## Installation

To install kbot, follow these steps:
1. Clone this [repository](https://github.com/danielm342/kbot).
2. Add your Telegram bot token with the command 'read -s TELE_TOKEN' and export it 'export TELE_TOKEN'.
3. Build a bot with a command 'go build'

## Usage

After installation, run the bot using `./kbot start`. Once running, open your Telegram app and start a conversation with the bot using one of the supported commands listed above.