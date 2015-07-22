Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 21 Jul 2015 17:40:18 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, heikki.krogerus@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/6] clk: fractional-divider: fix sparse warnings
Message-ID: <20150722004018.GD15042@codeaurora.org>
References: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1436886723-111895-2-git-send-email-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436886723-111895-2-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/14, Andy Shevchenko wrote:
> Sparse complains about possible imbalance in locking.
> 
> drivers/clk/clk-fractional-divider.c:37:9: warning: context imbalance in 'clk_fd_recalc_rate' - different lock contexts for basic block
> drivers/clk/clk-fractional-divider.c:61:12: warning: context imbalance in 'clk_fd_set_rate' - different lock contexts for basic block
> 
> Let's rewrite code to fix this and make it more straight.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/clk/clk-fractional-divider.c | 44 +++++++++++++++++++++---------------

This can be "fixed" with far fewer lines of code.

 drivers/clk/clk-fractional-divider.c | 8 ++++++++
  1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index 140eb5844dc4..e85f856b8592 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -27,11 +27,15 @@ static unsigned long clk_fd_recalc_rate(struct clk_hw *hw,
 
 	if (fd->lock)
 		spin_lock_irqsave(fd->lock, flags);
+	else
+		__acquire(fd->lock);
 
 	val = clk_readl(fd->reg);
 
 	if (fd->lock)
 		spin_unlock_irqrestore(fd->lock, flags);
+	else
+		__release(fd->lock);
 
 	m = (val & fd->mmask) >> fd->mshift;
 	n = (val & fd->nmask) >> fd->nshift;
@@ -80,6 +84,8 @@ static int clk_fd_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (fd->lock)
 		spin_lock_irqsave(fd->lock, flags);
+	else
+		__acquire(fd->lock);
 
 	val = clk_readl(fd->reg);
 	val &= ~(fd->mmask | fd->nmask);
@@ -88,6 +94,8 @@ static int clk_fd_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (fd->lock)
 		spin_unlock_irqrestore(fd->lock, flags);
+	else
+		__release(fd->lock);
 
 	return 0;
 }

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
