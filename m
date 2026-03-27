Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36CB38735C
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 19:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639962; cv=none; b=DbgvY+2o+b5B9uAhhHVB9bCHAVXyxqbMlUaqav9SX39BDOrc78GKAZUFz2U34+W4OJzG6+lzn40Gtgx5XEbfO7AiDjJ/CcDofgurE/lukdYboFtoDmIStXotS+rkCSHWAabg6TJWieUYwPCxuC2Awq+cm0xS/dM4S5LUVyyRPvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639962; c=relaxed/simple;
	bh=/tQL4+ZIoUSIasZYpJHwSdSiMqSkhfJfugUapZTcEGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogT6rPqUNZzSxRP39RvPUb3wzKoqP6C3WRCaJddR7du/GC6JQ35nSz5bKOb9is2OsaWVvy2O+En6R65XmazRU2wwXLhO+wRpu4N0B9huuvZjM6H/huXZHtGeT0F90erWg5BWua9Aqt6KUB9jvIfCtyQ3FzSpdg89zCeftMYV9X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wennqf30; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qpyn9bq+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wennqf30";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qpyn9bq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774639953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wIQCO/tlei6s0Ksfok5KmMI0bZq0VEuNdKVbn5e9O6c=;
	b=Wennqf30S5h3CJONCe8gGIPZ1WhJK/LJldTmZN+DIs73/5AEJaobP3Mv5ioNtjD3zQ2M1f
	B5xW/CruV/rKwTq5KovzTSz6uEm6qiUsWDiNInD0adh0vUrJ11puhZV0naBcnUZJZljaFq
	Q8NYnxWW/zZGRwA3htomBw6/FVNYi28=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-4uVJqoEbOrmOrJ24o_N5oQ-1; Fri, 27 Mar 2026 15:32:29 -0400
X-MC-Unique: 4uVJqoEbOrmOrJ24o_N5oQ-1
X-Mimecast-MFC-AGG-ID: 4uVJqoEbOrmOrJ24o_N5oQ_1774639949
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4b81c632so75307371cf.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774639949; x=1775244749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIQCO/tlei6s0Ksfok5KmMI0bZq0VEuNdKVbn5e9O6c=;
        b=Qpyn9bq+2XDPaWkjrP18+wNmrhnizz/59ktwRubdl6TqXZbgr0ypdL8XJOe6g3UETC
         9JSPVI5AV3WeRbCmbc78SF1dOSoS1Eh70rZqUN6i3ZFi8N5CpbwO7635nluykjRnuUmq
         IJGZMDyCcIZS6G0Sgf0tFoa3fWPJJ1T46hb9q0ixX9WxzFIrVovf6S5pzNBdNXTq9O7U
         g3s6WhJUYbk+N674+b81SzDSwupyvc1JlFSeKA7vGPGE4EJR3bFrn9y5iDSIsPmEcpTQ
         qjJVXqpQFJwX/cexmCskFoyiN04tDvEJslfN80HpVmORfKBVNUyoFC75Px68GVVPD/2b
         OvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639949; x=1775244749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wIQCO/tlei6s0Ksfok5KmMI0bZq0VEuNdKVbn5e9O6c=;
        b=Fu3P6yZsmD3Gs7UsOMZAwCFHGpyt/HCKum+0ocrVDa92TLHLU5sMmhUsaEKWD/ifCf
         e2CbB3o0NHfuELKkWpOttw0OGPJCPxqAzn9H4g8zKGRg/E5PKFBaF/RjJswiSSwnEkuw
         rSyTR70BaVWhXi4D7Ub0ALyN7Yqliy8GiDJ2/dDJwVXlsGp3EIPumvHUXVgCk/WQllYS
         6OHCkfYeGWj2GoF5wH/CS5pnGGL93ZEK/Ju2Lil+KSICvUHvWSlreYebRRtAz2lyjCyS
         I4yY3eMx8QmjTqp0El05dhOdPVLCjbVtSQo56nlLH/oNf9zsEsJvpTN56Tm/ObX/IYLN
         3KjA==
X-Gm-Message-State: AOJu0YxILm+4FgWHt3nkdeztkInQw3mfRewMhgvBznqrhHj0qhgrJ/N3
	s2EYILAu19xh9Y5GQKlsbX9BYFu3pX5izm0IEy1iWscmJivlV44dWzj10N+U22iIunc1EO9bGfE
	qyHkm7boaItHWKAjdJe5lJrALsFjfoptdzLB7rssWPaz7D9bwHmKFvFky+lFfPQ==
X-Gm-Gg: ATEYQzw2TBcKuPn+S0JEk0ZzH0yud8YH/CFCiDd0htYkQodb8vv+diImoLip81ipXIy
	pam8dxtiNg4bUfQWQeCeaUoRk+77B6ofUc+hFoFvZ3HRC25W8eLkk5KaKcf5AoCoS7AkdXMXKZv
	6eUvQCmVKWJ6agZpt/bA1Sc7uO+hrGDVXTwj1vc8t43Hq2qMr5Sd2fBcTKpwx0k3oeF0XfSOmYY
	+YroBffZ5juE+Zkk988k0/QHoIkWdri2fOtCZFwMP3aQVDKSuZdLL0Y8f27jDxu+7Hr5XbF7PKO
	zl7Zf1RlgTMQ1LXSJj4M0LSFl+NOEIxeVh8lKPVu8TMDDEO+P9OxNllPgRR59pChEo/bXmHpABq
	KbRVzMp+df6mQrz0wUiF9kxGjIIzaz50rHI7q+LM7SfaeZOPXW+NnaEZMQJSi
X-Received: by 2002:ac8:57d1:0:b0:509:1766:2f4f with SMTP id d75a77b69052e-50ba397f3b2mr46064021cf.54.1774639949247;
        Fri, 27 Mar 2026 12:32:29 -0700 (PDT)
X-Received: by 2002:ac8:57d1:0:b0:509:1766:2f4f with SMTP id d75a77b69052e-50ba397f3b2mr46063601cf.54.1774639948779;
        Fri, 27 Mar 2026 12:32:28 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c678e9sm2037551cf.6.2026.03.27.12.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:32:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 15:32:00 -0400
Subject: [PATCH v8 5/8] clk: introduce new flag CLK_V2_RATE_NEGOTIATION for
 sensitive clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-clk-scaling-v8-5-86cd0aba3c5f@redhat.com>
References: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
In-Reply-To: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7264; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=/tQL4+ZIoUSIasZYpJHwSdSiMqSkhfJfugUapZTcEGE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKP3Xawefnt69eDv4N+Sh7c9WdyQ5C9Oaua5f2gB4t2M
 136cOXG3I5SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAmsrie4Tdr1M5HjGZvOw6X
 a59daieev8zAxFDiPlfulsqZZ0wU/YwY/vDlTJxat/vvDk9+17xI7lWZxnc3nNt9cPXq1I2xe81
 Yt7EDAA==
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
CLK_V2_RATE_NEGOTIATION.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c            | 60 ++++++++++++++++++++++++++++++++++----------
 include/linux/clk-provider.h |  3 +++
 2 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index bb602c07df9a2b523a72e1e05cc3a27956e7198b..46b3c4c596043abff0be2552fee09c4ce2f15dfb 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -892,6 +892,33 @@ unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *requesti
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_children_lcm);
 
+/**
+ * clk_has_v2_rate_negotiation - Check if a clk should use v2 rate negotiation
+ * @core: The clock core to check
+ *
+ * This function recursively checks if the clk or any of its descendants have
+ * the CLK_V2_RATE_NEGOTIATION flag set.
+ *
+ * Returns: true if the v2 logic should be used; false otherwise
+ */
+bool clk_has_v2_rate_negotiation(const struct clk_core *core)
+{
+	struct clk_core *child;
+
+	lockdep_assert_held(&prepare_lock);
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
@@ -2299,7 +2326,8 @@ static int __clk_speculate_rates(struct clk_core *core,
 }
 
 static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
-			     struct clk_core *new_parent, u8 p_index)
+			     struct clk_core *new_parent, u8 p_index,
+			     struct clk_core *initiating_clk)
 {
 	struct clk_core *child;
 
@@ -2312,8 +2340,12 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
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
 
@@ -2322,7 +2354,8 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
  * changed.
  */
 static struct clk_core *clk_calc_new_rates(struct clk_core *core,
-					   unsigned long rate)
+					   unsigned long rate,
+					   struct clk_core *initiating_clk)
 {
 	struct clk_core *top = core;
 	struct clk_core *old_parent, *parent;
@@ -2370,7 +2403,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 		return NULL;
 	} else {
 		/* pass-through clock with adjustable parent */
-		top = clk_calc_new_rates(parent, rate);
+		top = clk_calc_new_rates(parent, rate, initiating_clk);
 		new_rate = parent->new_rate;
 		goto out;
 	}
@@ -2395,10 +2428,10 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 
 	if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
 	    best_parent_rate != parent->rate)
-		top = clk_calc_new_rates(parent, best_parent_rate);
+		top = clk_calc_new_rates(parent, best_parent_rate, initiating_clk);
 
 out:
-	clk_calc_subtree(core, new_rate, parent, p_index);
+	clk_calc_subtree(core, new_rate, parent, p_index, initiating_clk);
 
 	return top;
 }
@@ -2446,7 +2479,7 @@ static struct clk_core *clk_propagate_rate_change(struct clk_core *core,
  * walk down a subtree and set the new rates notifying the rate
  * change on the way
  */
-static void clk_change_rate(struct clk_core *core)
+static void clk_change_rate(struct clk_core *core, struct clk_core *initiating_clk)
 {
 	struct clk_core *child;
 	struct hlist_node *tmp;
@@ -2515,7 +2548,7 @@ static void clk_change_rate(struct clk_core *core)
 		__clk_notify(core, POST_RATE_CHANGE, old_rate, core->rate);
 
 	if (core->flags & CLK_RECALC_NEW_RATES)
-		(void)clk_calc_new_rates(core, core->new_rate);
+		(void)clk_calc_new_rates(core, core->new_rate, initiating_clk);
 
 	/*
 	 * Use safe iteration, as change_rate can actually swap parents
@@ -2525,12 +2558,12 @@ static void clk_change_rate(struct clk_core *core)
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
@@ -2586,7 +2619,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 		return -EBUSY;
 
 	/* calculate new rates and get the topmost changed clock */
-	top = clk_calc_new_rates(core, req_rate);
+	top = clk_calc_new_rates(core, req_rate, core);
 	if (!top)
 		return -EINVAL;
 
@@ -2605,7 +2638,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	}
 
 	/* change the rates */
-	clk_change_rate(top);
+	clk_change_rate(top, core);
 
 	core->req_rate = req_rate;
 err:
@@ -3592,6 +3625,7 @@ static const struct {
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

