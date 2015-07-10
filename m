Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Rob Herring <rob.herring@calxeda.com>
Subject: [PATCH 30/45] clk: highbank: Include clk.h
Date: Fri, 10 Jul 2015 16:33:28 -0700
Message-Id: <1436571223-10959-31-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This clock provider uses the consumer API, so include clk.h
explicitly.

Cc: Rob Herring <rob.herring@calxeda.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-highbank.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-highbank.c b/drivers/clk/clk-highbank.c
index 2e7e9d9798cb..be3a21abb185 100644
--- a/drivers/clk/clk-highbank.c
+++ b/drivers/clk/clk-highbank.c
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/err.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/of.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

