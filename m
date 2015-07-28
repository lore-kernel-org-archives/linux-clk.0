Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
Date: Tue, 28 Jul 2015 22:38:25 +0800
From: Dong Aisheng <b29396@freescale.com>
To: Dong Aisheng <aisheng.dong@freescale.com>
Subject: Re: [PATCH V3 0/5] clk: support clocks which requires parent clock
 on during operation
Message-ID: <20150728143824.GB16916@shlinux1.ap.freescale.net>
References: <1438089585-30103-1-git-send-email-aisheng.dong@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1438089585-30103-1-git-send-email-aisheng.dong@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Ranjani.Vaidyanathan@freescale.com, b20596@freescale.com,
 mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
 r64343@freescale.com, b20788@freescale.com, shawnguo@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 28, 2015 at 09:19:40PM +0800, Dong Aisheng wrote:
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
> Change Log:
> v2->v3:
>  * rebased version, no other changes.
> 
> v1->v2:
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
>  drivers/clk/clk.c            | 338 +++++++++++++++++++++++++------------------
>  include/linux/clk-provider.h |   5 +
>  2 files changed, 200 insertions(+), 143 deletions(-)
> 

Sorry, forgot to update Mike's new email address.
Updated.

Regards
Dong Aisheng

> -- 
> 1.9.1
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
