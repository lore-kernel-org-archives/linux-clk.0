Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1CB3C7DED
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420259; cv=none; b=BK0GpVj76kh25V5DZh1PkskGT+dxbXe5cPBF2X571CtAa+YbqWmtkdw8C+VEsjvwphC1v9Bai+GhV3DTv7xWkaZr/xH1ilvOImn7I8qoQrlJr7i0djYDf0bqHCbC2dl5LQER9w7ZWnvATF/SdKszGfG+P6lwUS+lmkXXC3PXyfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420259; c=relaxed/simple;
	bh=h2KdQwSzIlZcDjCLpoMS0OLH1GkGmmRBcuj91M9nvrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HJzBTdfLwxoo2rfNoJPRuRmCe/IUGOrWp65TzSEs+kKaTUdQWy+XkpI+Ou3b1Go5mnciZWOFwVBIzSjKKdgH93r8TLm+RmHQZIOaWFO2oAI0dIpmTsa8pM3jdpSBgs0uh+u4n6ut5ONibgVUtx8O44oRgN/Bef1uh2lZxXAqm6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h8XIm3aF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wg011fjQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h8XIm3aF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wg011fjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773420254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6l75RfWFOREmI8hEjvhwZVBHJLW9hVD1YjztskzN+WQ=;
	b=h8XIm3aFNVl59bkf82DYI69pruyDV8lOZ3xMDduy02pf1nRw6Ctah9+SxAIhfT++xRVWmA
	QoUkX/t2KBMzxr8fgBqltSInnC0uZjbZkMRal6fiUU4IfH6n8WVXn4dGrPn8rLpX6p1Hwo
	RZGJEeHrnIiug6HtxChsY+pNW6Mv+4w=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-k2yAk5ASPWOFl8GO_qFzmw-1; Fri, 13 Mar 2026 12:44:13 -0400
X-MC-Unique: k2yAk5ASPWOFl8GO_qFzmw-1
X-Mimecast-MFC-AGG-ID: k2yAk5ASPWOFl8GO_qFzmw_1773420253
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so1775036285a.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773420253; x=1774025053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6l75RfWFOREmI8hEjvhwZVBHJLW9hVD1YjztskzN+WQ=;
        b=Wg011fjQrkkXnAvnkZCa31+GhvcM6Cbtoti4jCiNUqKnKLSUCg6/whATLBJgJc+9g1
         ANZ+yfmyjCD4hswVb+KeVbqb7R+Yt3aScxCcufecXLHkXEnPypdWy9Qmbrd15DYdA2/k
         lhN++aIRwyXQ2zBhQNDCSvBUbL/eyXRGQwVmy9okOUC1lfeqlXuUQJbhf2eft86Y0STJ
         VqCwiQP3SC0aHoMdBSg2ADkAcnXI713RbKjCFmgPxn7HS+gus/IaLYBDYVSIjYs3y0z2
         8Fdq6N45VVIZp8TKldq7rS4iNyTGwxFuDLAaYAY16idV0Vvvyqz0jLt2M2uBMtKLWikK
         xeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420253; x=1774025053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6l75RfWFOREmI8hEjvhwZVBHJLW9hVD1YjztskzN+WQ=;
        b=lmQvafLRD1rPd2tWWXVXlNBAf1lqP18anE8PoTrEBL2/SYdq5ajILRetUriGkylnmh
         TJlTXi+aIOJwhgzQvUTw77EuuGB0u4iypfmyOdUqD4RSwf5aojs/HClvGE6i44BTzEyc
         D+nUYIKU6pvjoujJ4AOtgkay2h5qm74im8N7VYJtz1Z+u3BzqF2jsN9TzQOg3N32o6Si
         4kLEuLfSm6EuYWTSqcE9wSe45vxFtdOY+zvPDXuifvwqbCmtZwTpmUi+C165c/AQzWhz
         sXfaaPVCQWeMmUl/JOBdKHFiC9IEPIY7GUm6AkRXagXNfGFDu0Kf0suKMJUBr/uumJN0
         3L5A==
X-Gm-Message-State: AOJu0YzyILFrx57coMoGiBEr7VCEcGE46EDpsQOit+dAeuvxhY1r3WgK
	nQreXmm1vk5Wwr04KE825qwyllFT3hB/O1RjmE3DVtcN5I8HsIw8mGypbZoXeC8H7cM+kGX1MzG
	B0Td+Heqpq3HRaksaZ0yAXUycftwUGu8HxYnOb2xVkSwSO42sbT2+Ma/SdYKuTeG/hWCSDQ==
X-Gm-Gg: ATEYQzxYr4r6GD1cw3dmXtVrHbCUF0JXKRVcb8l9AxhTuPOyovm4JwgvmxkwO4db7A0
	15+h9w9pZaV66/JPe3QNpDvouBTxfIjPysUBvymR5KMpSG8Sm0qx5pnkYWpV/gr79L6eCuctRr0
	G5KH9XbYb8mAHQU+j8SOhuCugI+dAZELxNoJVYhx+xxqdmmkT+TQahLknpbToGoYt7JDzbjq+Hv
	7OIBTzeGhJaBN8/d7dezeh3cKBGZnrhYSzdBP67xy/3E5eYmBmrAiT254PwGlJFdc68YHSjFNO3
	LOhShhav2OPhc3dgqzeAgIxrpuc2XtUvj8ZVuYKSBUNZ17s9e4SDcYwbgzd+RT1J2WGMhew1oXa
	R+6fF5hPFYJKn+k3MUqBLhEJjX2jQ/fGvGXAmpW+1A/rp+uDGxufg1tnrk3yt
X-Received: by 2002:a05:620a:1725:b0:8cd:94f9:1bd1 with SMTP id af79cd13be357-8cdb5a79d98mr516989385a.13.1773420252988;
        Fri, 13 Mar 2026 09:44:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1725:b0:8cd:94f9:1bd1 with SMTP id af79cd13be357-8cdb5a79d98mr516985285a.13.1773420252539;
        Fri, 13 Mar 2026 09:44:12 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda215c2a9sm587964785a.46.2026.03.13.09.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:44:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 13 Mar 2026 12:43:14 -0400
Subject: [PATCH v6 7/7] clk: test: introduce additional test case showing
 v2 rate change + LCM parent
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-clk-scaling-v6-7-ce89968c5247@redhat.com>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
In-Reply-To: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4977; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=h2KdQwSzIlZcDjCLpoMS0OLH1GkGmmRBcuj91M9nvrU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDK32J1XCJS/r7Py2rKqbFGHVVc/s4Q/lbTZ8bzun0VK4
 m0VJe0lHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwkWY3hDxcT//fbZ7SYuLXb
 PHc990i5nfHMJDVrhT2X1oxA18rW+Qz/fX8aVn1gWXrz8kfmeUeTFkc6/Ylhi0g88jjyMMfDy5P
 v8gMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a test case that uses the clk divider with the v2 rate negotiation
logic, plus the Lowest Common Multiple (LCM) to calculate the optimal
parent rate. The test ensures that the parent clk rate is set to a rate
that's acceptable to both children, and the sibling clock is not
affected.

The test in this commit use the following simplified clk tree with
the initial state:

                     parent
                     24 MHz
                    /      \
              child1        child2
              24 MHz        24 MHz

child1 and child2 both divider-only clocks that have CLK_SET_RATE_PARENT
set, and the parent is capable of achieving any rate.

child1 requests 32 MHz, and the tree ends up with the correct state:

                     parent
                     96 MHz
                    /      \
              child1        child2
              32 MHz        24 MHz
              div=3          div=4

Additionally, add a note about why clk_dummy_div_lcm_ops + friends are
still needed.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 40bc01a0259d8d49ca4c1983b6c10a3684a95f0b..00511afe5faa8b2631633ab796ece1bfe6944fb5 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -181,6 +181,14 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+/*
+ * drivers/clk/clk-divider.c has support for v2 rate negotiation, and setting
+ * the parent based on the LCM, however we need to be able to test just setting
+ * the parent rate based on the LCM, and not set the v2 rate negotiation flag.
+ * This is to demonstrate existing functionality in the clk core, and ensure it
+ * stays the same. That's why we need to keep clk_dummy_div_lcm_ops, and can't
+ * just use clk_dummy_div_ops.
+ */
 static int clk_dummy_div_lcm_determine_rate(struct clk_hw *hw,
 					    struct clk_rate_request *req)
 {
@@ -709,6 +717,18 @@ clk_rate_change_sibling_div_div_test_lcm_ops_v1_params[] = {
 KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_lcm_ops_v1,
 		       clk_rate_change_sibling_div_div_test_lcm_ops_v1_params, desc)
 
+static const struct clk_rate_change_sibling_div_div_test_param
+clk_rate_change_sibling_div_div_test_regular_ops_v2_params[] = {
+	{
+		.desc = "regular_ops_v2",
+		.ops = &clk_dummy_div_ops,
+		.extra_child_flags = CLK_V2_RATE_NEGOTIATION,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_regular_ops_v2,
+		       clk_rate_change_sibling_div_div_test_regular_ops_v2_params, desc)
+
 static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
 {
 	const struct clk_rate_change_sibling_div_div_test_param *param = test->param_value;
@@ -836,6 +856,31 @@ static void clk_test_rate_change_sibling_div_div_3_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
 }
 
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
+ * set and one requests a rate incompatible with the existing parent rate, the
+ * sibling rate is not affected, and maintains it's rate.
+ */
+static void clk_test_rate_change_sibling_div_div_4_v2(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * With LCM-based parent + v2 rate changes, the parent should be at
+	 * 96 MHz (LCM of 32 and 24), child1 at 32 MHz (div=3), and child2
+	 * at 24 MHz (div=4).
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 96 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 4);
+}
+
 static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
 	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_1,
 			 clk_rate_change_sibling_div_div_test_regular_ops_gen_params),
@@ -843,6 +888,10 @@ static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
 			 clk_rate_change_sibling_div_div_test_regular_ops_gen_params),
 	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_3_v1,
 			 clk_rate_change_sibling_div_div_test_lcm_ops_v1_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_1,
+			 clk_rate_change_sibling_div_div_test_regular_ops_v2_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_4_v2,
+			 clk_rate_change_sibling_div_div_test_regular_ops_v2_gen_params),
 	{}
 };
 

-- 
2.53.0

