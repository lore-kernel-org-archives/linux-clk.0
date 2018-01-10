Return-Path: <sboyd@codeaurora.org>
Date: Wed, 10 Jan 2018 13:14:07 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: Fix debugfs_create_*() usage
Message-ID: <20180110211407.GK21040@codeaurora.org>
References: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
 <1514977577-11854-5-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1514977577-11854-5-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 01/03, Geert Uytterhoeven wrote:
> When exposing data access through debugfs, the correct
> debugfs_create_*() functions must be used, matching the data types.
> 
> Remove all casts from data pointers passed to debugfs_create_*()
> functions, as such casts prevent the compiler from flagging bugs.
> 
> clk_core.rate and .accuracy are "unsigned long", hence casting their
> addresses to "u32 *" exposed the wrong halves on big-endian 64-bit
> systems.  Fix this by using debugfs_create_ulong() instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
