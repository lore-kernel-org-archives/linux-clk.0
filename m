Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB81E3C7E0C
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420257; cv=none; b=dzMcdlWoK1rz1uF9nZ2wjD4/4AOtY1wNT/mZHqMHiaR5kx5pkLIAg9QFYWQNK3oppDbLdU8S0n1vJ5aXELNfYUB3GYaXmrIlR3CuclLLsCdXIZ8uxSm0TmlHO2pHfJ7+Z4Fhf2B6oEIm1DqOd8NBZfsPY0Zc4mLJQBJV4qNrHj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420257; c=relaxed/simple;
	bh=3HZ34b5RxjZz3yxu8VhkXggn5qS1EdNU7N/d70jV8Lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qE9tkkrey4mGCzjQfvrGYvmwIKt4oMdVKd3+xkA5pA0GAviedGLnIY25ecumdNJLX/U74DzP4yVueZ3a+yUSsB883CfjayGBgzItElAXs+JRo9s1ToKiRISUVsowd8FxDUtBlMOpfP4Y/DdOhtcKvG6SAwWzjwBmWQysunDseBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PrxgTmTf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uBhCtgrb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PrxgTmTf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uBhCtgrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773420254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MzZNWt8SDmgVcI7d1QBn6un9/v91BS/JCKV7h/4LU0=;
	b=PrxgTmTfoDZZJ6feKP1c/Ze+ONOwEVjgapSOAUOLJPcIi/fwYdz/jBzOe35CHoJA/vX46N
	HhHZLFnFibczGhjn0+r0/ctj3mkxqUVsVcMG7iXKj7cKcXGBgYSUl/OEQkP7wxrjJgSi6j
	3RnCd15Wq4cyaQA3lc5lfs6wNcUz8pQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-CL6PzVOHNYCRc5AH6zquZQ-1; Fri, 13 Mar 2026 12:44:10 -0400
X-MC-Unique: CL6PzVOHNYCRc5AH6zquZQ-1
X-Mimecast-MFC-AGG-ID: CL6PzVOHNYCRc5AH6zquZQ_1773420250
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd773dd39bso1695491385a.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773420250; x=1774025050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MzZNWt8SDmgVcI7d1QBn6un9/v91BS/JCKV7h/4LU0=;
        b=uBhCtgrb9cZ4119fUGZ6Is+A1lr7ZNBpFgBOMpF5Qkr/4INpAu3nv9ugGmQjWxvaM4
         hZhSNDPqV+fIEevkkUQzLpoAcFtPA6JG5d/UmZVB/3TtatG0PyKfpHucmN2HuaXAK+0V
         UADumFFfEflf056Y9pXU6BAqZiKesQYOViKMMDXbSIzusLcHmaduPkT3tvDAdEyLV27e
         R7CuwvHCP0lwWTqQPeOSVJTMrLMJ7fHczzaSWBFOeCpR+dfh1B015gGrlXkaoBkljcjT
         MU8gPRN8qzJznznlf2OHPZwSofkCHrSnvW5chFC2L5lBI4uMONtdnGLlz2xTkj+iSYEv
         eqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420250; x=1774025050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MzZNWt8SDmgVcI7d1QBn6un9/v91BS/JCKV7h/4LU0=;
        b=N+gQzqOpQGNmSTVyEYtIkXMB1WQGZUtvBfi0WFdZmz0XQ12fXsuCeMjqpcFdB/t+J/
         ncXawL0nJEXJPqbV7eSORuvPinzBo5iLAauarrrS/3Q9q3g8mesUKnI8dV2Sr7EFf/A3
         fvaGHZgQxVGP4ejl+K9sGIXamcWs0RXfzJZ60Oc6+bb0rCc/rthgnPMUDSwsKFJ9jO2L
         2edgPw508BwBDYsnciC+aKJfEaMYqVZ/kf5a/upIxuEW+Y0H0x0og3FuYzh3c1X4VNRJ
         7MhvPAV/cwitsgjRlBZl7AbZhj+SZd9VozM65QTB6VOQr1RVasLZ2zUvrHzUddb3gseG
         1cHw==
X-Gm-Message-State: AOJu0YziN96iVmaw2v3mJJ2/muRfduyrTXDiQmtk6Is7b+hiSipSj4X/
	H1zxGW0Gzy9eKJp1OOnWoYvufagHbU2eT5It5Aqt/7+9+LUcSW2DLDuJ66+5/AffNMlxP79+5xJ
	04qLOxyGA62J0aKECvY2Z+/lhzH2BcWZ5tcBqxgEAUgS5oML8JWvxsxuyidyWxg==
X-Gm-Gg: ATEYQzwwvpZNHOC1uUpj9A7LSmzdlf3ygicsgiMP38K2ydpw7NosrB1dHxD5Dghuexq
	0gS7N2xaDOKGJjch/j1CHSN4OL7HJUSt2hDlg16Wsau/sxwYyYPvA9Dj8G8Y9h9xOJIE+ase7KE
	QAD+zBa3FEqK1r89WI/ldF+qC+Mj/lRpmUhbs34AHyCHXyh974/pW9eo6Dhm7gu1Stw8Kw4y0DX
	EYYWMirzRy2IB63ik+qO4oisruwV6k2i/zmWcTzVt2PA2ZfhJQI5LMegVFv+TtPx5QI3DWjCB3D
	vbYPAMar3z6Kq8/baczPh4Iur7gQPaADHNNCIWkLiYj8aEbztMzAOntTpPKYBkKzMTWbxazOZF9
	D08aTxbzO/yfxiXMxvDj5xHv4zEpyy4s1EqNy8Y0uUJsLSF+a2Gxpl6WVpFUi
X-Received: by 2002:a05:620a:448c:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cdb5ba2501mr537405485a.58.1773420250214;
        Fri, 13 Mar 2026 09:44:10 -0700 (PDT)
X-Received: by 2002:a05:620a:448c:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cdb5ba2501mr537402385a.58.1773420249790;
        Fri, 13 Mar 2026 09:44:09 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda215c2a9sm587964785a.46.2026.03.13.09.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:44:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 13 Mar 2026 12:43:12 -0400
Subject: [PATCH v6 5/7] clk: introduce new flag CLK_V2_RATE_NEGOTIATION for
 sensitive clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-clk-scaling-v6-5-ce89968c5247@redhat.com>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
In-Reply-To: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7718; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=3HZ34b5RxjZz3yxu8VhkXggn5qS1EdNU7N/d70jV8Lo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDK32J1ZtXDtV+ve6dXSq3iMeJLiF8t8YNzTscN05YRoe
 8FunvfLOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZiI8WyGfzorb0x6m/pjweLz
 c/guFJV/22vtsXw2n7Zg3Y23l9nk3G8zMjTJSVy+IfAyZYX/YZaUrBuiHOeu8HmxW2bOusflmOu
 czQsA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

As demonstrated by the kunit tests, clk_calc_subtree() in the clk core
can overwrite a sibling clk with the parent rate. Clocks that are used
for some subsystems like DRM and sound are particularly sensitive to
this issue.

I consider this to be a logic bug in the clk subsystem, however this
functionality has existed since the clk core was introduced with
commit b2476490ef11 ("clk: introduce the common clock framework"),
and some boards are unknowingly dependent on this behavior.

Let's add support for a v2 rate negotiation logic that addresses the
logic error. Clks can opt into this new behavior by adding the flag
CLK_V2_RATE_NEGOTIATION, or globally on all clks with the kernel
parameter clk_v2_rate_negotiation.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c            | 70 ++++++++++++++++++++++++++++++++++++--------
 include/linux/clk-provider.h |  3 ++
 2 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 051fe755e3bf1b0a06db254b92f8a02889456db9..64c6de5ff5df2117b8d1aca663d40b41d974bf92 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -886,6 +886,43 @@ unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *requesti
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_children_lcm);
 
+static bool clk_v2_rate_negotiation_enabled;
+static int __init clk_v2_rate_negotiation_setup(char *__unused)
+{
+	clk_v2_rate_negotiation_enabled = true;
+	return 1;
+}
+__setup("clk_v2_rate_negotiation", clk_v2_rate_negotiation_setup);
+
+/**
+ * clk_has_v2_rate_negotiation - Check if a clk should use v2 rate negotiation
+ * @core: The clock core to check
+ *
+ * This function recursively checks if the clk or any of its descendants have
+ * the CLK_V2_RATE_NEGOTIATION flag set. The v2 behavior can also be enabled
+ * globally by adding clk_v2_rate_negotiation to the kernel command line.
+ *
+ * Returns: true if the v2 logic should be used; false otherwise
+ */
+bool clk_has_v2_rate_negotiation(const struct clk_core *core)
+{
+	struct clk_core *child;
+
+	if (clk_v2_rate_negotiation_enabled)
+		return true;
+
+	if (core->flags & CLK_V2_RATE_NEGOTIATION)
+		return true;
+
+	hlist_for_each_entry(child, &core->children, child_node) {
+		if (clk_has_v2_rate_negotiation(child))
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(clk_has_v2_rate_negotiation);
+
 /*
  * __clk_mux_determine_rate - clk_ops::determine_rate implementation for a mux type clk
  * @hw: mux type clk to determine rate on
@@ -2293,7 +2330,8 @@ static int __clk_speculate_rates(struct clk_core *core,
 }
 
 static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
-			     struct clk_core *new_parent, u8 p_index)
+			     struct clk_core *new_parent, u8 p_index,
+			     struct clk_core *initiating_clk)
 {
 	struct clk_core *child;
 
@@ -2306,8 +2344,12 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
 		new_parent->new_child = core;
 
 	hlist_for_each_entry(child, &core->children, child_node) {
-		child->new_rate = clk_recalc(child, new_rate);
-		clk_calc_subtree(child, child->new_rate, NULL, 0);
+		if (child != initiating_clk && clk_has_v2_rate_negotiation(child))
+			child->new_rate = child->rate;
+		else
+			child->new_rate = clk_recalc(child, new_rate);
+
+		clk_calc_subtree(child, child->new_rate, NULL, 0, initiating_clk);
 	}
 }
 
@@ -2316,7 +2358,8 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
  * changed.
  */
 static struct clk_core *clk_calc_new_rates(struct clk_core *core,
-					   unsigned long rate)
+					   unsigned long rate,
+					   struct clk_core *initiating_clk)
 {
 	struct clk_core *top = core;
 	struct clk_core *old_parent, *parent;
@@ -2364,7 +2407,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 		return NULL;
 	} else {
 		/* pass-through clock with adjustable parent */
-		top = clk_calc_new_rates(parent, rate);
+		top = clk_calc_new_rates(parent, rate, initiating_clk);
 		new_rate = parent->new_rate;
 		goto out;
 	}
@@ -2389,10 +2432,10 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 
 	if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
 	    best_parent_rate != parent->rate)
-		top = clk_calc_new_rates(parent, best_parent_rate);
+		top = clk_calc_new_rates(parent, best_parent_rate, initiating_clk);
 
 out:
-	clk_calc_subtree(core, new_rate, parent, p_index);
+	clk_calc_subtree(core, new_rate, parent, p_index, initiating_clk);
 
 	return top;
 }
@@ -2440,7 +2483,7 @@ static struct clk_core *clk_propagate_rate_change(struct clk_core *core,
  * walk down a subtree and set the new rates notifying the rate
  * change on the way
  */
-static void clk_change_rate(struct clk_core *core)
+static void clk_change_rate(struct clk_core *core, struct clk_core *initiating_clk)
 {
 	struct clk_core *child;
 	struct hlist_node *tmp;
@@ -2509,7 +2552,7 @@ static void clk_change_rate(struct clk_core *core)
 		__clk_notify(core, POST_RATE_CHANGE, old_rate, core->rate);
 
 	if (core->flags & CLK_RECALC_NEW_RATES)
-		(void)clk_calc_new_rates(core, core->new_rate);
+		(void)clk_calc_new_rates(core, core->new_rate, initiating_clk);
 
 	/*
 	 * Use safe iteration, as change_rate can actually swap parents
@@ -2519,12 +2562,12 @@ static void clk_change_rate(struct clk_core *core)
 		/* Skip children who will be reparented to another clock */
 		if (child->new_parent && child->new_parent != core)
 			continue;
-		clk_change_rate(child);
+		clk_change_rate(child, initiating_clk);
 	}
 
 	/* handle the new child who might not be in core->children yet */
 	if (core->new_child)
-		clk_change_rate(core->new_child);
+		clk_change_rate(core->new_child, initiating_clk);
 
 	clk_pm_runtime_put(core);
 }
@@ -2580,7 +2623,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 		return -EBUSY;
 
 	/* calculate new rates and get the topmost changed clock */
-	top = clk_calc_new_rates(core, req_rate);
+	top = clk_calc_new_rates(core, req_rate, core);
 	if (!top)
 		return -EINVAL;
 
@@ -2599,7 +2642,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	}
 
 	/* change the rates */
-	clk_change_rate(top);
+	clk_change_rate(top, core);
 
 	core->req_rate = req_rate;
 err:
@@ -3586,6 +3629,7 @@ static const struct {
 	ENTRY(CLK_IS_CRITICAL),
 	ENTRY(CLK_OPS_PARENT_ENABLE),
 	ENTRY(CLK_DUTY_CYCLE_PARENT),
+	ENTRY(CLK_V2_RATE_NEGOTIATION),
 #undef ENTRY
 };
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2699b9759e13d0c1f0b54f4fa4f7f7bdd42e8dde..e0fc0bd347e5920e999ac96dbed9fc247f9443fa 100644
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
@@ -1432,6 +1434,7 @@ void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
 unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *requesting_hw,
 				      unsigned long requesting_rate);
+bool clk_has_v2_rate_negotiation(const struct clk_core *core);
 
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {

-- 
2.53.0

