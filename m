Return-Path: <sboyd@codeaurora.org>
Date: Wed, 10 Jan 2018 13:14:03 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: Improve flags doc for
 of_clk_detect_critical()
Message-ID: <20180110211403.GI21040@codeaurora.org>
References: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
 <1514977577-11854-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1514977577-11854-2-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 01/03, Geert Uytterhoeven wrote:
> The "flags" parameter passed to of_clk_detect_critical() cannot be a
> pointer to a real clk_core.flags field, as clk_core is private to the
> clock framework internals.
> 
> Change the comment to refer to top-level framework flags instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
