Return-Path: <sboyd@codeaurora.org>
Date: Mon, 1 Feb 2016 18:41:58 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Insu Yun <wuninsu@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, taesoo@gatech.edu,
	yeongjin.jang@gatech.edu, insu@gatech.edu, changwoo@gatech.edu
Subject: Re: [PATCH] clk: unlock for handling unregisterd clock
Message-ID: <20160202024158.GM4848@codeaurora.org>
References: <1454166724-17374-1-git-send-email-wuninsu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1454166724-17374-1-git-send-email-wuninsu@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/30, Insu Yun wrote:
> If clock is already unregistered, it returns with holding lock.
> It needs to be unlocked.
> 
> Signed-off-by: Insu Yun <wuninsu@gmail.com>
> ---

Applied to clk-next but I changed it to a goto:

---8<---
From: Insu Yun <wuninsu@gmail.com>
Subject: [PATCH] clk: unlock for handling unregisterd clock

If clock is already unregistered, it returns with holding lock.
It needs to be unlocked.

Signed-off-by: Insu Yun <wuninsu@gmail.com>
[sboyd@codeaurora.org: Use goto instead]
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fff87b39944f..7d247a26a212 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2639,7 +2639,7 @@ void clk_unregister(struct clk *clk)
 	if (clk->core->ops == &clk_nodrv_ops) {
 		pr_err("%s: unregistered clock: %s\n", __func__,
 		       clk->core->name);
-		return;
+		goto unlock;
 	}
 	/*
 	 * Assign empty clock ops for consumers that might still hold
@@ -2665,7 +2665,7 @@ void clk_unregister(struct clk *clk)
 		pr_warn("%s: unregistering prepared clock: %s\n",
 					__func__, clk->core->name);
 	kref_put(&clk->core->ref, __clk_release);
-
+unlock:
 	clk_prepare_unlock();
 }
 EXPORT_SYMBOL_GPL(clk_unregister);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
