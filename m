Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A41D36C0DC
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583810; cv=none; b=DAstRXFvs1lEzeGEOi+ReYoqdzvqhgEs7VpxtxTyVGII8jM0bT6TxujmPbfK7/pbsbOeuh4LGZv2skqM1HMJdAWl8TqscMu/dUCjLeBiQ+FLLM4mnC3O+rTtzk3upiduOEpsERzJVmcw7u0igb8NpO17FLepxUGlQIKIXjlwv4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583810; c=relaxed/simple;
	bh=TdJ1z9fnJv9Cwe2UxdX0lSqEP6tGIURNZuGinVjnLHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IsPLeim2dYiO9F1O+ljuADwxdWh2ptibINr04szu2QND89hgMNBJQdIFB0p1Zkev7pCPjnH8n21HPXcxroe5g7w/aUuvdrztAGQHE3RaqUwrjNmS5d+6y/sjDRidkzexlX9wKec7itVhJV7pQJY7FkxNmnxUgEnqORA9SxSJu48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABP83f9g; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABP83f9g"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so4563825a34.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583807; x=1788188607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/T4NeVLI2Q/E0biNa8b/pafq7wYXWTnIin5DSqXZ6bs=;
        b=ABP83f9gL/fb/JtarmdO76pXmUpwzaW1UcotOQUWydJ06+WS8RcIy615OqDjYW5S6E
         CHZifXaCfmzAvi/zEbw8w7i+DK55nr0kaD8805zROuqyPb3Bnfk6432CQWRsOEzcw543
         2zF4FGNd9WlO/06vOJDlIOBvgRBlh7zowqAC1b1r2x8YZZ3wWzoq7R+4SyGXoUhx/NxV
         tlo44+99QMJ2t83vG+tVIpAYozmqXXfif9/OF2OAJDwMXvsEXcUtj19eycoLtoWx9wsM
         IBYj3mWba81KruDIUKkxfvYnqMIXaYIrPUCUPfLgDDL6+R6GCdu630lBl5059OfVeVcS
         4c8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583807; x=1788188607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/T4NeVLI2Q/E0biNa8b/pafq7wYXWTnIin5DSqXZ6bs=;
        b=hPXDeBG0ff/5ST1Y2mmCUbVb2NSVR/nmZB7/0C4HVVFX/1aY2eNq92yRP5/zYNsalX
         Ntrfima2lCWpNLEn3QF37lZWL0l2BJFvAI0PfaLsFO1o9D6L558vRERkoQPNJQCI6iCp
         YahUy5vN7Rss4CPokMAUqvnhRd3iiBmhwhD1l/FLWadm7+rVkb7260EEbV32efIQq+1L
         F85CmYGwEnxEd4tV8kxGByl968EWJXKmwKfu28mfN8xRlWdqqG47y6kLKsENiVJjYZbL
         BForOaWsyPseV52FqNhHt4FnnUr/IpwNapfouzh+Eqi3QV2SmPo4TEQl4u8tg4tqh29O
         kx+g==
X-Forwarded-Encrypted: i=1; AHgh+Rr7ew05/scDFXoXI2cl9hjeax3jpDbivY9SVcFbThRwNy48b5GEFVGwPFgoXNEWee5pJIqjCckh1ic=@vger.kernel.org
X-Gm-Message-State: AFuF++n3SniGsLCd6lfAkg2OL6qVZe/qEZTe3fWBUiS+msRA+jDToXkr
	xhP+DssTdKVoN1sDarlZf/T+aJ3U16Trj8oapUhgZPEY6t3EfYcm/2Uh
X-Gm-Gg: AR+sD12TaPTYZSFDWr/4fg4f1oHpOihIkCvvviCslmczu19gkF4rJlQb1nCqyXotRdb
	V66PvDAM7Tnj2WkCNsmDCNRw/bBHvfdai1WzNAf8EmsufQhzbDScBD/yqf/69MvMRim9XePvYbv
	MUHbLgfEcGE34gmdplPQjuek+d5zdwycWZwMf0ModLpRejg4MIC4jTPW3Yw0kFgH3eiuCtScwhh
	ZBny5zk8sqqctENBwYOFKDK6ljLJLEWCVk42lPyg3PHZpj0okroyYgIz8t7ycwI5MEhUMm1E1x9
	YnSrnenC2pJlyjEA5h2iWOuPb5l68073ZP6dLK6giOMhw1uCq+DRmtsiahhgpB7uox4N5kIyPJ7
	nMOVYPd8ZYa9hlftMvYF3J0loWDXGjc+srXcl9NNw7vT1qIEVFO4OJEqvrW16dr9RnfTHhXTKeL
	Fubj7JvoCHZY3KszvwAt5Zjw5ORwyDLvWcs3zO8/FOba5Z6p3ocxVVs+xK6PE8Sx7e/BsIIJwEs
	KRt74j32bG4
X-Received: by 2002:a05:6820:4c82:b0:6b1:3496:9ab with SMTP id 006d021491bc7-6b1591a0a16mr27505315eaf.2.1787583807237;
        Mon, 24 Aug 2026 08:03:27 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:03:26 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 06/13] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Mon, 24 Aug 2026 15:01:49 +0000
Message-ID: <20260824150156.1310-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RPMH clocks present in SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6367b2a5a..f4cafa274 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -1011,6 +1011,29 @@ static const struct clk_rpmh_desc clk_rpmh_hawi = {
 	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
 };
 
+static struct clk_hw *sm7250_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_d_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_d_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_d.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_d_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm7250 = {
+	.clks = sm7250_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm7250_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1120,6 +1143,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
+	{ .compatible = "qcom,sm7250-rpmh-clk", .data = &clk_rpmh_sm7250},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
-- 
2.43.0

