Return-Path: <sboyd@codeaurora.org>
Date: Wed, 5 Apr 2017 12:04:23 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Michael Turquette <mturquette@baylibre.com>,
	Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cs-2000-cp: keep Reserved bit on each register
Message-ID: <20170405190423.GL18246@codeaurora.org>
References: <87y3vfxw3q.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87y3vfxw3q.wl%kuninori.morimoto.gx@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/05, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Thus CS2000 datasheet is indicating below, this patch
> follows it.
> 
> WARNING: All "Reserved" registers must maintain their default
>          state to ensure proper functional operation.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Is this v2? I see two of these from different days.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
