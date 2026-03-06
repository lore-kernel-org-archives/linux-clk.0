Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B91B37649D
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 23:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772839390; cv=none; b=JLWXAnnjEMg2T1/nJ/QvtQQtU98GQLVR1chJlSZOQVtZI1M5yfipayGuIxvjEoNUZ11sDvXzD1hhh3B64Yp2eAynshIO5Q3FJu370DCz728ES/Xokh5vbEQfyidLrBouV2yGE1okCgus071PDr8YfPOrVIIitDr/HPfMET/CsWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772839390; c=relaxed/simple;
	bh=3ug+1P6t81GTxtoTxctcDdKNVy3s+p28sSKw7y50KiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sGhmC7VJvDmvg4/sIdpKyBKV7f6Z2LN5dDsfJ1o4FJG76L/L0ZMHkKLXLPco9IIgrsstXbvlmEHOlUN80KhUp7/bJ2/Ub7ERZBSrmMKXBwQrWLIE/ZoUWbDXaQWjnZXFLFYRHmGyQ0CodkiZtwf8HRv3dDd5ZftP5e9cIsQnl5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B456P87c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LKWX6FyY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B456P87c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LKWX6FyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772839385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uK84bcQp3JfYVn07vCaAW1q8GicwEaH6/Et7bq0fcCw=;
	b=B456P87cf+pxnmcyzB9bsG8lHNxk0A4l7pgbbt4tvCE33WYgusPMAvlGgifjbcEOrKE8lz
	Nud4TaCDWuX5k3gI4aX+zAwjv4Zi80wPEa6XCr4fVtLsq1q/dOYvsD9KopINTRfqxnV4HR
	ND/2JB7QQeAy/v08xPdnyMXyevbQVR8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-U_WyTIU8NXi75qqRR3gBpQ-1; Fri, 06 Mar 2026 18:23:04 -0500
X-MC-Unique: U_WyTIU8NXi75qqRR3gBpQ-1
X-Mimecast-MFC-AGG-ID: U_WyTIU8NXi75qqRR3gBpQ_1772839384
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3d11b913so5276419585a.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 15:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772839384; x=1773444184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uK84bcQp3JfYVn07vCaAW1q8GicwEaH6/Et7bq0fcCw=;
        b=LKWX6FyYQuaN0v0qaI+itle1tlgZm/n0+vV+bpZjdPAkg/eiCw5aLOJkrZ9G0g8nys
         MwdWPBuNxYK3rEdFjH5uVw0N6lFuQd38ftRA+fQSASyuP2nhp19QzO7FLac4jCVDfOkD
         Ps2gEc6HdKxjFor3NJNwkiZCOZUX3bxveZHL5cJmaV7QDEJn+rA2g9XdNpMgIjBYSIGq
         Sc41N36v755UGo+oKQjvqoZztrjjFSTC34RfbX9BdMEdhkUXEsDF1hzXrpXgmoDtxYLU
         HWtIZ1EyE+nNGjj9QUexqo+5zLnO+GqQ3NXl4GheCSy6fptrf1s40HF5ZwBdpdVfU1vB
         ahAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839384; x=1773444184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uK84bcQp3JfYVn07vCaAW1q8GicwEaH6/Et7bq0fcCw=;
        b=wASa45sw8UgJU83JoDnL168hZmk9aRVNHR5LnMC4/3E4dPNQLcRWTp6+c59gEcGXqe
         782XU/aM/2SWQTXlhLohPKaIm1o6ubCD9AGca8qTdZ5AeCgwIv5F1iDkSqhoTQZjh6i8
         EmpiuTDNqV6a0AaIHO51KYsdiUc6ywQCb2JxxsaXhyInKPcK7l0n6UTq2mStPCXlmdg2
         d2nOObRDFiltWIctszHoxS1sD4NiOjpdrKY45R1OiFO6R+7wmMVMlszBuYsbamAHyISp
         PdMPIgX3QzsuyUvPJdMQVqMKo46mUqgEUtwwgaar96qPRqVs86PkmKUe7dxmMBjkiTsH
         VcHw==
X-Gm-Message-State: AOJu0Yw728G74raJaxDlcrN3KcKkf22KJNTi7shfvPwKzc07fn6tMODt
	Qwy7Xb10qZ2mq7T/5Ed6T9Re6zRl8pwf/M/zULhomOSWbvEKCcU86lWPaMC4o/9s3U89GCDkihV
	oOwXarqiw1Bc5f5FyGQci1SmCuNSi1B2cldPa72er2XbnEoGuGtwdTdZEUcfnfVKzvnOR0rQFln
	SB3eDy6dT6hE7o3Hzi8GCXAvrXjFVP07oWtSprTgmKh/uV
X-Gm-Gg: ATEYQzwdHa0KxoNqjQo6udA5jLqjjYp2lff8JvCZpQIxTRBS6zSzzpYfT8i18LlQohI
	ScBSov032pg39FRuFKgCX5ouFrfRK+47gXF5Ael+mSYpLcVC68wraHiYXkKdzSI4OMqJ4Ap1xyN
	eBnV44/rlQlhLGeeZAMYXUcPxdfRsptVhHmTs5JboP6CTYwWPplEn/ALes5F4LKGfPdU22oW4y6
	Qkgiw6UR7FXW4w1A6BEmOkZhVeYv7/vCN5su09HdaM7MdoW0d098Obqg78lAYmiv7veo9AOsccr
	nTxzy8zSzHdZBcHr7H0Xmk06Oi/cjR/swuJBwb/HeaSPN2iqJ++41UfRG3fyZ7Fq1q9w7TEbbNM
	tH/pjZZZIu0hwL4p+33OmjMl6N58E
X-Received: by 2002:a05:620a:3911:b0:8ca:4288:b179 with SMTP id af79cd13be357-8cd6d33640cmr484143485a.5.1772839383835;
        Fri, 06 Mar 2026 15:23:03 -0800 (PST)
X-Received: by 2002:a05:620a:3911:b0:8ca:4288:b179 with SMTP id af79cd13be357-8cd6d33640cmr484140385a.5.1772839383358;
        Fri, 06 Mar 2026 15:23:03 -0800 (PST)
Received: from [10.125.247.224] ([2600:382:772b:4f24:8140:d6ff:f19a:7e11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f4856cesm203119585a.10.2026.03.06.15.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:02 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Mar 2026 18:21:37 -0500
Subject: [PATCH RFC v5 2/4] clk: test: introduce test suite for sibling
 rate changes on a divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-clk-scaling-v5-2-d21b84ee6f27@redhat.com>
References: <20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com>
In-Reply-To: <20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8192; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=3ug+1P6t81GTxtoTxctcDdKNVy3s+p28sSKw7y50KiM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJXJ55jMTQpt9ktd+/ey1MfX985XhAhxfFXuSnUc2lAZ
 PdzyZjfHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyk1IuRoX1x9sPAfzYzw4s7
 y0pPFLCsrZXselGgoXzlDQ/LsqUdIgz/LFRKtLfHLVi0Tfg0682cIwaaT50itV0iqlpOLeCTFOP
 iBwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce a test suite that creates a parent with two divider-only
children, and add kunit tests that document the current behavior when a
sibling clk can unknowingly change the rate of another clk. Some boards
are unknowingly dependent on this behavior, and per discussions at the
2025 Linux Plumbers Conference in Tokyo, we can't break the existing
behavior. So let's add kunit tests with the current behavior so that
we can be made aware if that functionality changes in the future.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 174 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 88e35f4419c958983578750356a97c0a45effb55..97cbf9dd16ee504d7687d8f0729b6e6e22a21afb 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -652,6 +652,179 @@ clk_multiple_parents_mux_test_suite = {
 	.test_cases = clk_multiple_parents_mux_test_cases,
 };
 
+struct clk_rate_change_sibling_div_div_context {
+	struct clk_dummy_context parent;
+	struct clk_dummy_div child1, child2;
+	struct clk *parent_clk, *child1_clk, *child2_clk;
+};
+
+struct clk_rate_change_sibling_div_div_test_param {
+	const char *desc;
+	const struct clk_ops *ops;
+};
+
+static const struct clk_rate_change_sibling_div_div_test_param
+clk_rate_change_sibling_div_div_test_regular_ops_params[] = {
+	{ .desc = "regular_ops", .ops = &clk_dummy_div_ops },
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_regular_ops,
+		       clk_rate_change_sibling_div_div_test_regular_ops_params, desc)
+
+static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
+{
+	const struct clk_rate_change_sibling_div_div_test_param *param = test->param_value;
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
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw,
+					     param->ops, CLK_SET_RATE_PARENT);
+	ctx->child1.div = 1;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ret;
+
+	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw,
+					     param->ops, CLK_SET_RATE_PARENT);
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
+ * sibling rate is also affected. This preserves existing behavior in the clk
+ * core that some drivers may be unknowingly dependent on.
+ */
+static void clk_test_rate_change_sibling_div_div_2(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	ret = clk_set_rate(ctx->child1_clk, 48 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+
+	/*
+	 * The sibling's rate is changed from 24 to 48 MHz. This keeps the
+	 * long-standing behavior of the clk core that some drivers may be
+	 * unknowingly dependent on.
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+}
+
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
+ * set and one requests a rate incompatible with the existing parent rate, the
+ * sibling rate is also affected. This preserves existing behavior in the clk
+ * core that some drivers may be unknowingly dependent on.
+ */
+static void clk_test_rate_change_sibling_div_div_3(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate(ctx->child2_clk, 48 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * The last sibling rate change is the one that was successful, and
+	 * wins. The parent, and two children are all changed to 48 MHz. This
+	 * keeps the long-standing behavior of the clk core that some drivers
+	 * may be unknowingly dependent on.
+	 *
+	 * In the case where the parent needs to be 96 MHz, and the children
+	 * need to be at 32 MHz / 48 MHz, then that logic needs to exist in
+	 * the clk provider for the relevant clks.
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 48 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+}
+
+static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_1,
+			 clk_rate_change_sibling_div_div_test_regular_ops_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_2,
+			 clk_rate_change_sibling_div_div_test_regular_ops_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_3,
+			 clk_rate_change_sibling_div_div_test_regular_ops_gen_params),
+	{}
+};
+
+/*
+ * Test suite that creates a parent with two divider-only children, and
+ * documents the behavior of what happens to the sibling clock when one child
+ * changes its rate.
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
@@ -3592,6 +3765,7 @@ kunit_test_suites(
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
+	&clk_rate_change_sibling_div_div_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,

-- 
2.53.0

