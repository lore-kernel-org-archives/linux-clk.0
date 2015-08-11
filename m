Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
Date: Tue, 11 Aug 2015 11:34:25 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL] i.MX clock updates for 4.2
Message-ID: <20150811183425.GL2839@codeaurora.org>
References: <20150811085921.GB10035@tiger> <20150811174657.2416.1270@quantum>
MIME-Version: 1.0
In-Reply-To: <20150811174657.2416.1270@quantum>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On 08/11, Michael Turquette wrote:
> > 
> > Also, please keep it stable, because I need to pull it into other
> > branch as dependency which I will send via arm-soc tree.
> 
> Will do.
> 
> Also, the clock driver was not Cc'd to linux-clk mailing list nor did it
> Cc myself or Stephen. I've taken a quick look at it and it seems fine,
> but please post clk patches to the linux-clk mailing list in the future.
> 

Yes. We would have found this unused include too. I'll apply this
after we merge it into clk-next.

----8<----
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH] clk: imx: Remove unused clkdev.h include

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/imx/clk-imx6ul.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index aaa36650695f..c498f558e942 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -11,7 +11,6 @@
 
 #include <dt-bindings/clock/imx6ul-clock.h>
 #include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
