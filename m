Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F53129B766
	for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842797; cv=none; b=WCoebv3u94bFG6UhJWLo61ME0t0OhZx/d4y9EAg5TclZwca4iPf5XwVqiI5/37jJmR5+qWrUYee2Q5SJl2ESLKsLbQRF0explflsFS0Z+veyQFuRFZwid1dGvNbvNEA/Db7QpnJq1ZlCXhrFduGXZGcQ11/AHRBCy115Qpf/xFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842797; c=relaxed/simple;
	bh=33aQvmJdtCZ4HVQ5M3x8OGvqlh+JGvl1nGP0weshrCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMbu8hktLQFS54qmFUxwNZTfcYGc2CIGK0azKqE4nH9jk0+J0XSCrLg5JoN+9LlkGrmuhac9G/XvccrEUI1+DNLQhB18G1WmRFcqekuUUcVmxYrvmVjONA7caxl+iD6KBQuAy2HOuK2eyvsu5lL3zYvnHP7rn9/mtE04uATLTyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1wYzlCBX; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1wYzlCBX"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so10983601a12.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842794; x=1751447594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gy7AzhYFaEI9pZ7ea04p55QtlZnkaCQmLbJHyD0ZDVY=;
        b=1wYzlCBXoDeA/J8PrZXIKnNGzMMRgvxpqqc3s8pkEma/ePBof9AGbMY+7bcX4Jh/47
         magv1WJxby2P/IK7Ffr3WpW6MalycuL926Lum5igFLJPGELJgS82z9TcPyfXPvUuUX+g
         7jIMfBunO24mYIDhXaSPcsKcW7INZXm8PkA6Lk5SGgPskqHEihfNHEA53UAoOLkP2fB0
         PnrKL0ikrK25Gnk1SfovrtW9yJoIZhO+uUtbq/Ln0JehFjb0cYNZvNEk6kMaana0ZQzV
         rVVXvYp7LYd3I4COt3i1Ufc/ao0iJcz1ejsjT9oFzIvNv4Pyv15tUZl/hpVMqyuDJxpH
         jaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842794; x=1751447594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gy7AzhYFaEI9pZ7ea04p55QtlZnkaCQmLbJHyD0ZDVY=;
        b=DcfyDV2WMJvi0IGFM++VwdwCqpj/8usz/R7GuXsXNiVGEhAv53IvXpPmAtT/wfxXEp
         mjXZdkvjhUXy9TgdIrpIX/b+4ncc4v9kVVGLqA9cynMKZ1b+8JBwb/6dpBFRwF0sSnG3
         Iu+V48tcakgz3hHsMEaxSsOox/XclxmIIvX16xnY818ao70IkgBj9RiG/kMDx7L+hVSC
         UW1UYHof6PZSK218PF1OZedw3LwqZhOn5tQi0l+k5dV3zoBiutuSRTDB3VG4BtAmbUO0
         kXGDFan/Ftb8mqwLRkX8mAQN4pMADGKUB/L+ZHdnfc72QClwEzQCENkycMeSaCknOGfW
         3Qjg==
X-Forwarded-Encrypted: i=1; AJvYcCUTAbzgUEDTD8cpEKHZ4jNbBQzg2wnbCPwNA+z8i2iV9BBoQkmfhByZfZfY3HD+++vmAGbKjdRwvVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3V3g2IwDoXFnKz0aWkMAS+eBIRgraCE49GSlGczup6aNlTSg
	Jb25K47s+UZgyfN9s/AvxeCCm8gxT7/pfWy9Uyc33hbHIP45SUP1pasbzmrP00dt5ug=
X-Gm-Gg: ASbGncu6kSQyWoPHLBUfzKE8ujj6avPKSxtgDNt9CQjcG7+XuLwuyt8zkld03YhquzS
	U2VuPzky9KHrh2Mx70Mb5K1zUxbAjYWBCjcTkVapqFWre3CmiYgn1OZKcvSHqxhoiowjHmT/Ctb
	bwvoAdBhuVH1Y3W8uSk5COGwrFClH7myYx5/jEkrfTtc9Ln9515uzcC197Vlb9J7RX6Z29+3dkB
	sCoCjw2RA+U62MZANeigupAAj/4w7Fdr+pu5vdpMawHrA7xZeUCXzeRXVIehUg2KLzoZq9S6TL8
	my2ri06Qj5MPAWSvcLM5eRrEfCvemaPIryPSNHKG0BvFTwOvO0eig4FlJ4adM7Al3O7Bh4rneOq
	v70HeBtPYYdYBqpmxusT+uVIChP8Csvh5eDI5VI4uKa0=
X-Google-Smtp-Source: AGHT+IFvF8x9uHbtysnAXyfi2dOz4+belael0w8BOhLbLcXWnPa/PUMKNrwSjVsMWvVc15op1RjLAw==
X-Received: by 2002:a17:906:d7cf:b0:ad8:9645:798c with SMTP id a640c23a62f3a-ae0bea2df07mr203465466b.51.1750842794312;
        Wed, 25 Jun 2025 02:13:14 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a93f5e96sm272499466b.74.2025.06.25.02.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:48 +0200
Subject: [PATCH 2/4] clk: qcom: rpmh: Add support for RPMH clocks on SM7635
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-misc-v1-2-45fea645d39b@fairphone.com>
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842791; l=2471;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=33aQvmJdtCZ4HVQ5M3x8OGvqlh+JGvl1nGP0weshrCw=;
 b=IsOl1W8gyKyVDOMnYOZzWLyktLzpaDaQg52tafRQzcs185XnFZiDeolLZ0XlVQxPUj/eweCHg
 X774OETGXZHCQmo6/UwwsmadpZXD0aNU/CPxeD3eLyMa/ZoW0YYmCGz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for RPMH clocks on SM7635 SoCs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/clk-rpmh.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388ed24ed76622983eb5bd81a6b7002..3c953af51b37bb998020512ec29bfaeb38ba6881 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -386,6 +386,8 @@ DEFINE_CLK_RPMH_VRM(clk6, _a2, "clka6", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2, "clka7", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
 
+DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
+
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -541,6 +543,29 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
 	.num_clks = ARRAY_SIZE(sc8180x_rpmh_clocks),
 };
 
+static struct clk_hw *sm7635_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a4.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a4_ao.hw,
+	/*
+	 * RPMH_LN_BB_CLK3(_A) and RPMH_LN_BB_CLK4(_A) are marked as optional
+	 * downstream, but do not exist in cmd-db on SM7635, so skip them.
+	 */
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a1.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a1_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm7635 = {
+	.clks = sm7635_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm7635_rpmh_clocks),
+};
+
 static struct clk_hw *sm8250_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -958,6 +983,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
+	{ .compatible = "qcom,sm7635-rpmh-clk", .data = &clk_rpmh_sm7635},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},

-- 
2.50.0

