Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 06/10] clk: add clk_set_rate_protect
Date: Mon, 12 Jun 2017 21:44:34 +0200
Message-Id: <20170612194438.12298-7-jbrunet@baylibre.com>
In-Reply-To: <20170612194438.12298-1-jbrunet@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

clk_set_rate_protect is a combination of clk_set_rate and clk_rate_protect
within a critical section. In case where several protecting consumers
compete to set the rate of the same provider, it provides a way to make
sure that at least one of them will be satisfied before the resource is
locked.

This is to avoid the unlikely situation where several consumers protect a
clock provider and none actually get a rate it can work with.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c   | 45 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk.h | 14 ++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d688b8f59a59..d91236e70a04 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1809,6 +1809,51 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
 EXPORT_SYMBOL_GPL(clk_set_rate);
 
 /**
+ * clk_set_rate_protect - specify a new rate and protect it
+ * @clk: the clk whose rate is being changed
+ * @rate: the new rate for clk
+ *
+ * This is a combination of clk_set_rate and clk_rate_protect within
+ * a critical section
+ *
+ * This can be used initially to ensure that at least 1 consumers is
+ * statisfied when several protecting consummers are competing for the
+ * same clock provider.
+ *
+ * The protection is not applied if setting the rate failed.
+ *
+ * Returns 0 on success, -EERROR otherwise.
+ */
+int clk_set_rate_protect(struct clk *clk, unsigned long rate)
+{
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	/* prevent racing with updates to the clock topology */
+	clk_prepare_lock();
+
+	/*
+	 * The temporary protection removal is not here, on purpose
+	 * This function is meant to be used in instead of clk_rate_protect,
+	 * so before the consumer code path protect the clock provider
+	 */
+
+	ret = clk_core_set_rate_nolock(clk->core, rate);
+
+	if (!ret) {
+		clk_core_rate_protect(clk->core);
+		clk->protect_count++;
+	}
+
+	clk_prepare_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_set_rate_protect);
+
+/**
  * clk_set_rate_range - set a rate range for a clock source
  * @clk: clock source
  * @min: desired minimum clock rate in Hz, inclusive
diff --git a/include/linux/clk.h b/include/linux/clk.h
index b60c36f2e6b0..7a01b32f7029 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -497,6 +497,15 @@ long clk_round_rate(struct clk *clk, unsigned long rate);
 int clk_set_rate(struct clk *clk, unsigned long rate);
 
 /**
+ * clk_set_rate_protect - set and protect the clock rate for a clock source
+ * @clk: clock source
+ * @rate: desired clock rate in Hz
+ *
+ * Returns success (0) or negative errno.
+ */
+int clk_set_rate_protect(struct clk *clk, unsigned long rate);
+
+/**
  * clk_has_parent - check if a clock is a possible parent for another
  * @clk: clock source
  * @parent: parent clock source
@@ -638,6 +647,11 @@ static inline int clk_set_rate(struct clk *clk, unsigned long rate)
 	return 0;
 }
 
+static inline int clk_set_rate_protect(struct clk *clk, unsigned long rate)
+{
+	return 0;
+}
+
 static inline long clk_round_rate(struct clk *clk, unsigned long rate)
 {
 	return 0;
-- 
2.9.4
