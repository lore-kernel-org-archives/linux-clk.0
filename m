Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA0635BDC4
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 23:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772839392; cv=none; b=Ndd/hjN5JbgZnX1Ntuuq/30rx0nlw2mCuchyCtIwyMaQI40r1k2S4jl5a5/V9PuQtL8x3rbGN8GRuM8a7Aph2wBZvN6GleA5kYvQyapCkXwIqLDqzNkh95lTMz1+5TSxpyqYwKw1UtyF8Dyyc56FlL17M8zUdW/MDjexJFy8HLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772839392; c=relaxed/simple;
	bh=kwejKjuYY4XenvDpzzbyRDggruiFrCZ5PscbhpIwrS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tl+HyddRlCLATv6LwDmbjKMqmyCv891pQbAUJi/GPU7XcUdWoJ8XS/156MkTXpXOsW58/0Qgk5RO7pgI9QbQdJp+wumeWkCeKMunt3lxgKo4ofI0m+y1DC8d1hPWJ2jHdzO09vZtEwgs+fGRgvqTPt5HMQ9NjGqxPTRdGDi6/qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CdZdS0YN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Je1s2md7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdZdS0YN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Je1s2md7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772839388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OppYOjvwaN4z3cxzeUtBRU+DjHN0TKViDHEHlur24l0=;
	b=CdZdS0YNWGraGk4fBIphPiiYirQXx33P4vSEnhONVimafTK0Y90diGcCxe58C6OCpes+BC
	lX61vBjIXCXls9cdHKRmr63UjWlUEz7BQMEpyf5qm38ARUUM0PbEteoxwdlRW2AD0CGgmk
	iytF2Xa4nu+51rJ7RAp7Ewv6OLrEKxw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-TQRlhDmiM8uEUuvBlz_Iaw-1; Fri, 06 Mar 2026 18:23:07 -0500
X-MC-Unique: TQRlhDmiM8uEUuvBlz_Iaw-1
X-Mimecast-MFC-AGG-ID: TQRlhDmiM8uEUuvBlz_Iaw_1772839387
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8950562d351so899628036d6.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 15:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772839387; x=1773444187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OppYOjvwaN4z3cxzeUtBRU+DjHN0TKViDHEHlur24l0=;
        b=Je1s2md7AsZMVngEn6P2eWr6e+fcQXB5rKXR30BGX3d3uC6qdIO1PWlxMpjKxH55oW
         5kArylNDC5TWkPEfTU3lBZbhCWWsMwsd5xs9vHMQkyyNugRzbwxbWmHHUj/TuzTuDHWI
         zf/roNEY6mCiAJwrdZHc1ntfkBh9mGcumapxX8S+jb8oqOHeh6u1Lu+hEFLjoLNuYj9P
         gNvY8vhKYlFI+4KmfMwC3AwFm8LrdlxQuh7mZajA6st7F50Y6VpQ1oVFYQ+twYov4hIr
         dSLVtyh+buJXXqgsdJK3+jLABG8l5sO+FEDZFBAiSsSDiycMjM8D9WDQI7eX16ja2Rqt
         NUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839387; x=1773444187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OppYOjvwaN4z3cxzeUtBRU+DjHN0TKViDHEHlur24l0=;
        b=SYg9/Nv/sfvmwo1aG2LwssgJmg8ku5Ok6fFDwRQ8iaSUjeurdF+pqDiIo8/LrV2Dz5
         buNPrMWFdyBpbEUsMLqlheJBJCqDVvtG0P4ym1+E9JETKfjMSi5AmalLJa20CWwsJRIF
         tCFHRyQncbFbEjDrTi7qmqOFNAchEEdBkZ/xELa5iN5YnJcUjNKOx2IClKscdOi+zh2e
         0VIktgm2fKHRtIfWmAXZjDgzmaLdIq0StYpZipubPAgohHYwBWtARv74zUfgnF7GdJma
         Atxn7Ttu7dtMnDYTnywM6ebCBvq+NyChuSSTX6wvAV1WKYUO4asJe5aCYrsr7UBtNKsS
         dEag==
X-Gm-Message-State: AOJu0Yw8zY45+sSMRiNC2HsfWPnAKjdRdOfjbjw5EqoxOWD3ZPCvMMx+
	RbY8FnFcULnpF6C5po8b6qnEPJ4xiEwfZyKchNqR0kuxFxOFuw7bRZU1454mA8wcUxrJIQF0JHx
	w3/0y2ZEVhqALkMGqASryIVoDAQuxCkLZZBQxXfzktTW9v9RrnxmvMTr4C7xCbElkiqjOvvX1cy
	RoeJQ/xP+hvABIdgDXvtQ7Vi9eScw/DNAbT/IMZiBR/POk
X-Gm-Gg: ATEYQzwnujt3FZdwh3Hd2xW1hqhpTW8+2axHhzdh4aNNt9i9IyFpuRUw2xSkD+Fx40Z
	0+93SbFtMKIM+ylf9iYyZG7DhlplAmFAyR5eaI9VWw0vH+TWacicehtnBIU/lUh3aUlAd/1mAJ2
	iH7T5aJMSfSie4Zp70kY2ArqwZShtEUfQxw9K9ViYf9k8r0LrCE6D+OuJ+LPqzOh0xhJVKgpn7P
	tsCsydx5TrPUDXBVqjzQaNrntaQyh5OVPecdPmCjGGrBiWHLC20lK28b4cgyPsh7uN49SgRtcWr
	kiAmP4EO2lUH2cObhgWgbh9EJR3KJ7zX03TdYzF67PgykXS+6dRn97rDOuifQLIu6d5MRSdgN6l
	InsFMyXEix8NMtOuHy7edR2+jl0wZ
X-Received: by 2002:a05:620a:190d:b0:8c7:139a:bf66 with SMTP id af79cd13be357-8cd6d4b4e6amr546281285a.50.1772839386993;
        Fri, 06 Mar 2026 15:23:06 -0800 (PST)
X-Received: by 2002:a05:620a:190d:b0:8c7:139a:bf66 with SMTP id af79cd13be357-8cd6d4b4e6amr546277785a.50.1772839386494;
        Fri, 06 Mar 2026 15:23:06 -0800 (PST)
Received: from [10.125.247.224] ([2600:382:772b:4f24:8140:d6ff:f19a:7e11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f4856cesm203119585a.10.2026.03.06.15.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:05 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Mar 2026 18:21:38 -0500
Subject: [PATCH RFC v5 3/4] clk: add support for coordinated rate changes
 from the providers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-clk-scaling-v5-3-d21b84ee6f27@redhat.com>
References: <20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com>
In-Reply-To: <20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13700; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=kwejKjuYY4XenvDpzzbyRDggruiFrCZ5PscbhpIwrS0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJXJ57PPuvv++N9M/fbpR4e3BX1y7uevdiSnJgq7Bpp/
 N80uFyho5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIm0tDMy/Ku8KrP+i59/d9Gh
 B4edtG9O47ii81E3Skl91+6aFekSMxn+B1neavnDst1VVeyXCcMXt6UbOGv2Lryyr7rm3q9qfaU
 nvAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Some clock topologies require multiple clocks to change rates in a
specific sequence to maintain stability and avoid glitches. For example,
sibling clocks derived from a shared parent may need coordinated updates
to prevent output disruption.

The existing rate change propagation mechanism changes clocks
recursively from parent to children, but doesn't provide a way for
providers to explicitly control the order of rate changes across
multiple clocks or coordinate updates among siblings.

At the moment, changes to sibling clocks can unknowingly affect the
rate of other clocks in the tree, and some boards are unknowingly
dependent on this behavior.

Let's add infrastructure to the clk core so that clks can opt into
a new way to allow changing the rates of multiple clks by:

- Add a CLK_V2_RATE_NEGOTIATION flag for clks that want to participate
  in this new negotiation logic.

- A clk provider calls clk_hw_get_v2_stable_clks() to get the list of
  clks with this set as part of the planning phase.

- It is up the to clk provider to determine what the new parent rate
  should be for that part of the clk subtree.

- The clk provider calls clk_hw_add_coordinated_rate_changes() for any
  clks that should have also their rate changed. It is up to the
  provider to provide the correct order that the clks should be changed.

- The clk core executes the rate changes serially in the order
  specified by the provider.

If the change list is empty, then the behavior falls back to the
existing propagation mechanism to maintain compatibility with existing
clk drivers.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c            | 207 +++++++++++++++++++++++++++++++++++++++----
 include/linux/clk-provider.h |  39 +++++++-
 2 files changed, 229 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df32223c1120c3710261296027c4cd3..c8ff31a6799c75746f2e4095cc3ff77fdbbdf6ef 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -838,6 +838,111 @@ void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 }
 EXPORT_SYMBOL_GPL(clk_hw_set_rate_range);
 
+static int __clk_hw_get_v2_stable_clks(struct clk_hw *hw,
+				       struct clk_hw *requesting_hw,
+				       unsigned long requesting_rate,
+				       struct list_head *stable_clks)
+{
+	struct clk_core *child;
+	int ret;
+
+	if (hw->core->flags & CLK_V2_RATE_NEGOTIATION) {
+		struct clk_rate_change *clk_node;
+
+		clk_node = kzalloc_obj(*clk_node);
+		if (!clk_node)
+			return -ENOMEM;
+
+		clk_node->hw = hw;
+		clk_node->current_rate = clk_hw_get_rate(hw);
+
+		if (hw == requesting_hw)
+			clk_node->target_rate = requesting_rate;
+		else
+			clk_node->target_rate = clk_hw_get_rate(hw);
+
+		clk_node->new_parent_index = 0;
+		list_add_tail(&clk_node->node, stable_clks);
+	}
+
+	hlist_for_each_entry(child, &hw->core->children, child_node) {
+		ret = __clk_hw_get_v2_stable_clks(child->hw, requesting_hw,
+						  requesting_rate,
+						  stable_clks);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int clk_hw_get_v2_stable_clks(struct clk_rate_request *req, struct clk_hw *parent_hw,
+			      struct list_head *stable_clks)
+{
+	return __clk_hw_get_v2_stable_clks(parent_hw, req->core->hw, req->rate,
+					   stable_clks);
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_v2_stable_clks);
+
+void clk_hw_free_rate_changes(struct list_head *stable_clks)
+{
+	struct clk_rate_change *clk_node, *tmp;
+
+	list_for_each_entry_safe(clk_node, tmp, stable_clks, node) {
+		list_del(&clk_node->node);
+		kfree(clk_node);
+	}
+}
+EXPORT_SYMBOL_GPL(clk_hw_free_rate_changes);
+
+static int clk_hw_add_rate_change(struct clk_rate_request *req, struct clk_hw *hw,
+				  unsigned long old_rate, unsigned long new_rate,
+				  u8 new_parent_index)
+{
+	struct clk_rate_change *change;
+
+	change = kzalloc_obj(*change);
+	if (!change)
+		return -ENOMEM;
+
+	change->hw = hw;
+	change->current_rate = old_rate;
+	change->target_rate = new_rate;
+	change->new_parent_index = new_parent_index;
+	list_add_tail(&change->node, &req->ordered_rate_changes);
+
+	return 0;
+}
+
+int clk_hw_add_coordinated_rate_changes(struct clk_rate_request *req,
+					struct clk_hw *parent_hw,
+					unsigned long parent_old_rate,
+					unsigned long parent_new_rate,
+					struct list_head *stable_clks)
+{
+	struct clk_rate_change *clk_node;
+	int ret;
+
+	ret = clk_hw_add_rate_change(req, parent_hw, parent_old_rate,
+				     parent_new_rate, 0);
+	if (ret)
+		goto out_free;
+
+	list_for_each_entry(clk_node, stable_clks, node) {
+		ret = clk_hw_add_rate_change(req, clk_node->hw,
+					     clk_node->current_rate,
+					     clk_node->target_rate, 0);
+		if (ret)
+			goto out_free;
+	}
+
+	ret = 0;
+out_free:
+	clk_hw_free_rate_changes(stable_clks);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_hw_add_coordinated_rate_changes);
+
 /*
  * __clk_mux_determine_rate - clk_ops::determine_rate implementation for a mux type clk
  * @hw: mux type clk to determine rate on
@@ -1615,6 +1720,7 @@ static void clk_core_init_rate_req(struct clk_core * const core,
 		return;
 
 	memset(req, 0, sizeof(*req));
+	INIT_LIST_HEAD(&req->ordered_rate_changes);
 	req->max_rate = ULONG_MAX;
 
 	if (!core)
@@ -2268,7 +2374,8 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
  * changed.
  */
 static struct clk_core *clk_calc_new_rates(struct clk_core *core,
-					   unsigned long rate)
+					   unsigned long rate,
+					   struct list_head *ordered_rate_changes)
 {
 	struct clk_core *top = core;
 	struct clk_core *old_parent, *parent;
@@ -2308,6 +2415,12 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 		new_rate = req.rate;
 		parent = req.best_parent_hw ? req.best_parent_hw->core : NULL;
 
+		/* Clock provider populated coordinated rate changes */
+		if (ordered_rate_changes && !list_empty(&req.ordered_rate_changes)) {
+			/* Transfer ownership of the list to caller */
+			list_splice_init(&req.ordered_rate_changes, ordered_rate_changes);
+		}
+
 		if (new_rate < min_rate || new_rate > max_rate)
 			return NULL;
 	} else if (!parent || !(core->flags & CLK_SET_RATE_PARENT)) {
@@ -2316,7 +2429,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 		return NULL;
 	} else {
 		/* pass-through clock with adjustable parent */
-		top = clk_calc_new_rates(parent, rate);
+		top = clk_calc_new_rates(parent, rate, NULL);
 		new_rate = parent->new_rate;
 		goto out;
 	}
@@ -2341,7 +2454,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 
 	if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
 	    best_parent_rate != parent->rate)
-		top = clk_calc_new_rates(parent, best_parent_rate);
+		top = clk_calc_new_rates(parent, best_parent_rate, NULL);
 
 out:
 	clk_calc_subtree(core, new_rate, parent, p_index);
@@ -2461,7 +2574,7 @@ static void clk_change_rate(struct clk_core *core)
 		__clk_notify(core, POST_RATE_CHANGE, old_rate, core->rate);
 
 	if (core->flags & CLK_RECALC_NEW_RATES)
-		(void)clk_calc_new_rates(core, core->new_rate);
+		(void)clk_calc_new_rates(core, core->new_rate, NULL);
 
 	/*
 	 * Use safe iteration, as change_rate can actually swap parents
@@ -2511,9 +2624,58 @@ static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 	return ret ? 0 : req.rate;
 }
 
+static int clk_apply_coordinated_rate_changes(struct clk_rate_request *req)
+{
+	struct clk_rate_change *change;
+	int ret;
+
+	/*
+	 * FIXME: There's currently no mechanism to roll back in case of an
+	 * error. This can leave the clock tree in an inconsistent state.
+	 */
+	list_for_each_entry(change, &req->ordered_rate_changes, node) {
+		struct clk_hw *hw = change->hw;
+
+		if (!hw || !hw->core)
+			continue;
+
+		if (change->new_parent_index && hw->core->ops->set_parent) {
+			ret = hw->core->ops->set_parent(hw, change->new_parent_index);
+			if (ret)
+				return ret;
+		}
+
+		if (hw->core->ops->set_rate) {
+			unsigned long parent_rate = 0;
+
+			if (hw->core->parent)
+				parent_rate = hw->core->parent->rate;
+
+			ret = hw->core->ops->set_rate(hw, change->target_rate, parent_rate);
+			if (ret)
+				return ret;
+
+			hw->core->rate = change->target_rate;
+		}
+	}
+
+	return 0;
+}
+
+static void clk_rate_request_cleanup(struct clk_rate_request *req)
+{
+	struct clk_rate_change *change, *tmp;
+
+	list_for_each_entry_safe(change, tmp, &req->ordered_rate_changes, node) {
+		list_del(&change->node);
+		kfree(change);
+	}
+}
+
 static int clk_core_set_rate_nolock(struct clk_core *core,
 				    unsigned long req_rate)
 {
+	struct clk_rate_request rate_req;
 	struct clk_core *top, *fail_clk;
 	unsigned long rate;
 	int ret;
@@ -2521,6 +2683,8 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	if (!core)
 		return 0;
 
+	clk_core_init_rate_req(core, &rate_req, req_rate);
+
 	rate = clk_core_req_round_rate_nolock(core, req_rate);
 
 	/* bail early if nothing to do */
@@ -2532,7 +2696,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 		return -EBUSY;
 
 	/* calculate new rates and get the topmost changed clock */
-	top = clk_calc_new_rates(core, req_rate);
+	top = clk_calc_new_rates(core, req_rate, &rate_req.ordered_rate_changes);
 	if (!top)
 		return -EINVAL;
 
@@ -2540,22 +2704,33 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	if (ret)
 		return ret;
 
-	/* notify that we are about to change rates */
-	fail_clk = clk_propagate_rate_change(top, PRE_RATE_CHANGE);
-	if (fail_clk) {
-		pr_debug("%s: failed to set %s rate\n", __func__,
-				fail_clk->name);
-		clk_propagate_rate_change(top, ABORT_RATE_CHANGE);
-		ret = -EBUSY;
-		goto err;
-	}
+	if (!list_empty(&rate_req.ordered_rate_changes)) {
+		/* Apply coordinated rate changes in order */
+		ret = clk_apply_coordinated_rate_changes(&rate_req);
+		if (ret) {
+			pr_debug("%s: failed to apply coordinated rate changes\n", __func__);
+			goto err;
+		}
+	} else {
+		/* Use traditional rate change propagation */
+		/* notify that we are about to change rates */
+		fail_clk = clk_propagate_rate_change(top, PRE_RATE_CHANGE);
+		if (fail_clk) {
+			pr_debug("%s: failed to set %s rate\n", __func__,
+					fail_clk->name);
+			clk_propagate_rate_change(top, ABORT_RATE_CHANGE);
+			ret = -EBUSY;
+			goto err;
+		}
 
-	/* change the rates */
-	clk_change_rate(top);
+		/* change the rates */
+		clk_change_rate(top);
+	}
 
 	core->req_rate = req_rate;
 err:
 	clk_pm_runtime_put(core);
+	clk_rate_request_cleanup(&rate_req);
 
 	return ret;
 }
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..26ab04196411f96dcb5d7c91c06ce3ca4117ca50 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -32,6 +32,8 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+/* clock participates in v2 rate negotiation */
+#define CLK_V2_RATE_NEGOTIATION	BIT(14)
 
 struct clk;
 struct clk_hw;
@@ -53,7 +55,10 @@ struct dentry;
  *			requested constraints.
  * @best_parent_hw:	The most appropriate parent clock that fulfills the
  *			requested constraints.
- *
+ * @ordered_rate_changes:	Execution list of rate changes for coordinated updates.
+ *				Clock providers populate this list when they need to
+ *				update multiple clocks in a specific order to maintain
+ *				rate stability for all consumers.
  */
 struct clk_rate_request {
 	struct clk_core *core;
@@ -62,6 +67,7 @@ struct clk_rate_request {
 	unsigned long max_rate;
 	unsigned long best_parent_rate;
 	struct clk_hw *best_parent_hw;
+	struct list_head ordered_rate_changes;
 };
 
 void clk_hw_init_rate_request(const struct clk_hw *hw,
@@ -1437,6 +1443,37 @@ static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 	dst->core = src->core;
 }
 
+/**
+ * struct clk_rate_change - Describes a clock rate change
+ *
+ * Used in both planning and execution phases of coordinated rate changes.
+ * During planning, collects information about sibling clocks. During execution,
+ * contains the final rate change instructions to apply.
+ *
+ * @hw:			The clock hardware that needs to change rate
+ * @current_rate:	The current rate of this clock
+ * @target_rate:	The target rate for this clock
+ * @new_parent_index:	The index of the new parent (for muxes), or 0
+ * @node:		List node for chaining entries
+ */
+struct clk_rate_change {
+	struct clk_hw *hw;
+	unsigned long current_rate;
+	unsigned long target_rate;
+	u8 new_parent_index;
+	struct list_head node;
+};
+
+int clk_hw_get_v2_stable_clks(struct clk_rate_request *req,
+			      struct clk_hw *parent_hw,
+			      struct list_head *stable_clks);
+void clk_hw_free_rate_changes(struct list_head *stable_clks);
+int clk_hw_add_coordinated_rate_changes(struct clk_rate_request *req,
+					struct clk_hw *parent_hw,
+					unsigned long parent_old_rate,
+					unsigned long parent_new_rate,
+					struct list_head *stable_clks);
+
 static inline long divider_round_rate(struct clk_hw *hw, unsigned long rate,
 				      unsigned long *prate,
 				      const struct clk_div_table *table,

-- 
2.53.0

