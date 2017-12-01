Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v5 09/10] clk: add clk_rate_exclusive api
Date: Fri,  1 Dec 2017 22:51:59 +0100
Message-Id: <20171201215200.23523-10-jbrunet@baylibre.com>
In-Reply-To: <20171201215200.23523-1-jbrunet@baylibre.com>
References: <20171201215200.23523-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Using clock rate protection, we can now provide a way for clock consumer
to claim exclusive control over the rate of a producer

So far, rate change operations have been a "last write wins" affair. This
changes allows drivers to explicitly protect against this behavior, if
required.

Of course, if exclusivity over a producer is claimed more than once, the
rate is effectively locked as exclusivity cannot be preempted

Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c   | 172 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk.h |  62 +++++++++++++++++++
 2 files changed, 234 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 1af843ae20ff..edd965d8f41d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -87,6 +87,7 @@ struct clk {
 	const char *con_id;
 	unsigned long min_rate;
 	unsigned long max_rate;
+	unsigned int exclusive_count;
 	struct hlist_node clks_node;
 };
 
@@ -565,6 +566,45 @@ static int clk_core_rate_nuke_protect(struct clk_core *core)
 	return ret;
 }
 
+/**
+ * clk_rate_exclusive_put - release exclusivity over clock rate control
+ * @clk: the clk over which the exclusivity is released
+ *
+ * clk_rate_exclusive_put() completes a critical section during which a clock
+ * consumer cannot tolerate any other consumer making any operation on the
+ * clock which could result in a rate change or rate glitch. Exclusive clocks
+ * cannot have their rate changed, either directly or indirectly due to changes
+ * further up the parent chain of clocks. As a result, clocks up parent chain
+ * also get under exclusive control of the calling consumer.
+ *
+ * If exlusivity is claimed more than once on clock, even by the same consumer,
+ * the rate effectively gets locked as exclusivity can't be preempted.
+ *
+ * Calls to clk_rate_exclusive_put() must be balanced with calls to
+ * clk_rate_exclusive_get(). Calls to this function may sleep, and do not return
+ * error status.
+ */
+void clk_rate_exclusive_put(struct clk *clk)
+{
+	if (!clk)
+		return;
+
+	clk_prepare_lock();
+
+	/*
+	 * if there is something wrong with this consumer protect count, stop
+	 * here before messing with the provider
+	 */
+	if (WARN_ON(clk->exclusive_count <= 0))
+		goto out;
+
+	clk_core_rate_unprotect(clk->core);
+	clk->exclusive_count--;
+out:
+	clk_prepare_unlock();
+}
+EXPORT_SYMBOL_GPL(clk_rate_exclusive_put);
+
 static void clk_core_rate_protect(struct clk_core *core)
 {
 	lockdep_assert_held(&prepare_lock);
@@ -592,6 +632,38 @@ static void clk_core_rate_restore_protect(struct clk_core *core, int count)
 	core->protect_count = count;
 }
 
+/**
+ * clk_rate_exclusive_get - get exclusivity over the clk rate control
+ * @clk: the clk over which the exclusity of rate control is requested
+ *
+ * clk_rate_exlusive_get() begins a critical section during which a clock
+ * consumer cannot tolerate any other consumer making any operation on the
+ * clock which could result in a rate change or rate glitch. Exclusive clocks
+ * cannot have their rate changed, either directly or indirectly due to changes
+ * further up the parent chain of clocks. As a result, clocks up parent chain
+ * also get under exclusive control of the calling consumer.
+ *
+ * If exlusivity is claimed more than once on clock, even by the same consumer,
+ * the rate effectively gets locked as exclusivity can't be preempted.
+ *
+ * Calls to clk_rate_exclusive_get() should be balanced with calls to
+ * clk_rate_exclusive_put(). Calls to this function may sleep.
+ * Returns 0 on success, -EERROR otherwise
+ */
+int clk_rate_exclusive_get(struct clk *clk)
+{
+	if (!clk)
+		return 0;
+
+	clk_prepare_lock();
+	clk_core_rate_protect(clk->core);
+	clk->exclusive_count++;
+	clk_prepare_unlock();
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(clk_rate_exclusive_get);
+
 static void clk_core_unprepare(struct clk_core *core)
 {
 	lockdep_assert_held(&prepare_lock);
@@ -1001,6 +1073,12 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 	if (!core)
 		return 0;
 
+	/*
+	 * At this point, core protection will be disabled if
+	 * - if the provider is not protected at all
+	 * - if the calling consumer is the only one which has exclusivity
+	 *   over the provider
+	 */
 	if (clk_core_rate_is_protected(core)) {
 		req->rate = core->rate;
 	} else if (core->ops->determine_rate) {
@@ -1117,10 +1195,17 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 
 	clk_prepare_lock();
 
+	if (clk->exclusive_count)
+		clk_core_rate_unprotect(clk->core);
+
 	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
 	req.rate = rate;
 
 	ret = clk_core_round_rate_nolock(clk->core, &req);
+
+	if (clk->exclusive_count)
+		clk_core_rate_protect(clk->core);
+
 	clk_prepare_unlock();
 
 	if (ret)
@@ -1853,14 +1938,67 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
 	/* prevent racing with updates to the clock topology */
 	clk_prepare_lock();
 
+	if (clk->exclusive_count)
+		clk_core_rate_unprotect(clk->core);
+
 	ret = clk_core_set_rate_nolock(clk->core, rate);
 
+	if (clk->exclusive_count)
+		clk_core_rate_protect(clk->core);
+
 	clk_prepare_unlock();
 
 	return ret;
 }
 EXPORT_SYMBOL_GPL(clk_set_rate);
 
+/**
+ * clk_set_rate_exclusive - specify a new rate get exclusive control
+ * @clk: the clk whose rate is being changed
+ * @rate: the new rate for clk
+ *
+ * This is a combination of clk_set_rate() and clk_rate_exclusive_get()
+ * within a critical section
+ *
+ * This can be used initially to ensure that at least 1 consumer is
+ * statisfied when several consumers are competing for exclusivity over the
+ * same clock provider.
+ *
+ * The exclusivity is not applied if setting the rate failed.
+ *
+ * Calls to clk_rate_exclusive_get() should be balanced with calls to
+ * clk_rate_exclusive_put().
+ *
+ * Returns 0 on success, -EERROR otherwise.
+ */
+int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
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
+	 * This function is meant to be used instead of clk_rate_protect,
+	 * so before the consumer code path protect the clock provider
+	 */
+
+	ret = clk_core_set_rate_nolock(clk->core, rate);
+	if (!ret) {
+		clk_core_rate_protect(clk->core);
+		clk->exclusive_count++;
+	}
+
+	clk_prepare_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_set_rate_exclusive);
+
 /**
  * clk_set_rate_range - set a rate range for a clock source
  * @clk: clock source
@@ -1885,12 +2023,18 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 
 	clk_prepare_lock();
 
+	if (clk->exclusive_count)
+		clk_core_rate_unprotect(clk->core);
+
 	if (min != clk->min_rate || max != clk->max_rate) {
 		clk->min_rate = min;
 		clk->max_rate = max;
 		ret = clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
 	}
 
+	if (clk->exclusive_count)
+		clk_core_rate_protect(clk->core);
+
 	clk_prepare_unlock();
 
 	return ret;
@@ -2101,8 +2245,16 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 		return 0;
 
 	clk_prepare_lock();
+
+	if (clk->exclusive_count)
+		clk_core_rate_unprotect(clk->core);
+
 	ret = clk_core_set_parent_nolock(clk->core,
 					 parent ? parent->core : NULL);
+
+	if (clk->exclusive_count)
+		clk_core_rate_protect(clk->core);
+
 	clk_prepare_unlock();
 
 	return ret;
@@ -2164,7 +2316,15 @@ int clk_set_phase(struct clk *clk, int degrees)
 		degrees += 360;
 
 	clk_prepare_lock();
+
+	if (clk->exclusive_count)
+		clk_core_rate_unprotect(clk->core);
+
 	ret = clk_core_set_phase_nolock(clk->core, degrees);
+
+	if (clk->exclusive_count)
+		clk_core_rate_protect(clk->core);
+
 	clk_prepare_unlock();
 
 	return ret;
@@ -3185,6 +3345,18 @@ void __clk_put(struct clk *clk)
 
 	clk_prepare_lock();
 
+	/*
+	 * Before calling clk_put, all calls to clk_rate_exclusive_get() from a
+	 * given user should be balanced with calls to clk_rate_exclusive_put()
+	 * and by that same consumer
+	 */
+	if (WARN_ON(clk->exclusive_count)) {
+		/* We voiced our concern, let's sanitize the situation */
+		clk->core->protect_count -= (clk->exclusive_count - 1);
+		clk_core_rate_unprotect(clk->core);
+		clk->exclusive_count = 0;
+	}
+
 	hlist_del(&clk->clks_node);
 	if (clk->min_rate > clk->core->req_rate ||
 	    clk->max_rate < clk->core->req_rate)
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 12c96d94d1fa..4c4ef9f34db3 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -331,6 +331,38 @@ struct clk *devm_clk_get(struct device *dev, const char *id);
  */
 struct clk *devm_get_clk_from_child(struct device *dev,
 				    struct device_node *np, const char *con_id);
+/**
+ * clk_rate_exclusive_get - get exclusivity over the rate control of a
+ *                          producer
+ * @clk: clock source
+ *
+ * This function allows drivers to get exclusive control over the rate of a
+ * provider. It prevents any other consumer to execute, even indirectly,
+ * opereation which could alter the rate of the provider or cause glitches
+ *
+ * If exlusivity is claimed more than once on clock, even by the same driver,
+ * the rate effectively gets locked as exclusivity can't be preempted.
+ *
+ * Must not be called from within atomic context.
+ *
+ * Returns success (0) or negative errno.
+ */
+int clk_rate_exclusive_get(struct clk *clk);
+
+/**
+ * clk_rate_exclusive_put - release exclusivity over the rate control of a
+ *                          producer
+ * @clk: clock source
+ *
+ * This function allows drivers to release the exclusivity it previously got
+ * from clk_rate_exclusive_get()
+ *
+ * The caller must balance the number of clk_rate_exclusive_get() and
+ * clk_rate_exclusive_put() calls.
+ *
+ * Must not be called from within atomic context.
+ */
+void clk_rate_exclusive_put(struct clk *clk);
 
 /**
  * clk_enable - inform the system when the clock source should be running.
@@ -472,6 +504,23 @@ long clk_round_rate(struct clk *clk, unsigned long rate);
  */
 int clk_set_rate(struct clk *clk, unsigned long rate);
 
+/**
+ * clk_set_rate_exclusive- set the clock rate and claim exclusivity over
+ *                         clock source
+ * @clk: clock source
+ * @rate: desired clock rate in Hz
+ *
+ * This helper function allows drivers to atomically set the rate of a producer
+ * and claim exclusivity over the rate control of the producer.
+ *
+ * It is essentially a combination of clk_set_rate() and
+ * clk_rate_exclusite_get(). Caller must balance this call with a call to
+ * clk_rate_exclusive_put()
+ *
+ * Returns success (0) or negative errno.
+ */
+int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
+
 /**
  * clk_has_parent - check if a clock is a possible parent for another
  * @clk: clock source
@@ -583,6 +632,14 @@ static inline void clk_bulk_put(int num_clks, struct clk_bulk_data *clks) {}
 
 static inline void devm_clk_put(struct device *dev, struct clk *clk) {}
 
+
+static inline int clk_rate_exclusive_get(struct clk *clk)
+{
+	return 0;
+}
+
+static inline void clk_rate_exclusive_put(struct clk *clk) {}
+
 static inline int clk_enable(struct clk *clk)
 {
 	return 0;
@@ -609,6 +666,11 @@ static inline int clk_set_rate(struct clk *clk, unsigned long rate)
 	return 0;
 }
 
+static inline int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
+{
+	return 0;
+}
+
 static inline long clk_round_rate(struct clk *clk, unsigned long rate)
 {
 	return 0;
-- 
2.14.3
