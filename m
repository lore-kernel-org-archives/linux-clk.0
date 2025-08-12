Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F1D2F548A
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009678; cv=none; b=S+J+RxlJkSx4rtLPm4rSC31fcbpqbMX2MPd+edxA0DQCYKFVD/OpaAG5ysNUHMwgNnKsyFZ5yYkOGRVd0wrx2IIDGccAp6P5VnZAG5c2+Np8DvPWMMGnSQkHnTrejdtF1QdPAEOqqHD/DTZ+E5JmzFgPCUqQzjHO7T4WPvJ/uFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009678; c=relaxed/simple;
	bh=IUzDle4gQB8Xk0bxNLtfHL2sLNitV0rVkDxOnQwk0ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DRzWvhvC5iTblwc/wskyO9RcrK/PHRBiY1FVFJfQ/TZ0pXkrNrIutlwJQ3XsWd/z/ChbA4wi3BIDDt1OAFbacuR8g7axoDsUEs53KArDbxxPoTS8uyMAd2Qs/d9hdhHB47QdSyHY/NTOV0ZwD7kljopGXBf1WtxwxkSPq3qcbnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Js/sSwyN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Js/sSwyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755009676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iutHxQ4O5SqVy6jHFiteHz6jLETStunywRM2TcmeHeA=;
	b=Js/sSwyNf/nF7XT2RTLqdW9mlfyyFxUpLha/WH4deNRr843SwDoTdSyu/P6RYRUxMMsxb0
	KwWqHJaohGFsDS1Yv5nKelngkZa/IIcoIdIIIbU0Y7qCpoMvPgwJINW6APzzPCAIxfUJ7I
	7TFvC0rQzlJUH7f6aUFszUkC2jGMaVI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-q5nQ-8cLP2ODaGRPul9JnA-1; Tue, 12 Aug 2025 10:41:15 -0400
X-MC-Unique: q5nQ-8cLP2ODaGRPul9JnA-1
X-Mimecast-MFC-AGG-ID: q5nQ-8cLP2ODaGRPul9JnA_1755009674
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b08a2b3e83so166064581cf.3
        for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 07:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009674; x=1755614474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iutHxQ4O5SqVy6jHFiteHz6jLETStunywRM2TcmeHeA=;
        b=Uq5fwZPhxBoBFHfvu4lkCHQRg1hQm6PL7WHaUMshsTLLaVb8SvHq2CN8pM+41Pl41/
         /RmVb/XlwuvMw8fE82o6luh5yLak+iccBqIeeZtXTcthKlLFjHJnZBrYjkbOR0E+CQAp
         iS9rrBbVJbgB5VVCPmN6giWJnK2hZaC6prgYZb7GxsFx426firhPRHt6bWEhVWJufFeM
         S+Cux/UznzTIsVPbWtGjhIvhxAdvinsYel8HWFwr/SvHxfxD/Y5GvBaN1S7jJ4bbmssz
         xF4OeA1qFb2L29ZryQktg5Y3Xv2ip3k9YC4Ve4KOga2PxDdlBHRTDOJCt/1VPrxriwaX
         JHNg==
X-Gm-Message-State: AOJu0YwlqYdtaYiO5IrG3A1g7pUGMTT1KSN2kaozdrwrcLYUUBywn7d/
	io/RVdjNrvjLQJcugYeMCSG/OwWCCm9GYZhJILS/hycgdKLCBOVjpe91qN5k9zZRI8vq1vCK8LY
	HAReAwXaOgOKE4Hd64XyZobVPw9yo0gcmI0QWguUKOaXAlXcPzkdbqB33r/Q8Iw==
X-Gm-Gg: ASbGnctUdUeMdSidV8kmuBOo+hBKhiEablevNRV39rW2kiQ/l/IszU0iyAoX0b40BWo
	3KSQpmUG4nlyf4MH9lOPgMtQ6d26r+05aEIHiDWMMpmcJv21OlnUAmAR5vPuhz6aMIrclsOuXil
	sTWpIJhVlPp1z3IB1id2HMdVEdSOoFG/19MjNwfJYXSaK3DvKzqmDgXv/Iyi4KazQqAXiMQB79j
	tub43NwJwtnOdHFE/VLwEi4WiZU3uG8X1siA6MzelDGAbGzz/7gRVbpY7EOrdW/YRBsseHuYc2C
	Wjiz9OQyVyB4Ll26T0ZtBxYQ/l1Tr/XPM+sqGU44LvAgjW0oYyhLacFZuWx0Nn54qi5Xa8oxezM
	e+g==
X-Received: by 2002:a05:622a:40cd:b0:4b0:8633:f961 with SMTP id d75a77b69052e-4b0ecae8695mr58555051cf.0.1755009674228;
        Tue, 12 Aug 2025 07:41:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd8odwF9Nz4qRqjYcflrFg8pVHarZXIcuayOZyBNpuegobdE3mhp+yY7nIC1pDd12ak0MQJA==
X-Received: by 2002:a05:622a:40cd:b0:4b0:8633:f961 with SMTP id d75a77b69052e-4b0ecae8695mr58554531cf.0.1755009673770;
        Tue, 12 Aug 2025 07:41:13 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm76186821cf.8.2025.08.12.07.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:41:11 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 12 Aug 2025 10:40:38 -0400
Subject: [PATCH v3 8/9] clk: test: introduce test variation for sibling
 rate changes on a mux
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-clk-tests-docs-v3-8-054aed58dcd3@redhat.com>
References: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
In-Reply-To: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755009649; l=2563;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=IUzDle4gQB8Xk0bxNLtfHL2sLNitV0rVkDxOnQwk0ls=;
 b=qDeH4KgI9d/t57bzy5StIb5ffHemwEbChn/GxrH3K7AeP8PcRx6fvRik7/HOwF9tbWMLkxdL8
 S8oje3gdV1TAabkL5VvIMZchYTHFAoHW3W6BSIo3OVTOHjVOngomwdf
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Introduce a test variation that creates a parent with two children: a
divider and a mux. Ensure that changing the rate of the divider does not
affect the rate of the mux.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index c91de77a5b7a90396d9b4819ff90087445316567..f1c43b5004057eccd0591f17d625c549d9eecc78 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -906,6 +906,47 @@ clk_rate_change_sibling_div_gate_test_init(struct kunit *test)
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
+					   "parent0", clk_dummy_rate_mhz(24),
+					   "parent1", clk_dummy_rate_mhz(48),
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
@@ -916,6 +957,10 @@ static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_siblin
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
2.50.1

