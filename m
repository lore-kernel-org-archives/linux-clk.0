Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 03/19] clk: max-gen: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:40 -0700
Message-Id: <1430897996-11597-4-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/clk-max-gen.c:82:16: warning: symbol 'max_gen_clk_ops' was not declared. Should it be static?
drivers/clk/clk-max-gen.c:109:5: warning: symbol 'max_gen_clk_probe' was not declared. Should it be static?
drivers/clk/clk-max-gen.c:183:5: warning: symbol 'max_gen_clk_remove' was not declared. Should it be static?

Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-max-gen.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-max-gen.c b/drivers/clk/clk-max-gen.c
index 6505049d50f1..35af9cb6da4f 100644
--- a/drivers/clk/clk-max-gen.c
+++ b/drivers/clk/clk-max-gen.c
@@ -31,6 +31,8 @@
 #include <linux/of.h>
 #include <linux/export.h>
 
+#include "clk-max-gen.h"
+
 struct max_gen_clk {
 	struct regmap *regmap;
 	u32 mask;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
