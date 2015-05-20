Return-Path: <Aisheng.Dong@freescale.com>
Date: Wed, 20 May 2015 19:42:56 +0800
From: Dong Aisheng <b29396@freescale.com>
To: Dong Aisheng <aisheng.dong@freescale.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sboyd@codeaurora.org>, <mturquette@linaro.org>, <shawn.guo@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <Ranjani.Vaidyanathan@freescale.com>,
	<b20596@freescale.com>, <r64343@freescale.com>, <b20788@freescale.com>
Subject: Re: [PATCH v2 0/5] clk: support clocks which requires parent clock
 on during operation
Message-ID: <20150520114253.GA6423@shlinux1.ap.freescale.net>
References: <1431610143-21853-1-git-send-email-aisheng.dong@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <1431610143-21853-1-git-send-email-aisheng.dong@freescale.com>
Return-Path: b29396@freescale.com
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Thu, May 14, 2015 at 09:28:58PM +0800, Dong Aisheng wrote:
> This patch series adds support in clock framework for clocks which operations
> requires its parent clock is on.
> 
> Such clock type is initially met on Freescale i.MX7D platform that all clocks
> operations, including enable/disable, rate change and re-parent, requires its
> parent clock on. No sure if any other SoC has the similar clock type.
> 
> Current clock core can not support such type of clock well.
> 
> This patch introduce a new flag CLK_SET_PARENT_ON to handle this special case
> in clock core that enable its parent clock firstly for each operation and disable
> it later after operation complete.
> 
> The most special case is for set_parent() operation which requires both parent,
> old one and new one, to be enabled at the same time during the operation.
> 
> The patch series is based on for-next branch of Michael's git:
> git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
> 
> Change Log v1->v2:
>  Mainly addressed Stephen Boyd's comments
>  * remove dupliciated code with __clk_set_parent_after
>  * introduce more clk_core_x APIs for core easily use
>  * move clk_disable_unused code position
>  * use clk_core_x API to make code more clean and easily read
> 
> Dong Aisheng (5):
>   clk: remove duplicated code with __clk_set_parent_after
>   clk: introduce clk_core_enable_lock and clk_core_disable_lock
>     functions
>   clk: move clk_disable_unused after clk_core_disable_unprepare function
>   clk: core: add CLK_OPS_PARENT_ON flags to support clocks require
>     parent on
>   clk: core: add CLK_OPS_PARENT_ON flags to support clocks require
>     parent on
> 

Can you help review this updated series?

>  drivers/clk/clk.c            | 338 +++++++++++++++++++++++++------------------
>  include/linux/clk-provider.h |   5 +
>  2 files changed, 200 insertions(+), 143 deletions(-)
> 
> -- 
> 1.9.1
> 

Regards
Dong Aisheng
