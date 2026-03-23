Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788413CB2FF
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 17:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286755; cv=none; b=gLJ9gJcCKcyjFiu+PvgSGU8kA0D9nMtamGUowrZ7TMN4MOb8Xf6CfZ4AeSvpc8p+7SF26uoCduXcYq7fr8ZQ50D+T+6ECdwECyun1yc8WAtExxMHRxkOUChBVPHAe+cL/7/koW0ApSbNmrB/t1AMzNcctF3lKCvaRoc4P9Z0sFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286755; c=relaxed/simple;
	bh=xpGnRJHb7iFtNaWnVivX5OL5Ase55p/rrd+OZZm4p/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pqF73O3cXZjMt9vkEQugvKV3SPYbWptX7KMpEOA4sLc/GcFHSnw5EniB5GyhHVgOtS0YJ+voEWPN5TcXQRRBvT0T9oCenlDelmrVwpSAtegTt1LF/3Fr6uj3KxciLdoVorEb2GOlVXLda/OCX/tWUzu3iOx3xXXrbnylrhT27Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QbozP16Q; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KM4XDQR2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QbozP16Q";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KM4XDQR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=34oVGrWJiWoSUSC15rXIzEcw5Hsg90ZuipTla97gnAM=;
	b=QbozP16QpSdXlzl0Jh9jzph6uHel0qNJKN0X0GRBtHnO50PrWFZ/mvoMQTSzto7G+YF//c
	hwIm6GJDyzb1u/q1vF+8PY1iDd7B2mO15xjrfsF4JMICZ2cPoxtZBDvwfIqwVsKYh9Bgvu
	dyWmHpu9Lmh1u6kqs0VRBHr7YuYCFn4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-S-RVfYlZNgif0DZieVJkKQ-1; Mon, 23 Mar 2026 13:25:52 -0400
X-MC-Unique: S-RVfYlZNgif0DZieVJkKQ-1
X-Mimecast-MFC-AGG-ID: S-RVfYlZNgif0DZieVJkKQ_1774286752
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50917996cfaso33702411cf.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 10:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286752; x=1774891552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34oVGrWJiWoSUSC15rXIzEcw5Hsg90ZuipTla97gnAM=;
        b=KM4XDQR23dXkDE/2xRR+Rv4ARzW3Id0e7lPIJANipnx5GznH13S3qaBhmEp9VWR6ig
         geJCU+NVC587RZ8aEu5h0jbSXgMt/GUoUf15YGr9/kMbqSM5XQj0xIbsi98e0+uKkn2L
         EZQCp7S2hainBDXvrkrHMHEZeOrQIdxytFiYFeqHIWtNSGVWrevz7r5jWlb1fppdj5WX
         UkFOdohjzm0eHb9VSQvw+nrsjn2CNUZtaxjJSWjbKakYioe69HjSrw+t2l/OxNSkhtpZ
         q6IGRUXwCTfjYLj0s4lcua8oSjMiY2FTF+jhE2ChqFdto7jeQWUCVogH4eLuYaXaZJNI
         QZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286752; x=1774891552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34oVGrWJiWoSUSC15rXIzEcw5Hsg90ZuipTla97gnAM=;
        b=c7N1frdqA4XV5f0xzMZR5nXhJFsHM5neDpbwcEXPy4IDVvQBv+Q85WbPMJTaURi4XM
         m2n0cHdUKZNAzWBFRE32G9Lq+ONtlACdIQqFBcgiB5wb4X62icEa22FLjGxEb1kiqsr1
         aQ5pgwYGDqh1Sak0HBk0OPfCa3ttXdFal6t9XgqcnMwcfnU4qumdgSMvu2Ag4TKCZKWn
         eTxdMGozqAnpTyWKfc1ou73wHRe854R1l6QO1uQvfxwckQTAbcyLRPWsZsdYQ+QDCGgk
         kQJdlLsQ4XXd2xULqXOAFeNOPUU827MeC+dP75pJ/YNOvKfgvLBf60lBDHNEs0QLYsez
         /dGQ==
X-Gm-Message-State: AOJu0YxIRHT7NsILiuIQ4EFj09iKULaqoEjREpIB7VPW5RZSRDAI45G9
	RR2HHoBppfD1FK8qqqyeI3WsWZX7obzkJaUvk/LrNcXG9BVR2laJsTqEyPTGP+cuZ2sESwpwMRM
	X2tvc3nuqZl8okd8B8wADVly41iNvXedt2Bvn2wpQx9p08otf4ZUI6U5InR2gcg==
X-Gm-Gg: ATEYQzxShhrc4I0cE+5zDohqmYjv8JolOyBc3gSF4O3J38e0U1eTShaDyws+T8YAsCH
	DTUWUb4quutcAVhLXiIUwdpSvpcf4QbQBPDxl8a47lSmEHjEl2fbhTw5lxQYAWQHClBbvDpxu+Q
	gPNApTuGqH4SA6R4XPHLXTRml4Uye5gUn0Owfz8Hcn85uq7VqZKs3nvIq8Ns+cEiWJ3/dmzrVDb
	8qPHbkxgxjP53hyYkk5/iVQfopV9lFDshbbLDCyedRe5a5/QT2Dr940NW+nVS3G9+kQtWVnnd5z
	0xybg6bSqEhjtnq05ELAImIVCy4UV6qPsMfzDY/OC6vRBaF6h1bTpsSG8nM8xc2VYYdSzqHitG/
	rpUYD/xhhs+oENmlBRxDwfnL/kuefhEZVRePAeZglad37vCN0w2Z/AeWtzdOG
X-Received: by 2002:a05:622a:1aaa:b0:50b:4dc9:347d with SMTP id d75a77b69052e-50b4dc94b6cmr116972471cf.22.1774286746747;
        Mon, 23 Mar 2026 10:25:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1aaa:b0:50b:4dc9:347d with SMTP id d75a77b69052e-50b4dc94b6cmr116971871cf.22.1774286746000;
        Mon, 23 Mar 2026 10:25:46 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:45 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 13:24:58 -0400
Subject: [PATCH v7 7/8] clk: divider: test: introduce additional test case
 showing v2 rate change + LCM parent
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-clk-scaling-v7-7-8e7193dc9405@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4963; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=xpGnRJHb7iFtNaWnVivX5OL5Ase55p/rrd+OZZm4p/o=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPlneVrBf/anbxvLrp4fWXtaXPbHPpk1uQ+983Mirm5
 M6fyg4iHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykiZXhfyDPpICi5rtNFU/y
 ZG9++SojKlKuoV7fXash830X2+Jl4YwMe/MZr91KfrCH66DAQZY2iUOsJVdXXGVf+Gyd5I9shgO
 ebAA=
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

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-divider_test.c | 54 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
index 95a55835a29065fede0426f1c15ec158e8a703c1..a16c04d5d8a86952b42750d326f88754fbc91eb7 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -110,6 +110,18 @@ clk_rate_change_divider_test_lcm_ops_v1_params[] = {
 KUNIT_ARRAY_PARAM_DESC(clk_rate_change_divider_test_lcm_ops_v1,
 		       clk_rate_change_divider_test_lcm_ops_v1_params, desc)
 
+static const struct clk_rate_change_divider_test_param
+clk_rate_change_divider_test_regular_ops_v2_params[] = {
+	{
+		.desc = "regular_ops_v2",
+		.ops = &clk_dummy_div_ops,
+		.extra_child_flags = CLK_V2_RATE_NEGOTIATION,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_rate_change_divider_test_regular_ops_v2,
+		       clk_rate_change_divider_test_regular_ops_v2_params, desc)
+
 static int clk_rate_change_divider_test_init(struct kunit *test)
 {
 	const struct clk_rate_change_divider_test_param *param = test->param_value;
@@ -196,6 +208,11 @@ static void clk_test_rate_change_divider_1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
 }
 
+static inline bool __clk_has_v2_negotiation(struct clk *clk)
+{
+	return clk_hw_get_flags(__clk_get_hw(clk)) & CLK_V2_RATE_NEGOTIATION;
+}
+
 /*
  * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
  * set and one requests a rate incompatible with the existing parent rate, the
@@ -265,6 +282,39 @@ static void clk_test_rate_change_divider_3_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
 }
 
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
+ * set and one requests a rate incompatible with the existing parent rate, the
+ * sibling rate is not affected, and maintains it's rate when the v2 rate
+ * negotiation logic is used.
+ */
+static void clk_test_rate_change_divider_4_v2(struct kunit *test)
+{
+	struct clk_rate_change_divider_context *ctx = test->priv;
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	KUNIT_ASSERT_TRUE(test, __clk_has_v2_negotiation(ctx->child1_clk));
+	KUNIT_ASSERT_TRUE(test, __clk_has_v2_negotiation(ctx->child2_clk));
+
+	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * With LCM-based parent + v2 rate changes, the parent should be at
+	 * 96 MHz (LCM of 32 and 24), child1 at 32 MHz, and child2 at 24 MHz.
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 96 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 4);
+}
+
 static struct kunit_case clk_rate_change_divider_cases[] = {
 	KUNIT_CASE_PARAM(clk_test_rate_change_divider_1,
 			 clk_rate_change_divider_test_regular_ops_gen_params),
@@ -272,6 +322,10 @@ static struct kunit_case clk_rate_change_divider_cases[] = {
 			 clk_rate_change_divider_test_regular_ops_gen_params),
 	KUNIT_CASE_PARAM(clk_test_rate_change_divider_3_v1,
 			 clk_rate_change_divider_test_lcm_ops_v1_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_divider_1,
+			 clk_rate_change_divider_test_regular_ops_v2_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_divider_4_v2,
+			 clk_rate_change_divider_test_regular_ops_v2_gen_params),
 	{}
 };
 

-- 
2.53.0

