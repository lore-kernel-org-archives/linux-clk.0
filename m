Return-Path: <ce3a@gmx.de>
Subject: Re: [PATCH] clk: gpio: Add debug messages for clock ops
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
References: <1486239750-24846-1-git-send-email-ce3a@gmx.de>
 <0b44d711-bc62-1ca9-e5fd-78b47108bb50@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Jyri Sarha <jsarha@ti.com>
From: Sergej Sawazki <ce3a@gmx.de>
Message-ID: <d8f39f0c-1029-06f2-b024-6f283f1a9d3f@gmx.de>
Date: Mon, 6 Feb 2017 21:46:03 +0100
MIME-Version: 1.0
In-Reply-To: <0b44d711-bc62-1ca9-e5fd-78b47108bb50@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On Mon, 6 Feb 2017 11:41:44 -0800, Stephen Boyd wrote:
> On 02/04/2017 12:22 PM, Sergej Sawazki wrote:
>> Debug messages are helpful when debugging the clock tree setup.

> Can you use clk tracepoints instead?
>

Probably yes, but I have been debugging the rest of the system with
the help of dynamic debug (dmesg) and found it pretty simple.
The si5351 driver, for example, has a lot dev_dbg()'s, which were
very helpful.
