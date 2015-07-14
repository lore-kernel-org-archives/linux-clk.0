Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH 2/2] clk: h8300: Use standard Linux I/O accessors
Date: Mon, 13 Jul 2015 17:11:50 -0700
Message-Id: <1436832710-23989-2-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436832710-23989-1-git-send-email-sboyd@codeaurora.org>
References: <1436832710-23989-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

There doesn't seem to be any reason why we can't use the standard
readb()/writeb() accessors here because ctrl_inb() and
ctrl_outb() match the generic implementation of readb() and
writeb() that the h8300 architecture uses. This allows us to test
compile this driver on other architectures besides h8300.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/h8300/clk-h8s2678.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/h8300/clk-h8s2678.c b/drivers/clk/h8300/clk-h8s2678.c
index c121eb55e2e1..11808cb4f141 100644
--- a/drivers/clk/h8300/clk-h8s2678.c
+++ b/drivers/clk/h8300/clk-h8s2678.c
@@ -28,7 +28,7 @@ static unsigned long pll_recalc_rate(struct clk_hw *hw,
 		unsigned long parent_rate)
 {
 	struct pll_clock *pll_clock = to_pll_clock(hw);
-	int mul = 1 << (ctrl_inb((unsigned long)pll_clock->pllcr) & 3);
+	int mul = 1 << (readb(pll_clock->pllcr) & 3);
 
 	return parent_rate * mul;
 }
@@ -65,13 +65,13 @@ static int pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	pll = ((rate / parent_rate) / 2) & 0x03;
 	spin_lock_irqsave(&clklock, flags);
-	val = ctrl_inb((unsigned long)pll_clock->sckcr);
+	val = readb(pll_clock->sckcr);
 	val |= 0x08;
-	ctrl_outb(val, (unsigned long)pll_clock->sckcr);
-	val = ctrl_inb((unsigned long)pll_clock->pllcr);
+	writeb(val, pll_clock->sckcr);
+	val = readb(pll_clock->pllcr);
 	val &= ~0x03;
 	val |= pll;
-	ctrl_outb(val, (unsigned long)pll_clock->pllcr);
+	writeb(val, pll_clock->pllcr);
 	spin_unlock_irqrestore(&clklock, flags);
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

