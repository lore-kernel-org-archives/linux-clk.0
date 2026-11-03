Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736544;
	b=vgXECvhn1E/JKL0gKUsRkZNZusI07pS/XWJKPOoI0RyTR5yrKPzxpAzPDWK+r82PCMpO
	 Vb0w2hTJVzO31Ey3m0v5JQLcZ4IotdpdDmV1q8vQrB7o33HyW6pHYapU2ssHXhVTrJa2z
	 5yqQoN6M0/5eWzZTj1O0u6R11OBHfoJkn+EP95z/QDPD4efU1AOaNsOqFaXwDC4Vekn8+
	 V8s02Q/R8rAQVEmOkETB1B4OMiZlEDTYtjNvkOzqbK1MUPeOO2DYIK2IihnrG/eUcm7u3
	 96vCXoCBEwjuVF2kTGPiGm/HU49RiOVak23l34N7aQj2HMFHUDYG4C8HESipThR1MRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SiyYpiRSQ+ztVQagUmVkqRY+Qe0aYhkJiNSynyd5qA4=;
	b=EuZAwo6kpVLdNq5P3pQVeWUkSysG0ToD5LD9ktsMg0Z80r4QvK4NofILOCNelAga1zoc
	 HEFa7Ak3HCX+/vH2OmYi1uzEff4mdoaUue2UOZM9i1O+aQ2zhAj29c5611fC4FZVFZjcl
	 wYVbC7cuGITIrJNPaoYet6ymzFMuS3b8UiEYk6iYhbJREfK1qssTugWROX311ugMc8rvh
	 1xa4fi9mOlpgjMqOB8KRcmJnZjNZ51sA5e7yPN/CsiQp2PFm6FuYtOETH+x3DnD0HuG1j
	 JR4T66DMQ2Sz5muE35JkgvEGMJdsjXzjaMNSuv8YK0DcdFaafwYyCFkedHoesrjg9Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s2iyhbV5;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0D0606A324
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 20:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D0D0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s2iyhbV5
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab1e5a01a1so16131fa.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 12:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793736542; x=1794341342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SiyYpiRSQ+ztVQagUmVkqRY+Qe0aYhkJiNSynyd5qA4=;
        b=s2iyhbV5eN0HZVUQ/5vYLGKbmkNY7emvuvZQe1Gvrc7hi7Il27K+MgrU/jwNVoqIsB
         gfsZGIeQeVnPLS3wBMdqwZYWSTycDCGUDa0A8LvrEHK+JXkX2fGEwHAYHyp6vt9i06pi
         6t05DrwWXWwkowbSaL3+hMFK6OHWNLrhhz7gOhN/CcAAXgFTBTnzG5SZPKK3ecZxAduc
         7idqGSxMt8cNXFH2nF4GEauhVYvwOZSA7RqKnU4XEBk8N9CBlIB8BNHM7jFF/P5FOJ9d
         5L4BhPxogy1DnOM/k9QX7nXLYmvQzfgiz2srXGMnj99sKK0PdpdADH5CIX4x03L20Jye
         GSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736542; x=1794341342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SiyYpiRSQ+ztVQagUmVkqRY+Qe0aYhkJiNSynyd5qA4=;
        b=tFTfH8o4FELg/sWLu7KmWVgrqrobeCdkECAfNwP6rHd+ZW+HLWxOcYBP+b0VmvnuXo
         khv2g6VAGOHsNz3uUS+FILQnsm/JUforIxpDoU7rSJzAOwr1U5aWReIgHzCnjkj6CBn/
         yP9zvYvJBoDeQd39F+sJ9EKedQcsulVLHBy5K0h2MJQMtW6OLV6Di9ghAUslwNCbW/4l
         iouMTDI6H+yKOG/y4X9LbKmjBNjSJ6iuEJdgg4C2jEtUMYYbqLYJgvrZD7l3Evr/yaMx
         QoTxfMyRr7x2NzC42gkkzaqfhoNuHl2fIb9PLsMj54tpjGLHbqarlZw4Ylu/u0did93o
         l5TQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8fO7QNsAIRFe5Ati1gDOnbYtf1IVSfY85nWP5meHqpd96M6y09Zr/7qqgc8y5YgHUcxbFcHHZADg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZC16nZaSr6is9b4zA9M5CUkJBBVHeCO19eIdTw6f/aB60PPAK
	r6DNPCThqIYiZIXUarN07HrHF1jvTQiMv6jLA3k+LrW0Li0rbI42uVwQxZhLS3ZeoHI=
X-Gm-Gg: AYBFou1I/bAiC8qWkcCohaaSSjNm0TDs/sfhsZisB8F/GFi7ZfKk2ile/wfI/36UOrS
	GaWduMDv0tPM29l4XWErf735kRUGBemAS9bOPAi75hR2K1EvKVxmFS7Iz0NNnlqzcWH14ZH/oyV
	bD5lmyk/XcnS+Y3YMyP2qToG+V/G0RnUf0VF75tC3+c1dUz5F5FAGZE6QIuXxPX2p7QGDIbok3Q
	Afg8rDu1BQyrd8oIVhhQz3Roet2IeH518ZVBjqp/TFmsmlhfno5ckxY19jPXvsJW2adTP2ZP/8J
	XZuNHVZftKfJyfLHRF8LtkbFJaBPThH/9JK2K/wsflV9/BK4+SSD2sUP1FTSm6k/eHRS3o1k+W5
	2n843l+AaBYGrVapmlgCL12//Aa43INOI70JwRyZEuRWf0TmTLtFBaJhEElVp3bDTXEJ4RlVAat
	yiBSbTYHJO1A7F4oKk2kxYg2NKS7Ei1n7R4YkbzUuyaplGfn9jPJmw8LnRXWI9VUFhI7z1OpURB
	BO8MqiwBUYp/PHmLs+NjkNs+QdQH2IyvVcN+7pCmjrVGtJZfF8Dinsz993GtUqn1lMP3qAxSXMv
	444FIoio3lOrwLQakzkRNZSziKIOVQf1jD8OsxYceAnz0+Ofgm5VsaFqUOv6KTivfRxJtw==
X-Received: by 2002:a05:6512:220d:b0:5bf:b8f1:80ce with SMTP id 2adb3069b0e04-5bfd9578721mr4929947e87.5.1793736542375;
        Tue, 03 Nov 2026 12:09:02 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff384c6e6sm79255e87.4.2026.11.03.12.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:09:01 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2] clk: qcom: camcc-sm8450: Use clk_rcg2_shared_ops for RCGs
Date: Tue,  3 Nov 2026 22:08:47 +0200
Message-ID: <20261103200847.606884-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On power on a GDSC enables the RCGs within its power domain, and if an
RCG is left parented to a disabled source clock, the GDSC power on gets
stuck. After a camera clock controller RCG is used, it is left parented
to a camera PLL, which is disabled together with the RCG, this leads to
a problem that on SM8450 the TITAN_TOP GDSC can be powered on only once
after boot, and every next time its power on fails with the message:

  titan_top_gdsc status stuck at 'off'

Update all camera clock controller RCGs to use clk_rcg2_shared_ops, so
that the RCGs are parked to XO on disable, like it is done for SC7180,
SM8250, SM8550 and other camera clock controllers, see similar changes:

* commit e5c359f70e4b ("clk: qcom: camcc: Update the clock ops for the
SC7180"),
* commit 52b10b591f83 ("clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops
for some RCGs").

Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v1 to v2:
* added Taniya's Reviewed-by tag,
* removed unneeded cam_cc_xo_clk_src ops change to clk_rcg2_shared_ops.

Link to v1:
* https://lore.kernel.org/linux-clk/20261031122037.565113-1-vladimir.zapolskiy@linaro.org/

 drivers/clk/qcom/camcc-sm8450.c | 68 ++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 4025db23d1a9..f0bac80d74fe 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -834,7 +834,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -856,7 +856,7 @@ static struct clk_rcg2 cam_cc_camnoc_axi_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -877,7 +877,7 @@ static struct clk_rcg2 cam_cc_cci_0_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -892,7 +892,7 @@ static struct clk_rcg2 cam_cc_cci_1_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -914,7 +914,7 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -935,7 +935,7 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -950,7 +950,7 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -965,7 +965,7 @@ static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -980,7 +980,7 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -995,7 +995,7 @@ static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1010,7 +1010,7 @@ static struct clk_rcg2 cam_cc_csi5phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1031,7 +1031,7 @@ static struct clk_rcg2 cam_cc_csid_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1055,7 +1055,7 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1078,7 +1078,7 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1102,7 +1102,7 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
 		.parent_data = cam_cc_parent_data_2,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1126,7 +1126,7 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
 		.parent_data = cam_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1149,7 +1149,7 @@ static struct clk_rcg2 cam_cc_ife_2_clk_src = {
 		.parent_data = cam_cc_parent_data_4,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1170,7 +1170,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1185,7 +1185,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1208,7 +1208,7 @@ static struct clk_rcg2 cam_cc_ipe_nps_clk_src = {
 		.parent_data = cam_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1223,7 +1223,7 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1245,7 +1245,7 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1260,7 +1260,7 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1275,7 +1275,7 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1290,7 +1290,7 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1305,7 +1305,7 @@ static struct clk_rcg2 cam_cc_mclk4_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1320,7 +1320,7 @@ static struct clk_rcg2 cam_cc_mclk5_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1335,7 +1335,7 @@ static struct clk_rcg2 cam_cc_mclk6_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1350,7 +1350,7 @@ static struct clk_rcg2 cam_cc_mclk7_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1373,7 +1373,7 @@ static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1396,7 +1396,7 @@ static struct clk_rcg2 cam_cc_sfe_0_clk_src = {
 		.parent_data = cam_cc_parent_data_6,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1419,7 +1419,7 @@ static struct clk_rcg2 cam_cc_sfe_1_clk_src = {
 		.parent_data = cam_cc_parent_data_7,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_7),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1439,7 +1439,7 @@ static struct clk_rcg2 cam_cc_sleep_clk_src = {
 		.parent_data = cam_cc_parent_data_8,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_8),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -1460,7 +1460,7 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
-- 
2.53.0

