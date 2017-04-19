Return-Path: <sboyd@codeaurora.org>
Date: Wed, 19 Apr 2017 10:19:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: cs2000: tidyup missing settings
Message-ID: <20170419171943.GP7065@codeaurora.org>
References: <87tw5mxy2h.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87tw5mxy2h.wl%kuninori.morimoto.gx@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/18, Kuninori Morimoto wrote:
> 
> Hi Stephen
> 
> These are missing settings for current cs2000.
> it is working without these settings, thus, not urgent.
> But, necessary for correct/safety operation.

Thanks. Applied all to clk-next. 

> 
> Kuninori Morimoto (3):
>   clk: cs2000: enable clock skipping mode
>   clk: cs2000: tidyup DEVICE_CFG2 settings
>   clk: cs2000: select 12.20 High Accuracy on LFRatioCfg
> 
>  drivers/clk/clk-cs2000-cp.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> -- 
> 1.9.1
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
