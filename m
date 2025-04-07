Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC2A254845
	for <linux-clk@vger.kernel.org>; Mon,  7 Apr 2025 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031603; cv=none; b=c0roh1JM5lT2Ln+NRqycYprIywnORX8fRMj9469mQGuFxABRdqkV/yD3jYkBKn3+/WM3CtCAbCN+Ohewth2X3nG5MOhn3Eg0dt5KJfNOemmVfD5DhmqJIrzGwaTXAuR4oea0mxmBvCQU8AzgnRiwT8fRV6gx6iFKyGNZUhYFHLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031603; c=relaxed/simple;
	bh=ZYipNs+crvm5U+agBHLVdGPNoOm0fvljgZMQ2NaTkBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=U2sJ5KzSW6YE36l1Cfu/r/ElikVDBTuQILhYAyiOgVCGyFKFpn+3YepGL5i8zONKvx4O1a7A5lK8bWPGtZ7I7jTCE/Bd05fEtm9M9XFmzXsbtS/l+DXjYxsv2rFAbvEzsa2uKTOpZBZpVj1Pr7SCoi/jhsyUIz2MppPL7c5CKiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vlsf2gNd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vlsf2gNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kj6PU5kJaei74PopQFAd4HOXHT8Ovro9cVP0ls9g+Yo=;
	b=Vlsf2gNdavrG4T7WQCWxRxSIC7H0B/lnKCI0eJJCtwIovOw2bsjg27+uZ/5bdvtqKX6nKX
	+cSAFxYkS6YkgtZMHnncdbDCi/NGP66bqQXwGjKJ026bA0zVtx/OlrRUtNRAHFDakiPatb
	FAVhPtkuKvgpqzUo7wEwpG/dabinPIw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-nd-6dxV0PfyJ2hIcKsdOXg-1; Mon, 07 Apr 2025 09:13:18 -0400
X-MC-Unique: nd-6dxV0PfyJ2hIcKsdOXg-1
X-Mimecast-MFC-AGG-ID: nd-6dxV0PfyJ2hIcKsdOXg_1744031597
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0c089909aso30579976d6.2
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 06:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031596; x=1744636396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kj6PU5kJaei74PopQFAd4HOXHT8Ovro9cVP0ls9g+Yo=;
        b=rZRVMhARw8HwlIa2calMv1ahlwFsHt80Iae9jSNPYfEb8pAyvTcxYyGRpA7Cihs9eD
         zpDr503NNkSDiJDqXfX0EZ1OqRopwKc1kykDeNfXephz7frh1t5sZhHqEYGgZrgQl9LL
         jDWt9cqZ/j62JsEu9Cr/d661dd1S08K8F1u6xX8SSU6rrpWDPeCwHdoNFjLo3x+zMmiW
         uXvwvH6W6Rme2a0cDuTMysUGkipFajdVBI9r0+eymK+7w7+dmwqB4BqxWhWJ18JNr4Es
         kt4vMiB4qF+4wRK0SiQ/UvrA2SX4ZSneZCFDaTUfdk5jrvCQsXPyVeXbYVUs4cC5tBL+
         QYaw==
X-Gm-Message-State: AOJu0YxYGociM+2NWAYvvDGDF1vvVBbynrS3n173RdkXLJXjAq+YiuL4
	HUy61jU1d+kmpxK437CkdsdoIqP4H2GGyWXMQPnTgZXI3kc8O6F7aef47gzzFaPNm2gZsBFKQj9
	dwBFTYIOt8oDKKKcvOT1TGOuI3ROGBkwaAYPYMQPzXdQc2ED/+qP1kP3jiZOitf90QQ==
X-Gm-Gg: ASbGnctiP+GoQu2/+AWS8QR7SoTPmlSyJeD5eecWj9rr5kYBjPVJ7FX3Z/2hLmUgN0B
	oMNwjCGuvp+7LTqMPro3+faIwxswI5mejLmL/qXB7qs5o8u6ZE5YWT9nDKZmACvC86TxlCQtHA4
	5PfoAFFlyqAauNiWTvmMpeBRvBVi9C4DdDaucT54qonaQmRn3qwV9uBw0aaRnCA+Dj4yd4XSPiY
	bt35UDfolMm81jZm5VsdmsGJofH5YalcLlXwb3GJ9Jc622ri5i7nY0q5wDOrCLzg/BNa0wfhxIp
	eC77eVL7HtbOSzbpz6DSmKRQyvw6z7yPuMarQFILHw==
X-Received: by 2002:a05:6214:1d2d:b0:6e8:ef80:bcbc with SMTP id 6a1803df08f44-6f00debc511mr203626186d6.5.1744031595750;
        Mon, 07 Apr 2025 06:13:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGByCpQR2AniaNCjBHDOmGlDE2aS5mpzlnF4QdIIC1rtfrWYX0CPYIvd3RuYJyKvftUvu52LQ==
X-Received: by 2002:a05:6214:1d2d:b0:6e8:ef80:bcbc with SMTP id 6a1803df08f44-6f00debc511mr203625856d6.5.1744031595407;
        Mon, 07 Apr 2025 06:13:15 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:13 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 3/8] clk: test: introduce test suite for sibling rate changes on a divider
Date: Mon,  7 Apr 2025 09:12:53 -0400
Message-ID: <20250407131258.70638-4-bmasney@redhat.com>
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

Introduce a test suite that creates a parent with two divider-only
children, and ensure that changing the rate of one child does not
affect the rate of the sibling.

Some of the tests are disabled until the relevant issue(s) are fixed in
the clk core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 135 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 4908fb9c0c46..7d4dd1a559db 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -653,6 +653,140 @@ clk_multiple_parents_mux_test_suite = {
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
+	kunit_skip(test, "This needs to be fixed in the core.");
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
+ * requested rates.
+ */
+static void clk_test_rate_change_sibling_div_div_3(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_16_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate(ctx->child2_clk, DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_16_MHZ);
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
@@ -3445,6 +3579,7 @@ kunit_test_suites(
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
+	&clk_rate_change_sibling_div_div_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,
-- 
2.49.0

