Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	Russell King <linux@arm.linux.org.uk>,
	linux-clk@vger.kernel.org (open list:CLK API)
Subject: [PATCH 1/6] clk: Add missing clk_get_sys() stub
Date: Thu,  2 Jun 2016 23:41:32 +0200
Message-Id: <1464903697-3802-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

When compiling with the COMPILE_TEST option set, the clps711x does not
compile because of the clk_get_sys() noop stub missing.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 include/linux/clk.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 0df4a51..834179f 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -461,6 +461,10 @@ static inline struct clk *clk_get_parent(struct clk *clk)
 	return NULL;
 }
 
+static inline struct clk *clk_get_sys(const char *dev_id, const char *con_id)
+{
+	return NULL;
+}
 #endif
 
 /* clk_prepare_enable helps cases using clk_enable in non-atomic context. */
-- 
1.9.1
