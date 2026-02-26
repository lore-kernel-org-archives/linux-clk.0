Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BF5364932
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129871; cv=none; b=bz4dot3AEXn9Wi45xtu0CiRNE/98yuNRnWA4iFMvckEt32inCEqFP+CU/AA1POAj/aTX7DiBRxxpC6GUUx1P1FTk4gbTJ9Gg6NOTwTuisV13v+JF2i8zfghVmrimYbgYnum6Yru2hsRPwSMk/NPUQccFG6cvM6Z4puQ+ecElEfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129871; c=relaxed/simple;
	bh=Xv/Yn0DsACY4tPbVThHFi4E542QG5tcnAnMJGGRhnJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=feoBW9jOP1Nnz2Fw2Y+ljoJapvct1Ya9bDXt61rhR2Wz7qpc7dNft+Fn4NnULyV8Sw5Mfoi2b6JEx0pAD2dotcss/BdBxQAPRlhA88gbY/Y6D+XBMovp8ao8IGDzWJ32pa3NPva3EEOTu9A1oigfHQOOP79miSwd8rddwjYACDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W+kPBjby; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VlRlL93h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W+kPBjby";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VlRlL93h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jTyzt/WEM+gv/OJ+PPQ8O+8T255/lfffemaw2ikqAT8=;
	b=W+kPBjbys2mkPdeAln3KCV3+mIKAmmD2gghnpEC/7/pPBVEryJ2kDg3FMtKBw1iUsHBRzB
	QXGKFPVP3vrD5Q/OGIi2XzUOQYVUFEgJiPlTuZCzaww7CFlR2DpEvMnqxWxyKxk5dNhQIl
	UpisEIfy92KRM/6e80MhyzE0ShI86xQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-Au_Z8rdQN6mzxZsRx5w4Tw-1; Thu, 26 Feb 2026 13:17:45 -0500
X-MC-Unique: Au_Z8rdQN6mzxZsRx5w4Tw-1
X-Mimecast-MFC-AGG-ID: Au_Z8rdQN6mzxZsRx5w4Tw_1772129865
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb42f56c4aso1010246585a.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129865; x=1772734665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTyzt/WEM+gv/OJ+PPQ8O+8T255/lfffemaw2ikqAT8=;
        b=VlRlL93hrZj1dYZfjTBaWm+z1JLada8eWPFqv03OVsMgZcYgM+QZfr+uefkCU1o7YK
         /xiHbjiFx6aR1kzkftWYKNGEiYJ44NQAriTLfHiUGykGsOUfRo1mt0zdJFgFAh/O01wf
         fjbVRi1EQHPHvcuLHr5ry4Zk9UoUHnRsjOaX5L8Js2uJVXlZot3i59w/t2KzlZb+Gt8N
         orH+SiJhsw0ALMNIkRAki4xwIZ51wNmrC3X+Ywxya4cUcmgHicqdy0GxSB1u5p0MCYqq
         O9lwu5+kdQ8ctbWO/OoF38l3oY3L6etI6sqmuA2dfoUr3vFKGtCad7fN++WBxbnj8eLP
         NiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129865; x=1772734665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jTyzt/WEM+gv/OJ+PPQ8O+8T255/lfffemaw2ikqAT8=;
        b=pGIVFOwlKwX2tqdvYYVJYdyFTmdkKlN94Skw0S9QqTOIG6YL+noNx35BavLHfFnmju
         5b/NvftlVNLx3YCWSB2X5jJ9rNWFXrMWvC9l4nYt+NSoZGqUWmvPyq9T7iiGfT0EH/lK
         BCFWV2Y7mu8hlSCKrrt9nJx8rlg/0ETApJ3coXTzikLZPpG7gC1qt4PR3cKQXUfbgSXc
         mbYRLVyF1scNrJxLlE3rtuuO9Aji6b86jLEvFhvxXbTGeGcDwBFewZEPsoA+fXyM3CSd
         uo14OxXg8uwpPKqO5mDXZyYM2Pr3GW3pnF1ibULnWNaESmbnIxSiu3dJSWTd0S+PhsB1
         ma7A==
X-Gm-Message-State: AOJu0Yy1Xwevmqvllv6eTX+OjSNkuptMKmfAO68783WCfNlg5OPKA7ei
	oPI5Fy/Rw8Ks/nXCC3sXqzAqz7k9IS11DkeBBMxYjw/0e9rfgipP7XLsQ+pLfd6VgmpLrbJdHrX
	Jz8lVwGqTbFGBsIuWON9wSOEmp8+n2nA9XmaDkPL3gJbfKuQVRXn0YZdD+8cLXg==
X-Gm-Gg: ATEYQzw9sxsvhtSE6qyHjQtPh2DoXpfe1C7rXR3LUb2A3ssNcEdWvTdkMUuVYqIiw3K
	EbKv9yQOSFlAd8JwHZTGMtYA7KP5svjuAyrSHSJuYXscSWxld4dWNNtu5BKdj/CjP/niiNnDpnR
	pgkqpMaTFELJfYQ616Py5ViU+Bn2OVAVvvZTCXmWoQC29RjEqq5qJx/hGqycpc3PvTyB9f4vvC/
	3dT8QItGnRHMCvrP4KdF7duxmDJFk7grYGzy8dQ67zeKcu51d7ViUT+QLeZR3j2uRehKLFFkLrZ
	r3TVgowKvEkVJm4W3m2X/P0fvrJbSEge9R9LeMUS+PWTcqvTTJ42Gc42XYnTzc0ZXKfZmQiy9R4
	ECDC8hbxKZPqpxMDRg1PGOEY1EOiNklLQ3Sv0zP7lJAjg7OOJ3c1r99RAwO05
X-Received: by 2002:a05:620a:3192:b0:8cb:3870:5c1f with SMTP id af79cd13be357-8cbc112b3f0mr376956085a.27.1772129864770;
        Thu, 26 Feb 2026 10:17:44 -0800 (PST)
X-Received: by 2002:a05:620a:3192:b0:8cb:3870:5c1f with SMTP id af79cd13be357-8cbc112b3f0mr376953185a.27.1772129864349;
        Thu, 26 Feb 2026 10:17:44 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:46 -0500
Subject: [PATCH 02/13] clk: test: add test suite for
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-2-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3637; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Xv/Yn0DsACY4tPbVThHFi4E542QG5tcnAnMJGGRhnJY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9OmotiloOvscfXSnkXtJtmCyxnyLuwlHd1dscFCfM
 GthzvKYjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACby35nhr/zUY+r3Zpz6xBpT
 OZdnHa9P+bYTB4LOWWpWXPqieSVq0w6GPzw2L4wl4mxMq2xUz6okl9xT89teyjF73Ymebztkgq5
 KcAIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add two new clk tests related to the CLK_ROUNDING_FW_MANAGED flag:

- Test that clk_hw_register() fails when determine_rate is not set.

- Test that clk_hw_register() succeeds when determine_rate is not set,
  and CLK_ROUNDING_FW_MANAGED is set. clk_set_rate() works, and
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
index b1961daac5e22fb84f493f04feab1ff94a975d90..d7037eadc0a0ddf7559151068775a9d11429c02e 100644
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
+ * and CLK_ROUNDING_FW_MANAGED is set. clk_set_rate() works, and
+ * clk_round_rate() returns the requested rate.
+ */
+static void clk_test_fw_managed_round_rate(struct kunit *test)
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
+	init.name = "test_fw_managed";
+	init.ops = &clk_no_determine_rate_ops;
+	init.flags = CLK_ROUNDING_FW_MANAGED;
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
+static struct kunit_case clk_fw_managed_test_cases[] = {
+	KUNIT_CASE(clk_test_no_determine_rate_fails),
+	KUNIT_CASE(clk_test_fw_managed_round_rate),
+	{}
+};
+
+/*
+ * Test suite for CLK_ROUNDING_FW_MANAGED flag.
+ */
+static struct kunit_suite clk_fw_managed_test_suite = {
+	.name = "clk_fw_managed_test",
+	.test_cases = clk_fw_managed_test_cases,
+};
 
 kunit_test_suites(
 	&clk_assigned_rates_suite,
+	&clk_fw_managed_test_suite,
 	&clk_hw_get_dev_of_node_test_suite,
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,

-- 
2.53.0

