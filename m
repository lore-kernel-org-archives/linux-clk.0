Return-Path: <sboyd@codeaurora.org>
Date: Mon, 9 May 2016 16:05:16 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] rockchip clock changes for 4.7 part 4 - some more
 fixes
Message-ID: <20160509230516.GB3492@codeaurora.org>
References: <16076636.fp1YCeqDWQ@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <16076636.fp1YCeqDWQ@phil>
List-ID: <linux-clk.vger.kernel.org>

On 05/09, Heiko Stübner wrote:
> Hi Mike, Stephen,
> 
> A fixup for a rk3399 clock name as well as the GRF-portions of
> my cleanup series. As Stephen had some mild reservations about the
> introduced indirection in the pll parts and we don't save to much lines
> with my modifications for the currently supported pll-types, I think it's
> easier to postpone those until the next new pll type comes around.
> 
> Maybe it even has some completely different properties to handle where
> the current "simplification" might even be counter-productive :-) .
> 
> So please pull if possible.
> 
> Thanks
> Heiko
> 
> 
> The following changes since commit fd8bc829336a24b770247eb893111bcb8f1ddedb:
> 
>   clk: rockchip: fix the rk3399 cifout clock (2016-04-25 22:54:51 +0200)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.7-rockchip-clk4

Thanks. Pulled.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
