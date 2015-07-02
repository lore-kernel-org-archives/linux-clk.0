Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Jul 2015 14:38:50 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sergej Sawazki <ce3a@gmx.de>
Cc: mturquette@baylibre.com, jsarha@ti.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 4/4] clk: Rename clk-gpio-gate.c to clk-gpio.c
Message-ID: <20150702213850.GG4301@codeaurora.org>
References: <1435501496-25761-1-git-send-email-ce3a@gmx.de>
 <1435501496-25761-5-git-send-email-ce3a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1435501496-25761-5-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

On 06/28, Sergej Sawazki wrote:
> The file clk-gpio-gate.c does not only contain the gate clock, but also
> the mux clock. Rename the file to clk-gpio.c.
> 
> Cc: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
> ---

Applied to clk-next (but won't appear in -next until after rc1
drops).

Next time feel free to generate this sort of thing with -M -C so
that the diff is much smaller.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
