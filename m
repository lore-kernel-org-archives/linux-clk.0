Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Alex Elder <elder@linaro.org>
Subject: [PATCH 29/45] clk: bcm: Include clk.h
Date: Fri, 10 Jul 2015 16:33:27 -0700
Message-Id: <1436571223-10959-30-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This clock provider uses the consumer API, so include clk.h
explicitly.

Cc: Alex Elder <elder@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/bcm/clk-kona.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 79a98506c433..5638de8c6489 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -16,6 +16,7 @@
 
 #include <linux/delay.h>
 #include <linux/kernel.h>
+#include <linux/clk.h>
 
 /*
  * "Policies" affect the frequencies of bus clocks provided by a
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

