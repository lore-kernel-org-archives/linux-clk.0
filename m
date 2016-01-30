Return-Path: <wuninsu@gmail.com>
Return-Path: <wuninsu@gmail.com>
From: Insu Yun <wuninsu@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: taesoo@gatech.edu,
	yeongjin.jang@gatech.edu,
	insu@gatech.edu,
	changwoo@gatech.edu,
	Insu Yun <wuninsu@gmail.com>
Subject: [PATCH] clk: unlock for handling unregisterd clock
Date: Sat, 30 Jan 2016 10:12:04 -0500
Message-Id: <1454166724-17374-1-git-send-email-wuninsu@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

If clock is already unregistered, it returns with holding lock.
It needs to be unlocked.

Signed-off-by: Insu Yun <wuninsu@gmail.com>
---
 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b4db67a..9cc2d08 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2683,6 +2683,7 @@ void clk_unregister(struct clk *clk)
 	if (clk->core->ops == &clk_nodrv_ops) {
 		pr_err("%s: unregistered clock: %s\n", __func__,
 		       clk->core->name);
+		clk_prepare_unlock();
 		return;
 	}
 	/*
-- 
1.9.1
