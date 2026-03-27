Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F2B37FF60
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 19:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639958; cv=none; b=eZXLBiuwQ1W1sfoSFaH6t3ItnBcOa1N63X2dgxRIF50BHKkim55V+ctOLIffgt/GyRqgjfyBeBX9d9ZeKs4Oivv0JPJBPUFPvVmJRmVtVZPS+L2W1zRtVOvrVdEoGuiG5/ruRa0+mCAzuXuJmFmyeMuQ9RiC6+ZqnWyW/+MKIj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639958; c=relaxed/simple;
	bh=bG1tTDaW55SQc5UPS13lHzafvfk0/Nz3KkwUNwECLZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4lp9VrCGssXeq3qKaBmqDO+C5LzM2HKeWn/g3EYFlfP9VY88MUt5HfJ50VaFD263f+51+X8OOc7x6a3Z0+u/vZ5DXnDednNCr4YWZSBA9TtLmPJb6DMHr9yDYV4G7wBwxhwUXuZlA3ggrB46A1O7G8elpPJ8nqIrY/pwiOqy/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZYzHZW1u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=l09/zBd3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZYzHZW1u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="l09/zBd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774639949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=madb98YO0pI32vaL934LuxFhz1SS1v/lF4lccUcV1oA=;
	b=ZYzHZW1uym3bTblJqWtPO3bFlyg41wxHtlDmFelduQKu2vSVEtAnVBenPKkvyEQPszJ7oK
	R0Rmt8L03VbLkbLmsbe3pfzKPL+LUtt/292g9N2lwX0j5vXucJSITuqFGQvETHORKf1C6c
	jc8VXsVipZaubm2yPTVQz3xBRNTaa2Y=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-YPXEWXySNpeHt_oKEc_S-w-1; Fri, 27 Mar 2026 15:32:28 -0400
X-MC-Unique: YPXEWXySNpeHt_oKEc_S-w-1
X-Mimecast-MFC-AGG-ID: YPXEWXySNpeHt_oKEc_S-w_1774639948
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so58170641cf.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774639948; x=1775244748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=madb98YO0pI32vaL934LuxFhz1SS1v/lF4lccUcV1oA=;
        b=l09/zBd3WyAwHwNn3gc6QpAmKlSvHFlyDwzc63zDkbVgebTkSSXCetWU2Co7kKWoo0
         iu9lLfH4FxABAoKdt5WCIWlE8fjPMseCu8GbtU0TWBjK5wAYl0WzxMNwWdvCzMMcmLql
         39czrVgC2zE2fiWodM9tM07ueexfXkAShoCO/yJaY2ZNPKueczl8POwMuCzMWAmDYKyA
         z6Rofd/rBYJmbO0q8K5SJbVuQ+a3BkBFODiL+eZEpGYQZk5pzxBY4v+RtiJLTTGjgVlb
         WfxKw9/WaB3hKfUlvQiQjPkpK4id/M6RTUtSVPXqzXc/MRjh5D8Sukenpcgf0S9gzUBm
         lKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639948; x=1775244748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=madb98YO0pI32vaL934LuxFhz1SS1v/lF4lccUcV1oA=;
        b=cotr1w2C5wMVBlfO6nbYET2/l2WNMA/IKtjCEsSND6VhvmmZR5/aZZ+Mn3xPjfBWEh
         Sc0GLBVu2/DlPrWHqIG2ucEGYE7KaOm/eAeqRHDPWJp3ZzE28uk7tcGlXXDJkBqtTsre
         EaiwvNCWSiGI/6YipQABjaBSlhH60Xo3rMuvHlF41On7H3OlePO7+Fn57Ldm9e/MrSUC
         BlpiazRsWe58q9bgJZgV3BK5DDZWA3WlXgcVd8DesovkuhbwoHb207bulrUM3fz9ACz8
         0fNay4Nh4n6x8Oun6kr+NGievvsrEfw1z7Xy7hsrHHICGn+afVzIagTRveb9yUcInGsa
         29dA==
X-Gm-Message-State: AOJu0YxIjZ9IKxgEVYdYe/cI0XGxwqp3KgfOF2oD41YDMagnf6oG6Ivv
	LSoeWfFuSDpebtvQVCwOmdD8JOloKxP0TxoIzZ9ZH4iWoDrSDxf20dpm8ZgiDTp1pao6RwxFmRe
	a8qE50RioIdGJFVfI7BJ2Twl42lZZBxWk+Ymu8CRTphD1w4Qqrb1xNHLC2lX6mFt1bYIShg==
X-Gm-Gg: ATEYQzxJzVdfYlqWjRWtgnebCwa5sfdG3+hfcVzrz6l4AakSCFyME9fWuxLovOBZknu
	jOZ2SP+Mgv1zgN8pMz0oC9WBqfj6UKrijppKctbLB//K+162+zlmzQ3mIrpCLVZdb8hBnedxbPJ
	9lTexIZ4PKWZM4JWyOptFRBhcZPjtWvDs3Ym+GIEOaxXVvY1n7MKFwmJEg+/6wJQ70utwKzjQXX
	jkunaXvTfEHMNDIIx9LeJXaXiWilmHFkB94M7hPa2e1D/++U/gUUbNlL2fPFRCcLHp98cHsImq3
	bg8H2xlEaTwLFIMML2a7uoyni4Wovnf09LNMsK4paJ2JIqBC1hiewdqRDY5exKQdwhWvOXVHtS+
	oMQHnIaoOeza6lJNsqgxEjNl0loWWOrvIQvh3HI+XNSJ+YdZsJGpWUIn01+i6
X-Received: by 2002:ac8:5fc7:0:b0:50b:36af:56a6 with SMTP id d75a77b69052e-50ba383ebf5mr53697041cf.15.1774639947717;
        Fri, 27 Mar 2026 12:32:27 -0700 (PDT)
X-Received: by 2002:ac8:5fc7:0:b0:50b:36af:56a6 with SMTP id d75a77b69052e-50ba383ebf5mr53696611cf.15.1774639947255;
        Fri, 27 Mar 2026 12:32:27 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c678e9sm2037551cf.6.2026.03.27.12.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:32:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 15:31:59 -0400
Subject: [PATCH v8 4/8] clk: divider: test: introduce additional test case
 for parent rate change
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-clk-scaling-v8-4-86cd0aba3c5f@redhat.com>
References: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
In-Reply-To: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5710; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bG1tTDaW55SQc5UPS13lHzafvfk0/Nz3KkwUNwECLZE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKP3ba/riMdKGAhOCVhm/ArB/0jK8JcfTiK3/8TdbDf4
 7vs8J+ajlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbibcDwT3O70GrG5JULWp6F
 iX7MSP51S+PpFB+f9R6sq0rO3ef8X8DIsNDkqNvts+6fUrLnurZ+lGNXamg+andpzdo/868pxep
 95gYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a test case where the parent clk rate is changed to a rate that's
acceptable to both children, however the sibling clk rate is affected.

The tests in this commit use the following simplified clk tree with
the initial state:

                     parent
                     24 MHz
                    /      \
              child1        child2
              24 MHz        24 MHz

child1 and child2 both divider-only clocks that have CLK_SET_RATE_PARENT
set, and the parent is capable of achieving any rate.

child1 requests 32 MHz, and the tree should end up with the state:

                     parent
                     96 MHz
                    /      \
              child1        child2
              32 MHz        24 MHz

However, child2 ends up with it's parent rate due to the way the clk
core currently handles rate changes.

                     parent
                     96 MHz
                    /      \
              child1        child2
              32 MHz        96 MHz
                            ^^^^^^
                            Incorrect. Should be 24 MHz.

Let's document this behavior with a kunit test since some boards are
unknowingly dependent on this behavior.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-divider_test.c | 70 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
index 0991bd865da03c1e42f154b25a7f1b5760dff3c5..f1ba15f3646ae501c940b82f0522eeee7831492a 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -59,6 +59,26 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+static int clk_dummy_div_lcm_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
+{
+	struct clk_hw *parent_hw = clk_hw_get_parent(hw);
+
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && req->best_parent_rate < req->rate)
+		return -EINVAL;
+
+	req->best_parent_rate = clk_hw_get_children_lcm(parent_hw, hw, req->rate);
+	req->best_parent_hw = parent_hw;
+
+	return divider_determine_rate(hw, req, NULL, CLK_DUMMY_DIV_WIDTH, CLK_DUMMY_DIV_FLAGS);
+}
+
+static const struct clk_ops clk_dummy_div_lcm_ops = {
+	.recalc_rate = clk_dummy_div_recalc_rate,
+	.determine_rate = clk_dummy_div_lcm_determine_rate,
+	.set_rate = clk_dummy_div_set_rate,
+};
+
 struct clk_rate_change_divider_context {
 	struct clk_dummy_context parent;
 	struct clk_dummy_div child1, child2;
@@ -83,6 +103,18 @@ clk_rate_change_divider_test_regular_ops_params[] = {
 KUNIT_ARRAY_PARAM_DESC(clk_rate_change_divider_test_regular_ops,
 		       clk_rate_change_divider_test_regular_ops_params, desc)
 
+static const struct clk_rate_change_divider_test_param
+clk_rate_change_divider_test_lcm_ops_v1_params[] = {
+	{
+		.desc = "lcm_ops_v1",
+		.ops = &clk_dummy_div_lcm_ops,
+		.extra_child_flags = 0,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_rate_change_divider_test_lcm_ops_v1,
+		       clk_rate_change_divider_test_lcm_ops_v1_params, desc)
+
 static int clk_rate_change_divider_test_init(struct kunit *test)
 {
 	const struct clk_rate_change_divider_test_param *param = test->param_value;
@@ -184,11 +216,49 @@ static void clk_test_rate_change_divider_2_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
 }
 
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
+ * set and one requests a rate incompatible with the existing parent rate, the
+ * sibling rate is also affected. This preserves existing behavior in the clk
+ * core that some drivers may be unknowingly dependent on. This test
+ * demonstrates that even if the clk provider picks a parent rate that's
+ * suitable for both children, the child's rate change also affects the
+ * sibling's rate with the v1 rate negotiation logic.
+ */
+static void clk_test_rate_change_divider_3_v1(struct kunit *test)
+{
+	struct clk_rate_change_divider_context *ctx = test->priv;
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+
+	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * With LCM-based coordinated rate changes, the parent should be at
+	 * 96 MHz (LCM of 32 and 24), child1 at 32 MHz, and child2 at 24 MHz.
+	 * However, the clk core by default will clobber the sibling clk rate,
+	 * so the sibling gets the parent rate of 96 MHz.
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 96 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 96 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+}
+
 static struct kunit_case clk_rate_change_divider_cases[] = {
 	KUNIT_CASE_PARAM(clk_test_rate_change_divider_1,
 			 clk_rate_change_divider_test_regular_ops_gen_params),
 	KUNIT_CASE_PARAM(clk_test_rate_change_divider_2_v1,
 			 clk_rate_change_divider_test_regular_ops_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_divider_3_v1,
+			 clk_rate_change_divider_test_lcm_ops_v1_gen_params),
 	{}
 };
 

-- 
2.53.0

