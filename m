Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A3A2ECD26
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009675; cv=none; b=Q84G2ORuPRmUvsVD8+hN8U18nhvNwlA80fhfnFSHHZDH0XNhxB/Rw+no+MU6N7LJ5j8gZyEZVnPoYAZQg1MpJIEbAEnKjGIDoCUQwdFp0sayPB/F60euX1FYaE+a3OHtFzN2vQfng+7az5ZbdiGRKJqchADaiSK0UYQ2yASdqqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009675; c=relaxed/simple;
	bh=1HCjF9b0ejjYW6k+GcOOU4iJhvsGJNM1EUbh1YteUW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTcQjVRqXbbPBvc76hG0TjrjKDEmdFu8McHgkK+gqg6zGxi/8FQhzKd39aLqf4T0uQY0gqEdzlvZY79bkhM3zTMdd401wJJbFju4NRdbnZZHQ5+AGKlfllTrNErxAEfUvvt+O3QmOJu7fuGQ6bWxnPiIXA+M68hGR3mD2nkbtcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h2+6vNQs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h2+6vNQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755009673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A56hAiI+3lqqNs9x68FTAuvdeBe5TZ9wTlzZV++JKWM=;
	b=h2+6vNQs856oZC3i/Q/iwxrS7hbpgDVMmNVnwJFkVQBZXalHOJdF8/b6FG5T4jPrbgRpof
	YjTQqikhhifkVH7PpoXjRi6CpThJkj3uXXTmUEmYVip1HRoH42KbnywaN8uniUPGeUYXPb
	opUj3aeDFXmYheB/SIe0O6AvK73f6XY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-Ssz_5eftNjms_U13qp3zew-1; Tue, 12 Aug 2025 10:41:11 -0400
X-MC-Unique: Ssz_5eftNjms_U13qp3zew-1
X-Mimecast-MFC-AGG-ID: Ssz_5eftNjms_U13qp3zew_1755009671
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-478f78ff9beso200565611cf.1
        for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 07:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009671; x=1755614471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A56hAiI+3lqqNs9x68FTAuvdeBe5TZ9wTlzZV++JKWM=;
        b=JjZC5tYlDoVk7VFHw6zOviFeTUj353VcreFygL++UFsXOQ5+jUbC+UczG9FDh7NYg4
         NPhoZjX/LTLiKvmzK6ewoBP1Devf6QkQ46qPS2zJrp17KdQztXfqs3ajX47kHly9W3dZ
         eWKeJJ9aiv30gYcTqT7FDaWn84z7RyS/UjZvqQuEOjfiYqBbjyWbTvjBDHlI9Htgrsi/
         DYqYjghVuqF6BeWgU25WNtssyNwJ4C1bik1RIo/gmE4OMgH32aWSf75+s4RDV/6ADJ4t
         1eaHgLiA7PSTAxpdTkFaGxeXHtS/7SF7kcA57PqNbjvC92qGtESgsKfhNZOAG/cE+Cz/
         2HbA==
X-Gm-Message-State: AOJu0YyKLu/9xs46nM5AZAbjxJuXbhmAwC43TPP7Aed9NsxAxlXbYnQx
	Kvzs/H1Fg/OZOTwZcqNFEp9clyUODb9GfiZxNHkW95sKxZJyCHQXaC2zaYe9kjBY+60NmznHoYS
	upCHvRzy1ltJL0ECsmaB3mGiPsxuiVVoo9/F8J+Mflh1Ez9qCJ4JKpkckWaOIsg==
X-Gm-Gg: ASbGnctJGCLBCRCjPGNFrfRjjQ4+DeCHh3unGCOY/45iULrxnNzKOUe9DNrs9FoJaAY
	oEl8PMBpdDoh36LCLDsA+HkSDBVHUYMmPSnWqIt+/lW1GmOaTqMiBsOYr+HIx9ykNB66QQUXWIg
	OCqU1YvoRZFan4SEEVJD9UNnLjzZtemAR9jG0t94e1ht9BhnE7KlNUhPRbKpdE3lBqqqM+3ooaz
	VWtSKq4LEMGaEal5sTrksl5tpNd0XO3VdMCZPKMU4xJnBiy09V2tjhZ2j8rguDxCAdVvoOy9E31
	UJ3f09ydF3I73piWhGU8qtrPq+1zSPE5Ik6cqOh2pXbL3CeT3c8keYa/XnrZ1g/fZlBy4GcWo9c
	WuA==
X-Received: by 2002:a05:622a:758e:b0:4b0:adfc:eda7 with SMTP id d75a77b69052e-4b0ecc5133emr43528121cf.32.1755009670505;
        Tue, 12 Aug 2025 07:41:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFpZ0SI/hb/Kr/mX+rP8ZWbTkmvWdEGS9Lbsl6gFjyD9uHgvMV6gU7cB5LH7d2SmMasrmcYQ==
X-Received: by 2002:a05:622a:758e:b0:4b0:adfc:eda7 with SMTP id d75a77b69052e-4b0ecc5133emr43527631cf.32.1755009669854;
        Tue, 12 Aug 2025 07:41:09 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm76186821cf.8.2025.08.12.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:41:02 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 12 Aug 2025 10:40:36 -0400
Subject: [PATCH v3 6/9] clk: test: introduce test suite for sibling rate
 changes on a gate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-clk-tests-docs-v3-6-054aed58dcd3@redhat.com>
References: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
In-Reply-To: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755009649; l=6817;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=1HCjF9b0ejjYW6k+GcOOU4iJhvsGJNM1EUbh1YteUW4=;
 b=jdSoFnEcL85yl309OP1iUg5iItDeZdqOO1hHWFuYSXRUYF7JPk4JW6QXUFySpH8IrevuUKJXa
 BCZgUBArooOAOUkPUDtTs1ehA9KkHZHqaQFKPAzkYos6kB2CjhdLv+4
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Introduce a test suite that creates a parent with two children: a
divider and a gate. Ensure that changing the rate of one child does
not affect the rate of the gate.

Some of the tests are disabled until the relevant issue(s) are fixed in
the clk core. This is also implemented as a parameterized kunit test
since additional test variations will be added.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 155 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 9ed887551cd9b4926075d85b30b6cdfc8d307ea6..2e002f3154430e8cd4bafb5addc350798d4b02bb 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -829,6 +829,160 @@ static struct kunit_suite clk_rate_change_sibling_div_div_test_suite = {
 	.test_cases = clk_rate_change_sibling_div_div_cases,
 };
 
+struct clk_test_rate_change_sibling_clk_ctx {
+	struct clk *parent_clk, *child1_clk, *child2_clk;
+};
+
+static void
+clk_test_rate_change_sibling_clk_ctx_put(struct clk_test_rate_change_sibling_clk_ctx *clk_ctx)
+{
+	clk_put(clk_ctx->parent_clk);
+	clk_put(clk_ctx->child1_clk);
+	clk_put(clk_ctx->child2_clk);
+}
+
+struct clk_rate_change_sibling_div_gate_sibling_context {
+	struct clk_dummy_context parent;
+	struct clk_dummy_div child1;
+	struct clk_dummy_gate child2;
+	struct clk_test_rate_change_sibling_clk_ctx clk_ctx;
+};
+
+static struct clk_test_rate_change_sibling_clk_ctx *
+clk_rate_change_sibling_div_gate_test_init(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_gate_sibling_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+	test->priv = ctx;
+
+	ctx->parent.hw.init = CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate_ops, 0);
+	ctx->parent.rate = clk_dummy_rate_mhz(24);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw, &clk_dummy_div_ops,
+					     CLK_SET_RATE_PARENT);
+	ctx->child1.div = 1;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw, &clk_dummy_gate_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->clk_ctx.parent_clk = clk_hw_get_clk(&ctx->parent.hw, NULL);
+	ctx->clk_ctx.child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
+	ctx->clk_ctx.child2_clk = clk_hw_get_clk(&ctx->child2.hw, NULL);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->clk_ctx.parent_clk), clk_dummy_rate_mhz(24));
+
+	return &ctx->clk_ctx;
+}
+
+struct clk_test_rate_change_sibling_test_case {
+	const char *desc;
+	struct clk_test_rate_change_sibling_clk_ctx *(*init)(struct kunit *test);
+};
+
+static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_sibling_test_cases[] = {
+	{
+		.desc = "div_gate",
+		.init = clk_rate_change_sibling_div_gate_test_init,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_test_rate_change_sibling_test_case,
+		       clk_test_rate_change_sibling_test_cases, desc);
+
+/*
+ * Test that, for a parent with two children with CLK_SET_RATE_PARENT set and
+ * one requests a rate change that requires a change to the parent rate, the
+ * sibling rates are not affected.
+ */
+static void clk_test_rate_change_sibling_1(struct kunit *test)
+{
+	struct clk_test_rate_change_sibling_test_case *testcase =
+		(struct clk_test_rate_change_sibling_test_case *) test->param_value;
+	struct clk_test_rate_change_sibling_clk_ctx *ctx;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	ctx = testcase->init(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), clk_dummy_rate_mhz(24));
+
+	ret = clk_set_rate(ctx->child1_clk, clk_dummy_rate_mhz(48));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), clk_dummy_rate_mhz(48));
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), clk_dummy_rate_mhz(48));
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), clk_dummy_rate_mhz(24));
+
+	clk_test_rate_change_sibling_clk_ctx_put(ctx);
+}
+
+/*
+ * Test that, for a parent with two children with CLK_SET_RATE_PARENT set where
+ * one requests an exclusive rate and the other requests a rate change that
+ * requires a change to the parent rate, the sibling rates are not affected.
+ */
+static void clk_test_rate_change_sibling_2(struct kunit *test)
+{
+	struct clk_test_rate_change_sibling_test_case *testcase =
+		(struct clk_test_rate_change_sibling_test_case *)(test->param_value);
+	struct clk_test_rate_change_sibling_clk_ctx *ctx;
+	int ret;
+
+	ctx = testcase->init(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ret = clk_rate_exclusive_get(ctx->child2_clk);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), clk_dummy_rate_mhz(24));
+
+	ret = clk_set_rate(ctx->child1_clk, clk_dummy_rate_mhz(48));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), clk_dummy_rate_mhz(24));
+	/* child1 is rounded to the closest supported rate */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), clk_dummy_rate_mhz(24));
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), clk_dummy_rate_mhz(24));
+
+	clk_rate_exclusive_put(ctx->child2_clk);
+
+	clk_test_rate_change_sibling_clk_ctx_put(ctx);
+}
+
+
+static struct kunit_case clk_rate_change_sibling_cases[] = {
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_1,
+			 clk_test_rate_change_sibling_test_case_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_2,
+			 clk_test_rate_change_sibling_test_case_gen_params),
+	{}
+};
+
+/*
+ * Test suite that creates a parent with two children, where the children can
+ * be combinations of a divider, gate, and a mux. Ensure that changing the rate
+ * of one child does affect the rate of the other child.
+ */
+static struct kunit_suite clk_rate_change_sibling_test_suite = {
+	.name = "clk-rate-change-sibling",
+	.test_cases = clk_rate_change_sibling_cases,
+};
+
 static int
 clk_orphan_transparent_multiple_parent_mux_test_init(struct kunit *test)
 {
@@ -3770,6 +3924,7 @@ kunit_test_suites(
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
 	&clk_rate_change_sibling_div_div_test_suite,
+	&clk_rate_change_sibling_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,

-- 
2.50.1

