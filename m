Return-Path: <sboyd@codeaurora.org>
Date: Fri, 15 Apr 2016 15:52:16 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] rockchip clock changes for 4.7 part 1
Message-ID: <20160415225216.GY14441@codeaurora.org>
References: <1640921.TBVHP9NGjj@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1640921.TBVHP9NGjj@phil>
List-ID: <linux-clk.vger.kernel.org>

On 04/12, Heiko Stuebner wrote:
> Hi Mike, Stephen,
> 
> The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:
> 
>   Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.7-rockchip-clk1
> 
> for you to fetch changes up to 115510053e5e5872f1f19a2220b04aab5542c5c4:
> 
>   clk: rockchip: add clock controller for the RK3399 (2016-03-28 14:57:07 +0200)
> 
> ----------------------------------------------------------------
> This is first big chunk of Rockchip clock-related changes for 4.7.
> 
> Main change is probably the added support for the new rk3399 soc
> and necessary infrastructure changes surrounding it.
> 
> The biggest chunk is probably that clock code is now able to
> handle multiple clock providers in one system, as the rk3399
> has two of those. A general one and another smaller one in a
> separate power domain. The rk3399 also uses another new pll type.
> Thankfully it just fits nicely into our current structure.
> It also needs some parts like the cpuclk mux parameters to be
> a bit more flexible and an new fractional divider subtype without
> gate.
> 
> Apart from this big change we have some more fixes and removal
> of forgotten variables.
> 

Pulled into clk-next.

BUT, this has some checkpatch annoyances, mostly spaces before
tabs in the DT headers. For example:

WARNING: please, no space before tabs
#162: FILE: include/dt-bindings/clock/rk3399-cru.h:139:
+#define FCLK_CM0S ^I^I^I190$

WARNING: please, no space before tabs
#233: FILE: include/dt-bindings/clock/rk3399-cru.h:210:
+#define ACLK_PERF_CORE_L ^I^I260$

Please send another patch to fix those or do it in another pull,
whatever works for you.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
