Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B24225624
	for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708336772; cv=none; b=qJ6whI+fv+gsa1i290+pgeHfBtNtCfGKNuOJLtiHWE2Jo/OgzIPiOHUSvLPFY2eZlTgVJuiJSrPqU2lpN7oYe8mOOvsDy7g/diF7Xd9BF2FpSYoGfiaNdEpUk76POxHNCTjRWekPenEpyqnU0E5chxanWeuwJ9QGZC3WMfnm1jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708336772; c=relaxed/simple;
	bh=UFg5Y/nnGfPoHiHLKLLt6EH77/MsMtjJoR7bs9nfPlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=eIE9OjfKCIrc18ejK2vqwR789Z59M9bCZ1VhEoJXNbMrzS7b9bGzZgOkkhloi1x1v5IAck/4o1gn0dq51P3g5P6mG3padRqm8dqAzPkjYeoU1pD4TPm3QAPXOl5ZTAqE5XfU1pfmug9fhYUCkfahiDgjReJJtwF744pUDc//2Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=1lD1nW1r; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="1lD1nW1r"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41J46YIX011941;
	Mon, 19 Feb 2024 04:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=DKIM; bh=k5afY3Gs
	1ePJILlUWWaKEvm+d4iPVNavd9yoA/OykHw=; b=1lD1nW1rIVkomuKi92+HwwaW
	7w2QjCWKbcglD1RWGmPR1BL/zE7enGp097rZaq/I4NLX3WCxAx2OweCb33oxQDI8
	3NXkx17Lh5TvE3eLHneSM4jUr+fox/1colvGFaMvOPa+QUV/V1sYiURgeGCWXBVD
	wu6bEplIbBI21viGgQoWJ5y8Gyj3gRbjL0iylmlqL0MxiS7ChwE2HWdigBZ46tuG
	qkMtI2m7B6zCvu79srjj5pjGk3AYj4d8UuVMuq6d1XEPnQjkUPpkxZ/OWE29w/Kf
	donHwpZvP9e+4f4aDUe+yeau1lju2dizzjf/46Jti3zTlgg9mJr3ojczJoKcng==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3waqh8em2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Feb 2024 04:59:16 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 41J9xFdw064149
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Feb 2024 04:59:15 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 19 Feb
 2024 04:59:14 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 19 Feb 2024 04:59:14 -0500
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 41J9x407028285;
	Mon, 19 Feb 2024 04:59:07 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Mon, 19 Feb 2024 11:02:24 +0100
Subject: [PATCH RFC] clk: add a new clock type for clock rates
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240219-clk-u64-rates-v1-1-0ff0e85f4b29@analog.com>
X-B4-Tracking: v=1; b=H4sIAC8n02UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDI0MT3eScbN1SMxPdosSS1GJdc0OTRHMjIwujtCQzJaCegqLUtMwKsHn
 RSkFuzkqxtbUA0I8MwWQAAAA=
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        <linux-clk@vger.kernel.org>
CC: 
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708336946; l=29396;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=UFg5Y/nnGfPoHiHLKLLt6EH77/MsMtjJoR7bs9nfPlc=;
 b=86ZL7HQa5+0UiVYjrEilRMDr01iKnmzGcTOz4jxPsFZT9bYw+/N+d3LyYLlSbSSp5bAINJ+Kj
 bAjfe2qXqLcBGZiRUPQjPLc7EtKAa6BtN64jhy0z5IyvoPtIibqDZ/6
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: GY0y5XKkEfNjNxJhSYd8ObzhIs0asQDL
X-Proofpoint-GUID: GY0y5XKkEfNjNxJhSYd8ObzhIs0asQDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_07,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 clxscore=1011
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402190074

Currently, there's a fundamental issue for devices that can output high
clock frequencies on 32bit system. That's because the rate is defined as
unsigned long.

With a new type, we could slowly move all the users to the new type and
then it should be fairly straight to change the type to unsigned long
long.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
This is clearly far from being ready for inclusion but it should be
enough to show the idea. And this will require a huge amount of "not so
fun" work (which I'm willing to do), so I want to make sure this is
something the maintainers would be willing to accept before starting
the effort on this.

Currently, devices that can output high frequencies won't  work
properly on 32 bit arch (or at least at it's full capacity). We even
have things like this [1] so we don't risk issues.

A colleague of mine already tried to start a discussion on this [2] but
with no luck. So I'm trying my luck now :).

Internally, at ADI, we just have a simple scaling devicetree properly
for both consumers and providers. It's not really proper code for
inclusion in the kernel but I could surely make it better and send a RFC
with the scaling approach. It's clearly way less intrusive but it would be
prone to rounding issues and not as good as the new type. But we have
lived with it for years now. So, at least, as far as I'm concerned, it
would work for ADI (but naturally I want something that works for
everyone).

In the end, I would just like to have a proper (upstreamed) solution for this. 

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/iio/frequency/Kconfig#L75
[2]: https://lore.kernel.org/linux-clk/20221206112827.115674-1-demonsingur@gmail.com/
---
 drivers/clk/clk.c            | 134 +++++++++++++++++++++----------------------
 include/linux/clk-provider.h |  67 +++++++++++-----------
 include/linux/clk-types.h    |   7 +++
 include/linux/clk.h          |  35 +++++------
 4 files changed, 126 insertions(+), 117 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2253c154a824..19bb04c0af99 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -64,9 +64,9 @@ struct clk_core {
 	struct clk_parent_map	*parents;
 	u8			num_parents;
 	u8			new_parent_index;
-	unsigned long		rate;
-	unsigned long		req_rate;
-	unsigned long		new_rate;
+	clk_rate_t		rate;
+	clk_rate_t		req_rate;
+	clk_rate_t		new_rate;
 	struct clk_core		*new_parent;
 	struct clk_core		*new_child;
 	unsigned long		flags;
@@ -75,8 +75,8 @@ struct clk_core {
 	unsigned int		enable_count;
 	unsigned int		prepare_count;
 	unsigned int		protect_count;
-	unsigned long		min_rate;
-	unsigned long		max_rate;
+	clk_rate_t		min_rate;
+	clk_rate_t		max_rate;
 	unsigned long		accuracy;
 	int			phase;
 	struct clk_duty		duty;
@@ -99,8 +99,8 @@ struct clk {
 	struct device *dev;
 	const char *dev_id;
 	const char *con_id;
-	unsigned long min_rate;
-	unsigned long max_rate;
+	clk_rate_t min_rate;
+	clk_rate_t max_rate;
 	unsigned int exclusive_count;
 	struct hlist_node clks_node;
 };
@@ -475,7 +475,7 @@ unsigned int __clk_get_enable_count(struct clk *clk)
 	return !clk ? 0 : clk->core->enable_count;
 }
 
-static unsigned long clk_core_get_rate_nolock(struct clk_core *core)
+static clk_rate_t clk_core_get_rate_nolock(struct clk_core *core)
 {
 	if (!core)
 		return 0;
@@ -491,7 +491,7 @@ static unsigned long clk_core_get_rate_nolock(struct clk_core *core)
 	return 0;
 }
 
-unsigned long clk_hw_get_rate(const struct clk_hw *hw)
+clk_rate_t clk_hw_get_rate(const struct clk_hw *hw)
 {
 	return clk_core_get_rate_nolock(hw->core);
 }
@@ -538,8 +538,8 @@ bool __clk_is_enabled(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_is_enabled);
 
-static bool mux_is_better_rate(unsigned long rate, unsigned long now,
-			   unsigned long best, unsigned long flags)
+static bool mux_is_better_rate(clk_rate_t rate, clk_rate_t now,
+			       clk_rate_t best, unsigned long flags)
 {
 	if (flags & CLK_MUX_ROUND_CLOSEST)
 		return abs(now - rate) < abs(best - rate);
@@ -549,7 +549,7 @@ static bool mux_is_better_rate(unsigned long rate, unsigned long now,
 
 static void clk_core_init_rate_req(struct clk_core * const core,
 				   struct clk_rate_request *req,
-				   unsigned long rate);
+				   clk_rate_t rate);
 
 static int clk_core_round_rate_nolock(struct clk_core *core,
 				      struct clk_rate_request *req);
@@ -580,7 +580,7 @@ clk_core_forward_rate_req(struct clk_core *core,
 			  const struct clk_rate_request *old_req,
 			  struct clk_core *parent,
 			  struct clk_rate_request *req,
-			  unsigned long parent_rate)
+			  clk_rate_t parent_rate)
 {
 	if (WARN_ON(!clk_core_has_parent(core, parent)))
 		return;
@@ -600,7 +600,7 @@ clk_core_determine_rate_no_reparent(struct clk_hw *hw,
 {
 	struct clk_core *core = hw->core;
 	struct clk_core *parent = core->parent;
-	unsigned long best;
+	clk_rate_t best;
 	int ret;
 
 	if (core->flags & CLK_SET_RATE_PARENT) {
@@ -641,7 +641,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 {
 	struct clk_core *core = hw->core, *parent, *best_parent = NULL;
 	int i, num_parents, ret;
-	unsigned long best = 0;
+	clk_rate_t best = 0;
 
 	/* if NO_REPARENT flag set, pass through to current parent */
 	if (core->flags & CLK_SET_RATE_NO_REPARENT)
@@ -650,7 +650,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	/* find the parent that can provide the fastest rate <= rate */
 	num_parents = core->num_parents;
 	for (i = 0; i < num_parents; i++) {
-		unsigned long parent_rate;
+		clk_rate_t parent_rate;
 
 		parent = clk_core_get_parent_by_index(core, i);
 		if (!parent)
@@ -700,8 +700,8 @@ struct clk *__clk_lookup(const char *name)
 }
 
 static void clk_core_get_boundaries(struct clk_core *core,
-				    unsigned long *min_rate,
-				    unsigned long *max_rate)
+				    clk_rate_t *min_rate,
+				    clk_rate_t *max_rate)
 {
 	struct clk *clk_user;
 
@@ -726,16 +726,16 @@ static void clk_core_get_boundaries(struct clk_core *core,
  * Fills the @min_rate and @max_rate variables with the minimum and
  * maximum that clock can reach.
  */
-void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
-			   unsigned long *max_rate)
+void clk_hw_get_rate_range(struct clk_hw *hw, clk_rate_t *min_rate,
+			   clk_rate_t *max_rate)
 {
 	clk_core_get_boundaries(hw->core, min_rate, max_rate);
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_rate_range);
 
 static bool clk_core_check_boundaries(struct clk_core *core,
-				      unsigned long min_rate,
-				      unsigned long max_rate)
+				      clk_rate_t min_rate,
+				      clk_rate_t max_rate)
 {
 	struct clk *user;
 
@@ -751,8 +751,8 @@ static bool clk_core_check_boundaries(struct clk_core *core,
 	return true;
 }
 
-void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
-			   unsigned long max_rate)
+void clk_hw_set_rate_range(struct clk_hw *hw, clk_rate_t min_rate,
+			   clk_rate_t max_rate)
 {
 	hw->core->min_rate = min_rate;
 	hw->core->max_rate = max_rate;
@@ -1509,7 +1509,7 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 
 static void clk_core_init_rate_req(struct clk_core * const core,
 				   struct clk_rate_request *req,
-				   unsigned long rate)
+				   clk_rate_t rate)
 {
 	struct clk_core *parent;
 
@@ -1547,7 +1547,7 @@ static void clk_core_init_rate_req(struct clk_core * const core,
  */
 void clk_hw_init_rate_request(const struct clk_hw *hw,
 			      struct clk_rate_request *req,
-			      unsigned long rate)
+			      clk_rate_t rate)
 {
 	if (WARN_ON(!hw || !req))
 		return;
@@ -1571,7 +1571,7 @@ void clk_hw_forward_rate_request(const struct clk_hw *hw,
 				 const struct clk_rate_request *old_req,
 				 const struct clk_hw *parent,
 				 struct clk_rate_request *req,
-				 unsigned long parent_rate)
+				 clk_rate_t parent_rate)
 {
 	if (WARN_ON(!hw || !old_req || !parent || !req))
 		return;
@@ -1658,7 +1658,7 @@ EXPORT_SYMBOL_GPL(__clk_determine_rate);
  * Return: returns rounded rate of hw clk if clk supports round_rate operation
  *         else returns the parent rate.
  */
-unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
+clk_rate_t clk_hw_round_rate(struct clk_hw *hw, clk_rate_t rate)
 {
 	int ret;
 	struct clk_rate_request req;
@@ -1686,7 +1686,7 @@ EXPORT_SYMBOL_GPL(clk_hw_round_rate);
  * use which is then returned.  If clk doesn't support round_rate operation
  * then the parent rate is returned.
  */
-long clk_round_rate(struct clk *clk, unsigned long rate)
+long clk_round_rate(struct clk *clk, clk_rate_t rate)
 {
 	struct clk_rate_request req;
 	int ret;
@@ -1734,7 +1734,7 @@ EXPORT_SYMBOL_GPL(clk_round_rate);
  * a driver returns that.
  */
 static int __clk_notify(struct clk_core *core, unsigned long msg,
-		unsigned long old_rate, unsigned long new_rate)
+			clk_rate_t old_rate, clk_rate_t new_rate)
 {
 	struct clk_notifier *cn;
 	struct clk_notifier_data cnd;
@@ -1817,10 +1817,10 @@ long clk_get_accuracy(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_get_accuracy);
 
-static unsigned long clk_recalc(struct clk_core *core,
-				unsigned long parent_rate)
+static clk_rate_t clk_recalc(struct clk_core *core,
+			     clk_rate_t parent_rate)
 {
-	unsigned long rate = parent_rate;
+	clk_rate_t rate = parent_rate;
 
 	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
 		rate = core->ops->recalc_rate(core->hw, parent_rate);
@@ -1845,8 +1845,8 @@ static unsigned long clk_recalc(struct clk_core *core,
 static void __clk_recalc_rates(struct clk_core *core, bool update_req,
 			       unsigned long msg)
 {
-	unsigned long old_rate;
-	unsigned long parent_rate = 0;
+	clk_rate_t old_rate;
+	clk_rate_t parent_rate = 0;
 	struct clk_core *child;
 
 	lockdep_assert_held(&prepare_lock);
@@ -1871,7 +1871,7 @@ static void __clk_recalc_rates(struct clk_core *core, bool update_req,
 		__clk_recalc_rates(child, update_req, msg);
 }
 
-static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
+static clk_rate_t clk_core_get_rate_recalc(struct clk_core *core)
 {
 	if (core && (core->flags & CLK_GET_RATE_NOCACHE))
 		__clk_recalc_rates(core, false, 0);
@@ -1888,9 +1888,9 @@ static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
  * the clock enabledness. If clk is NULL, or if an error occurred, then returns
  * 0.
  */
-unsigned long clk_get_rate(struct clk *clk)
+clk_rate_t clk_get_rate(struct clk *clk)
 {
-	unsigned long rate;
+	clk_rate_t rate;
 
 	if (!clk)
 		return 0;
@@ -2116,10 +2116,10 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
  * take on the rate of its parent.
  */
 static int __clk_speculate_rates(struct clk_core *core,
-				 unsigned long parent_rate)
+				 clk_rate_t parent_rate)
 {
 	struct clk_core *child;
-	unsigned long new_rate;
+	clk_rate_t new_rate;
 	int ret = NOTIFY_DONE;
 
 	lockdep_assert_held(&prepare_lock);
@@ -2146,7 +2146,7 @@ static int __clk_speculate_rates(struct clk_core *core,
 	return ret;
 }
 
-static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
+static void clk_calc_subtree(struct clk_core *core, clk_rate_t new_rate,
 			     struct clk_core *new_parent, u8 p_index)
 {
 	struct clk_core *child;
@@ -2170,14 +2170,14 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
  * changed.
  */
 static struct clk_core *clk_calc_new_rates(struct clk_core *core,
-					   unsigned long rate)
+					   clk_rate_t rate)
 {
 	struct clk_core *top = core;
 	struct clk_core *old_parent, *parent;
-	unsigned long best_parent_rate = 0;
-	unsigned long new_rate;
-	unsigned long min_rate;
-	unsigned long max_rate;
+	clk_rate_t best_parent_rate = 0;
+	clk_rate_t new_rate;
+	clk_rate_t min_rate;
+	clk_rate_t max_rate;
 	int p_index = 0;
 	long ret;
 
@@ -2298,8 +2298,8 @@ static void clk_change_rate(struct clk_core *core)
 {
 	struct clk_core *child;
 	struct hlist_node *tmp;
-	unsigned long old_rate;
-	unsigned long best_parent_rate = 0;
+	clk_rate_t old_rate;
+	clk_rate_t best_parent_rate = 0;
 	bool skip_set_rate = false;
 	struct clk_core *old_parent;
 	struct clk_core *parent = NULL;
@@ -2383,8 +2383,8 @@ static void clk_change_rate(struct clk_core *core)
 	clk_pm_runtime_put(core);
 }
 
-static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
-						     unsigned long req_rate)
+static clk_rate_t clk_core_req_round_rate_nolock(struct clk_core *core,
+						 clk_rate_t req_rate)
 {
 	int ret, cnt;
 	struct clk_rate_request req;
@@ -2414,10 +2414,10 @@ static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 }
 
 static int clk_core_set_rate_nolock(struct clk_core *core,
-				    unsigned long req_rate)
+				    clk_rate_t req_rate)
 {
 	struct clk_core *top, *fail_clk;
-	unsigned long rate;
+	clk_rate_t rate;
 	int ret;
 
 	if (!core)
@@ -2483,7 +2483,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
  *
  * Returns 0 on success, -EERROR otherwise.
  */
-int clk_set_rate(struct clk *clk, unsigned long rate)
+int clk_set_rate(struct clk *clk, clk_rate_t rate)
 {
 	int ret;
 
@@ -2526,7 +2526,7 @@ EXPORT_SYMBOL_GPL(clk_set_rate);
  *
  * Returns 0 on success, -EERROR otherwise.
  */
-int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
+int clk_set_rate_exclusive(struct clk *clk, clk_rate_t rate)
 {
 	int ret;
 
@@ -2555,11 +2555,11 @@ int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
 EXPORT_SYMBOL_GPL(clk_set_rate_exclusive);
 
 static int clk_set_rate_range_nolock(struct clk *clk,
-				     unsigned long min,
-				     unsigned long max)
+				     clk_rate_t min,
+				     clk_rate_t max)
 {
 	int ret = 0;
-	unsigned long old_min, old_max, rate;
+	clk_rate_t old_min, old_max, rate;
 
 	lockdep_assert_held(&prepare_lock);
 
@@ -2633,7 +2633,7 @@ static int clk_set_rate_range_nolock(struct clk *clk,
  *
  * Return: 0 for success or negative errno on failure.
  */
-int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
+int clk_set_rate_range(struct clk *clk, clk_rate_t min, clk_rate_t max)
 {
 	int ret;
 
@@ -2657,7 +2657,7 @@ EXPORT_SYMBOL_GPL(clk_set_rate_range);
  *
  * Returns success (0) or negative errno.
  */
-int clk_set_min_rate(struct clk *clk, unsigned long rate)
+int clk_set_min_rate(struct clk *clk, clk_rate_t rate)
 {
 	if (!clk)
 		return 0;
@@ -2675,7 +2675,7 @@ EXPORT_SYMBOL_GPL(clk_set_min_rate);
  *
  * Returns success (0) or negative errno.
  */
-int clk_set_max_rate(struct clk *clk, unsigned long rate)
+int clk_set_max_rate(struct clk *clk, clk_rate_t rate)
 {
 	if (!clk)
 		return 0;
@@ -2759,7 +2759,7 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 {
 	int ret = 0;
 	int p_index = 0;
-	unsigned long p_rate = 0;
+	clk_rate_t p_rate = 0;
 
 	lockdep_assert_held(&prepare_lock);
 
@@ -3263,7 +3263,7 @@ DEFINE_SHOW_ATTRIBUTE(clk_summary);
 static void clk_dump_one(struct seq_file *s, struct clk_core *c, int level)
 {
 	int phase;
-	unsigned long min_rate, max_rate;
+	clk_rate_t min_rate, max_rate;
 
 	clk_core_get_boundaries(c, &min_rate, &max_rate);
 
@@ -3566,7 +3566,7 @@ DEFINE_SHOW_ATTRIBUTE(clk_duty_cycle);
 static int clk_min_rate_show(struct seq_file *s, void *data)
 {
 	struct clk_core *core = s->private;
-	unsigned long min_rate, max_rate;
+	clk_rate_t min_rate, max_rate;
 
 	clk_prepare_lock();
 	clk_core_get_boundaries(core, &min_rate, &max_rate);
@@ -3580,7 +3580,7 @@ DEFINE_SHOW_ATTRIBUTE(clk_min_rate);
 static int clk_max_rate_show(struct seq_file *s, void *data)
 {
 	struct clk_core *core = s->private;
-	unsigned long min_rate, max_rate;
+	clk_rate_t min_rate, max_rate;
 
 	clk_prepare_lock();
 	clk_core_get_boundaries(core, &min_rate, &max_rate);
@@ -3781,7 +3781,7 @@ static int __clk_core_init(struct clk_core *core)
 {
 	int ret;
 	struct clk_core *parent;
-	unsigned long rate;
+	clk_rate_t rate;
 	int phase;
 
 	clk_prepare_lock();
@@ -4375,8 +4375,8 @@ static void clk_nodrv_disable_unprepare(struct clk_hw *hw)
 	WARN_ON_ONCE(1);
 }
 
-static int clk_nodrv_set_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long parent_rate)
+static int clk_nodrv_set_rate(struct clk_hw *hw, clk_rate_t rate,
+			      clk_rate_t parent_rate)
 {
 	return -ENXIO;
 }
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1293c38ddb7f..a1f92993b580 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -6,6 +6,7 @@
 #ifndef __LINUX_CLK_PROVIDER_H
 #define __LINUX_CLK_PROVIDER_H
 
+#include <linux/clk-types.h>
 #include <linux/of.h>
 #include <linux/of_clk.h>
 
@@ -57,21 +58,21 @@ struct dentry;
  */
 struct clk_rate_request {
 	struct clk_core *core;
-	unsigned long rate;
-	unsigned long min_rate;
-	unsigned long max_rate;
-	unsigned long best_parent_rate;
+	clk_rate_t rate;
+	clk_rate_t min_rate;
+	clk_rate_t max_rate;
+	clk_rate_t best_parent_rate;
 	struct clk_hw *best_parent_hw;
 };
 
 void clk_hw_init_rate_request(const struct clk_hw *hw,
 			      struct clk_rate_request *req,
-			      unsigned long rate);
+			      clk_rate_t rate);
 void clk_hw_forward_rate_request(const struct clk_hw *core,
 				 const struct clk_rate_request *old_req,
 				 const struct clk_hw *parent,
 				 struct clk_rate_request *req,
-				 unsigned long parent_rate);
+				 clk_rate_t parent_rate);
 
 /**
  * struct clk_duty - Structure encoding the duty cycle ratio of a clock
@@ -242,19 +243,19 @@ struct clk_ops {
 	void		(*disable_unused)(struct clk_hw *hw);
 	int		(*save_context)(struct clk_hw *hw);
 	void		(*restore_context)(struct clk_hw *hw);
-	unsigned long	(*recalc_rate)(struct clk_hw *hw,
-					unsigned long parent_rate);
-	long		(*round_rate)(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate);
+	clk_rate_t	(*recalc_rate)(struct clk_hw *hw,
+				       clk_rate_t parent_rate);
+	long		(*round_rate)(struct clk_hw *hw, clk_rate_t rate,
+				      clk_rate_t *parent_rate);
 	int		(*determine_rate)(struct clk_hw *hw,
 					  struct clk_rate_request *req);
 	int		(*set_parent)(struct clk_hw *hw, u8 index);
 	u8		(*get_parent)(struct clk_hw *hw);
-	int		(*set_rate)(struct clk_hw *hw, unsigned long rate,
-				    unsigned long parent_rate);
+	int		(*set_rate)(struct clk_hw *hw, clk_rate_t rate,
+				    clk_rate_t parent_rate);
 	int		(*set_rate_and_parent)(struct clk_hw *hw,
-				    unsigned long rate,
-				    unsigned long parent_rate, u8 index);
+					       clk_rate_t rate,
+					       clk_rate_t parent_rate, u8 index);
 	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
 					   unsigned long parent_accuracy);
 	int		(*get_phase)(struct clk_hw *hw);
@@ -351,7 +352,7 @@ struct clk_hw {
  */
 struct clk_fixed_rate {
 	struct		clk_hw hw;
-	unsigned long	fixed_rate;
+	clk_rate_t	fixed_rate;
 	unsigned long	fixed_accuracy;
 	unsigned long	flags;
 };
@@ -363,11 +364,11 @@ struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
-		unsigned long fixed_rate, unsigned long fixed_accuracy,
+		clk_rate_t fixed_rate, unsigned long fixed_accuracy,
 		unsigned long clk_fixed_flags, bool devm);
 struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
-		unsigned long fixed_rate);
+		clk_rate_t fixed_rate);
 /**
  * clk_hw_register_fixed_rate - register fixed-rate clock with the clock
  * framework
@@ -701,15 +702,15 @@ struct clk_divider {
 extern const struct clk_ops clk_divider_ops;
 extern const struct clk_ops clk_divider_ro_ops;
 
-unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
+clk_rate_t divider_recalc_rate(struct clk_hw *hw, clk_rate_t parent_rate,
 		unsigned int val, const struct clk_div_table *table,
 		unsigned long flags, unsigned long width);
 long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
-			       unsigned long rate, unsigned long *prate,
+			       clk_rate_t rate, clk_rate_t *prate,
 			       const struct clk_div_table *table,
 			       u8 width, unsigned long flags);
 long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
-				  unsigned long rate, unsigned long *prate,
+				  clk_rate_t rate, clk_rate_t *prate,
 				  const struct clk_div_table *table, u8 width,
 				  unsigned long flags, unsigned int val);
 int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
@@ -718,7 +719,7 @@ int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
 int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
 			      const struct clk_div_table *table, u8 width,
 			      unsigned long flags, unsigned int val);
-int divider_get_val(unsigned long rate, unsigned long parent_rate,
+int divider_get_val(clk_rate_t rate, clk_rate_t parent_rate,
 		const struct clk_div_table *table, u8 width,
 		unsigned long flags);
 
@@ -1159,8 +1160,8 @@ struct clk_fractional_divider {
 	u8		nwidth;
 	u8		flags;
 	void		(*approximation)(struct clk_hw *hw,
-				unsigned long rate, unsigned long *parent_rate,
-				unsigned long *m, unsigned long *n);
+				clk_rate_t rate, clk_rate_t *parent_rate,
+				clk_rate_t *m, clk_rate_t *n);
 	spinlock_t	*lock;
 };
 
@@ -1316,7 +1317,7 @@ struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
 int clk_hw_get_parent_index(struct clk_hw *hw);
 int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *new_parent);
 unsigned int __clk_get_enable_count(struct clk *clk);
-unsigned long clk_hw_get_rate(const struct clk_hw *hw);
+clk_rate_t clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long clk_hw_get_flags(const struct clk_hw *hw);
 #define clk_hw_can_set_rate_parent(hw) \
 	(clk_hw_get_flags((hw)) & CLK_SET_RATE_PARENT)
@@ -1337,10 +1338,10 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 int clk_hw_determine_rate_no_reparent(struct clk_hw *hw,
 				      struct clk_rate_request *req);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
-void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
-			   unsigned long *max_rate);
-void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
-			   unsigned long max_rate);
+void clk_hw_get_rate_range(struct clk_hw *hw, clk_rate_t *min_rate,
+			   clk_rate_t *max_rate);
+void clk_hw_set_rate_range(struct clk_hw *hw, clk_rate_t min_rate,
+			   clk_rate_t max_rate);
 
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {
@@ -1348,8 +1349,8 @@ static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 	dst->core = src->core;
 }
 
-static inline long divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate,
+static inline long divider_round_rate(struct clk_hw *hw, clk_rate_t rate,
+				      clk_rate_t *prate,
 				      const struct clk_div_table *table,
 				      u8 width, unsigned long flags)
 {
@@ -1357,8 +1358,8 @@ static inline long divider_round_rate(struct clk_hw *hw, unsigned long rate,
 					 rate, prate, table, width, flags);
 }
 
-static inline long divider_ro_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *prate,
+static inline long divider_ro_round_rate(struct clk_hw *hw, clk_rate_t rate,
+					 clk_rate_t *prate,
 					 const struct clk_div_table *table,
 					 u8 width, unsigned long flags,
 					 unsigned int val)
@@ -1371,7 +1372,7 @@ static inline long divider_ro_round_rate(struct clk_hw *hw, unsigned long rate,
 /*
  * FIXME clock api without lock protection
  */
-unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate);
+clk_rate_t clk_hw_round_rate(struct clk_hw *hw, clk_rate_t rate);
 
 struct clk_onecell_data {
 	struct clk **clks;
diff --git a/include/linux/clk-types.h b/include/linux/clk-types.h
new file mode 100644
index 000000000000..d1cfd37a42ee
--- /dev/null
+++ b/include/linux/clk-types.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_CLK_TYPES_H
+#define __LINUX_CLK_TYPES_H
+
+typedef	unsigned long	clk_rate_t;
+
+#endif
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 06f1b292f8a0..b107c4018cd9 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -9,6 +9,7 @@
 #ifndef __LINUX_CLK_H
 #define __LINUX_CLK_H
 
+#include <linux/clk-types.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/notifier.h>
@@ -70,8 +71,8 @@ struct clk_notifier {
  */
 struct clk_notifier_data {
 	struct clk		*clk;
-	unsigned long		old_rate;
-	unsigned long		new_rate;
+	clk_rate_t		old_rate;
+	clk_rate_t		new_rate;
 };
 
 /**
@@ -687,7 +688,7 @@ void clk_bulk_disable(int num_clks, const struct clk_bulk_data *clks);
  *		  This is only valid once the clock source has been enabled.
  * @clk: clock source
  */
-unsigned long clk_get_rate(struct clk *clk);
+clk_rate_t clk_get_rate(struct clk *clk);
 
 /**
  * clk_put	- "free" the clock source
@@ -766,7 +767,7 @@ void devm_clk_put(struct device *dev, struct clk *clk);
  *
  * Returns rounded clock rate in Hz, or negative errno.
  */
-long clk_round_rate(struct clk *clk, unsigned long rate);
+long clk_round_rate(struct clk *clk, clk_rate_t rate);
 
 /**
  * clk_set_rate - set the clock rate for a clock source
@@ -778,7 +779,7 @@ long clk_round_rate(struct clk *clk, unsigned long rate);
  *
  * Returns success (0) or negative errno.
  */
-int clk_set_rate(struct clk *clk, unsigned long rate);
+int clk_set_rate(struct clk *clk, clk_rate_t rate);
 
 /**
  * clk_set_rate_exclusive- set the clock rate and claim exclusivity over
@@ -795,7 +796,7 @@ int clk_set_rate(struct clk *clk, unsigned long rate);
  *
  * Returns success (0) or negative errno.
  */
-int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
+int clk_set_rate_exclusive(struct clk *clk, clk_rate_t rate);
 
 /**
  * clk_has_parent - check if a clock is a possible parent for another
@@ -817,7 +818,7 @@ bool clk_has_parent(const struct clk *clk, const struct clk *parent);
  *
  * Returns success (0) or negative errno.
  */
-int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max);
+int clk_set_rate_range(struct clk *clk, clk_rate_t min, clk_rate_t max);
 
 /**
  * clk_set_min_rate - set a minimum clock rate for a clock source
@@ -826,7 +827,7 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max);
  *
  * Returns success (0) or negative errno.
  */
-int clk_set_min_rate(struct clk *clk, unsigned long rate);
+int clk_set_min_rate(struct clk *clk, clk_rate_t rate);
 
 /**
  * clk_set_max_rate - set a maximum clock rate for a clock source
@@ -835,7 +836,7 @@ int clk_set_min_rate(struct clk *clk, unsigned long rate);
  *
  * Returns success (0) or negative errno.
  */
-int clk_set_max_rate(struct clk *clk, unsigned long rate);
+int clk_set_max_rate(struct clk *clk, clk_rate_t rate);
 
 /**
  * clk_set_parent - set the parent clock source for this clock
@@ -999,22 +1000,22 @@ static inline void clk_disable(struct clk *clk) {}
 static inline void clk_bulk_disable(int num_clks,
 				    const struct clk_bulk_data *clks) {}
 
-static inline unsigned long clk_get_rate(struct clk *clk)
+static inline clk_rate_t clk_get_rate(struct clk *clk)
 {
 	return 0;
 }
 
-static inline int clk_set_rate(struct clk *clk, unsigned long rate)
+static inline int clk_set_rate(struct clk *clk, clk_rate_t rate)
 {
 	return 0;
 }
 
-static inline int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
+static inline int clk_set_rate_exclusive(struct clk *clk, clk_rate_t rate)
 {
 	return 0;
 }
 
-static inline long clk_round_rate(struct clk *clk, unsigned long rate)
+static inline long clk_round_rate(struct clk *clk, clk_rate_t rate)
 {
 	return 0;
 }
@@ -1024,18 +1025,18 @@ static inline bool clk_has_parent(struct clk *clk, struct clk *parent)
 	return true;
 }
 
-static inline int clk_set_rate_range(struct clk *clk, unsigned long min,
-				     unsigned long max)
+static inline int clk_set_rate_range(struct clk *clk, clk_rate_t min,
+				     clk_rate_t max)
 {
 	return 0;
 }
 
-static inline int clk_set_min_rate(struct clk *clk, unsigned long rate)
+static inline int clk_set_min_rate(struct clk *clk, clk_rate_t rate)
 {
 	return 0;
 }
 
-static inline int clk_set_max_rate(struct clk *clk, unsigned long rate)
+static inline int clk_set_max_rate(struct clk *clk, clk_rate_t rate)
 {
 	return 0;
 }

---
base-commit: efe5a1b888ab0f6acf723e2a12a4644a599294d0
change-id: 20240214-clk-u64-rates-714a72282fb6
--

Thanks!
- Nuno Sá

