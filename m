Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: gpio: Add debug messages for clock ops
To: Sergej Sawazki <ce3a@gmx.de>, mturquette@baylibre.com
References: <1486239750-24846-1-git-send-email-ce3a@gmx.de>
Cc: linux-clk@vger.kernel.org, Jyri Sarha <jsarha@ti.com>
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <0b44d711-bc62-1ca9-e5fd-78b47108bb50@codeaurora.org>
Date: Mon, 6 Feb 2017 11:41:44 -0800
MIME-Version: 1.0
In-Reply-To: <1486239750-24846-1-git-send-email-ce3a@gmx.de>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 02/04/2017 12:22 PM, Sergej Sawazki wrote:
> Debug messages are helpful when debugging the clock tree setup.
>
> Cc: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
>

Can you use clk tracepoints instead?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
