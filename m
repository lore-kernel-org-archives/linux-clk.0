Return-Path: <sboyd@codeaurora.org>
Date: Wed, 2 Aug 2017 18:38:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com,
	Franklin Cooper <fcooper@ti.com>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH] clk: keystone: sci-clk: Fix sci_clk_get
Message-ID: <20170803013813.GR2146@codeaurora.org>
References: <1501698733-27316-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1501698733-27316-1-git-send-email-t-kristo@ti.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/02, Tero Kristo wrote:
> ﻿Currently a bug in the sci_clk_get implementation causes it to always
> return a clock belonging to the last device in the static list of clock
> data. This is due to a bug in the init code that causes the array
> used by sci_clk_get to only be populated with the clocks for the last
> device, as each device overwrites the entire array with its own clocks.
> 
> Fix this by calculating the actual number of clocks for the SoC, and
> allocating the whole array in one go. Also, we don't need the handle
> to the init data array anymore after doing this, instead we can
> just compare the dev_id / clk_id against the registered clocks and
> use binary search for speed.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Reported-by: Dave Gerlach <d-gerlach@ti.com>
> Fixes: b745c0794e2f ("clk: keystone: Add sci-clk driver support")
> Cc: Franklin Cooper <fcooper@ti.com>
> Cc: Nishanth Menon <nm@ti.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
