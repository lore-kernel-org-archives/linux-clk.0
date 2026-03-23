Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512A63C9432
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 17:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286747; cv=none; b=KmsfaB7HQQO2gFyhRlpG/2eZqf5k/OvZlukN6xDNh29L0yII+5qcuQLsVqovYQq61avQgOp6J6SPA/FJmFZ2JXpy8vkIsMyfqrs2xuQNG5R3jZcsXK6yrHW26Y9Kt4Sy34uAMkzDU1v2Kg8JbRreDTcqkNPQF1fWQEaxpVCo848=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286747; c=relaxed/simple;
	bh=sdglBIrVf9XMFJdnwd7fyg9fFtXfQnVciJoWpfDXV38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4tHEMqQDze16SjO5MCAc4ZZF1SMn+umveGtJ5daY7mjA7wopfAUCQ3XLmsvMeOvrsMZidjDx+KcRsOHXKe4+6fZ0fCCR+HOE/qQRIEL4oTxK2hZuezbF5+ztdLviVUTKEiry+17KuFubjYRBOjRISfz21Z3M4TTmnX9/JkJxGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Abbq8LM5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hyBS9JKo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Abbq8LM5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hyBS9JKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTykAjUDSJWq2f3i10F+kRt97VvDrBvWNt+eUgSz3Ow=;
	b=Abbq8LM5K+RkiF6MdtccaBLn+AI5hlhO1Xl8kjmYai0W+VgVyUezQLLg48FMi7UWckiOB2
	guSTUGvDaJ2FJ8BYd0ct8iS1wuoMafiYdoW0/vpT7CASo+jeilbLEkLKcC0G/VBSWyxCQD
	7wTBaq90d56KARS4RUthT6cvpmY6EV0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-m409npr1NTO-6IekrthbbQ-1; Mon, 23 Mar 2026 13:25:43 -0400
X-MC-Unique: m409npr1NTO-6IekrthbbQ-1
X-Mimecast-MFC-AGG-ID: m409npr1NTO-6IekrthbbQ_1774286741
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4031b86dso271181701cf.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 10:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286741; x=1774891541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTykAjUDSJWq2f3i10F+kRt97VvDrBvWNt+eUgSz3Ow=;
        b=hyBS9JKofQNjY8Y5k2GfRUwLMiqgAKpvKd8mS+vR511lz1wWKEm/wnSJQicjDWLPij
         HfCyB9ySdKQPcpZEs0KGfWDZ9mpOOcJvulrmi4fWxHWwd7gLLYjepGGbDzFiJ/h/v1sz
         8lw6CQEPe9Bqri30hcJ0ygu9druYnWBZ9ANrIkrZmyrctQvmwllwBG0Qw8rTRyvoRUq3
         OGYl0I7aMDeQMpZ7u4joj5+yG9htmfrNK06teBo//y4hHSdLE0a9gPmyZPmcytwLhPoW
         70vnDY1JPopGhj6b/3YBpy8+36ZqYJc5GmWmp5cK01dl9X5QTtzWy/jIxcIi7bDKbzcw
         1w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286741; x=1774891541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KTykAjUDSJWq2f3i10F+kRt97VvDrBvWNt+eUgSz3Ow=;
        b=YwCpu67TDkj90BvFSVboYVNCqS388DslJpsGw0JCJrrX/+F9gMIQfjeAJXkGJMkCwQ
         ycXRc9hh5s1BG72hZR07KPQHyAqr/ezlf+GZsqv4fhSCWX/kdOol0DOOTt5nCPH13rHR
         JX/dYKN3dYApmf42FBHr82MP4mkGE3gChat4rfBbbAyB/Ip919BDXAFQXShXt+CIPPfJ
         CL/kRRqd3nySzmmZDT+yMdNilc42ZMv9w97IAbcJjKw8BKOSlaNNuZnfahokHPNGcCnW
         h5E4rUzv/7tSNubftXePMDdxAwtNA3oFVgHtTFnVfx4p7Ou6ISPG/gSXIH7agfITafUk
         ZI5w==
X-Gm-Message-State: AOJu0YxPdx4tkqZj6uoBBPvv21fNh2dP6X6SDGjZDitTJYjZYRqyBLf+
	jSES+OAWoLUon/qozMD+JJwCrPtQcsLD4n54M7SbNO0L1eehra/Vpj4yt6HQ12shVPD8puPBdmN
	moNlPF3OnuojBW/MRRaTZZyEXld8BHqHgZn5+YM5PYu83ZFW5RHMFXoFa+81UWw==
X-Gm-Gg: ATEYQzyQmCBjO6s4viN3il3IUD46SwW369aBvXA57Aq0mW+hTW+UEp6XUSicYdLwGV7
	rKB4j+d96jRi0AzwqaOsgidKCkXVaDkTqPEKxJzvYybdGez4Lb8aQqtqMIjtyWIOFx3JfLSZ+kB
	wPNwnAr+Tuv+47O+8SgYTzKP5bEL/16m6NO9CS7AYotyODdgKiakeaIDQTBlx3YZXBDxobGbRoW
	BfmzhDtNOmwI7neXepWvRMAiY6KUqJJfBzwIlu9c4g7pVdLCCNg5I2zmi9KS/2Gae7bnsMOK/cR
	QKq1z091MfYFFLGWlcSl8dri4D+7rtruY8Hr7z1Dca/Zfm3g9SyyBuCWW/QaxPijS+apdqn1Z5V
	ZYDsjHGBX/Fxr34QiWb+Os5aI4absWHUhgnskw9QNhQxZYQzcx5zqC9xKeSxH
X-Received: by 2002:ac8:59d5:0:b0:50b:559e:fb09 with SMTP id d75a77b69052e-50b559f063fmr90674261cf.11.1774286741293;
        Mon, 23 Mar 2026 10:25:41 -0700 (PDT)
X-Received: by 2002:ac8:59d5:0:b0:50b:559e:fb09 with SMTP id d75a77b69052e-50b559f063fmr90673591cf.11.1774286740676;
        Mon, 23 Mar 2026 10:25:40 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 13:24:55 -0400
Subject: [PATCH v7 4/8] clk: divider: test: introduce additional test case
 for parent rate change
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-clk-scaling-v7-4-8e7193dc9405@redhat.com>
References: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
In-Reply-To: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5709; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=sdglBIrVf9XMFJdnwd7fyg9fFtXfQnVciJoWpfDXV38=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPlnc4Xbb6dWF/8pq5jOvSmEvD7SY0uueslZaR0Zh3X
 8n83SGdjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZy/xojw881i96Ehj9tPb3k
 1LMVF5NfP5Rce0vWjo2TaeIOh/S/AY4M/5Ndsp3nLH9f9SctYEmjY5q5b3W4gdsss0MfTtxcnlz
 GwAcA
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
index 2a01b0201e9d919c36bb70eeb21c9f4ae113254e..95a55835a29065fede0426f1c15ec158e8a703c1 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -54,6 +54,26 @@ static const struct clk_ops clk_dummy_div_ops = {
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
@@ -78,6 +98,18 @@ clk_rate_change_divider_test_regular_ops_params[] = {
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
@@ -197,11 +229,49 @@ static void clk_test_rate_change_divider_2_v1(struct kunit *test)
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

