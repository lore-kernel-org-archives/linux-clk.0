Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7857253F1A
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638417; cv=none; b=O44hxt4LzbzKjPf88TJYmVyzMBLXt+rHnVy70vu6LV/jfjNzzbmEX2/CX62AiLaBLsqJlZU/N2R1KNwocI2Vr/t/xLCOqCUZVP7pNWrmeusKfND6Vq+1fpm1Y7XuF+n6Vu/zgDSRHQZrGCuXHjbU0lRALuVhNXpeIhECwPAUlw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638417; c=relaxed/simple;
	bh=zpyuXvyiYD9eeqhZlOVx8F+Pl/6qjadEKFFcmOgiDiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBDyR61jXUPRkMht3+4G8i6IEyL/1Z2dMMG+vxu1vN++oKXg51KmL7KhcJ7Nxy8alXelxRQ5lAbza4Nohl63CE8AKvc8nMeGFan5vQH8H/pF33rokXmPdufg1LuDvQ13vRw10gxOt47Cl5GL+lBZLraBPv0EpdyGKSXPrh6XIf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dz0zaW6n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dz0zaW6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYAaIRlhQfgUHW4R/ndesV2wqa5bdYWvu/q6ojx4leM=;
	b=Dz0zaW6n4voQyLn5R3zailQPBERLJ7XeIBAKl/0uUsN3UNSIY2DuyUDP4d7hc3iASnd/fz
	wkcpMJaAhc/2BN3ID60Bw2pQ82rmkU8M8lugIa3nPwdHHyHSVAAcRoePl1Q56bgHTPsVi0
	kM4eWOB0A5DLA/nFnNv7ojWh75F3SOw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-z77OSXaoMf2GVs6kyUPefw-1; Tue, 23 Sep 2025 10:40:07 -0400
X-MC-Unique: z77OSXaoMf2GVs6kyUPefw-1
X-Mimecast-MFC-AGG-ID: z77OSXaoMf2GVs6kyUPefw_1758638407
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8178135137fso1356595385a.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 07:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638407; x=1759243207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYAaIRlhQfgUHW4R/ndesV2wqa5bdYWvu/q6ojx4leM=;
        b=N9o39IIOvxQzoSIg9ZfX45eDGwz+2rkbrZoRuqn2S0I6zgoo+DaCwHWHzaD5FJR7Y3
         P9IgcawfgM5XUEpho0cm9bSVnIXq/aGaVqdf3OVhr/ue/JCmxkePMoScvxXwjnWqURQJ
         4JSBRWr7ovveI6ojEvo+l/OU/Irj0g0qKAi3LaGfg/vEDQTXv/uz3H/Oyi7vueod6S1E
         SieSlLSleaUcN9XxlU8pHqOz/8qQalvmwOne/mNaP1heZv89v4xSxl6MmcbeAgvUWjQI
         XU/olqyc4vZfbt29c0/CVpuzRjO2vY4q4veJ7eYsGzkogSuWTF2G+/LEKtu4D8c1+bWc
         VOXA==
X-Gm-Message-State: AOJu0YxIZiZvTGappS+hrFWSqCYgLf3wuhc9vgX3TozV9Te+Q4GhvlN6
	sADaBsBp4v3CALQDCMZQnSI2mFpw+3abat8zevHVIKd0a+VgUsUsjICGOxMXokd1UIUeo/zjg2v
	5l91ukV/NL7KD+wxFytL6wb/pFDVp5Zdu24moRcNSFbM7Td3J8B0IjZqGlyjH4A==
X-Gm-Gg: ASbGncui5VQf+dcMarEJTVznjDhYeegYjdAf5ZLEe3hfrEk36MSKMkCGQ5mxCKqxDRz
	D15UcAXCNRn6ZUAjVmnI16w1h5nkhwMkPwRD4VME2lGa9KDzhajOPfUO4M+pHXFNPyAQAPvFo90
	uOXgBUOb6QH3YyQMCq8gUFqQZkn/8ML3Vb6FdOVCa1dsXtGLDCjPDkFOddOmYfJ1hbFoy+KF1w6
	PyuxrmRQl3qAyPXosuB5SRMLRATX6g3v55Osgo4/+8Eurp5pnZTAFDtuTZI68gwGxBCnRyPpGs5
	0PiyQzjBihrgeU+sg7/IvRLPPQztK243hmzpYm7mVF4E4uXLwKDY+9JCoT9Hn9s9Wc4NyUTsBrY
	jKaTXi8s1Xra8x5E6L44h30jkO11KGuYmWU3xiHc=
X-Received: by 2002:a05:620a:414b:b0:84d:b0e0:4183 with SMTP id af79cd13be357-8516a919802mr345617185a.23.1758638406883;
        Tue, 23 Sep 2025 07:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdjlcch00PashDlzbuTTmPoVSqMAIOcWAUI4Pr/QX+fLOPi2xGS7zPFlAxGgH4hNbH3DSn5A==
X-Received: by 2002:a05:620a:414b:b0:84d:b0e0:4183 with SMTP id af79cd13be357-8516a919802mr345612485a.23.1758638406285;
        Tue, 23 Sep 2025 07:40:06 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:05 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:25 -0400
Subject: [PATCH RFC v4 06/12] clk: test: introduce test suite for sibling
 rate changes on a gate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-6-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6733; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zpyuXvyiYD9eeqhZlOVx8F+Pl/6qjadEKFFcmOgiDiU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubdSv7e01MH5uv3z93sjYY2E7mXaeku561bHeSyOgx
 cbYfoZnRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOJP8LwP/LOtXvqsaeYte4z
 8niv/6JesMvukd93mbu28XINq8+8q2Zk2HRdPCgi4XXDNIbK+R9d5Rwrstz2bTZw2rxZvKBBaQE
 DLwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

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
index e798ee0591b5db6a7728eda20dcab167245a9834..5fb908a8c764f3c3d2c744022bd61e6307c890c2 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -831,6 +831,160 @@ static struct kunit_suite clk_rate_change_sibling_div_div_test_suite = {
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
+	ctx->parent.rate = 24 * HZ_PER_MHZ;
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
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->clk_ctx.parent_clk), 24 * HZ_PER_MHZ);
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
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+
+	ret = clk_set_rate(ctx->child1_clk, 48 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
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
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+
+	ret = clk_set_rate(ctx->child1_clk, 48 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	/* child1 is rounded to the closest supported rate */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
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
@@ -3772,6 +3926,7 @@ kunit_test_suites(
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
 	&clk_rate_change_sibling_div_div_test_suite,
+	&clk_rate_change_sibling_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,

-- 
2.51.0

