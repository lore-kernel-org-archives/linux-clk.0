Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 73/92] clk: Add missing clk_get_sys() stub
Date: Tue, 28 Jun 2016 12:31:32 +0200
Message-Id: <1467109911-11060-73-git-send-email-daniel.lezcano@linaro.org>
In-Reply-To: <1467109911-11060-1-git-send-email-daniel.lezcano@linaro.org>
References: <577251A4.7030508@linaro.org>
 <1467109911-11060-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

When compiling with the COMPILE_TEST option set, the clps711x does not
compile because of the clk_get_sys() noop stub missing.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Michael Turquette <mturquette@baylibre.com>
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
