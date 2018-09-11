import discord
import asyncio
import subprocess

client = discord.Client()

@client.event
async def on_ready():
    print('Logged in as')
    print(client.user.name)
    print(client.user.id)
    print('------')

@client.event
async def on_message(message):
        if message.content.startswith('!test'):
                subprocess.call("./test.sh")
                await client.send_message(message.channel,'test')

client.run('x')

