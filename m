Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F38F2ED169
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009676; cv=none; b=os8JjT+8xrQjRkLt1yGzjy+bJboG32Fz0QO9FKgDNPHULn553b6YxNaC0rzFUExJ/lb5lK3C9WyIfAC5GPGoryt2iP/+Yfh6VNiuaGPCMO4Bg275N99DGIcDi8VmgNaPesB+qpcX3t7Y4H0iM/XDtMdqwFHTT1hrnIM3yQMOgvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009676; c=relaxed/simple;
	bh=XHXNEFI9odB0IIoG8jChbqF/uj+50qUnXYV2Gp5unms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9Z07+F3qHK9Vl/PEXIS9TAM5FZjc6vOItaTlbrsToYKES/hZXJhJZsyCRcixCzU6SxnYVH7hEQDc+ErbEDCocI6DWpJiNBwL0efrfxNhW63COTQDhE/vwmjOBcbfhtm71wDMIY4d+4nuQUWBAXKK6IK46XVbzVsxvGZVdRBMKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DgPFLn0g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DgPFLn0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755009673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKFY3n7CuO3NWtgbzOLLtqZ6Z4Snbd39W5EBQWC1wwE=;
	b=DgPFLn0gPJ9ZpLz2GRvxhwaKm6dV2mDwrZ2QlE9qn5pZFbbx2Eq5y5T/Bsaggo4SOe/ADf
	CMGk9jompWMRYkxl309zA0jbEdEXS/RT9C4ccvrDjFM33su1cKP9i1nOqr7827slPviwB8
	nlvFAfKVQDa9GnQWkuh+lCkFAEG0tgI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-wgtNchRfNJauYdPGVJ-Z9w-1; Tue, 12 Aug 2025 10:41:12 -0400
X-MC-Unique: wgtNchRfNJauYdPGVJ-Z9w-1
X-Mimecast-MFC-AGG-ID: wgtNchRfNJauYdPGVJ-Z9w_1755009672
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b068c25f04so128924211cf.1
        for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 07:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009672; x=1755614472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKFY3n7CuO3NWtgbzOLLtqZ6Z4Snbd39W5EBQWC1wwE=;
        b=lS7dsEgTitCU638x/8erDu3E3MUcxyqDioPgVP5Bde+SScyIrl9SIfVthOZGHJgiQK
         TVblC8+DcEb7i5qzGfdxDIhpRlWX6+mp68iFx6KGPGBYb9knT2eZfdBcmoyWLuaNpJjC
         J8x5E3dKOR9C3l36n9l15yR2A8WXzsb/whcnqnXaBtRCjwEtLoYXEDfG0IiArNtu2KOV
         hx6S6VW4gvfkVOgMVpFm/Z2QyI2VMeLckXzjk7pHCHyEASIaedGullPLrqxciJa12q7+
         ygllrypW4AvhT/FYl4+KdKdVKA6ahn7MgFEDPpoC32gHzP2mMLKeuFe5bvS7W3q4NdcX
         wyEg==
X-Gm-Message-State: AOJu0YzpACyk4cwi3N+alKGOKrO+Uo+gyKKtIyv7jDq+PmLqs3+XI6NG
	LUsTu87utG/01rpVZNg809w4JnBQcD73fvM38+9ipfYK1T0+1hCV8lXMoDQcdX4nCVHWEpvag7e
	eraFIvL8rvLYi0G3xLFGIubNgemKBIlyHYkHbdFDfmFytPMmxLQTAMaNCC3lASg==
X-Gm-Gg: ASbGncsvFhgvb98FsAmYtvDMSrUvDBfWhfPSkJendkxxno2hI/GZqJWpHBewathuFXx
	8YI2CuWPOMK9Ny2bFgYC4ou8RsuueeYHzA2cDh8JLpH2lKIGhqzdJJ6UWhEpthRLFDGJj4gkk6g
	2bgnNnJx04YvtO8xyryoGunnEtGtb6iOAZkoZo5gDaQJYL0y+qoKGZ4TInj7SgGiZklPmn0i/Si
	yvh66xQad7vH+f1dmqUaiD97T7GLkDctNmThZsPya7OH43EEUl/6eEC69xfmq6/vGTqYOS6RqpK
	RFQVfsu5fyKWsdPY9CgAnpjuh7pp5OEyVBd5VELWbI4cvdojfVrxUOb5ZkYh3ll1H6KF1NKcyQZ
	C0g==
X-Received: by 2002:a05:622a:4d8e:b0:4b0:e92d:78e1 with SMTP id d75a77b69052e-4b0eca37c40mr54121061cf.15.1755009671710;
        Tue, 12 Aug 2025 07:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER9jNCy7HOkkzvC7BBgOfqjjwCJoE/DqvN6LcIDUE+Bto/PsR/V+ZKHaCCMfitCCAQpQfftA==
X-Received: by 2002:a05:622a:4d8e:b0:4b0:e92d:78e1 with SMTP id d75a77b69052e-4b0eca37c40mr54120381cf.15.1755009671021;
        Tue, 12 Aug 2025 07:41:11 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm76186821cf.8.2025.08.12.07.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:41:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 12 Aug 2025 10:40:37 -0400
Subject: [PATCH v3 7/9] clk: test: introduce helper to create a mock mux
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-clk-tests-docs-v3-7-054aed58dcd3@redhat.com>
References: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
In-Reply-To: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755009649; l=7421;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=XHXNEFI9odB0IIoG8jChbqF/uj+50qUnXYV2Gp5unms=;
 b=g08sE/ZPUIcWigiq9gMMDGVozwCf9DVFr2Y7RbubTpS/IvY3INOf5roDMU6hCDonrKI96Tlg+
 HtLYf/3OmNVC64Hj2VymeJrhDFyNEWoGlZwcFiGZnIQG9WbakfDQnth
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Introduce a helper to create a mock mux to reduce code duplication.
This also changes it so that the relevant clk_hws are registered with
the kunit framework.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 141 ++++++++++++++++++-------------------------------
 1 file changed, 52 insertions(+), 89 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 2e002f3154430e8cd4bafb5addc350798d4b02bb..c91de77a5b7a90396d9b4819ff90087445316567 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -536,45 +536,64 @@ static struct kunit_suite clk_uncached_test_suite = {
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
@@ -2539,7 +2558,6 @@ static int
 clk_leaf_mux_set_rate_parent_test_init(struct kunit *test)
 {
 	struct clk_leaf_mux_ctx *ctx;
-	const char *top_parents[2] = { "parent-0", "parent-1" };
 	int ret;
 
 	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
@@ -2547,27 +2565,11 @@ clk_leaf_mux_set_rate_parent_test_init(struct kunit *test)
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
 
@@ -2755,7 +2757,6 @@ static int clk_mux_notifier_callback(struct notifier_block *nb,
 static int clk_mux_notifier_test_init(struct kunit *test)
 {
 	struct clk_mux_notifier_ctx *ctx;
-	const char *top_parents[2] = { "parent-0", "parent-1" };
 	int ret;
 
 	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
@@ -2766,27 +2767,11 @@ static int clk_mux_notifier_test_init(struct kunit *test)
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
 
@@ -2869,39 +2854,17 @@ static int
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
2.50.1

