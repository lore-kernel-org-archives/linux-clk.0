Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4F22253BD
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 23:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474255; cv=none; b=ZmMiQtZPkFu6zh23+vgPVw0Q4CRV3T1zH9Q0FAjWzIWbIwzElV4WFWiJQ3NumIdfGGTlT2dLuQ6oedspF7YdGtc88vZRsIt8zAZ9mgUnazjQIqpwTtfnvalYstjd+NYjSWqyiRWU6gTWQon2M6HlsesF30c+5IbRlNrDKlk3geg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474255; c=relaxed/simple;
	bh=sQ+5ETviPsufC2rC/jxYhJ16ZkKYEBNOFVNqjLFU4VM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMM41Go3TXEXlJQnTZiZdfkUO3yuUPfogMcauoXxaMurWPu4eU4r/ID+aOsxbZu6pa5BQy5g0MKaOkzEp6Ew89RsWqoUpKxeZmkFRD+a+rlVzrvMf3O/S1pLCg55C/3vwHulpRiQ4HhjbizmsRhGOLdYv05Wiy8VOGCrEDKZTKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e4QyuH9P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e4QyuH9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UoCPU8m3g0MY3zvVnMAX+QdRxdLJGM4GIE5nlW4Y3SY=;
	b=e4QyuH9P6u6SBjM3wIZdiliTyfCLxlZ3kERTa/PTsrjaiSInkXD/C9ZlDWy9jwnYQevsbR
	i58emKH4vR/vtsYRLnOXbga0N/QwRv9nyEV1smPxK2ldGfq1HwFFtDGZwdhyp/GerDPTbl
	jHLQ9JOVAXbk2kERyAYuiz4c9JGTrBU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-nDXt07-SPWW3iGh_AJoHUw-1; Wed, 28 May 2025 19:17:31 -0400
X-MC-Unique: nDXt07-SPWW3iGh_AJoHUw-1
X-Mimecast-MFC-AGG-ID: nDXt07-SPWW3iGh_AJoHUw_1748474251
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53e316734so42403585a.2
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 16:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474251; x=1749079051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoCPU8m3g0MY3zvVnMAX+QdRxdLJGM4GIE5nlW4Y3SY=;
        b=S64R1On9d26gWqUIJfS4p7h1PYmN9QD6Pb0p+VhIucyDVKai4QxYxmrg3VUesHKxlZ
         T2gJ7fo1SBnrRDxDXJgoIwtoykPnzLSRgaRFzR1rEnLlSCCIeUut6y6sbFVDBi4UNf+J
         9p1VQBe6lK5Xi+0zPtzcnJJUeN6otuTEbJfHPeAfqVlYEEz0jkCgYGBiYa39JP5KZAtZ
         x2DLphi+3KZcUGI4Ku8WBriWycNSfFAoIsz44WLMmmSwmHAcR01XoeKOoweZvAeNbhb4
         4ck+wdcnepqFrlsHonKboF84Fuo/JDIlUhM7UXN7HNKlBeKGyhdZOW4B1o04dgmRv1pY
         JzSQ==
X-Gm-Message-State: AOJu0YwIXPLDRdqfp+lJqyoaQ20q3Tlg/u0vlqaE0S+3a6ugkedV113D
	rzgTUy8n1TbCMRbxqWuDi0pOF0hYvjmw7pWvVHP568HF7z8dPjQHGV/aHe1X70a/v9D7g73iJIw
	H22Vhng4yKxdrF0p+Og4agA19+2Mc+yqyJLeAV6s7OHGtNT6ugU30jO2JGjdfpA==
X-Gm-Gg: ASbGncuOz7L/Xl4d9Jbl8v64p+J1LAeOSnEJQFGpYU4j0dBAJl0MicaSX7D3Ekqhiqa
	H00tFu0fpU/3mBtbFxntBfuk8yFyKybMrAnmfqzq2INWE75ZAciO02PKfxS1K79euKqG/OIRyqe
	z7FQ64QGP8IprKISubPKck8nb2AHdqfzhT0zE1lN982Z2OnK8MwKJlfcfi66dDPdgWcpA5+H5hy
	RBznZqS8iKtKOmObaC9gjQ+fXu/pKOlLYVi+1Ljcz8LQ78WgB57ItlHZOTl1EuVpJA7qtmENEZ/
	FnPemiFi5+P8moDWKs51774kUpB+OqJqg1k5GiM0nlw72jPX9Q==
X-Received: by 2002:a05:620a:2682:b0:7ca:cb02:7942 with SMTP id af79cd13be357-7ceecba4556mr2609129585a.1.1748474250735;
        Wed, 28 May 2025 16:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvTpkkJ9DU5JLRmwa8tguJ3IJoZtmoauvr0XQSfD/ieT9Sm6WTM94sv1t5e4G4Mp1o2SEv1g==
X-Received: by 2002:a05:620a:2682:b0:7ca:cb02:7942 with SMTP id af79cd13be357-7ceecba4556mr2609127085a.1.1748474250477;
        Wed, 28 May 2025 16:17:30 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:55 -0400
Subject: [PATCH v2 09/10] clk: test: introduce test variation for sibling
 rate changes on a mux
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-9-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=2566;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=sQ+5ETviPsufC2rC/jxYhJ16ZkKYEBNOFVNqjLFU4VM=;
 b=ChBC/ilvuXXJXRyiziNjnFOkucSkSvvLHNZzLHSQQdueZGY9aWrJAP9J9NkBCRVXMyUsjqlxk
 THzafP5HRIGAFYJKQKPa6Caxb9n9anfpeIxZbJB4un1a6UdrxCEo9d1
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Introduce a test variation that creates a parent with two children: a
divider and a mux. Ensure that changing the rate of the divider does not
affect the rate of the mux.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 147935975969f8da4a9365c0fac6ffe37e310933..b5cf0de16abd1e098368a67626fff9044f7a1a6a 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -904,6 +904,48 @@ clk_rate_change_sibling_div_gate_test_init(struct kunit *test)
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
+					   "parent0", DUMMY_CLOCK_RATE_24_MHZ,
+					   "parent1", DUMMY_CLOCK_RATE_48_MHZ,
+					   "child2", CLK_SET_RATE_NO_REPARENT,
+					   &clk_multiple_parents_mux_ops);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1",
+					     &ctx->child2_mux.parents_ctx[0].hw,
+					     &clk_dummy_div_ops,
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
@@ -914,6 +956,10 @@ static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_siblin
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
2.49.0

