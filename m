Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9780D352022
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 06:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245128; cv=none; b=SMM3bUHZSvcvv8ymbmXr0xiItipd0jUbLcO2PY1prQYOdS7BjqOcC5hvlNRSKi+zh3DVGQXkxmSwkjTvrZtnoeKqIP/cm5NabCd7sA4jioOytQvbU/A3vT9TksqcZieNwgkiKAmoOJ9P1lzIiOoggkHeJs6tknUkFAQD9S68Kfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245128; c=relaxed/simple;
	bh=WWiZETqtERmFbujUpcdTmbmOg/Oos2rIugNyk5YbX6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QA8uKZVxc67vyNozMfoNQArxmh/4rv8OZt/xjk/KYoC8z0gxbVO3ig7oB23/xf6lThulEOTYvjJJpEFfTUd+NLtWuhQbn8Hesaa24INZDzVJupGhKPbMkig924BgDEO+W8KVyNE9zRoHJ21jiEgufp93fkVRcvkXNfbKeraZEYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGd6G3AP; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGd6G3AP"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so5066520a12.3
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 23:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245126; x=1788849926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQFudH3aykdSu1uFZBUbXQTkxTQGqISY8X7sgzXiGDU=;
        b=bGd6G3APJbxHwnOOXaFnZW0acsElzkkvjG+rp3ScNoL94aIlsIUFnGjxb+a5kkuwrz
         DuZ0Iw7YSQzkbT3iKbaaksRUD4bNaia1Qi7OJpFiR/ggsD2PCypArzu4J9OcmjFIwJO6
         qs1FQOJcJetlQlX0pJKT0wVJfXIs9IEfYP/X1moDfPnE/JRP4NyTgt0EIrDambZ0dYYe
         YX+TzxvnBK2ICpW3YTIxe5g1rwV/I4hKsDjt/IJlCNttTDsGeSv6WAAfKkfhC6TgMLN6
         wpg9i5+uMqxS5ACeAa0iADCU80PL9YsV+4nB0qYGFeLAyQZz/iGo7NiPTSie0YcgeLMI
         ySKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245126; x=1788849926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQFudH3aykdSu1uFZBUbXQTkxTQGqISY8X7sgzXiGDU=;
        b=O9yT64I7mW64u+3D2AoI6eRkKMND9woEoPdnTn36N4sN8XpmAtpcyzyG9TDKl1gwmD
         k1vTO0OVZyWsJOK+mUbWcnJNKHlI2evb3pGv5Pj+pIQuQSki0Fs8SYmT3DAo2bFG6GDk
         P5rwcio4jdqgoc63Y3sENAvL/Hjb4eoBFgWgTo2s7TgU38e34mQk/IrZuwkgGVB5cXUV
         0O/hptKxllZ2H7a75b/WRrRpeLpKCp3Gbo2d1vKl86x0tMX7slHJ/iiCixmA6uQJhmeh
         ws6gZLeTA1e34NrN2+riySjw6E23atBryr3uZiGV4pCUtPHI0fhXOypcTuKzx9JcUm5f
         kqkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/E4n+tpXn5txL1XcgSvon4iSGd3fMrdVfMDf5V85y69qEI5QfupJhTZ/T6sIqkh1Jg+/nPzgZz78=@vger.kernel.org
X-Gm-Message-State: AFuF++msyBM+fT3hzg23/rmv8mn4c3k9CXZiMJo5dCW8swHd5eFj+awW
	8qgt3+OG6sKYyUrk0wqOnX154ql3DAkWezoP5Eqvqk8cY/gWmQTmiOsc
X-Gm-Gg: AR+sD13mlIFIIsWKN3KpQcofRA+r03K5UjR1QFjUmSvQiz0BEkjodCrMmXMQ08yDoo/
	zMiC10cWBArZ9jkdGv19me4UuA3CjhxH3NyqmhJeCyCWzS0sAJQW6KRFrZM0lM1RBVV6kqkNLLs
	R6v548gXqpi9Tzv5xLFdNhxFAEN6Ibg8qUrIBPuNRYxUd3v5c77SL88QkGeW4qsVLGSdx5onrsY
	WZx0zIC/hN/2nMt0Dgk9ONvH4clGH7XY+nn7YX8JNwfINsecquBYnAo0I7+sYJKQ+WEzyUGoPjK
	xB42YyJAQmFpEC/Htk713eNN2S55mqCusQUXJA2T42bvqDQhCK3YHsP4CylEtC1e7owODT61Xuw
	S0tDqItc4ouqZQhoY7OBdkmiiPd1McTKYAFbN0lcSwEpJ+16t5LPALsYU8BcD7XHEs0fuB8eRgl
	rGL1puN6Jx5+xhnQSuCsPNThojERTA0JQiOSgMi6GkrbYkBj1xXRiM6m0crVs6sePe8Us2fMpXN
	cLyJptqplrS
X-Received: by 2002:a05:6a20:3d05:b0:3d0:ba81:79b9 with SMTP id adf61e73a8af0-3d7ae3d0e58mr9536560637.12.1788245125743;
        Mon, 31 Aug 2026 23:45:25 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:45:24 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Tue,  1 Sep 2026 06:43:51 +0000
Message-ID: <20260901064357.20055-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901064357.20055-1-sreeshankar0910@gmail.com>
References: <20260901064357.20055-1-sreeshankar0910@gmail.com>
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
index a224a94ae..5799fa296 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -1005,6 +1005,29 @@ static const struct clk_rpmh_desc clk_rpmh_hawi = {
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
@@ -1114,6 +1137,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
+	{ .compatible = "qcom,sm7250-rpmh-clk", .data = &clk_rpmh_sm7250},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
-- 
2.43.0

