Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2951A9F90
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638446; cv=none; b=FFOL5kcrMuhiCk+4q8m3qnBB+GZ3hUF8XJJpPLASz4xz8oiVCRpkPdG8V7ZYIqv/Zi8v/sEK5yNq2rRwIYKBXBaAxcta0H0TFkooHnaUVjy5UlgKsNmAoScqBaT+V6N02QOL66nWke+g0IBGC5OQ7IE1jgHmqDfS+QH3QcaYNAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638446; c=relaxed/simple;
	bh=D3UgrSosq/MOSn8K9Aaz+rOUHHRaOZ0z2hzHPegpLO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gRXKkZdUH8YoUcYI0rJbfzi0a407jIVn1PPrvriPxHV/4U6kkTu2l6QesPbZtWHAJrhDcETsn7R2qAwDS+R/9rmt71rYZB1/BuS8EPVIk5fOaCiU5jDf7ABk5/Ug3g5PPYhDvyACZnxq4HTxQf2w0c2YSrdAM5eP0u7he7+ZfYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VGZTPf1K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VGZTPf1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+erhI99JOuUzOc3CsexcHwDM2IOmUBQdfJnBT87dGw=;
	b=VGZTPf1Kvdxh/hYZS72u2eKrZmNrx2wpOmFi+3u/l+TVpDfZd3xe8jR/Meu65iJZ6F8W39
	tlHlbg6XgjzJZ6AEGq7JzVQAZpMrvFLXiPh1ARpCD+eCVGLr8sm9tuCFZO4y6ZMiXZBKOE
	l+VWpR3h4Nrkdg2oBwZensH0YU/6XRg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-Gya9C4b1OW2G9lLothCiEQ-1; Tue, 23 Sep 2025 10:40:25 -0400
X-MC-Unique: Gya9C4b1OW2G9lLothCiEQ-1
X-Mimecast-MFC-AGG-ID: Gya9C4b1OW2G9lLothCiEQ_1758638425
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-827061b4ca9so1036827085a.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 07:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638425; x=1759243225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+erhI99JOuUzOc3CsexcHwDM2IOmUBQdfJnBT87dGw=;
        b=lHX6LVLPx+//9utXzQNsiKaWkT3xqFrLaRNl2aAOANu1zihL2YuhaWoH26CVZ2BkQX
         bq2dXZPSAuzayNcsrpI+Zn+NeQDnhmLUP4bILFo/z36WuwqLfBK48BjZWaXxO8JHdqhk
         MUXHSWtakEylLR3wDhXH7sAtYyhpsLS1A+XBdmgin6ot6JmiBeOL4OJfHfIqwJQqRTLO
         wCD6uKOE8HK0cpd4cGgG0kgokQwkWhqiALLky14eSlSomPp1B7McAF8Wqflw9gHwEK2e
         rUhdoaIH81Omt/o4siq80jiKSfSkhQK+xn+CXo1a9RjjgjpgRiXGIfV6WXqeWopb+yQ1
         utYw==
X-Gm-Message-State: AOJu0YyKQPzKCifCTJtjxNNy79IieC+z8tH6AeDiKnuVQ2LOFZkowB8P
	eZ4S6t9dnj/rs7DYo6SkKl9Uyynop5FmKrP2BMBn2SibpZVg4XX1cIDPUfz+ynwAdsQfxlmastL
	0B7mI1J9UVs87yq/1nw2SRjR9Tjkc3+AbSVG+yiECluTHAy6NnGy6DUivtj/kSw==
X-Gm-Gg: ASbGncsXtMdTIz0dR2ck1DZazZZtBzDZAD0NJIbnxYWJVwtjBz/e/MimVAbUmixEosv
	m1rtDa5SRQ3zXNaAt4pZKd4D/LbhRRvNt7e1nZbPdWMj2tqh7pvsFqBeCIT68osf3hdqUVcUxn9
	PLayUpLfyV89yrRWV9/46Fte+UX8DWyaBvsxk03hdOwk3RHeLcpFdl32WMZiQcaRG1UuvEGaAb1
	XoD2mbTHwILg6E/NXuFdPkhk0piCrtmSeQjQmNzbcYuwk2+G1CJUgMt3zLXxw+jNhF6EY2bfrQi
	gxsx8u1IkyTytFAdLxlq7glQaEtKqZPfGZQ+rGMoEpO04kE8tXS69hrOHLzNsDcLfj4ojFXbpz6
	OLmuNeLHboALW80AEg452lYeOKpqYHzNsvdwJh7w=
X-Received: by 2002:a05:620a:d8a:b0:812:c6e3:6663 with SMTP id af79cd13be357-8516ba5c35emr303165585a.34.1758638424930;
        Tue, 23 Sep 2025 07:40:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7D73wHsfmP93/Sd0Q4FqlIqORkx+fAcKsqHGCJ9Fpb8lMOLSJtCsdrIjyP8S4cVr0zCMXug==
X-Received: by 2002:a05:620a:d8a:b0:812:c6e3:6663 with SMTP id af79cd13be357-8516ba5c35emr303161285a.34.1758638424314;
        Tue, 23 Sep 2025 07:40:24 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:31 -0400
Subject: [PATCH RFC v4 12/12] clk: test: update divider kunit tests for v1
 and v2 rate negotiation
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-12-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6302; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=D3UgrSosq/MOSn8K9Aaz+rOUHHRaOZ0z2hzHPegpLO8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubTRcsnyrxlvJRTGXHzxVa+Dbvcaj9kidJs+JwOKF6
 1/P33TxXkcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATSTZm+O8bY5OYtenwxQfR
 EVErn77OOchw21lN/b5hqIljzKEw7hiGvzLlRe1WapwMGucS/LR6hc7F9K5R9e+csvHi7b7F4Te
 NWAE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Update the divider kunit tests to verify that the v1 and v2 rate
negotiation logic is working as expected.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 77 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 59 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 7c4d1a50a7dd0bfb66e021ba314a9a9709813d97..87af60d0782274c9faacf7729ed95bf04dfd4860 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -763,6 +763,7 @@ static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
 	test->priv = ctx;
 
 	ctx->parent.hw.init = CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate_ops, 0);
+	ctx->parent.negotiate_step_size = 1 * HZ_PER_MHZ;
 	ctx->parent.rate = 24 * HZ_PER_MHZ;
 	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
 	if (ret)
@@ -793,6 +794,20 @@ static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
 	return 0;
 }
 
+static int clk_rate_change_sibling_div_div_v1_test_init(struct kunit *test)
+{
+	clk_enable_v1_rate_negotiation();
+
+	return clk_rate_change_sibling_div_div_test_init(test);
+}
+
+static int clk_rate_change_sibling_div_div_v2_test_init(struct kunit *test)
+{
+	clk_enable_v2_rate_negotiation();
+
+	return clk_rate_change_sibling_div_div_test_init(test);
+}
+
 static void clk_rate_change_sibling_div_div_test_exit(struct kunit *test)
 {
 	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
@@ -833,16 +848,21 @@ static void clk_test_rate_change_sibling_div_div_2(struct kunit *test)
 	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
 	int ret;
 
-	kunit_skip(test, "This needs to be fixed in the core.");
-
 	ret = clk_set_rate(ctx->child1_clk, 48 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 48 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 48 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
-	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
-	KUNIT_EXPECT_EQ(test, ctx->child2.div, 2);
+
+	if (clk_use_v2_rate_negotiation(ctx->child1_clk)) {
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, ctx->child2.div, 2);
+	} else {
+		// Legacy behavior in v1 logic where sibling clks are expectedly changed.
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 48 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	}
 }
 
 /*
@@ -856,19 +876,26 @@ static void clk_test_rate_change_sibling_div_div_3(struct kunit *test)
 	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
 	int ret;
 
-	kunit_skip(test, "This needs to be fixed in the core.");
-
 	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	ret = clk_set_rate(ctx->child2_clk, 48 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 96 * HZ_PER_MHZ);
-	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
-	KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
-	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 48 * HZ_PER_MHZ);
-	KUNIT_EXPECT_EQ(test, ctx->child2.div, 2);
+	if (clk_use_v2_rate_negotiation(ctx->child1_clk)) {
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 96 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 48 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, ctx->child2.div, 2);
+	} else {
+		// Legacy behavior in v1 logic where sibling clks are expectedly changed.
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 48 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 48 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 48 * HZ_PER_MHZ);
+		KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	}
 }
 
 static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
@@ -879,13 +906,25 @@ static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
 };
 
 /*
- * Test suite that creates a parent with two divider-only children, and
- * ensures that changing the rate of one child does not affect the rate
- * of the other child.
+ * Test suite with v1 rate negotiation logic that creates a parent with two
+ * divider-only children, and ensures that changing the rate of one child
+ * does not affect the rate of the other child.
+ */
+static struct kunit_suite clk_rate_change_sibling_div_div_v1_test_suite = {
+	.name = "clk-rate-change-sibling-div-div-v1",
+	.init = clk_rate_change_sibling_div_div_v1_test_init,
+	.exit = clk_rate_change_sibling_div_div_test_exit,
+	.test_cases = clk_rate_change_sibling_div_div_cases,
+};
+
+/*
+ * Test suite with v2 rate negotiation logic that creates a parent with two
+ * divider-only children, and ensures that changing the rate of one child
+ * does not affect the rate of the other child.
  */
-static struct kunit_suite clk_rate_change_sibling_div_div_test_suite = {
-	.name = "clk-rate-change-sibling-div-div",
-	.init = clk_rate_change_sibling_div_div_test_init,
+static struct kunit_suite clk_rate_change_sibling_div_div_v2_test_suite = {
+	.name = "clk-rate-change-sibling-div-div-v2",
+	.init = clk_rate_change_sibling_div_div_v2_test_init,
 	.exit = clk_rate_change_sibling_div_div_test_exit,
 	.test_cases = clk_rate_change_sibling_div_div_cases,
 };
@@ -4017,7 +4056,8 @@ kunit_test_suites(
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
-	&clk_rate_change_sibling_div_div_test_suite,
+	&clk_rate_change_sibling_div_div_v1_test_suite,
+	&clk_rate_change_sibling_div_div_v2_test_suite,
 	&clk_rate_change_sibling_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
@@ -4033,4 +4073,5 @@ kunit_test_suites(
 	&clk_uncached_test_suite,
 );
 MODULE_DESCRIPTION("Kunit tests for clk framework");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_LICENSE("GPL v2");

-- 
2.51.0

