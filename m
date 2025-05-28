Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CCE223DE2
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 23:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474245; cv=none; b=e14cSNYgnDHBpdURC32O87zEhoh0MTKkY6/yS9yU3ofIgg83he19shFUzaKeRrgu6De06bW/eUSRyUV8uFSSXn8dYfL4eQpaaUCDumOPOKp4cQ8cKdVK5caxdizO2JL9kVxanmd7eG7KCNaK0tr4erwASUC321S5pmUyLGxZjvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474245; c=relaxed/simple;
	bh=IGEeR6GetpJ5C1jEWi5w6/QO0GccDmMEscoH2i9wX9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gaK881LL+t4ic8HW2TNXZsUFyIswvfiO8ThuQlV5ad+vGU2aJYukwpip99RFRg1UhW1PHCczrj7q2AtYJ0unAPFuMDV20jk6pRH3HRca5J5eM1pffPbOvyWnG0fW4+rJPnLzgSEWFZXfBZuzWVEE/8E+t9ilZvzEKp1R0DZlGXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PRumem29; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PRumem29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3a/LsUeYxbB9EWmt1iNbsdUxpfsyTRKAQHGwuVJdP0=;
	b=PRumem29GbSWz5dkFWuakWOjA8BeRq9ojo+nLgaEQjrm4jkGDMfI9WozbtyqLh91ZkSEeo
	ODpqI0NSr5ne1VYpvy/q8RbNk5ghSxVnbDQ1bmRyJdWPdABskytoOChg8faC9s9VbBXB7G
	6s0JL7bII4GOPRSDDDuaRAFNuP6CipU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-uGs5peRBMJqxdwhwPtalZg-1; Wed, 28 May 2025 19:17:21 -0400
X-MC-Unique: uGs5peRBMJqxdwhwPtalZg-1
X-Mimecast-MFC-AGG-ID: uGs5peRBMJqxdwhwPtalZg_1748474241
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c793d573b2so47235685a.1
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 16:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474241; x=1749079041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3a/LsUeYxbB9EWmt1iNbsdUxpfsyTRKAQHGwuVJdP0=;
        b=R69u3A2290cz9633khnlO2j88n/+gPKnQ95wSUZ3LDBCjQhQii85q57yk5e4aSm5q5
         4biDUlj0OyWDLW+SXg29N5ilU2oKiODKp1IO9ozBdgWfEBGS2imhnKjm7eSFEbLKnr9x
         UqyDdiXlpuEDZL8KxEUHX2BfKAkEajKFRtXIp1r5o4cuVN8Mzc2kv75Qx1XvYcCYaVnb
         odjuXIoLmRe5iWTuWdgG/yccN5tRZjO6BE29AH9CEQIkOCxE0Hal4VLACnltjMG75GMV
         9ePeZqiFKmXy0pKya5zgp80ayf/VZKgYbfdhoyLPk4H5BlCouEOMXAzQWu5LgbRSNg/K
         hXqw==
X-Gm-Message-State: AOJu0YzaclNdX8kMg3phQpoQlP7sClEapbUkm0q8B+9LPCJ0LrIoi+qD
	wx7HGh7StOIBw6aZt5Mw02DxFJA6LT1NEsvednCWGUNOpOcF8P/wWrmrqoFtBzIu+3UEaD2lRjM
	EKM9uk5L9OxOiQlwCKjWMNCJ3FQQTKnXDM9uEvqcWN/Z0+YE3/xvfmlmlxEfnog==
X-Gm-Gg: ASbGnct3lzEAY2+tVPg68whB8QijJWVO6nR8yufwlLwsSKc7jud/kFA5YrJOh/6e5CA
	GIsZYcDXmNDZqXEsj3gSd1bgeN3gey9BQWfApfJtvdmAWA66ySCURu9i3Q/P1OBLdVqsdC/7OSm
	Wrels+X/UyfdBzq3S29LfxgdmYsRTqsoQzSk+F0hmZQt1asCI8j6LMSoyizLPq9xJNaSGJf7SfJ
	LuLXqNOSqM9/n8MBg6CeW3jf6k1mDyDiHUAS4kRKct9DbQPxeW7aesLTZVsrrSp955Q5bgySgZ1
	vwD+oniROFJEJukttoPJ731d/YeNS2aHItYFDH/JEzPQH7UQ8g==
X-Received: by 2002:a05:620a:26a3:b0:7cd:148:d584 with SMTP id af79cd13be357-7d09ab46971mr19718085a.31.1748474240826;
        Wed, 28 May 2025 16:17:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmRPQZj12tCsTAJ/q6xHaiHddNwtxTaCIq44YvIyx/ySfBkz+7Y+7BxJoKx6jA0WadX/T3Eg==
X-Received: by 2002:a05:620a:26a3:b0:7cd:148:d584 with SMTP id af79cd13be357-7d09ab46971mr19714885a.31.1748474240415;
        Wed, 28 May 2025 16:17:20 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:18 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:51 -0400
Subject: [PATCH v2 05/10] clk: test: introduce test suite for sibling rate
 changes on a divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-5-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=6278;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=IGEeR6GetpJ5C1jEWi5w6/QO0GccDmMEscoH2i9wX9o=;
 b=wz7OjZHAO1SRXStjvpw6TOd8nv7KQP7thAXi6sg6OB60ne0EEWbJghfSwYCkBwP2fyTfSNL03
 lG8HK4lbStRBLcmDcC8u7Z1uB/tcA6ES5Or+h5wqLCXCxjM0vuAt2en
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Introduce a test suite that creates a parent with two divider-only
children, and ensure that changing the rate of one child does not
affect the rate of the sibling.

Some of the tests are disabled until the relevant issue(s) are fixed in
the clk core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 139 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 4908fb9c0c46e34063ecf696e49b48510da44538..35f516fd71a2e33ca19a0512bd2db02111ea644c 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -653,6 +653,144 @@ clk_multiple_parents_mux_test_suite = {
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
+	ctx->parent.rate = DUMMY_CLOCK_RATE_24_MHZ;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
+	if (ret)
+		return ret;
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw,
+					     &clk_dummy_div_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ret;
+
+	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw,
+					     &clk_dummy_div_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
+	if (ret)
+		return ret;
+
+	ctx->parent_clk = clk_hw_get_clk(&ctx->parent.hw, NULL);
+	ctx->child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
+	ctx->child2_clk = clk_hw_get_clk(&ctx->child2.hw, NULL);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_24_MHZ);
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
+ * Test that, for a parent with two divider-only children and one requests a
+ * rate compatible with the existing parent rate, the parent and sibling rates
+ * are not affected.
+ */
+static void clk_test_rate_change_sibling_div_div_1(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_6_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_24_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_6_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+}
+
+/*
+ * Test that, for a parent with two divider-only children and one requests a
+ * rate incompatible with the existing parent rate, the sibling rate is not
+ * affected.
+ */
+static void clk_test_rate_change_sibling_div_div_2(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+}
+
+/*
+ * Test that, for a parent with two divider-only children that request rates
+ * incompatible with the existing parent rate, both children end up with the
+ * requested rates. The internal divider for child1 will be changed from 0 to 2.
+ */
+static void clk_test_rate_change_sibling_div_div_3(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	/* Validate initial child rates and divider states. */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_24_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 0);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 0);
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_16_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate(ctx->child2_clk, DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_16_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 2);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 0);
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
@@ -3445,6 +3583,7 @@ kunit_test_suites(
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
+	&clk_rate_change_sibling_div_div_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,

-- 
2.49.0

