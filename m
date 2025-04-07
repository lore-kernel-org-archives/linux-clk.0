Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB21254B0B
	for <linux-clk@vger.kernel.org>; Mon,  7 Apr 2025 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031612; cv=none; b=KEUmL92GZTrYdUKbYy2DkbLDmJfpksDBP3ZLpz/rK3pqQ0vlH51tHg6luo1ITJ/RpAGBUxEgMw75LyVzlh+ChgOqOewMGfhN1kJdEmciWupHulRk9obAWI4IYeuoYCn3BbvA+VKAwKpznY81ncoIT+z7dMReGag5yuBCT1Lm7sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031612; c=relaxed/simple;
	bh=GN3voStKR5Oh+8mUZUpd029ZKjm8JBA4D8k5Q2aS0T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=EKcLAA+TMY+y3VR2itU+tufY9jm3urdP/mwZfYl7/2jQq2HJUBvEH2OhisHz3i6qGqRVHReHCgInDi2Rrr1KSNR/NKDaDrlQWgjIGqMIya3VpZq/4mBJZ4ZrPabvHyxXRqNeK0MkyjrzIY2sISer5jk6yJtClPkDv51+c4KFBZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SrkPLpwP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SrkPLpwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bh5Q0sLZw7+M5FGlXd5xakStCO4/0BURaA8xUUHrIXY=;
	b=SrkPLpwPcuczwuETjXA/Q7FIH4rzvVRNlEMEBZ5KaiQNLfDHhWxp6DCXlgYMbrv5pJM8aj
	5CnxRx5ig6GZrO3KwOtKELgOA2GTDrS/QafTMUIanz91HxLiIMyMxCl8vJRRfWcMJuP0zh
	hb3LfLJFZ92R2jc0YQctZSAxeoI7kbA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-Cib4E21tOIOYSgKHKcJoLA-1; Mon, 07 Apr 2025 09:13:28 -0400
X-MC-Unique: Cib4E21tOIOYSgKHKcJoLA-1
X-Mimecast-MFC-AGG-ID: Cib4E21tOIOYSgKHKcJoLA_1744031608
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f64eb467so35240246d6.3
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 06:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031608; x=1744636408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bh5Q0sLZw7+M5FGlXd5xakStCO4/0BURaA8xUUHrIXY=;
        b=Qnp/MDUXButFS6WKmoPOy9NSr40lEIWHby3TrU9FAyCGHrPs1Q+htwz9pfHB9/lmSi
         zxPGM7D0Y6mRRkjFAkpMa3rynKMS4CqHsfiRWeuV58YlXqd88D1E94GPYdNn3O0DHEUd
         uj8pLEUY8LFjHSttGTtWPWivzfP4y2qUcVR+sH5mUn4cyo6IhKTtkTRBPG9V4YrO389W
         MuVSPx0KptZV8k09GKUBI2zqjN8c+8/yQcEy+IPRfuCB48mE7GfFo/BzzIbx2WFNW10m
         Y0Xff1x0xAAHwFRfC7oF6Osk0CEnFDRbJz4zacl9HZPob6rVpJGBi8Yc1NEu5hfN5jL+
         tLpQ==
X-Gm-Message-State: AOJu0YwXRMgLukVv7DAchqMpatqD//44sDhfMCp12M6iBjPpvOxMv5FT
	2u/DWx5MRttOO8itHpPmdPQg4DDHuodxflxc9yBKZc5Bc8DWgincSWRRVkEVctiDbSqLdsZ8LyD
	7MX9yiP1pnJKhspiAzJtPO2NOts7aCy8bxYVycKPNlFrwJPz5HXTkeuLfWA==
X-Gm-Gg: ASbGnctX9MvkZ4VSZvkniNlzLcMt+qGJpw1aWbwcCSNotealXQAcFIvGAhTun0XPqTs
	nTAPA8DDn9VP0LpKuUhGMdq8wlEWcM2bzWkcN06h5K9JBti9MgiOPlvdo1cVri40ApqTe4GFWTq
	vhNNGeEb2UVktPINiSejjTw2Qy+3O1u9lbF5RTKG/wJ4EhntUpN5Zuz/Fu0HC1JFe7Q/h0n0s7p
	xLwvraPUqwhmosKBy6u3ewLx4UM25GjpMu8Aas9hfgBeT5NmFvELRVeFpR3Wylp7Cl7KsmVBHX6
	SQEwQO4jzSR3FoeDkD+0ManWBX5GLweykr0uLkOwww==
X-Received: by 2002:a05:6214:f6a:b0:6e8:fad6:7104 with SMTP id 6a1803df08f44-6f064b27e5dmr230252446d6.35.1744031608042;
        Mon, 07 Apr 2025 06:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3ciFpFjf+SwD8KF8vuNyhdHnxtlz8uDM6Kto6KyAm9+ypPxnut52K/L2hr2yRorO4oeMeag==
X-Received: by 2002:a05:6214:f6a:b0:6e8:fad6:7104 with SMTP id 6a1803df08f44-6f064b27e5dmr230252186d6.35.1744031607774;
        Mon, 07 Apr 2025 06:13:27 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 8/8] clk: test: introduce test variation for sibling rate changes on a gate/mux
Date: Mon,  7 Apr 2025 09:12:58 -0400
Message-ID: <20250407131258.70638-9-bmasney@redhat.com>
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

Introduce a test variation that creates a parent with two children: a
gate and a mux. Ensure that changing the rate of the gate does not
affect the rate of the mux.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 97909caa71b2..e6df1d2274b2 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -942,6 +942,48 @@ clk_rate_change_sibling_div_mux_test_init(struct kunit *test)
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
@@ -956,6 +998,10 @@ static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_siblin
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

