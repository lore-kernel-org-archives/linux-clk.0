Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Jul 2015 14:39:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sergej Sawazki <ce3a@gmx.de>
Cc: mturquette@baylibre.com, jsarha@ti.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 0/4] clk: add gpio controlled clock multiplexer
Message-ID: <20150702213953.GH4301@codeaurora.org>
References: <1435501496-25761-1-git-send-email-ce3a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1435501496-25761-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

On 06/28, Sergej Sawazki wrote:
> This patch series adds a common clock driver for basic gpio controlled clock
> multiplexers. It does also contain some minor fixes for the gpio-gate-clock.
> 
> The first two patches are minor fixes for the gpio-gate-clock. Patch three
> refactors the file clk-gpio-gate.c and adds the new gpio-mux-clock driver.
> Finally, patch four renames the file clk-gpio-gate.c to clk-gpio.c. 
> 
> Based on clk-next.

I applied all of them to clk-next but you won't see it in -next
until rc1 drops.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
