Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183713C65FE
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420251; cv=none; b=YxQzFX9pP5odXgZ/cQEL8iZmPqpnQrodAWf9p/VRUcznY2p1Q6xmTvW61TM2XsrVt+8P7wy5cAU2Yvq2gbRTLjU/imEtCCjK2dudR75b4gzg+9px2jwoUzPTNfSHdlXCLyHRn5t0bRml9Za/ArIOY+9VcF8aWe+geasG75U1OBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420251; c=relaxed/simple;
	bh=6RjRp0BMKBvqwmUs2I0l3tLNfJ+lEfqmjaaBafYyByA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWjxg00CFnxnLYeA/2KdX5+5ey2BFxkGasgpOQuKgKsksB6iyNokZdwCM2F7IZYkqBme1EPyZlvEp1ITW6YNs450Kjrqp+pQcHNNK949JgpceB87sJ1b5TgB4+3wNW7W/lo5vWetCJW3RYyXU1gBHb4BA79iy6b0Tqj+rpnI2aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ELEUbjom; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CNOoPzdw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ELEUbjom";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CNOoPzdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773420248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VnD7BXzXySXk+jlzLn21Mtw8nvr+Gs1Ehlor65FMWLw=;
	b=ELEUbjom291wDd+0Vft++ZDt4qavMNf/u68Sz40iQeCaN9j347ybPb14e9qNDcAFbHJmXp
	Nd6zYTnIWUagVQONPLl8d7EOJVa7kyzEhqJRv1lPhaBh7jtpaTKSTJ6dxg2++t9w3cyxqG
	+m86WSC9nkV8S6Uu95xj8cXNor3YHQg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-hausutSKO96s8IdpBsGlSQ-1; Fri, 13 Mar 2026 12:44:06 -0400
X-MC-Unique: hausutSKO96s8IdpBsGlSQ-1
X-Mimecast-MFC-AGG-ID: hausutSKO96s8IdpBsGlSQ_1773420246
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77e5e187so1315793085a.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773420246; x=1774025046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnD7BXzXySXk+jlzLn21Mtw8nvr+Gs1Ehlor65FMWLw=;
        b=CNOoPzdwBFSKrfwbewNB1OXdAodFiLjO0BMa6wt8J6UNxLnje2D6B0HXuiOrZ76hNJ
         eZeIqoY+psU3rQckuyQE9KxtNRXxZzHL53W6kuS9lTMMA/q/5h2L9WEmYXsAkXgp5TEn
         9yTffPQxXBF5/t8UjzVpE2VHCcl3pS4tnlXBfIq+lZSGXNuyfvU0qu8+em1U61xivg+g
         g+xs8Npg5yFyvWbU/dMG9wxojQzTXq6Nsh4zsQF8akmoECMMYPBQ11hKQf3CmTrQPQ7A
         lBshkx1iFMCRN6YGoSzSnV4d1GB+bOiM3DUMC9Hd9MJ2Y6C3SOiNx3K28O3BqyFAZuR0
         zC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420246; x=1774025046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VnD7BXzXySXk+jlzLn21Mtw8nvr+Gs1Ehlor65FMWLw=;
        b=RmJeQ4fK6KyAMcIn2poXSYB5DVHSXHxznC8x7UzhjE9ZbzxDPXBQbaOhZ57oho6XT3
         9JSHC7vyQnfAfoKFGJ4505le4e2PmnCEv8/KEhs6VatWERuLni/9zr21O2WuPyxSSzrO
         IrbuqHY6eDVrWpYIY3GCvEtxQ31mvR7W0QolENNN6KS4nwsix7jt/3H8i4h8nOpXOZnI
         IbjR5O50LFc7XwK5pxVAlgYEIbR/fmXtvJDnx6Ht+zI4klnh2eOQzlO9TID6Sfz4cKrh
         7Q8VLLfZEFJUzUF/KzYjtcZTub8V360RIu1HGc4gswpgSsb0/jxQXnNo/kyZfvLfEIsP
         iXAw==
X-Gm-Message-State: AOJu0YyLIp9203kfFLv01je1UNl5Gwz3Ij9nDp7GYSEyO8Cyl7xrIRvN
	CylGC1ERnDyNBXA45crOU1WmAnDC2WBX1h65jmUuhDcYpvsX3RP/Xvb5atuJLT/KO2Cyc50rRqw
	DsTneUVYvJBhYIGQjyb241rlC0P+BQCESpJ0Ki0BzmLZsSSbAr0brZQhuB+BIsg==
X-Gm-Gg: ATEYQzzU9VA8/ocTIVCLK7ZWuBPWGQLwtBVWGMSyHCywZYaNHaCSVedpBziryWrWact
	R8tlDrTpMcEw8kdDQrD8tHQCeVYqdr0nFOibQ0LLBU7sjq/SdwQnR2B57vT2DGY9Asu/REKGW2u
	vy3tAUC76lgHVlS8AINAMxNNnQZPn5eOeA9iyeGyJE+CKPEzzC439PwnshGhOfwnIsJGUryg/lj
	rZ9JGS1ipDQPiJ31b0dH3c5qqlKYIQmEkbmFYK6xPXHM++9wt54GK84PDVZEuuPhwYGbuRmgWHd
	rIgmigw2cSXKflR9n7aW5DlUwqYa/hTOZvTTLMbIRrAfgMnpmPD+saW3wlO4fHSwvxp4rUnS3RR
	fE4km5ZXZ9NOf/8T9b8+J3kJVyJxtjffCsRjAFSemGO2wlTCTNdX7NbNBW0gE
X-Received: by 2002:a05:620a:4044:b0:8cd:9020:f043 with SMTP id af79cd13be357-8cdb5a1c711mr554598285a.7.1773420246115;
        Fri, 13 Mar 2026 09:44:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4044:b0:8cd:9020:f043 with SMTP id af79cd13be357-8cdb5a1c711mr554592685a.7.1773420245521;
        Fri, 13 Mar 2026 09:44:05 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda215c2a9sm587964785a.46.2026.03.13.09.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:44:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 13 Mar 2026 12:43:09 -0400
Subject: [PATCH v6 2/7] clk: test: introduce test suite for sibling rate
 changes on a divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-clk-scaling-v6-2-ce89968c5247@redhat.com>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
In-Reply-To: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7367; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=6RjRp0BMKBvqwmUs2I0l3tLNfJ+lEfqmjaaBafYyByA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDK32J2w9Ll7frtT36aff1+Wsd1uOno6Zc/1ySHlv67P+
 LDq3aaMeR2lLAxiXAyyYoosS3KNCiJSV9neu6PJAjOHlQlkCAMXpwBMRCqWkeHHyau/P3revy16
 i7WUV7SH3Y3j0r/lC6qXf0uxObFVm7GF4X/Gq3kSnJuzrS+dyAw40t4cZK/1kXelx71mS4UTy+/
 2ZPEDAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce a kunit test suite that demonstrates the current behavior
of how a clock can unknowingly change the rate of it's siblings. Some
boards are unknowingly dependent on this behavior, and per discussions
at the 2025 Linux Plumbers Conference in Tokyo, we can't break the
existing behavior. So let's add kunit tests with the current behavior
so that we can be made aware if that functionality changes in the
future.

The tests in this commit use the following simplified clk tree with
the initial state:

                     parent
                     24 MHz
                    /      \
              child1        child2
              24 MHz        24 MHz

child1 and child2 both divider-only clocks that have CLK_SET_RATE_PARENT
set, and the parent is capable of achieving any rate.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 146 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 88e35f4419c958983578750356a97c0a45effb55..325da7c84ab2ecdcf6b7a023ce4c2c4ef2d49862 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -7,6 +7,7 @@
 #include <linux/clk/clk-conf.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/units.h>
 
 /* Needed for clk_hw_get_clk() */
 #include "clk.h"
@@ -652,6 +653,150 @@ clk_multiple_parents_mux_test_suite = {
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
+	unsigned int extra_child_flags;
+};
+
+static const struct clk_rate_change_sibling_div_div_test_param
+clk_rate_change_sibling_div_div_test_regular_ops_params[] = {
+	{
+		.desc = "regular_ops",
+		.ops = &clk_dummy_div_ops,
+		.extra_child_flags = 0,
+	},
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
+					     param->ops,
+					     CLK_SET_RATE_PARENT | param->extra_child_flags);
+	ctx->child1.div = 1;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ret;
+
+	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw,
+					     param->ops,
+					     CLK_SET_RATE_PARENT | param->extra_child_flags);
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
+static void clk_test_rate_change_sibling_div_div_2_v1(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * The last sibling rate change is the one that was successful, and
+	 * wins. The parent, and two children are all changed to 32 MHz. This
+	 * keeps the long-standing behavior of the clk core that some drivers
+	 * may be unknowingly dependent on.
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+}
+
+static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_1,
+			 clk_rate_change_sibling_div_div_test_regular_ops_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_sibling_div_div_2_v1,
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
@@ -3592,6 +3737,7 @@ kunit_test_suites(
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
+	&clk_rate_change_sibling_div_div_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,

-- 
2.53.0

