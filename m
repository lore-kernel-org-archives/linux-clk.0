Return-Path: <sboyd@codeaurora.org>
Date: Mon, 9 Jan 2017 16:09:11 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: clk-conf: Do not print error messages if
 EPROBE_DEFER
Message-ID: <20170110000911.GD17126@codeaurora.org>
References: <1483524753-32213-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1483524753-32213-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 01/04, Geert Uytterhoeven wrote:
> EPROBE_DEFER is not an error, hence printing an error message like
> 
> 	clk: couldn't get clock 0 for /soc/display@feb00000
> 
> may confuse the user.
> 
> Suppress error messages in case of probe deferral to fix this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
