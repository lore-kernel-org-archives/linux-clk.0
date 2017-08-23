Return-Path: <sboyd@codeaurora.org>
Date: Wed, 23 Aug 2017 15:39:11 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL v2] rockchip clock changes for 4.14
Message-ID: <20170823223911.GG21656@codeaurora.org>
References: <2274885.hdbqj6Qr1b@phil>
 <2504131.RNZrFhkOWB@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2504131.RNZrFhkOWB@phil>
List-ID: <linux-clk.vger.kernel.org>

On 08/22, Heiko Stuebner wrote:
> Hi Mike, Stephen,
> 
> please find below rockchip clock-changes targetted at 4.14.
> As we talked about before, it includes the approximation-callback
> for fractional dividers, Acked by Stephen.
> 
> Apart from that we have the usual changes as described by the tag.
> So if stuff looks ok, please pull.
> 
> changes in pull v2:
> Compared to v1 of the pull I included some more clock-ids and
> rv1108 fixes that came in meanwhile.
> 
> 

Thanks. Pulled into clk-next + I added a static marking patch.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
