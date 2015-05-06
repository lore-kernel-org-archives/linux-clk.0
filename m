Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Chao Xie <chao.xie@marvell.com>
Subject: [PATCH 16/19] clk: mmp: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:53 -0700
Message-Id: <1430897996-11597-17-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/mmp/clk-apbc.c:118:16: warning: symbol 'clk_apbc_ops' was not declared. Should it be static?
drivers/clk/mmp/clk-apmu.c:64:16: warning: symbol 'clk_apmu_ops' was not declared. Should it be static?

Cc: Chao Xie <chao.xie@marvell.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/mmp/clk-apbc.c | 2 +-
 drivers/clk/mmp/clk-apmu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-apbc.c b/drivers/clk/mmp/clk-apbc.c
index d14120eaa71f..09d41c717c52 100644
--- a/drivers/clk/mmp/clk-apbc.c
+++ b/drivers/clk/mmp/clk-apbc.c
@@ -115,7 +115,7 @@ static void clk_apbc_unprepare(struct clk_hw *hw)
 		spin_unlock_irqrestore(apbc->lock, flags);
 }
 
-struct clk_ops clk_apbc_ops = {
+static struct clk_ops clk_apbc_ops = {
 	.prepare = clk_apbc_prepare,
 	.unprepare = clk_apbc_unprepare,
 };
diff --git a/drivers/clk/mmp/clk-apmu.c b/drivers/clk/mmp/clk-apmu.c
index abe182b2377f..cdcf2d7f321e 100644
--- a/drivers/clk/mmp/clk-apmu.c
+++ b/drivers/clk/mmp/clk-apmu.c
@@ -61,7 +61,7 @@ static void clk_apmu_disable(struct clk_hw *hw)
 		spin_unlock_irqrestore(apmu->lock, flags);
 }
 
-struct clk_ops clk_apmu_ops = {
+static struct clk_ops clk_apmu_ops = {
 	.enable = clk_apmu_enable,
 	.disable = clk_apmu_disable,
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

