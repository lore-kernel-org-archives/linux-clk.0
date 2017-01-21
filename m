Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 16:19:51 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Michael Turquette <mturquette@baylibre.com>,
	Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Gaku Inami <gaku.inami.xw@bp.renesas.com>,
	Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Subject: Re: [PATCH] clk: cs2000: add Suspend/Redume feature
Message-ID: <20170121001951.GK20800@codeaurora.org>
References: <87pojvxve9.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87pojvxve9.wl%kuninori.morimoto.gx@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/10, Kuninori Morimoto wrote:
> From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> 
> CS2000 needs re-setup when redume, otherwise, it can't
> handle correct clock rate.
> 
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> [Kuninori: cleanup original patch]
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
