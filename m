Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9373D3493
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067171; cv=none; b=nkfe8ND2bOwUtXtq5OQfWTvVGFE02455VmoFjgQdJa7zFz0GeAtFT+9jBRlmQ6sjkMaW/XUqljVuZga57PWHS+8yEyrPmH4CEn80fwWvwO6KzTuWIb9KUQEzarK12Kc9Wqo7Z4DxepbE2PDbqip5nihjy6eXyA3ifjxVHzs+f6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067171; c=relaxed/simple;
	bh=KGjGlg9+FVN2/hOowvBTMcATr+J7fq3fwpj4roBVI74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZqkPkvmFtTF5CNiw6xlpwg5TSoHcqdoAhsbD6f0sYwuvTJVgtd2Gft9vayiaLEjrQH8CEzEXXKG29YonuneORDsrs0b88Q4V/k64MeMDPE9byS7YHhyn6q6Npp2FyC04sFijEUKJSZRYn6dwwpBlwgTgrKQgGuQWp4uh/UeAPOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L+4bLEbP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lK9U41pl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L+4bLEbP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lK9U41pl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yYJKtYDTWyz8NMDHb7DCD1Fd834dm4nETH5Ial4epIw=;
	b=L+4bLEbP3nF0a3rPl99XmTvSUpEAneFL5l5S2kHJdj9MjzHeCgk+IL0+JMuqUrdhOGH9cM
	1V2J6mikupuoAp83CPwfuspp+lF0f7G8fsqsVP11XHEpE6dcap4hiWkfYAyaFnbE8mERKC
	Kx+t4n8+mM06DmODAQGXCN0qU2VzAdA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-xSuCTO1ENESs1X42XLZFJg-1; Mon, 09 Mar 2026 10:39:26 -0400
X-MC-Unique: xSuCTO1ENESs1X42XLZFJg-1
X-Mimecast-MFC-AGG-ID: xSuCTO1ENESs1X42XLZFJg_1773067165
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8b37d4b2so556574985a.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 07:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067165; x=1773671965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYJKtYDTWyz8NMDHb7DCD1Fd834dm4nETH5Ial4epIw=;
        b=lK9U41plA6Dum+ud9G1Ge0iURD7WmFUt2DEZOLCuAfV/HuTtopMhLsOt0naka0X8Tj
         9P1RJrIZyz7ZhSrSPznd6AUDrLTlMf3ib/U7tUa9LF6uw2epWmzoPxoiwTQKyatNVeSQ
         pcMObdlPxmVME/MK2xpuC3b+A27QbDEcj2iYQOvmPr6SruNOThfk+Dwi4AXqMlJyDCyv
         u8VEU5CO2/3v3mylsFPnTExWIoAvppDB5P/bmS6BE2gcff4NN+95myZAOwpV0QCQkHkb
         gnFd6ecjbDOSSC5hfJlIr74k2hrtrkbevuNb1oDQ8PJLjH8ZKItGq5LKlRagYCA5eEsq
         ew3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067165; x=1773671965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yYJKtYDTWyz8NMDHb7DCD1Fd834dm4nETH5Ial4epIw=;
        b=F4Vi0v/HlRJ8L+AudqnsZ+EVos1gJjgFBbIpdZ4Wo84ZmpRIWNg40Z8SOhguH+TxYp
         ui0uB38N6rgRSEoi8yuB1Edd8Ei+zYdcNsQY0VeDfdWeUvTUO5fqspz49ZbCJ419Yfm2
         xbTwr1xO1enHVcEPVEw3sr5/J7xv9l2btRFs5t4b0E4pmP5jVskwsRiC4H7PhFCs89L7
         QJ4Rq+cSGA2Ah2KJBHUoD5XxIHCk8txHNfv+jVfJUmlJ60wsbreSrd8vPiXPgVheRmPt
         4Dfgkzbd5ejL5HyRJ5bvdee4hBrQe8nGZJXaR034U2T3lAqrMP2JE2GZOfC/qku9s3Yz
         u7pw==
X-Gm-Message-State: AOJu0Yz5Buj17eWLlX8/L0TEZdvJJAvrbBy+ClYL9dC4ZuteTLolE5aL
	5FLMljxJkQ74DNGqodet+T5HsQP5Qcr3XbUXFDETS21NRnxGo9tcs/Mqj8/H8vxS5aTAkSC/S9U
	ZvSPCx8y2TFd6fs8GHkICPpfhkMls6pTyuM/tpdglPEWBsuBQkJqc+6DOqOy5hw==
X-Gm-Gg: ATEYQzwJ1ARMihZpeH26jC/xZ3RvntI8E6o/7S6wFkxSUTOGRRdYzXiVBDwgdnRgnJ0
	doWlNrcMQW12PkJBmuqnVusQybmXKGiOVf8Heu6XtcoZGPVWx/UAuOZqFTFvWn8MOexrwOFRx7q
	l2kJfaNcFqXARksKzFZWSrblIMoQhzsbUzysfWwAP4QP9iwxQ9D5WrJTbl6hBZ5bzBTGXyw2rI7
	mTjcWHbC/Im+FkKLwmuCcAOj4sWLlzK82o/SOVLTx4d4byw+OH+gZg4b8G4uKgTBZ/KCJKzQ6o6
	ka0p/kuK6rDcLMFDaDMnoT04EjDzWkcxDVLZije+zlJZER9xcm+oGCve20lZ5kjRedTx0irETA8
	edBHYBTLYzB5iHVB+vgeNW8fhCepKhysvPsHPAlL2ZJqxZ3XcGQXk35b9FXyI7A==
X-Received: by 2002:a05:620a:4623:b0:8cb:3f0e:7740 with SMTP id af79cd13be357-8cd6d4d7cb7mr1379569585a.51.1773067165644;
        Mon, 09 Mar 2026 07:39:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:8cb:3f0e:7740 with SMTP id af79cd13be357-8cd6d4d7cb7mr1379564885a.51.1773067165125;
        Mon, 09 Mar 2026 07:39:25 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:24 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:41 -0400
Subject: [PATCH v2 02/12] clk: test: add test suite for CLK_ROUNDING_NOOP
 flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-2-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3612; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=KGjGlg9+FVN2/hOowvBTMcATr+J7fq3fwpj4roBVI74=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3e5dXtd9Lef2xnV/4++Knb/2Ru764qlPXoq0GYj6s
 go0t5kHdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRyM0M/6umSaUXOLMUKXu3
 cS1heGep0B6/znvrDq0r8ZNXBR4MfszI0Pm1Nzu527333bkT6p5LXvt8PpGcdHCe5tG9J1tOPG+
 YzQ8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add two new clk tests related to the CLK_ROUNDING_NOOP flag:

- Test that clk_hw_register() fails when determine_rate is not set.

- Test that clk_hw_register() succeeds when determine_rate is not set,
  and CLK_ROUNDING_NOOP is set. clk_set_rate() works, and
  clk_round_rate() returns the requested rate.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk_test.c | 85 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b1961daac5e22fb84f493f04feab1ff94a975d90..6745b63ee4e5188665825b56c5e0def51d68e10e 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -3541,9 +3541,94 @@ static struct kunit_suite clk_hw_get_dev_of_node_test_suite = {
 	.test_cases = clk_hw_get_dev_of_node_test_cases,
 };
 
+static const struct clk_ops clk_no_determine_rate_ops = {
+	.recalc_rate = clk_dummy_recalc_rate,
+	.set_rate = clk_dummy_set_rate,
+};
+
+/*
+ * Test that clk_hw_register() fails when determine_rate is not set.
+ */
+static void clk_test_no_determine_rate_fails(struct kunit *test)
+{
+	struct clk_init_data init = { };
+	struct clk_dummy_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ctx->rate = DUMMY_CLOCK_INIT_RATE;
+
+	init.name = "test_no_determine_rate";
+	init.ops = &clk_no_determine_rate_ops;
+	ctx->hw.init = &init;
+
+	ret = clk_hw_register(NULL, &ctx->hw);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
+/*
+ * Test that clk_hw_register() succeeds when determine_rate is not set,
+ * and CLK_ROUNDING_NOOP is set. clk_set_rate() works, and
+ * clk_round_rate() returns the requested rate.
+ */
+static void clk_test_noop_round_rate(struct kunit *test)
+{
+	struct clk_init_data init = { };
+	struct clk_dummy_context *ctx;
+	long rate, rounded_rate;
+	struct clk *clk;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ctx->rate = DUMMY_CLOCK_INIT_RATE;
+
+	init.name = "test_noop";
+	init.ops = &clk_no_determine_rate_ops;
+	init.flags = CLK_ROUNDING_NOOP;
+	ctx->hw.init = &init;
+
+	ret = clk_hw_register(NULL, &ctx->hw);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk = clk_hw_get_clk(&ctx->hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clk);
+
+	/* Test that clk_round_rate() returns the requested rate */
+	rounded_rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, rounded_rate, DUMMY_CLOCK_RATE_1);
+
+	/* Set a rate and verify it works */
+	ret = clk_set_rate(clk, DUMMY_CLOCK_RATE_1);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	clk_put(clk);
+	clk_hw_unregister(&ctx->hw);
+}
+
+static struct kunit_case clk_noop_round_rate_test_cases[] = {
+	KUNIT_CASE(clk_test_no_determine_rate_fails),
+	KUNIT_CASE(clk_test_noop_round_rate),
+	{}
+};
+
+/*
+ * Test suite for CLK_ROUNDING_NOOP flag.
+ */
+static struct kunit_suite clk_noop_round_rate_test_suite = {
+	.name = "clk_noop_round_rate_test",
+	.test_cases = clk_noop_round_rate_test_cases,
+};
 
 kunit_test_suites(
 	&clk_assigned_rates_suite,
+	&clk_noop_round_rate_test_suite,
 	&clk_hw_get_dev_of_node_test_suite,
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,

-- 
2.53.0

