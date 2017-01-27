Return-Path: <sboyd@codeaurora.org>
Date: Thu, 26 Jan 2017 16:15:31 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: mstp: Reformat cpg_mstp_clock_register()
 for git diff
Message-ID: <20170127001531.GT8801@codeaurora.org>
References: <1485165970-25149-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1485165970-25149-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 01/23, Geert Uytterhoeven wrote:
> As the function header of cpg_mstp_clock_register() is split in an
> unusual way, "git diff" gets confused when changes to the body of
> the function are made, and attributes them to the wrong function.
> 
> Reformat the function header to fix this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

I'm not sure it's really necessary, but ok.

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
