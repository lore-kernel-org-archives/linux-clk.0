Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F3A253B53
	for <linux-clk@vger.kernel.org>; Mon,  7 Apr 2025 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031607; cv=none; b=i2NK77pfqQzv4jnCQwlNbanHmlSq28kOdgMsoMVySWKQhJ0z98IGLbjx1PVmYlmXvuby4BM+GJN9Q88GAXs4prh5+VwPCakDw2FPWonHRtjf3u/kw0IOkNAmcGQbN/RCDz9G8nxAbAT3iRjG4YuxyzHTa6tpqcIpvazguNRf58c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031607; c=relaxed/simple;
	bh=w+xCGDIdzVRV8Qx5LNSMut5UWIJvmE8bj12UF53NjSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=aaIaCHjt8+pmCDgrpPcdV8a/4KJ5KpcSyiHu9Dv94GIYvGIgfQxTc9GG5S4hIGP69Ca1yUOR8oKhDa64hZ6IUC3MTCQb9oHfXsP+cNnw8zrEUOt3cBGjrhnu5tbPpcQ7PQZmMKmoUl5Z7jFRfU4gvSHM+wv/6TSJKQ/JhaM6CM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i7scMAwQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i7scMAwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1BC2Jz5jp96nLB4+e1LcdwFK2nm1a7mDNlVuZGEZ0cg=;
	b=i7scMAwQckQIbar63/ZyAplHTqa4nClbPylPe2Sn1KuygBZeZ2zqmAILDugfidrFhJIH9q
	kCADzM3nP66G7Ryh+LNSviKWS0NQwreE+bhEoLaW8tn7GDFx7uu7dqp5mu6tjlBFcrG7aT
	pyiJzdwNHhlIumAuJcV13vEisrMLnMY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-ibh1QrqRMmiFO0MkQNviCw-1; Mon, 07 Apr 2025 09:13:23 -0400
X-MC-Unique: ibh1QrqRMmiFO0MkQNviCw-1
X-Mimecast-MFC-AGG-ID: ibh1QrqRMmiFO0MkQNviCw_1744031603
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso122764386d6.2
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 06:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031603; x=1744636403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BC2Jz5jp96nLB4+e1LcdwFK2nm1a7mDNlVuZGEZ0cg=;
        b=BKSQ18LBf3Dus+qT/fOqKozWC0oY439np9xJT5DL5zIRzmyOx55cVO8dx1ppNAre5D
         Gw+CW6mysiSczrTQ1Gym/5DSOkOQO6WQlYbHddXJaJ7BGHbjNWdueOyt71QBnkK4l60+
         sRswzbsu3i35+B+A0Rxqd8Xfyw/D8qv/6b+449mQUAg5U5IbIanQLVbKU/Z2s6PvhR/g
         Mf4HrHqb8BjLSOWEPvW7QQmm+Dgnt0lgh5PpBJwfkXKuatP3MQ6eJSS8pKNRaStUyLhJ
         3kzLmiroOqnQb4TuksMlQ9p/aBFaqFBgMQfLZvbkINpKEObfuI5RBuMqSkxj5XfPMgln
         wUCg==
X-Gm-Message-State: AOJu0Yzh5ee+GkEiIqWpUbfaRsFR20o6aV4YUyOEPtsDl61XEG18r1+O
	+FhxLVRSjkmIVy6t5b5joPq2xL2ZixSFuK1zg+qa3CvoEooe7/+JCZ5IXWLSo/xU3iyhDZeOPUz
	n9ZcgvrGgpbJrY+1OB2XiAv6O8w2PDcI8cbN0NK3eSLhUCql/zp1jgV/8Dg==
X-Gm-Gg: ASbGncs1lO/sUNj+WV3J44t+ATPSAlQXCAGstnjrg3HE7Jkx8VsPlmPWGKyKDGxp1VW
	qmZ4hG8WcVNNTx1ZBGBMgHHha1B1RQot1eHFUFsZQhMjTM1X1mKIOcquPRJNDePfW2PqOEPzTuv
	l9EvpE/uM+n4uvKYaDMiPVTzxGEmRD7A8BV21ZIxA+pmupPl0X9CRUeW/ExNOsy0bu+mi0oHQCJ
	NzJhDLRHz9bid6P9NW0a97ydYiLhBxSn2gAFqWXUcnqOYkyUXJ626eNl6h30OurBjm8UtZCKKcZ
	fV2SMM2KURAVK9DiSyFiJEOdbX5CDucT2Tp7adGN8Q==
X-Received: by 2002:a05:6214:4001:b0:6e8:97c0:76f8 with SMTP id 6a1803df08f44-6f01e731605mr183726566d6.27.1744031603169;
        Mon, 07 Apr 2025 06:13:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECigefhr/fQPDSyepNGdMzhuvgNE/MDsWMUGZvR1lvDTwiG0VImJiSlq4Fy1KlSBS40YJRJQ==
X-Received: by 2002:a05:6214:4001:b0:6e8:97c0:76f8 with SMTP id 6a1803df08f44-6f01e731605mr183726066d6.27.1744031602596;
        Mon, 07 Apr 2025 06:13:22 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 6/8] clk: test: introduce helper to create a mock mux
Date: Mon,  7 Apr 2025 09:12:56 -0400
Message-ID: <20250407131258.70638-7-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407131258.70638-1-bmasney@redhat.com>
References: <20250407131258.70638-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Introduce a helper to create a mock mux to reduce code duplication.
This also changes it so that the relevant clk_hws are registered with
the kunit framework.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 141 +++++++++++++++--------------------------
 1 file changed, 52 insertions(+), 89 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index df5d4b25aa69..d72ce0226dc7 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -538,45 +538,64 @@ static struct kunit_suite clk_uncached_test_suite = {
 	.test_cases = clk_uncached_test_cases,
 };
 
-static int
-clk_multiple_parents_mux_test_init(struct kunit *test)
-{
-	struct clk_multiple_parent_ctx *ctx;
-	const char *parents[2] = { "parent-0", "parent-1"};
+static int clk_init_multiple_parent_ctx(struct kunit *test,
+					struct clk_multiple_parent_ctx *ctx,
+					const char *parent0_name,
+					unsigned long parent0_rate,
+					const char *parent1_name,
+					unsigned long parent1_rate,
+					const char *mux_name, int mux_flags,
+					const struct clk_ops *mux_ops)
+{
+	const struct clk_hw *parents[2];
 	int ret;
 
-	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-	test->priv = ctx;
-
-	ctx->parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT("parent-0",
+	ctx->parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT(parent0_name,
 							    &clk_dummy_rate_ops,
 							    0);
-	ctx->parents_ctx[0].rate = DUMMY_CLOCK_RATE_1;
+	ctx->parents_ctx[0].rate = parent0_rate;
 	ret = clk_hw_register_kunit(test, NULL, &ctx->parents_ctx[0].hw);
 	if (ret)
 		return ret;
 
-	ctx->parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("parent-1",
+	ctx->parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT(parent1_name,
 							    &clk_dummy_rate_ops,
 							    0);
-	ctx->parents_ctx[1].rate = DUMMY_CLOCK_RATE_2;
+	ctx->parents_ctx[1].rate = parent1_rate;
 	ret = clk_hw_register_kunit(test, NULL, &ctx->parents_ctx[1].hw);
 	if (ret)
 		return ret;
 
-	ctx->current_parent = 0;
-	ctx->hw.init = CLK_HW_INIT_PARENTS("test-mux", parents,
-					   &clk_multiple_parents_mux_ops,
-					   CLK_SET_RATE_PARENT);
+	parents[0] = &ctx->parents_ctx[0].hw;
+	parents[1] = &ctx->parents_ctx[1].hw;
+	ctx->hw.init = CLK_HW_INIT_PARENTS_HW(mux_name, parents,
+					      mux_ops, mux_flags);
 	ret = clk_hw_register_kunit(test, NULL, &ctx->hw);
 	if (ret)
 		return ret;
 
+	ctx->current_parent = 0;
+
 	return 0;
 }
 
+static int
+clk_multiple_parents_mux_test_init(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	return clk_init_multiple_parent_ctx(test, ctx,
+					    "parent-0", DUMMY_CLOCK_RATE_1,
+					    "parent-1", DUMMY_CLOCK_RATE_2,
+					    "test-mux", CLK_SET_RATE_PARENT,
+					    &clk_multiple_parents_mux_ops);
+}
+
 /*
  * Test that for a clock with multiple parents, clk_get_parent()
  * actually returns the current one.
@@ -2532,7 +2551,6 @@ static int
 clk_leaf_mux_set_rate_parent_test_init(struct kunit *test)
 {
 	struct clk_leaf_mux_ctx *ctx;
-	const char *top_parents[2] = { "parent-0", "parent-1" };
 	int ret;
 
 	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
@@ -2540,27 +2558,11 @@ clk_leaf_mux_set_rate_parent_test_init(struct kunit *test)
 		return -ENOMEM;
 	test->priv = ctx;
 
-	ctx->mux_ctx.parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT("parent-0",
-								    &clk_dummy_rate_ops,
-								    0);
-	ctx->mux_ctx.parents_ctx[0].rate = DUMMY_CLOCK_RATE_1;
-	ret = clk_hw_register(NULL, &ctx->mux_ctx.parents_ctx[0].hw);
-	if (ret)
-		return ret;
-
-	ctx->mux_ctx.parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("parent-1",
-								    &clk_dummy_rate_ops,
-								    0);
-	ctx->mux_ctx.parents_ctx[1].rate = DUMMY_CLOCK_RATE_2;
-	ret = clk_hw_register(NULL, &ctx->mux_ctx.parents_ctx[1].hw);
-	if (ret)
-		return ret;
-
-	ctx->mux_ctx.current_parent = 0;
-	ctx->mux_ctx.hw.init = CLK_HW_INIT_PARENTS("test-mux", top_parents,
-						   &clk_multiple_parents_mux_ops,
-						   0);
-	ret = clk_hw_register(NULL, &ctx->mux_ctx.hw);
+	ret = clk_init_multiple_parent_ctx(test, &ctx->mux_ctx,
+					   "parent-0", DUMMY_CLOCK_RATE_1,
+					   "parent-1", DUMMY_CLOCK_RATE_2,
+					   "test-mux", 0,
+					   &clk_multiple_parents_mux_ops);
 	if (ret)
 		return ret;
 
@@ -2748,7 +2750,6 @@ static int clk_mux_notifier_callback(struct notifier_block *nb,
 static int clk_mux_notifier_test_init(struct kunit *test)
 {
 	struct clk_mux_notifier_ctx *ctx;
-	const char *top_parents[2] = { "parent-0", "parent-1" };
 	int ret;
 
 	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
@@ -2759,27 +2760,11 @@ static int clk_mux_notifier_test_init(struct kunit *test)
 	init_waitqueue_head(&ctx->pre_rate_change.wq);
 	init_waitqueue_head(&ctx->post_rate_change.wq);
 
-	ctx->mux_ctx.parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT("parent-0",
-								    &clk_dummy_rate_ops,
-								    0);
-	ctx->mux_ctx.parents_ctx[0].rate = DUMMY_CLOCK_RATE_1;
-	ret = clk_hw_register(NULL, &ctx->mux_ctx.parents_ctx[0].hw);
-	if (ret)
-		return ret;
-
-	ctx->mux_ctx.parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("parent-1",
-								    &clk_dummy_rate_ops,
-								    0);
-	ctx->mux_ctx.parents_ctx[1].rate = DUMMY_CLOCK_RATE_2;
-	ret = clk_hw_register(NULL, &ctx->mux_ctx.parents_ctx[1].hw);
-	if (ret)
-		return ret;
-
-	ctx->mux_ctx.current_parent = 0;
-	ctx->mux_ctx.hw.init = CLK_HW_INIT_PARENTS("test-mux", top_parents,
-						   &clk_multiple_parents_mux_ops,
-						   0);
-	ret = clk_hw_register(NULL, &ctx->mux_ctx.hw);
+	ret = clk_init_multiple_parent_ctx(test, &ctx->mux_ctx,
+					   "parent-0", DUMMY_CLOCK_RATE_1,
+					   "parent-1", DUMMY_CLOCK_RATE_2,
+					   "test-mux", 0,
+					   &clk_multiple_parents_mux_ops);
 	if (ret)
 		return ret;
 
@@ -2862,39 +2847,17 @@ static int
 clk_mux_no_reparent_test_init(struct kunit *test)
 {
 	struct clk_multiple_parent_ctx *ctx;
-	const char *parents[2] = { "parent-0", "parent-1"};
-	int ret;
 
 	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 	test->priv = ctx;
 
-	ctx->parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT("parent-0",
-							    &clk_dummy_rate_ops,
-							    0);
-	ctx->parents_ctx[0].rate = DUMMY_CLOCK_RATE_1;
-	ret = clk_hw_register(NULL, &ctx->parents_ctx[0].hw);
-	if (ret)
-		return ret;
-
-	ctx->parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("parent-1",
-							    &clk_dummy_rate_ops,
-							    0);
-	ctx->parents_ctx[1].rate = DUMMY_CLOCK_RATE_2;
-	ret = clk_hw_register(NULL, &ctx->parents_ctx[1].hw);
-	if (ret)
-		return ret;
-
-	ctx->current_parent = 0;
-	ctx->hw.init = CLK_HW_INIT_PARENTS("test-mux", parents,
-					   &clk_multiple_parents_no_reparent_mux_ops,
-					   0);
-	ret = clk_hw_register(NULL, &ctx->hw);
-	if (ret)
-		return ret;
-
-	return 0;
+	return clk_init_multiple_parent_ctx(test, ctx,
+					    "parent-0", DUMMY_CLOCK_RATE_1,
+					    "parent-1", DUMMY_CLOCK_RATE_2,
+					    "test-mux", 0,
+					    &clk_multiple_parents_no_reparent_mux_ops);
 }
 
 static void
-- 
2.49.0

