Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542A12ECD1E
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 14:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009668; cv=none; b=CO5WRWHA/x1YuNDiW/Y4mNIYfQc6gwfTxBW61XfB1IrjSHJpzWkXuWMPQ245uIi2/cQxekQZbwe02NdTKAC6od47Hk8axBPgM9cWPCyEM9huRd30JBDtuViZqL7EHk3BDMtunYmIkjsWQVuPDyaBk6On9zWgUZmxvtOUJi4mqE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009668; c=relaxed/simple;
	bh=vyZW28lbH7FtzudF1QBo50QacGCE1YcnXyZjBOXhCNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PatDd91RvtAhBFKp0rXlwjLBuX8EozBG/LzKwx6Bs2wl13h1T8ujYg7Zdj8NGHOQcFBsjS9tn+W5oNKIeyiWiFHp1RbfaVKg4O8qRyFAwQ44KghpuQrYlQ8TZsb7DM2r1Vgj9mKnWn2YtQLPI9ohxkrhlCDD7joI51l0wsGgUTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fLdhX5zj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fLdhX5zj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755009665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tpdbwlgCYt2Wd+KDHVT+8/nd32QpV6OdXoz9Er6kdHw=;
	b=fLdhX5zju+bLAlxsz791q1YH6WYDqnR/ytd8YWmfoCjDmFleRTXfUNcKkC9apLPUxVYuDP
	AuyHSa0v4ZvSn8tUSBeM7GVljO3201TCQHW5BbqLSdQp0o+dsfpv+b/3/dBsJfSf2EXewa
	NdYgmOPnHssqlYe6n1bSTTvDv0Fclyo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-8A-Wjvz_MJ2IHTa6jtbgfA-1; Tue, 12 Aug 2025 10:41:02 -0400
X-MC-Unique: 8A-Wjvz_MJ2IHTa6jtbgfA-1
X-Mimecast-MFC-AGG-ID: 8A-Wjvz_MJ2IHTa6jtbgfA_1755009662
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b08b271095so146930701cf.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 07:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009662; x=1755614462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpdbwlgCYt2Wd+KDHVT+8/nd32QpV6OdXoz9Er6kdHw=;
        b=Am0PJlvfMOg7p1aUPfuPC7E0RMxqjJKYjbTvhSzhDmQEkqoovHXbmVywFblAWazP5j
         zAh8EyxxbLO2zUt7cIQeNGLr1cNqkyWxAq5KsaPZvNpw2N7B5d1AjFvwl9nqjeFIELuY
         8Bu7ZFq4N+aSBszLcMXEuI++54OvWXXj2JH9p777bhTv8sjCz/K//d4R3Bza+kF9fDCm
         ZSspZ1nxlDketraBck3cMVkLxCHZ+XFlvjIiNgAlBt4Cn61vCBepdsWlIqvI5mkXd2Q7
         gR5SdzD+EFbdJLUmTgdY84CjTdPTeH0Cwpd53lvZE51DUodPPHNbtVs7yzUUTv/bJ2t3
         xvFA==
X-Gm-Message-State: AOJu0Yw0cUIMj0v4/AlxACQw6KtWA8d64PW2jYMtoPO/9FnrjIiNTQoy
	HA090HzsqNGrFckK84qOPx5XNrBAxZOAQgAIW64jIeLdsMSz5vzeaat9vu4TDlDOUoFv9yKcG4I
	9T32mKIQzElh87ilkBXLfVn7b343LN9NnoO4g6CmiT8jvKsoP3wWwyC0BQIbaPA==
X-Gm-Gg: ASbGncviUX4AZM6WL17YYSQ05k1SoOEXYj3oOZ3zFHaIXiyYs/iQymxDRhYIiYR8v0l
	3yWlrmdUw0Ak/FF7G9aM1jL+loLiiEQ96QGOoSdxL9u07a1UkjXH3HB9Gip2wr1ZVziMg5EUZ8P
	FxrwFggbML6gtOIxZct/BZGCOPqEkWKWLgxT+8Gymz6MTakfmDnVPIp7Z4KXvdSBffD3HQHixG/
	P661XguDz7kkVS2/5Ppg07lrAUjjuBD8MvIQSft8zD6jOVETWTmV4WuJaeR4p6lL9GtVhqB3LOG
	/t2BYq1G/W4uibzw29U1JaEqAIS0jtlRtTCj5tPcBtBFubN47h4PoQ0JKBK3Fv20mJ/ZQOXUrNi
	MtA==
X-Received: by 2002:a05:622a:ce:b0:4b0:7298:1ec4 with SMTP id d75a77b69052e-4b0eccc810fmr53042101cf.51.1755009661607;
        Tue, 12 Aug 2025 07:41:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5dtlEiE/AoaLpAjyPc/iiT4Ol5WvkYPKtpwpUg8utNhfK6DbKFhT1c8BXdABdASmICAyOeQ==
X-Received: by 2002:a05:622a:ce:b0:4b0:7298:1ec4 with SMTP id d75a77b69052e-4b0eccc810fmr53040691cf.51.1755009660137;
        Tue, 12 Aug 2025 07:41:00 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm76186821cf.8.2025.08.12.07.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:40:59 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 12 Aug 2025 10:40:34 -0400
Subject: [PATCH v3 4/9] clk: test: introduce test suite for sibling rate
 changes on a divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-clk-tests-docs-v3-4-054aed58dcd3@redhat.com>
References: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
In-Reply-To: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755009649; l=6637;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=vyZW28lbH7FtzudF1QBo50QacGCE1YcnXyZjBOXhCNI=;
 b=xiP6mRmZepVnpwhapEW0RGWWNo6nO4GNFAUOg8HBW0CD0fhrHRDAC04qR50DGyjfwahOskDID
 97VRfpO3AWdCDLWd7HJjOoGvJRgH+qWDwHMJpkVpRVSKY/Qid32cEY7
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Introduce a test suite that creates a parent with two divider-only
children, and ensure that changing the rate of one child does not
affect the rate of the sibling. Some of the tests are disabled
until the underlying issue is fixed in the clk core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 145 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 61668fcd7203c4cef9f22b8c0c5bb5a50d331f53..81095fd80b270c1fd5e73e90a2f36da0071d10a4 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -651,6 +651,150 @@ clk_multiple_parents_mux_test_suite = {
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
+	ctx->parent.rate = clk_dummy_rate_mhz(24);
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
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), clk_dummy_rate_mhz(24));
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), clk_dummy_rate_mhz(24));
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), clk_dummy_rate_mhz(24));
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
+	ret = clk_set_rate(ctx->child1_clk, clk_dummy_rate_mhz(6));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), clk_dummy_rate_mhz(24));
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), clk_dummy_rate_mhz(6));
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 4);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), clk_dummy_rate_mhz(24));
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
+	ret = clk_set_rate(ctx->child1_clk, clk_dummy_rate_mhz(48));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), clk_dummy_rate_mhz(48));
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), clk_dummy_rate_mhz(48));
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), clk_dummy_rate_mhz(24));
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 2);
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
+	ret = clk_set_rate(ctx->child1_clk, clk_dummy_rate_mhz(32));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate(ctx->child2_clk, clk_dummy_rate_mhz(48));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), clk_dummy_rate_mhz(96));
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), clk_dummy_rate_mhz(32));
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), clk_dummy_rate_mhz(48));
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
@@ -3591,6 +3735,7 @@ kunit_test_suites(
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
+	&clk_rate_change_sibling_div_div_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,

-- 
2.50.1

