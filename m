Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45C8302CB5
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009681; cv=none; b=TtDIlbBoqVxI6XBT33Jo5cPtrM+oYtzRZIAkuIhrvrRyiJCouqPJPQRWnZSs46qFiEqSMpHl+i30VekeH7V+mSzhCkwyMUxYjMaphdR/IYSISakYpodk/dy3qd+GstYbmuKPXnPr+8hK1E6tPLUkZgSihdc8gScGXnkM5CCHDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009681; c=relaxed/simple;
	bh=sDM4TxN8ShOb8aBv+Z7HrYy5822cwlDrWFqdSR4OZKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOxI7dUsSyRY/MhoJ0C+ABMjHvdwhbR3Xy6wO3kUL7HQnhh9kYP9TNWuEkhuB82NAsv8JbLgOOj3/Q4BpRW1NpfIZC7qgPhI/Ak9Ny9tDG+y0t2BLAxVoHKY29eYR3rn6fnLyyhMJS7aeiNQyXkxt+5d9rNEzMzymNiYPozi04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EuAhNLZk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EuAhNLZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755009679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rXSNQkir9l0c6O4Uch1lbWYG6q3I9kiF+5fAxrExQNg=;
	b=EuAhNLZker0h2r2Qdv/tzsry5d3z3N7L4C1Nr7TDYLc2F31I++mp1IQdSUNvpCW5at8iKr
	4K5Dsx3tWmR0JEuaJ8015Xz+jTXggBXhhulUcSbaAJj3Ht/G+F+6kd1lvrSClzQ3q3SL6T
	9g995ltnqM/K6/1VNSw+YWDPz94oVS0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-HBfoJEPcN3Wlv57mQN8izQ-1; Tue, 12 Aug 2025 10:41:17 -0400
X-MC-Unique: HBfoJEPcN3Wlv57mQN8izQ-1
X-Mimecast-MFC-AGG-ID: HBfoJEPcN3Wlv57mQN8izQ_1755009677
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e82b8ea647so1163989685a.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 07:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009677; x=1755614477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXSNQkir9l0c6O4Uch1lbWYG6q3I9kiF+5fAxrExQNg=;
        b=g+DCbisUBnbToHES6oCWbHC+k8iPOZ77XckRdn+mb97s9AC8SGv8z6O+dHyD/wHmWa
         eGhfJQ4aAzK42M5g0+13ot7O3IKGXRuZusgEhFmGxa32cT3e1Bao4O+NG4xmpxtvXHdc
         Lt39EgJ15wWt+0SKsZ8QxTTnOgpt5H+nms7ZxQ8lT1clx4014VZ+TUKNBB9Odx0+yvBf
         2VbMvUXxGV2+RY1DB+vot9L3W9M28jjS2SvIgh12VN6sb0MK4O4nKMRF+9ZIsPJwKALV
         4+l2buDjRIO3VaA+zZt+VVhabZnPKQuG/3ZrYKXOZ0vbux1vK6E1/aB5WHHgWfDKffki
         a6GQ==
X-Gm-Message-State: AOJu0YxLuXs1PmBZgfK65uvGRE5CbcKstJY8lSKsTC5S6lCLLmMiLpX0
	BPOvu5y4z5y40gtMncTAXMCFFoPaU4XUH9/C69jXFgG5yZeZU4M39FDOI5CibKX3+zYwF5ZL4Qg
	QiqfMuHtdRoU7v6/sbXaYXHMUprsEM4GnCpo6Tq33o+2okNL2D5+ZAv17EtY7XA==
X-Gm-Gg: ASbGnct1bUt8oYDC0qDtXWnEDuTrj2jZFcS5KzB377LJN+l+5ICVizeJVf5YFIorAa/
	S/vSeGB9sIv31zjY4NPZ3hTjXvJGb6Kp/Ep8W7u6y3suvu8nqMQyU8x7iYJLidGSWxA2IvkL1oq
	SS1XYd0iSE57ZecQhFPrG6+Creoj9qrc0b3UQQcKMBTroYgKY38VMPiGs1osJTXKmxXZdu1skZf
	on2s963+7lX7vVf+8RZ6/fXrQGiIutTQdq7yndRn3Rw4n2NndaftXwqtiMDEK5zJf9Z/gwhuIJb
	hht4Jo/Coa45mEIeK6mxjFsvXPFmmL9uJRPDB9ZPRyZc97fJMZaGGf+GnsUIgkH8KYnt0AnNkhr
	U8w==
X-Received: by 2002:a05:622a:1823:b0:4ab:722e:3b39 with SMTP id d75a77b69052e-4b0ec9faa2cmr31287561cf.1.1755009677038;
        Tue, 12 Aug 2025 07:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVeqwIbgPVF4yzmFFuy2sDDvdU3iNThQxQDamVLjzwWjBf5U6ADjdwgTxVdogE5PzekAcxfw==
X-Received: by 2002:a05:622a:1823:b0:4ab:722e:3b39 with SMTP id d75a77b69052e-4b0ec9faa2cmr31287091cf.1.1755009676475;
        Tue, 12 Aug 2025 07:41:16 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm76186821cf.8.2025.08.12.07.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:41:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 12 Aug 2025 10:40:39 -0400
Subject: [PATCH v3 9/9] clk: test: introduce test variation for sibling
 rate changes on a gate/mux
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-clk-tests-docs-v3-9-054aed58dcd3@redhat.com>
References: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
In-Reply-To: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755009649; l=2537;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=sDM4TxN8ShOb8aBv+Z7HrYy5822cwlDrWFqdSR4OZKE=;
 b=r5FvK3WTbTODfyrV1UUlVrGiqX+hXi0edFBQWx7+UwkPASXGz05BP0ajvIkJT4VYwtDbP4lQL
 wxpW1BxVD+QDZQ4h48aqXcxF0q1N9kAFLxpJrPRt67SoIj70Y7oYpSu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Introduce a test variation that creates a parent with two children: a
gate and a mux. Ensure that changing the rate of the gate does not
affect the rate of the mux.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f1c43b5004057eccd0591f17d625c549d9eecc78..abc0e4dd1b79e7d54673d3eeae7c95b0d1d61e33 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -947,6 +947,46 @@ clk_rate_change_sibling_div_mux_test_init(struct kunit *test)
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
+					   "parent0", clk_dummy_rate_mhz(24),
+					   "parent1", clk_dummy_rate_mhz(48),
+					   "child2", CLK_SET_RATE_NO_REPARENT,
+					   &clk_multiple_parents_mux_ops);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->child2_mux.parents_ctx[0].hw,
+					     &clk_dummy_gate_ops, CLK_SET_RATE_PARENT);
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
@@ -961,6 +1001,10 @@ static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_siblin
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
2.50.1

