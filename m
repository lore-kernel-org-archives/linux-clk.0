Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477E7230D35
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638420; cv=none; b=FCcSYLQJWPXoQnDAs6JMs/8IiRKDwuTv3G9RKTWooujzkLwZYcfbCXr3S9RY57TyM50fG3LqneurdqY5uh++0tJVzrJcl/g++gG+eWLc70k4GGyQ1sa+v9JVY7EKvJYfFh0SATD6W14DDbWw4uOjBUYYXDOFsT6U9m4NMz07jNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638420; c=relaxed/simple;
	bh=Q4FysjLwmisDNtR/Tyh/L+zp4+LEXH1XuUq81ZlHyiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QjpT8/lAeWMnbsNaEAXnV0Wti6/KaBPieCwLxN6gCTnlyEiZcSKwQk4bAB/GQSd44KnVccJIzQvgHz3lhNJy2hn6aGfvNZMqBoyS60LOyRppeeP0+DYUpWuGYrL4r/WlUQW88QXEvJhT06wjRq6vlIvVg1J18tjRjtAsDZJ/2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ikvyu4+2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ikvyu4+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRIZZjnscf0CTJC2caJhMyNbvqlOTaws6rzDBpb96D8=;
	b=Ikvyu4+2J/EmwDWhh14T6xLc5lclAvq2g76jeM326Js36DSnJ7ZAVZp0CO4tYXR4IPss2e
	D9uMPGYZaJypN4oTm75XZqIRxQMLdjxugaepUjSDV1zlgCkBUrlWoMvBETVAwDECnQiuIP
	31uhR+ZTDLMZKwKWoYXAwvrRTMOvQ1o=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-gMjjwzbxOPSBoDqzAdqR5g-1; Tue, 23 Sep 2025 10:40:15 -0400
X-MC-Unique: gMjjwzbxOPSBoDqzAdqR5g-1
X-Mimecast-MFC-AGG-ID: gMjjwzbxOPSBoDqzAdqR5g_1758638414
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-84d47fe9a38so355398585a.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 07:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638413; x=1759243213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRIZZjnscf0CTJC2caJhMyNbvqlOTaws6rzDBpb96D8=;
        b=kmLghzUpMZKxiVJPX/sWjONHAwR+6ToX225Yvf+JEz5QknWmEUT0LeXDkQqGD22/tf
         ylfiZJ8Dpc1FlPfMifQL03o75hLin3PkhrFc5HhIJKz4zuSxL4I9qR7TCI3f4uTHXG7r
         eKSvkDdptxPZ6t7KqaifAdqCU14OejMWF2TuRDyASiYzmwroUKSWo8txZN3ATEcxt7N7
         ZR3lYeqwSDBj81lcBgHBOJyTJflG+D9neKaZMmFWAyya3pgtN/8MomlRCqE8bPtsQU8m
         PFQf+jCMc54LMc/VrDWXCfAEqj1LxzzGV2QOBO1wb6KbzfQNWdG6r7hWLpg4SatVszwB
         9GgA==
X-Gm-Message-State: AOJu0YyAo2WyF/duRsoDk4Gv0rln4O+7SSL1rBtQL4ukLdyd8V8TK4GS
	fF15oKd0iq82RoC6XfuIRFr3GObaIQ0Ep4A3MbB8QIcKubxJgdkAOhrix6iiPPPQQsVi2r2TP40
	bzDLZO2faO24jl7u5Tf28yLlA/U+MHP9CdSGZ/ycmHsdkl6gwkUZis0AHVfGp8Quw9EaxzA==
X-Gm-Gg: ASbGncu5UF/wFNwk7VrvdcWgxK6aHdENqV92mFBV6IfpUTuOtq75BtP1JyO+Nu+w7gS
	Q/xiXsP9YxMl4eABUHMuRvqv9d+8NnwK19ikOsUV5RqerJiT3TX74H9gUNuRAmgNswfQ8XYg7Yp
	UuGb1SaNLyU1JhTlHL10lVKIm1XJsTHdaG3g7PCW65Kd9IjBgNp6ZSJMzHayOAw8NIvQ8RtdyQ1
	C18zLYG854cgcDHJbeNae2wto5FzSmtO/weneDLxP0deZUCC4TV2d1brw4q8OCIYrz2fO+or60u
	dW4NV/n4ZhqcFiGKMaSLryK+9pz7wuyLBBfTHRDymcK2PtDKnNcQM6Gc78GlqYbOSWHrS7nWZnm
	6ahp2AF2smKeuPBYjH8y6VYYY5NzRTVboltvqK94=
X-Received: by 2002:a05:620a:3953:b0:7ea:463:e2f9 with SMTP id af79cd13be357-8516eb4611bmr323652785a.20.1758638413178;
        Tue, 23 Sep 2025 07:40:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPaSgwgYu2jWSLtWkKuFwUUeiviIqk4f81BpVimVxbiuKlOcm9lYGy6m0TtX9XsNim1ZZ0Jg==
X-Received: by 2002:a05:620a:3953:b0:7ea:463:e2f9 with SMTP id af79cd13be357-8516eb4611bmr323648585a.20.1758638412624;
        Tue, 23 Sep 2025 07:40:12 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:11 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:27 -0400
Subject: [PATCH RFC v4 08/12] clk: test: introduce test variation for
 sibling rate changes on a mux
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-8-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Q4FysjLwmisDNtR/Tyh/L+zp4+LEXH1XuUq81ZlHyiA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubTR4svCbnaRe5RUGyR8OPzdxRmdP4VxQ18a24lZaf
 I5+06zDHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwkrZuRYfO2iu/hbyb0XTlo
 tejBw8MuZVF/Y3tYTum8PHeu3+nsMnOGf7YnXzAUm1WWCu+dyqlh9OvDzOCb3j/uZrguz7jm/7f
 +HCsA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce a test variation that creates a parent with two children: a
divider and a mux. Ensure that changing the rate of the divider does not
affect the rate of the mux.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a330de8bd8dc2cdda558d364a3c6d87a26791c8d..0344f3f62251728e15af277ea0d143dc1f40fd94 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -908,6 +908,47 @@ clk_rate_change_sibling_div_gate_test_init(struct kunit *test)
 	return &ctx->clk_ctx;
 }
 
+struct clk_rate_change_sibling_div_mux_sibling_context {
+	struct clk_dummy_div child1;
+	struct clk_multiple_parent_ctx child2_mux;
+	struct clk_test_rate_change_sibling_clk_ctx clk_ctx;
+};
+
+static struct clk_test_rate_change_sibling_clk_ctx *
+clk_rate_change_sibling_div_mux_test_init(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_mux_sibling_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+	test->priv = ctx;
+
+	ret = clk_init_multiple_parent_ctx(test, &ctx->child2_mux,
+					   "parent0", 24 * HZ_PER_MHZ,
+					   "parent1", 48 * HZ_PER_MHZ,
+					   "child2", CLK_SET_RATE_NO_REPARENT,
+					   &clk_multiple_parents_mux_ops);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->child2_mux.parents_ctx[0].hw,
+					     &clk_dummy_div_ops, CLK_SET_RATE_PARENT);
+	ctx->child1.div = 1;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ctx->clk_ctx.parent_clk = clk_hw_get_clk(&ctx->child2_mux.parents_ctx[0].hw, NULL);
+	ctx->clk_ctx.child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
+	ctx->clk_ctx.child2_clk = clk_hw_get_clk(&ctx->child2_mux.hw, NULL);
+
+	return &ctx->clk_ctx;
+}
+
 struct clk_test_rate_change_sibling_test_case {
 	const char *desc;
 	struct clk_test_rate_change_sibling_clk_ctx *(*init)(struct kunit *test);
@@ -918,6 +959,10 @@ static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_siblin
 		.desc = "div_gate",
 		.init = clk_rate_change_sibling_div_gate_test_init,
 	},
+	{
+		.desc = "div_mux",
+		.init = clk_rate_change_sibling_div_mux_test_init,
+	},
 };
 
 KUNIT_ARRAY_PARAM_DESC(clk_test_rate_change_sibling_test_case,

-- 
2.51.0

