Return-Path: <sboyd@codeaurora.org>
Date: Wed, 10 Jan 2018 13:14:09 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: Show symbolic clock flags in debugfs
Message-ID: <20180110211409.GL21040@codeaurora.org>
References: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
 <1514977577-11854-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1514977577-11854-4-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 01/03, Geert Uytterhoeven wrote:
> Currently the virtual "clk_flags" file in debugfs shows the numeric
> value of the top-level framework flags for the specified clock.
> Hence the user must manually interpret these values.
> 
> Moreover, on big-endian 64-bit systems, the wrong half of the value is
> shown, due to the cast from "unsigned long *" to "u32 *".
> 
> Fix both issues by showing the symbolic flag names instead.
> Any non-standard flags are shown as a hex number.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
