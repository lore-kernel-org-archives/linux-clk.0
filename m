Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D5D41F35C
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576767; cv=none; b=aoPGPcmmbvXarihNDUyYSaPCHNuXt0kR5A5dIwuW1sP9mLb9yOqaPU52RH4IxrwvuA07RFSMs4VLQy4QITkqSRGQmPQ5DJ9paXHvzwOJ4i/mhai/xWpVnqTOt0/QKqD5L/BE47Dbjz+Re2Lt0/4COslL6CtHWCu9C95uKreU1eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576767; c=relaxed/simple;
	bh=GZpOUG3EXKO+QZK6dr4xOMkQjofCkY8f7CgoNTh+PnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3DCXqei3JHXMOebR3lcNTki/k0BKCFCbcMWqO/KOA8patbGG4aLULj0BUSPpiqgXc20jAGpOvd6tzd6Y3fDn3fbQZ/mxF60WWIcPjIv/tMFryU0bbsDqyD7+K2mD+nTANImpMuh7vfBLPQsmr3p2c/Jdz599K28Z3f6K5CZqNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MN2SSsGA; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MN2SSsGA"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so4370769a34.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 06:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576765; x=1788181565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgYAs0kfLDJbR97gF8B5vdewU847vzvHuLjE+TGmj38=;
        b=MN2SSsGAmFUOafXMXwNjHhgFVB74oZXbNt8iBYJY7K9XUt7C8fcPQtbSDFFlPvE/5P
         FrUHJHs/cZop1RMKz3FaPgoFF/VmGsV6zzVPh0Rvdhq6qRr7I9ZLLdcem22K96CVzsJR
         KYJLo+Vv2g+viIxPJgVkxqvakAf9jHZdiIFKJgWALsWBnQDgICzJT4iGXpCAmUG4SbZz
         r0g9skwZayV/oj1B1VdJDQvgTuYQGqPcEAInpVs5dgGYxV3mtstPJvuKJb7OB+6qJUIk
         PNHn21m9fcvzU01gpHTGYVVnkj87xY1rC3XnGWwIRQ203+/PPOyefzS7C3cwf+EsDqj+
         WZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576765; x=1788181565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LgYAs0kfLDJbR97gF8B5vdewU847vzvHuLjE+TGmj38=;
        b=dSUgdAI32dPKVLgOYFsPz0Ux3dThgQdcRcLjKlnu/L9RkXXYcrJnWqmdD5wS7DVbg7
         hRXerm1frJfC7kcqvGEQ+T/PxgnMtst/u+mXBHZsyRUUppcrcEKg0csRGLyjiBltOZmt
         l0uBC7JDBeJ95oLboomT99oijkIB7v5gLJ0tXb5E0wvQ8UNxlgaba3+Y73s0rysNjyCS
         8yNoDPxU4UgSJXxSBkEtb03JNqHEFK4GqFxp1o7uU+7pLFu8Ao8cG8SROZ/CT4Q9nFTd
         2ms07RnoGyjQWIatmum3eu6PKaeZDGTynFOdFwyW00b3EMXft0dXoszZrjOAp8b4ASnR
         ko4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrQgI+CpF0XJ+Vvxd+pMExXdBj9lkTW0kfx25w6KAlGNmyGRmv6GD+sYPuFFzaOZ+W2Bj/8I+4qKDM=@vger.kernel.org
X-Gm-Message-State: AFuF++n22sB+492Y+5yyUx3k+RVeGDWgPO54MN92e04T8Dij8Vgq0AzD
	qYyCiy3Huo/50OvAMe53C3MJ3nVZru/wXomBqIgdniDBcBxqLXnhmyqU
X-Gm-Gg: AR+sD12kyxhlZUeQ9T9RahA8Vq930cYlJXmsoXTugEtSji8fv0V3Yw6yDO1GKFU+FaP
	odRwLL1EZqTirww+/8O2JIT+m5e24cq6ZxSAJMvMKT98jiFVoPhEHHTdiHX1rTvNptARY6P/ntA
	FYLFhhT4zP8feJ+LV9ijaSQDFdYjrh6HusjL+MMBziBzc5inEKlBuTAezoi3HIxvwLNWj+dy12x
	lDv+LhYcPPUMpsKDty/60AYVA/7TEuHrDkVtK2BXFE17689IxWzIZ5gX8lnDf5XjUMVQq66g/fn
	syg2d1i5fD1hTSQi3Oe35Bp2YvYCYDUvlwPtbXcW5XtcpiC5vEm23R096vkM5qhWR4WlvNaKZsh
	xCUILqGPGs5J9b74xQSfj1tRi6HmivTEstQtTFgZ2/sx9Zqt15mBbKUxk/6BsoMWfRjUykyQtSL
	62rKILj9F9wpePffpvealcTq1URwOs86EI99yhxPG2Rn2FGVt3PYbh33Wd7GPEaqL4a6KMPN1g+
	sSCEXHPJrzJ
X-Received: by 2002:a05:6820:1c99:b0:6b1:5c8b:c0b9 with SMTP id 006d021491bc7-6b15c8bd304mr19796060eaf.3.1787576765018;
        Mon, 24 Aug 2026 06:06:05 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:04 -0700 (PDT)
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
Subject: [PATCH v5 06/13] clk: qcom: rpmh: Add SM7250 rpmh clocks
Date: Mon, 24 Aug 2026 13:04:30 +0000
Message-ID: <20260824130437.2771-7-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RPMH clocks present in SM7250 SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

