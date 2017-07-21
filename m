Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Jul 2017 13:16:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Fix SD divider setting
Message-ID: <20170721201631.GB19878@codeaurora.org>
References: <1492624001-3758-10-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1492624001-3758-10-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/20, Yoshihiro Kaneko wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch fixed the SD divider settiing for corresponding to the change
> in the HS200/HS400 mode.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
> This patch is based on the clk-next branch of linux-clk tree.

Geert?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
