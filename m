Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD030224259
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 23:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474257; cv=none; b=Q/qVhctX7c49NM+5nix2i87wRgHjZgu852NMeoHYEDN0niwHoTTd1hAtkIkooSC20OlOCJ+eLdCAh6qryLTNf7v61fw5PocvqcXq5p2+hiKGVATgL1O8rPqlI6TtNXMIPFSwRddcAUlr047UXzn5BErGJU+NMeGcs5PycLoJvgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474257; c=relaxed/simple;
	bh=2UyuBFVBF7/NqDq+ovnhAtBjPjcIVQGpsNux7ISwlE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSb29huDVSkZW7aAdzbas29P1dTl51Q9ejKsKOhaespKFfDHuzYF7UpHFiaELkaR2mYCCc3MB2SSKw8COmvV5K1TAmrHfk4tD0OFPnfKyyDxL7ooW2MOOlddBvh9YD4MwvW/2YbwqmIXuJ9wIpE6EcmBNwzrgefP10BB87qed4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aT+gt5Xq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aT+gt5Xq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okyJbl6eCklKJGEFMxSh/0mMfugaWDJTFRqMQyNrXMU=;
	b=aT+gt5Xq9oJm3IXDe1CQQ1jx+sJmqxirz3KkJLkvzNQRku3iXEzyVMQTcWiA4YIYtKg82H
	pJK5pEUrcyC5UaCFd7XduqoQ3TGm0TovA2jocqPLlCAvLJiRprbxk09rjSEgMqNxTIdWPj
	OFTJtFNtRC8WcFkcwN1B/gR2yjJIcSg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-yibSqirrOiO5n1alS30MAg-1; Wed, 28 May 2025 19:17:33 -0400
X-MC-Unique: yibSqirrOiO5n1alS30MAg-1
X-Mimecast-MFC-AGG-ID: yibSqirrOiO5n1alS30MAg_1748474253
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c543ab40d3so38652685a.2
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 16:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474253; x=1749079053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okyJbl6eCklKJGEFMxSh/0mMfugaWDJTFRqMQyNrXMU=;
        b=JlVdbX9BRLNbt1WtOetk9d07gHg8Pwz3INfrqQq7mhkMfEXxNFQZ2AX4+KfUWO96yk
         15h0PtiUQwXjs8OEgD2ingfvJz65jjnAaH435E0qSZsaqHln4PlDzqWxfmMhFI8UHW0h
         exrO2zUHH2vl8VwGNoEZ/j4vH/IhxsINfGd/VZIxpKA2ht1lcAX0Kl4KMux0s1qA5rf6
         72cJjqKBcI6C4qHGYLpjqrAquwlvxr0EljX7qPC+5yyBp6Q/PgqpMmltodMLjWHMr1TZ
         /tXjwkxHyko/IAsqfSxsylPhMHqf3qo8C7Ibdyap4uq+oZEDt7gi2avie9+eiW7oJ/fY
         z7tw==
X-Gm-Message-State: AOJu0YxaE8t28JicQpZxUe0EzH0eze3ijXCpcmnjnMZTKavd4zVNKtMd
	zJlrdTWDTcZqqLCOOsYpTgi4CxHSQRWTOvt0L9Lm++J7G3sbhUxsfDLzctznWf1lyuMGIYRuXHn
	PgdsUS158kwPxyLZL+HkZbM1usg+s3lS9/pRRWun3H0J47F79GrjtPMnOC/aVtg==
X-Gm-Gg: ASbGncuRLfFPVoEectzYSeUmTUdkQuO9pezVXhAp3/vOahXjLW7e4cACLGhiunJwdZK
	tcRTToycJbIZ48yV0pLgcG3GTmVOt9E3ftFN1A8QfM0Y6BwLL1FrXCbpqNJ2jXFCUNm0Smv8Jc/
	SZF3wcF+ntmLwzCO9gJD3rgJWMp28mCWpmgRAOrGNYKKDT7EMtVa2Tlrh4cTxUKpz1OxSnt087B
	fZYH504xY0/xy/NcmItEOABVguY0B7LIUYSqAGEqcSLZGRSMMqgJWg1OGHRsRPeTARb1AMKCtAm
	BaZpDyU7P3LqwPd08aaIME/nBeOLNVDZ2K4g3bDfcWmNVmYR9g==
X-Received: by 2002:a05:620a:4899:b0:7ca:c63c:c59b with SMTP id af79cd13be357-7d09ab36c8amr24489385a.22.1748474253042;
        Wed, 28 May 2025 16:17:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMv4olD6L+xEmV4YMpNnuWUk2AHunM4ENQ0bxRwPeD/SXi2QqhHhGJN0RkQf4JyV0HIRpzQA==
X-Received: by 2002:a05:620a:4899:b0:7ca:c63c:c59b with SMTP id af79cd13be357-7d09ab36c8amr24486385a.22.1748474252630;
        Wed, 28 May 2025 16:17:32 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:32 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:56 -0400
Subject: [PATCH v2 10/10] clk: test: introduce test variation for sibling
 rate changes on a gate/mux
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-10-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=2565;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=2UyuBFVBF7/NqDq+ovnhAtBjPjcIVQGpsNux7ISwlE4=;
 b=5fozoClZaz3cF6k4P4348t7plBzvForrhLSMk0Pp0guJb4WPQJlBDPhK0JHbk/o6+gBWT/w/0
 ej3nCkgUHHFCW2CQldcwiDaZlKZM5RiBeuoM38YlJDqfNV3RHJuEBIh
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Introduce a test variation that creates a parent with two children: a
gate and a mux. Ensure that changing the rate of the gate does not
affect the rate of the mux.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b5cf0de16abd1e098368a67626fff9044f7a1a6a..c5b856e224f057b011b095d998ca3016b6a041a8 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -946,6 +946,48 @@ clk_rate_change_sibling_div_mux_test_init(struct kunit *test)
 	return &ctx->clk_ctx;
 }
 
+struct clk_rate_change_sibling_gate_mux_sibling_context {
+	struct clk_dummy_gate child1;
+	struct clk_multiple_parent_ctx child2_mux;
+	struct clk_test_rate_change_sibling_clk_ctx clk_ctx;
+};
+
+static struct clk_test_rate_change_sibling_clk_ctx *
+clk_rate_change_sibling_gate_mux_test_init(struct kunit *test)
+{
+	struct clk_rate_change_sibling_gate_mux_sibling_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+	test->priv = ctx;
+
+	ret = clk_init_multiple_parent_ctx(test, &ctx->child2_mux,
+					   "parent0", DUMMY_CLOCK_RATE_24_MHZ,
+					   "parent1", DUMMY_CLOCK_RATE_48_MHZ,
+					   "child2", CLK_SET_RATE_NO_REPARENT,
+					   &clk_multiple_parents_mux_ops);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1",
+					     &ctx->child2_mux.parents_ctx[0].hw,
+					     &clk_dummy_gate_ops,
+					     CLK_SET_RATE_PARENT);
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
@@ -960,6 +1002,10 @@ static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_siblin
 		.desc = "div_mux",
 		.init = clk_rate_change_sibling_div_mux_test_init,
 	},
+	{
+		.desc = "gate_mux",
+		.init = clk_rate_change_sibling_gate_mux_test_init,
+	},
 };
 
 KUNIT_ARRAY_PARAM_DESC(clk_test_rate_change_sibling_test_case,

-- 
2.49.0

