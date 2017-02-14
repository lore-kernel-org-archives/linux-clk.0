Return-Path: <sboyd@codeaurora.org>
Date: Tue, 14 Feb 2017 11:00:48 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] clk: renesas: mstp: ensure register writes complete
Message-ID: <20170214190048.GU25384@codeaurora.org>
References: <20170214160805.20156-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170214160805.20156-1-chris.brandt@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/14, Chris Brandt wrote:
> When there is no status bit, it is possible for the clock enable/disable
> operation to have not completed by the time the driver code resumes
> execution. This is due to the fact that write operations are sometimes
> queued and delayed internally. Doing a read ensures the write operations
> has completed.
> 
> Fixes: b6face404f38 ("ARM: shmobile: r7s72100: add essential clock nodes to dtsi")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
