Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03A8252919
	for <linux-clk@vger.kernel.org>; Mon,  7 Apr 2025 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031606; cv=none; b=vEJJokpKHcC8aftVuvIdLnV9oQe+OTwbNfdSK4uBR/It5ZEK5xAMB23MGW5f5SsG+tzEPSz+wXXpWvM+BRhHw8rMgt7ja7xfd3+n+rKJaK/sOODTtfb9YyEriQQR7JSMm2QcRKvEbo1KP2DcHUYuU8sQbfnnB77nP/M5NosjNP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031606; c=relaxed/simple;
	bh=19xZqCbMrxhaSVg4THIIDnGeA1aclB846rauCeJXklE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=J3NG99ANJpaXDtv1VOtzwu+QSYjX7YoZZzzVOGkeWC7WQbS5ElCkbgpO/Cqe5xAio5Ly/mYaTRg2g5C51/fhe8jokdC8dTKPlqCW05ZCdZ/kth/fZ5BOrcDhOgibtXXWOaWPRHnasYaNo4KjYIBEiYn5O5/nScGKePnnEkYpAGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fCgCOYRh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fCgCOYRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LwcXXpdL89K8CifyOieLXHCWhlyVVIdRdeG/nxs+w4=;
	b=fCgCOYRh3xX86NZHgGI3fw8U4qEDaZri9HaToebAizE5UoT4PCnNjK1EyRPKxq9A58v4qu
	bHqeRS1b1YiwdHX8q1kOqG6PMT2IP0+kxeJlZ93o6L/qjGqnQ3toCJ3KR0YeNQItnunZxZ
	HVTAd6EFOSLzIQoUqWgAgaLMXMlCyBQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-UNBq48xIMZuzEebEAqsQnA-1; Mon, 07 Apr 2025 09:13:21 -0400
X-MC-Unique: UNBq48xIMZuzEebEAqsQnA-1
X-Mimecast-MFC-AGG-ID: UNBq48xIMZuzEebEAqsQnA_1744031601
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeffdba0e2so89316136d6.2
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 06:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031600; x=1744636400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LwcXXpdL89K8CifyOieLXHCWhlyVVIdRdeG/nxs+w4=;
        b=obKz1ntXwffrt/l6R61n7MA13J0PrTPzGoUayVg0pXoVX0KW66VYQzLnF7/50ckW6k
         KC3yJoGnxOYhoTkWtQM1kxdMqf6XbHqjEsFIxbXZaKR8VqIDalFunCK8xXZTWFpuAj4J
         U0zvLDo05neITRUJnpG8Uy2MKwKSqPvcGNkZZH5kZyrIEVUNbGW/l/kItK0w2PYOrpbV
         mjReHgxbmD8HSQNyZOwIyrs02taw+adVYuMNs0lwzjeNB2UupfebfXHJlavu8aCYI7aG
         9pujI1rdA/JemKE5rsGn9sYWclM4XatadBi3QIEfKYqxTG+39WgHsgOXwPKhq6UICahk
         M/6g==
X-Gm-Message-State: AOJu0YzIuNo7FEo2hlnPEzqkZ9pQYWEfEVeAE1QL0d3QSzZqi1EF7tWs
	LkjUqerwj0Gu7+vpEtQcB6IoBxFfSbl5aT5aFhbrfBE14w9fQBkM9rw3ijK/5E3FzoWcMJxNGap
	n11qsc4gSuIgWJVtFDyaLdV/4+TsOAR2lh4iIA72hj5WK7pU0FKdj37oEkg==
X-Gm-Gg: ASbGnct8hSz1SsmYwI7+6N7AHMcPT2r+CB4ByYX27UBTA1Gj4/LUYk650Sr1q4F4prm
	X7RC7ItAmwsj319Nb9iS8cEBUWJccpc9TplKR5kSUysWCfrvFkVoYx/4yFYtNMHv7TebxXw1XAE
	r8I/uttvrR7S+zVqTUzYNL4c3/3etWOluPf2g0qb4O3a4Tep9B5CG1wbfM+maC7JDl6kf7d6PFD
	pD0+jm5gQgGQDj9PhN0y6Kr/94EWreBKn9/JOocsLUHeSiTmi4UIHaTitkURUU/ZCRCA44mv37E
	YywE+g/x854VYNt7biIfb5lekHAecqpRp6V5a5wHGw==
X-Received: by 2002:ad4:5ba1:0:b0:6ee:b77c:7dbe with SMTP id 6a1803df08f44-6f058433cecmr192715516d6.12.1744031600703;
        Mon, 07 Apr 2025 06:13:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbIcdTOZ9gWbu8ai03fhRZZ0ayJGUGd9p13kqveI+0V3okeGBC6eJdQ6jZSyZ9kK0gTCIo5w==
X-Received: by 2002:ad4:5ba1:0:b0:6ee:b77c:7dbe with SMTP id 6a1803df08f44-6f058433cecmr192715266d6.12.1744031600409;
        Mon, 07 Apr 2025 06:13:20 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:18 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 5/8] clk: test: introduce test suite for sibling rate changes on a gate
Date: Mon,  7 Apr 2025 09:12:55 -0400
Message-ID: <20250407131258.70638-6-bmasney@redhat.com>
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

Introduce a test suite that creates a parent with two children: a
divider and a gate. Ensure that changing the rate of one child does
not affect the rate of the gate.

Some of the tests are disabled until the relevant issue(s) are fixed in
the clk core. This is also implemented as a parameterized kunit test
since additional test variations will be added.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 156 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 14ae88df5389..df5d4b25aa69 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -821,6 +821,161 @@ static struct kunit_suite clk_rate_change_sibling_div_div_test_suite = {
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
+	ctx->parent.rate = DUMMY_CLOCK_RATE_24_MHZ;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw,
+					     &clk_dummy_div_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw,
+					     &clk_dummy_gate_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->clk_ctx.parent_clk = clk_hw_get_clk(&ctx->parent.hw, NULL);
+	ctx->clk_ctx.child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
+	ctx->clk_ctx.child2_clk = clk_hw_get_clk(&ctx->child2.hw, NULL);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->clk_ctx.parent_clk),
+			DUMMY_CLOCK_RATE_24_MHZ);
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
+ * Test that, for a parent with two children and one requests a rate change that
+ * requires a change to the parent rate, the sibling rates are not affected.
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
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+
+	clk_test_rate_change_sibling_clk_ctx_put(ctx);
+}
+
+/*
+ * Test that, for a parent with two children where one requests an exclusive
+ * rate and the other requests a rate change that requires a change to the
+ * parent rate, the sibling rates are not affected.
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
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_24_MHZ);
+	/* child1 is rounded to the closest supported rate */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_24_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
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
+ * Test suite that creates a parent with two children: a gate and a mux.
+ * Ensure that changing the rate of one child does affect the rate of the
+ * other child.
+ */
+static struct kunit_suite clk_rate_change_sibling_test_suite = {
+	.name = "clk-rate-change-sibling",
+	.test_cases = clk_rate_change_sibling_cases,
+};
+
 static int
 clk_orphan_transparent_multiple_parent_mux_test_init(struct kunit *test)
 {
@@ -3614,6 +3769,7 @@ kunit_test_suites(
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
 	&clk_rate_change_sibling_div_div_test_suite,
+	&clk_rate_change_sibling_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,
-- 
2.49.0

