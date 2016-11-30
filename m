Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL] rockchip clock changes for 4.10 part2
Date: Wed, 30 Nov 2016 22:40:27 +0100
Message-ID: <2295308.YcyGhdT6at@phil>
In-Reply-To: <2743552.IWmOsK33LT@phil>
References: <2743552.IWmOsK33LT@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, 24. November 2016, 16:17:46 CET schrieb Heiko Stuebner:
> Hi Mike, Stephen,
> 
> here are some more rockchip-specific clock changes, hopefully still in
> time for 4.10.
> 
> Apart from some smaller fixes there is one new clock-controller for
> the RK1108 (a soc combining a single-core Cortex-A7 with a DSP).
> 
> 
> There was a bit of concern from Rob regarding our softer links to
> circular input clocks which I tried to explain in [0] and [1] but
> haven't heared anything back in nearly a week now from my
> initial reply last friday.
> 
> He did ack bindings with the same behaviour for the rk3036, rk3228
> and rk3399 in the past though, so I can only hope my explanation did
> somehow alleviate his concerns.
> 
> I've Cc'ed him on this pull request, so hopefully he'll protest if
> that isn't the case.

I've pinged Rob on IRC, and he is fine with the approach [as long as I'm fine 
with it :-) ]


Heiko

> 
> 
> Heiko
> 
> [0] http://www.spinics.net/lists/devicetree/msg151344.html
> [1] http://www.spinics.net/lists/devicetree/msg151658.html
> 
> 
> 
> The following changes since commit bf92384b6d729b22916ba832b4a225ca196e98ba:
> 
>   clk: rockchip: Ignore frac divisor for PLL equivalence when it's unused
> (2016-11-05 23:16:29 +0100)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git
> tags/v4.10-rockchip-clk2
> 
> for you to fetch changes up to e44dde27949254b7da7259ab90864c211c14ade3:
> 
>   clk: rockchip: add clock controller for rk1108 (2016-11-16 12:37:37 +0100)
> 
> ----------------------------------------------------------------
> A new clock controller for the rk1108 soc (single-core Cortex-A7+DSP),
> a fix making sure the cpuclk rate is actually valid, before trying to
> set it and a copy-paste fix for the rk3399's testclk.
> 
> ----------------------------------------------------------------
> Elaine Zhang (1):
>       clk: rockchip: validity should be checked prior to cpu clock rate
> change
> 
> Heiko Stuebner (1):
>       Merge branch 'v4.10-shared/clkids' into v4.10-clk/next
> 
> Jianqun Xu (1):
>       clk: rockchip: fix copy-paste error in rk3399 testclk
> 
> Shawn Lin (3):
>       clk: rockchip: add dt-binding header for rk1108
>       dt-bindings: add documentation for rk1108 cru
>       clk: rockchip: add clock controller for rk1108
> 
>  .../bindings/clock/rockchip,rk1108-cru.txt         |  59 +++
>  drivers/clk/rockchip/Makefile                      |   1 +
>  drivers/clk/rockchip/clk-cpu.c                     |   9 +
>  drivers/clk/rockchip/clk-rk1108.c                  | 531
> +++++++++++++++++++++ drivers/clk/rockchip/clk-rk3399.c                  | 
>  4 +-
>  drivers/clk/rockchip/clk.h                         |  15 +
>  include/dt-bindings/clock/rk1108-cru.h             | 269 +++++++++++
>  7 files changed, 886 insertions(+), 2 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/clock/rockchip,rk1108-cru.txt create mode
> 100644 drivers/clk/rockchip/clk-rk1108.c
>  create mode 100644 include/dt-bindings/clock/rk1108-cru.h
