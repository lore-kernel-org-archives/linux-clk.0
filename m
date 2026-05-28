Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620B13B583C
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962867; cv=none; b=aZGMgKEg/Crhtv/Fp+5bClyMQTNc+asBZ3aFRWBeFu9OIUxfzbgKb4nDzAEgpKYXRsWCmoHEDmUOtT3NbGI1uUxqdLncp0yJA5YXvCkyFaL99+ZGAKOM5rfi9H/ELieejji6FMz7EeWnGeecoux9ItPoQMesnHcG4ZSg0JmQaQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962867; c=relaxed/simple;
	bh=s+tAFQWynP4FEurcpkqp4lvBgWrs0E8Ljg1RJ4bZBmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aQOf/U+7OdVH7r6ut/xdm3KDD8IMN5POFanypZ+IUnopO+SkX5ks3bUKZr2XmaHHKvOz3STUHa/xsHgs03diJgR7CsxRYT6MDP/SJ5R7V7FKZD5eiZLlJsR43lwIMqKLGSxvHhYdpijtd8WllBTH3w1m44eV1e9Jd42lRiwHMXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHYxw5GC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZvxKZsM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHYxw5GC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZvxKZsM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vUg53203253
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8WvFekrIRFFLcAxHpLyvBVm8/1Vp7yHnSBk/lA+7KQA=; b=pHYxw5GC4RZgy/eN
	Quo54oSfMLuXWfR8+2eohjw/vDVMv0uPsuRksctEluC7V64nmvxuCTH1Jii3d56l
	orLlcyJNwGH3v7epf1uF2ea0BdZLctDAtJpTGMctgDPFEOVa0hTXnVs5R/HkPd2V
	Guib1TkbE+4h2Sgf5kJNZaULGlvmRQ/99w1SEiLl1u3Zqmg26ORYwZ+yXx0wqrn+
	nkFxOd1dP+qB+nae2yknuCG75j09rJrvxl3E6rD/JJm0O26K9nT8GMnU2qWZTKJO
	5lcWUbDN6ExW46GW5dmiZaV0wvW83GNNzFOLHMajZvoaKjAaMO1RZYyHVE3VkD+n
	oyYSxQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjb0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662668b825so6650456a91.3
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 03:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779962865; x=1780567665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WvFekrIRFFLcAxHpLyvBVm8/1Vp7yHnSBk/lA+7KQA=;
        b=VZvxKZsMqUliI5jDTaFWJVTbGNUYBsWmcaPOorhyNRWuNS9rhYMnr//zCpYomaFkEa
         Jr5q/0EkDGtzZgLJPHgBviRC1y2BzlMQ1L2oL8EVtFD4VS6kIDDlMGep/UxP2IoQvmml
         DRJfYW7+8QTQ6osr0uUdMLvfSZy58cKVWxlbi8WFCDI1EXCzBSBcCUdWU3ydYByDFtNt
         yCCrQhOeTSbAsk3rGHbT8bYrCPU5YG9s560I6ncEuFB7C9bmnuhfmdloVN3bjfzkICfQ
         gS04atK5PPA+hmG9lOZEUBhFVvLCVWIwxBVilQaFlTV3auwIywbHiHTroKbfHs4yBOYC
         6gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962865; x=1780567665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8WvFekrIRFFLcAxHpLyvBVm8/1Vp7yHnSBk/lA+7KQA=;
        b=byOPAhgJ1pxogtI8vcE3ipluYwzgLnl3k6MTTd8sNPAdh7gQ+/t4XWQC+3ty1lwunM
         n79N6GqF0UUVXdLIMnvuKMa88FOcUvU84L8wEJffV1ThJ5yzFI/tGJQNkn3gSVIjZwlN
         8nalwBanv5CrDuiFIwkjZs0wUNnRNNFF71ob5/RKWaZPQq22n6TIYgA7z3S48LpnV4Yu
         LYMTr6/EIvOuYsLUE4yTFr0omjzNbEfrwR6lx0uZemKak4l2qn5Qx4RbgGyHMFvlumhF
         Wh60jOxZPTX7O24zIi0v75kVvkKzkm75qDYlc4Q+ot9t6BrGrh1y0avzC39tUSNZXfxK
         rraA==
X-Forwarded-Encrypted: i=1; AFNElJ+mW6psPGlcamnGIKBgTe6ovMjjVIIo6R1KUjSOJCJeEHTXm5UaXmLCe/wXCt8Ern2LoYY2uBrChAA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy70D/y7VUjr/rBljC/718XAkAUZZXbkKanPet7+dtgVLoI2bYs
	bkrzAQQfzMw6txPj/aUDqxffOIanS2LeIqLdET8UMCHZqQrU9eyWKRmqjQPyHrCIAiO5PBAVG8C
	dewk1gHR+APNUsggXmLeoJz61YFmPECK/4uzRtAJ+wlwrSShFCdFq53qTzLQwg14=
X-Gm-Gg: Acq92OFlkQDBueHOBkV9+/7pmwTnsR+2YVmpHUO8/t6UY+cBpSmhEEknV4kNiE4jJ9w
	ziT93yDKkbrVqTPuMlJxMuXVarvnPkmjsg2JsNGDZHrgyngc/yu4Iu4nhza9lFC6XRD5dQFNMmf
	JlI5GoBFhnibp0GUay2EzFwZYPme2c/Kg8ilM3gxaKF0xx+x8qyEmhE7F33HkFf0z6hMeKGLFTC
	JvF55xQ1jKRnzZ/o6Nea7+Jau8u6bwZ659sBEGbFIeiZuVLKq35jyDB4yX0Yvv3vVPMARfwhCAV
	X2PBCubEbK1NQsw1bZpN6clekqgyYwaI4xsqW0ti6dduPbGer1LQKr9TQBKuqwpmKTkgSghH8jX
	DL9+/FaGQsRGFDMPDS0Rs3gFlUBbu2jRNj4kkU1NwHYzxkzLuP5Lgp9d9X7VMQXI=
X-Received: by 2002:a17:90b:3d09:b0:367:cb53:7435 with SMTP id 98e67ed59e1d1-36a678478c0mr26699319a91.24.1779962864874;
        Thu, 28 May 2026 03:07:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3d09:b0:367:cb53:7435 with SMTP id 98e67ed59e1d1-36a678478c0mr26699284a91.24.1779962864454;
        Thu, 28 May 2026 03:07:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b7e38af60sm575296a91.1.2026.05.28.03.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:07:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:37:05 +0530
Subject: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: Add support for Qualcomm
 Shikra DISPCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMiBTYWx0ZWRfXyA8TqhEYcjbU
 iACfx++83qPiC0WF/ydZNXIOBeD4m/S+h2XCuGHD6PxleLJvZfPQk1hOpGLJivE2KkNPbuGdTsC
 PiG+s/vcAedC3L2YVlA2ONATgXCIe9A+q09zNL4jSxJSjj6gZz4AnlWanh8+027GchWCA74Q56Z
 ZsnmgDisUIzl3UZmRMwGuR5AQQRCaf6i+QEH/hCUOyytfgTVFfE4kxQN/V0zdN9cWE/Y7Dudcnz
 8GMOx6LsOwLUDTdGRNngW5I5cQfvQJBg+OrF4ZUirmJA0Y95x1Gmxk/7k4ZVs7xw1qKXydP5jdL
 regXD9JGfpTSM/7xM+zeTVzHt7E7aoagIYWsniQGGpgSFvxYhLE9Pyhn+1lLgEqNCol2WRoXJdi
 N1RNb9ly0O0oSRb8R+oh7ltCRWy3MDlUPqJG1xvGAQNjtykZ8ZWOk4gTgBCJYAxBCoAMkw0erBG
 hbX0x9f+g3FQ924y5qg==
X-Proofpoint-ORIG-GUID: 2K1exFK6yFyEnqHq20a3li4f5ecpC9AE
X-Proofpoint-GUID: 2K1exFK6yFyEnqHq20a3li4f5ecpC9AE
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a1813f1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=c-iP70gTdw2rVZxswl4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280102

The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
but has minor differences. Update the parent data of mdss ahb/mdp clocks
accordingly to the hardware clock plan and correct the GDSC *_wait_val and
flags which are applicable for both QCM2290 and Shikra SoC, and add the
support for DSI1 PHY source.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 6d88d067337fa132114b0d8666931b449f86de17..19c997f3fe9f197d2c252a9dd1e8169947200f5f 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, Linaro Ltd.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
@@ -32,6 +33,8 @@ enum {
 	P_GPLL0_OUT_DIV,
 	P_GPLL0_OUT_MAIN,
 	P_SLEEP_CLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
 };
 
 static const struct pll_vco spark_vco[] = {
@@ -84,7 +87,7 @@ static const struct clk_parent_data disp_cc_parent_data_1[] = {
 
 static const struct parent_map disp_cc_parent_map_2[] = {
 	{ P_BI_TCXO_AO, 0 },
-	{ P_GPLL0_OUT_DIV, 4 },
+	{ P_GPLL0_OUT_MAIN, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
@@ -101,17 +104,19 @@ static const struct parent_map disp_cc_parent_map_3[] = {
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &disp_cc_pll0.clkr.hw },
-	{ .fw_name = "gcc_disp_gpll0_clk_src" },
+	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
+	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
@@ -153,8 +158,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 
 static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
 	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
-	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
-	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
+	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
 	{ }
 };
 
@@ -450,11 +455,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {

-- 
2.34.1

