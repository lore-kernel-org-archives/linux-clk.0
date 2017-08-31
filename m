Return-Path: <sboyd@codeaurora.org>
Date: Thu, 31 Aug 2017 11:32:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: cs2000: Add cs2000_set_saved_rate
Message-ID: <20170831183243.GH21656@codeaurora.org>
References: <1492624001-3758-11-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1492624001-3758-11-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/20, Yoshihiro Kaneko wrote:
> From: Gaku Inami <gaku.inami.xw@bp.renesas.com>
> 
> This patch adds the common function to reset the clk rate in order to
> be able to use it in other cases.
> 
> Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
