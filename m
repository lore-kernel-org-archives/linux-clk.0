Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19440275AED
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638406; cv=none; b=RYj2jJ7lSrm13mFeFkXDrZxpyo1rdrXwip5W665gXBE/Q4f+H+bCfYjSW4bLcXhs+NkybjRReua6yATJS4+LSt2ZBIsMLmc2AOHbzlYi8RL9nCWKqRJwiLnTmsnMKFtvPcp/BuLTX3LT6LwxgfFnWoddvqOE9S4p6U5FgpZLLkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638406; c=relaxed/simple;
	bh=1TO024p3M9e4CvKoFHluPPeetN75UqlgmhPAZLsIONQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhKFqJD9A8vekTNmolRDqoHL8SIzuSLO95MTABGQ3x9om170P/cU8aj2aGoEFKBkvRITpJU+AwTqFG0TGSzw3d5L/3ShV2dFWlkBBoY5xwAWsf+wG53oeXgJuYV/ufUci2sViz/mAXt9XyiwoOXAGY0SuMuC01GS6V8AOXFsCI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=grmB9FDp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="grmB9FDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKuLuPjkfTwmJjUEB4orAAqLaFZFpgNaOtW4WuFuAAc=;
	b=grmB9FDpxG+c3qp2ItqCjdyi1tFkiKKB4fV7bfg6s1/UuCZQKj4RoIBI29Tei2wM3LkMwq
	xDd7NppajhGNX7pIUlcoSWq1Y0S0ZoYK00+m1wx4aerY0zc3pjkX550dD1zZl4yepVPfET
	brfDcoVn30NlPu/LWMP1vEgX7eaf3ZI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-rVSGgbNiOI6E4AGQut9Uug-1; Tue, 23 Sep 2025 10:40:02 -0400
X-MC-Unique: rVSGgbNiOI6E4AGQut9Uug-1
X-Mimecast-MFC-AGG-ID: rVSGgbNiOI6E4AGQut9Uug_1758638402
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-81b8e3e29edso961806185a.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 07:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638402; x=1759243202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKuLuPjkfTwmJjUEB4orAAqLaFZFpgNaOtW4WuFuAAc=;
        b=H64l/4gJHAVxpC5qutIqe9AEwxoE2Kny/fKB6NgeSyJgcNcjrg2/iOHqNViX50MhD/
         egj7ibKOAjJjsYyNku8sgW0N+CIDz+1I7O7ry8J5sT0dXm903uhIQIcqv9iDPrzzfUmz
         gsw2PjO07D0wZf/prK9GOFmd8+NrmL1HZvPNj3buD7Je+ODxJqCFw93toslRpUiWCJd6
         SV2vGhZfYwr0q2gHOEBEENcuY5Qg8aedyOmSga06YodwiwDMXE0WmQcXWyce+dN2NDPJ
         QLmyVh66dMXKZiSSUWQbB1zdP+NDyjpAJThZhjwflY8+uuI0oyrZlwpaYOxZNogV7DfM
         tACQ==
X-Gm-Message-State: AOJu0Ywc7x39TdRlKjCUiDtmDHX+9CNagRg36Vsk/bok6vOSPIYjBDLU
	094F7u4v4edH8qnaFQwcd6k3DenOBcfECHFuUdEiMMI5VJLgYXTyQBviEIgaAeXuUyMS62/H2LV
	1KSpGuYH6ruq5nQdDRrJht/RzZ2Nv4QuM3VNoGMt4Yk/S+dp9GdN+ait6wLZ3NA==
X-Gm-Gg: ASbGncuHWN6qxOLZ5B/vQzK4cNkLbwIrCpXKSJ8U6cU1aMQmXUQFfLTBBLJFlW4XTTX
	LH6lD+Hn3KOImtrSC6faHcrylbRqi6ZpNAnYBDOzbLiby9ciST6P5deLQVNKe/eE+HrtEzrB1m0
	aN4HGy9CAsZprwpT/Z/qEQPPveDVG+lpbx49LP0BrsoKhJ1roaFkAEPfAayo8RLuyUt/zrUpYQi
	CCRw607HrcCPsGyflc4B0KUaNZ3hRBzAg5KHjft0CR/AN9YkWaYCg+cwViLt1fD82zoqzQDD/8J
	W2cUdMdrG5jlUJQtZnnl6L+vRtPzK8gpy9vi5izVOtChSOSpt0AEqMajTsESq3VpX6geLAPkMYO
	6kUp8j1FoYi003QnbNx4rLGMjCHCYFNChlgmsREw=
X-Received: by 2002:a05:620a:4004:b0:850:329f:f1ef with SMTP id af79cd13be357-85174c1e3fcmr346705585a.55.1758638401740;
        Tue, 23 Sep 2025 07:40:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+7OLSb7GBt5STwn4FgC6PtZci/VRxi6hdnrqJXbPq3mGFGcag7VbemPhwQuktFX6Ssqn1+w==
X-Received: by 2002:a05:620a:4004:b0:850:329f:f1ef with SMTP id af79cd13be357-85174c1e3fcmr346700185a.55.1758638401033;
        Tue, 23 Sep 2025 07:40:01 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:00 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:23 -0400
Subject: [PATCH RFC v4 04/12] clk: test: introduce test suite for sibling
 rate changes on a divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-4-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6518; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1TO024p3M9e4CvKoFHluPPeetN75UqlgmhPAZLsIONQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubdQ/dWOW5qUp9/e7znpgzhEdGiDSpuwt3io1+43rZ
 ukCfXXljlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZy2oLhf3nL/+XnJrfnR1oe
 COLb/srg9Lz20pVab/6lbinUmvK7so3hf/WX7cZH/fZnXwu02i516Oj10rBZLz/3Bi4+KrX1+Ia
 bezkB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce a test suite that creates a parent with two divider-only
children, and ensure that changing the rate of one child does not
affect the rate of the sibling. Some of the tests are disabled
until the underlying issue is fixed in the clk core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 145 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index e1f72fcede1df1d486744b171728231ec8fa8836..1aca266f9922beb7d81124c07d21b2a3d700dc5c 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -653,6 +653,150 @@ clk_multiple_parents_mux_test_suite = {
 	.test_cases = clk_multiple_parents_mux_test_cases,
 };
 
+struct clk_rate_change_sibling_div_div_context {
+	struct clk_dummy_context parent;
+	struct clk_dummy_div child1, child2;
+	struct clk *parent_clk, *child1_clk, *child2_clk;
+};
+
+static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->parent.hw.init = CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate_ops, 0);
+	ctx->parent.rate = 24 * HZ_PER_MHZ;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
+	if (ret)
+		return ret;
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw, &clk_dummy_div_ops,
+					     CLK_SET_RATE_PARENT);
+	ctx->child1.div = 1;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ret;
+
+	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw, &clk_dummy_div_ops,
+					     CLK_SET_RATE_PARENT);
+	ctx->child2.div = 1;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
+	if (ret)
+		return ret;
+
+	ctx->parent_clk = clk_hw_get_clk(&ctx->parent.hw, NULL);
+	ctx->child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
+	ctx->child2_clk = clk_hw_get_clk(&ctx->child2.hw, NULL);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+
+	return 0;
+}
+
+static void clk_rate_change_sibling_div_div_test_exit(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+
+	clk_put(ctx->parent_clk);
+	clk_put(ctx->child1_clk);
+	clk_put(ctx->child2_clk);
+}
+
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT set
+ * and one requests a rate compatible with the existing parent rate, the parent and
+ * sibling rates are not affected.
+ */
+static void clk_test_rate_change_sibling_div_div_1(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	ret = clk_set_rate(ctx->child1_clk, 6 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 6 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 4);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+}
+
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
+ * set and one requests a rate incompatible with the existing parent rate, the
+ * sibling rate is not affected. The requested child rate picks a parent rate
+ * that's compatible with both children.
+ */
+static void clk_test_rate_change_sibling_div_div_2(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	ret = clk_set_rate(ctx->child1_clk, 48 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 2);
+}
+
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
+ * set and one requests a rate incompatible with the existing parent rate, the
+ * sibling rate is not affected. The requested child rates require a parent rate
+ * that neither child would initially pick.
+ */
+static void clk_test_rate_change_sibling_div_div_3(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate(ctx->child2_clk, 48 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 96 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 2);
+}
+
+static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
+	KUNIT_CASE(clk_test_rate_change_sibling_div_div_1),
+	KUNIT_CASE(clk_test_rate_change_sibling_div_div_2),
+	KUNIT_CASE(clk_test_rate_change_sibling_div_div_3),
+	{}
+};
+
+/*
+ * Test suite that creates a parent with two divider-only children, and
+ * ensures that changing the rate of one child does not affect the rate
+ * of the other child.
+ */
+static struct kunit_suite clk_rate_change_sibling_div_div_test_suite = {
+	.name = "clk-rate-change-sibling-div-div",
+	.init = clk_rate_change_sibling_div_div_test_init,
+	.exit = clk_rate_change_sibling_div_div_test_exit,
+	.test_cases = clk_rate_change_sibling_div_div_cases,
+};
+
 static int
 clk_orphan_transparent_multiple_parent_mux_test_init(struct kunit *test)
 {
@@ -3593,6 +3737,7 @@ kunit_test_suites(
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
+	&clk_rate_change_sibling_div_div_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,

-- 
2.51.0

