Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FA52E7F06
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638421; cv=none; b=MlH2ldy2JVtvdySnghYW8ptIo86Fzadcb4beFx+rvjNjF0+sn9iLFoGHcBf/Wp2o735L7zhHz1y+1FNWV866A8mw+e2QcrdNyPTIbJQNfYE80YH97AuclAk5rRbjD4On694ORZkgt+OEwarqNMtkv75JmRF4GyVqViLicRTHClw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638421; c=relaxed/simple;
	bh=CBq4gpUSfkFVa42LifJPSpuY6RfDWwyJToNVFFTmN1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQABGYll+K6DksP4HKIK+6G4yqnEcthmznZOzMqsEafK2oSAujme0+KWMYt++kV4q1O3cGDpuMtetxr1dtUbfo/YdvEx0NYwdlCS7HXAFM2FSjKN6K36VT2ECuh0SUqv6pT01OEkJewqNQbpi9hzakeMPV3int81gWXAkYEMuIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XNNV7yQg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XNNV7yQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/qs4aNKvqEO+6lTRrN0KMMX6ekNLCCx7OU6VhGwFBo=;
	b=XNNV7yQgDgi70jT8z9JqB6rOMUAaKftc5IkUP/7o8A+MlAcUty1g/ScBnGOT/5ZCMCVKBl
	RJezfUySMX7kUb2OTDiyP4d+eSAtfYxU5y361TB3sN6E4xp1Lp3ygAsPEtTAPAvl6vBrOi
	wVlo6tCfeP6gWJ+UBLS/CO+W/gSud4A=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-ORDaQNhsMLKByxG7nQkPxg-1; Tue, 23 Sep 2025 10:40:18 -0400
X-MC-Unique: ORDaQNhsMLKByxG7nQkPxg-1
X-Mimecast-MFC-AGG-ID: ORDaQNhsMLKByxG7nQkPxg_1758638416
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-84ef374c241so300924885a.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 07:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638416; x=1759243216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/qs4aNKvqEO+6lTRrN0KMMX6ekNLCCx7OU6VhGwFBo=;
        b=YMRlW5rkI4RWlGJnxHo+i0MTO/0b+qbZxdfseuwaVBsjpY4c1Wwpn9GryWS+nEPu73
         K2gn4FNSXJ/0RO+oIk8+/bF16Yz4D4qlzh7vmjzBmK2aZgbZAbrv04kfhIj65IuA+sJI
         bKhac7LV63+LKuyRiDaZWH6KNf1SJB9zVitqBsn3KSvW/4aSmxAjsrNkfnoEUblvk9Nk
         yaayuM+8tuhlMpB+MnGwZMvE4VxLGllqRdTR52oURcYfF/dFEelV/leZTmiXM85yYnVW
         soJyeFDyWHlOr/KLsuWQxyCA3EUvDjANrBcE6vP8WbV9Bq4J2nl6YXNEDVRrD4uYyzev
         ErSg==
X-Gm-Message-State: AOJu0Yw0el4lMNH8iCHkGhBgV5OlIcoTBs4ghGs9zkjQfufCKic7iabe
	1dRs3yJvyeh0vM8jbnptDWVyC3RcuhFSL4jsYNBQb57pq2Pe6rNpZFjabem9khbYjyubtsrQgmD
	gb2HvZ1tUzQhpO2OtG4a/yYiSMKTTI4dkNp1W/aVAT8KcJBtd5J0DLwRJpYkXCg==
X-Gm-Gg: ASbGncuubIxTD2AjrDESyZaf+80k4hMMoiAGB0QroY9iG/efq0uixKGPdoo6J0RDjoI
	LXnrQ88o8v4jLA8FxZm/tE4o5itlslVbShsyMjtChiW9jbvZWSr4Lqmwfvmcfe8FpKn+ceV3VYs
	Q57RzFGJMgCGajE4aMCvEQVhdb/z6tHNyyBK0H0DlZfPllC3umgtoJay0wqbCer8A9r8ARSUUnL
	kjLVoTgKNkkDbB8cFCFVH7xCcqVY/Ei7iJ9BdLXSmHcQD3XMJtDyI9V4sBe0TTI8qXMoG5PW82y
	Dwx5EcHcYkwV2O8K4JkDlWTslgUvaBrrfZ+d5icZOsnc0mQqIXDx3RT0lF0U2rrTJt0fwZSCpHk
	VT1eMJyhFA3aFFbYMEPMrBbYv+8TmWnzSY0oI7nI=
X-Received: by 2002:a05:620a:7006:b0:82e:ce61:f840 with SMTP id af79cd13be357-85177762e54mr266599285a.84.1758638415968;
        Tue, 23 Sep 2025 07:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkjrs9K+x4Mp+DvIuL0w/NCd2l+jLO7z2+XRg4C4o1bR3l4p1tNVqZ+0EwMNqqqZJaF/rzkQ==
X-Received: by 2002:a05:620a:7006:b0:82e:ce61:f840 with SMTP id af79cd13be357-85177762e54mr266595085a.84.1758638415376;
        Tue, 23 Sep 2025 07:40:15 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:28 -0400
Subject: [PATCH RFC v4 09/12] clk: test: introduce test variation for
 sibling rate changes on a gate/mux
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-9-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2523; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CBq4gpUSfkFVa42LifJPSpuY6RfDWwyJToNVFFTmN1s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubTRQMn2475bDjy/SG6e89L8/e8PjLZ6GU+LsQ+ckb
 NYvnbh0ZkcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQAT+ZTFyDBX2/hd7Cu292bb
 SsrF2cw2+h78ud5RIWZP8kZO/Y2/Dgoy/GK6OHVfkeDHO2o2Aqlnrlzlead1ULZYRPhTle2CANu
 PbZwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce a test variation that creates a parent with two children: a
gate and a mux. Ensure that changing the rate of the gate does not
affect the rate of the mux.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 0344f3f62251728e15af277ea0d143dc1f40fd94..32defaf1972c28224108c32aef1e74796aae8bc0 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -949,6 +949,46 @@ clk_rate_change_sibling_div_mux_test_init(struct kunit *test)
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
+					   "parent0", 24 * HZ_PER_MHZ,
+					   "parent1", 48 * HZ_PER_MHZ,
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
@@ -963,6 +1003,10 @@ static struct clk_test_rate_change_sibling_test_case clk_test_rate_change_siblin
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
2.51.0

