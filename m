Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626C535F190
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702649; cv=none; b=es7d77vH6FKdEevzSDG3CTFwg3ydR2XNirU8lJP/uvGkio4fhDIEdjyjVLg4CAMhEkTTnfPZCiPQaYjRzunWl3mKEWoOI7Z2Os44oQFghfy1RDrLTvpGvkTP9AYRNOyh63e/KH/H0wqobVq74jLutyNh11fcoAP8Q0nRL16Ke0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702649; c=relaxed/simple;
	bh=mk4dCNBBr8ZVmNIOnHG8airy1Gvqc4Pj+PZBNtF+cjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RqceFSXsh+s8JgIpKIgATnlj6xNGFB8oxLBxgxsfWmTcg4/+SxlaV6KGxFkMqkX2PmaUnrf3Zd704Iddxy2BrY5TWEbaeaAuyE209B7RHObrkJ3v3jvUUQkAKspCtLznI/pBsjMvXnBcgorBgdhjPAG3np0eg/nEqZbdjpTBCdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FHflGIUq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQa3LNC4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FHflGIUq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQa3LNC4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBA9Zv1598349
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3+v4TaCfS8cG1zHwAijshPJOmORhUEU1m+ODIyfKcM=; b=FHflGIUqtY3DUG7l
	kr0YHyI9ESWziOPmKOhf3SZcMgxKkC10sqXFFNAaJFGaXW8TSIFLdBkNI5+rP5Xq
	22oOjCyyi8ER1znJyZBUw4kKDmtxngYE6CTmCC93tMbj960BdB+iQzSJzz5naaUt
	Xe5ujBWibwbBRuT/lEDgDhGylTcN2rk+omfl2j5EJH57z+jmLjw1KZ/GuBndvQt/
	K6g74KZ1OPGrdeoE35wdo69huhdKNvzkOJf9WOS6wP6QfWjHjNU7Xtl+A82nGcLh
	rIWokXBpUS5cUYNvlDy4uvfar9vqQkAA255z6yuh8XJ+jMm9+lq973sCznOR+/4k
	k9cXRQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnjbqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso1683759b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 09:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702646; x=1777307446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3+v4TaCfS8cG1zHwAijshPJOmORhUEU1m+ODIyfKcM=;
        b=IQa3LNC420iYPBHvukxU5Sscg2cN9CXDJ15ZBXO1gNe2DnTo3taHDnFb5n+1GMCBOB
         VcZEDiEDr/jYgDucjpzpEVkRQbdbOyLtXuI/dJej5zsJQyopk/Fhh8TqT7jmENc1Syl6
         i5ek/HihQaQIUogMKs9HDwiiJuhnCDbvO618k+Qh4qDdHvLJXP6zJQYXFFhBG6Fzlsad
         ngVopxoJ2mKunQeLZW50rbE9Iubq86o8VgXgLDCZa/gqm03uMzIP8er0VcxvyxBb0wEs
         8ukP4juNk+ipXwgYnSiNXPlL5tQtX1NUo/yfn0SavzSKY3AolPiv6Tak1b/vX5FD8pxY
         9VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702646; x=1777307446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L3+v4TaCfS8cG1zHwAijshPJOmORhUEU1m+ODIyfKcM=;
        b=G9ywIlZpJCn8uQUPcBtQfilxDE7fCMS87VOarvVVrUjQiebrLmynjU59X6OMoz9QwS
         uVxIKnP39FIGCcPgPlqd2lM4SGHaelB4KkeTdEEOkpx2qOPPIWkj6fRE0FkJbhbpDDl1
         HxER8sqF9r95Tr6jZunN4bBZFSKu60PpCXcAbMlGJS6wCI5DW+gfDjwoPOtBZIpF07JL
         laqrDjFovgqlf6TRvuG7RkcsAUoB5Ihglibk32rza7zMQl4pCqv8ZxspM3qrInm4/5bE
         teaMp6R+KXNY2DuKmkylyywfUkdCPyr9Ar/ArZMZTSGMrD9ZYrfPmhWXvXRluEXO+6PG
         v8Gg==
X-Forwarded-Encrypted: i=1; AFNElJ/Yb2Pl/wj49qohRZUlwCz3jWYIUyEryZ9Wm5YNsU0+lRrcp1/9jstZ67RFOY3OaOK8YGxlGEQB/FM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv8d5T8iD8faMKKZXnyRdyVR90nI8iS4ThPy1DmLlkeLW66ang
	52dsfWeL3LwEqXlCY5NtpCNGJfnaBqvmaud+rb2l9BSsKTrgXXg7b9Ahp+dBVq0hzN9yy8lHXt0
	ztv2zT65WS/GIAdkQtUE+4yP8F2igEOTnAidAhI/dMlembg2+slcvPlTYm23ayPY=
X-Gm-Gg: AeBDieu+dyBRy5hv8QJf7XzR979nWI+Q0lmwtR5JQsBXx99d4xgh02X3/mvlS/FuGOu
	SpehiLbE8J0Nglos+eK/jPcwnM18QIdOY36YnVbEDPVJYyrcJE1WI9qQs4N5TUdzfg4Op0EX+Dw
	2Ok0vZngC/Nh/kBTLSnWpdEWQ7m/ZOd1Vkw67t90DKpImvxl2qIgQxrngezbwWnmyj3306e5yIY
	QsfoxjrcGy1hIn0eq5NXltE+aejeSo2IUzf/A/uAOBEIqCN56TH2RuLilLqY8swfI6qfwDneVEe
	hTQd2l1WoaJe4NN9/a+DpnbONVP6T/musXO3G77V8h8Na0uxq4YA6Z/7A2AjawFrZo4hx5fQS1+
	ZLqsotdZJnjnUxMQjDS5RQXzrccW8WiTkrDWLG1A23JU0SEOrxi0TmakhfG5ZBEk=
X-Received: by 2002:a05:6a00:6601:b0:82f:ac48:8342 with SMTP id d2e1a72fcca58-82fac488922mr4807057b3a.24.1776702645796;
        Mon, 20 Apr 2026 09:30:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:6601:b0:82f:ac48:8342 with SMTP id d2e1a72fcca58-82fac488922mr4807022b3a.24.1776702645282;
        Mon, 20 Apr 2026 09:30:45 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:44 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:59:03 +0530
Subject: [PATCH 10/13] clk: qcom: dispcc-sm8750: Add support to control MDP
 clocks using CESTA
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 1eD_cezkFiviCCx1kHW_kFr1d35Au0s4
X-Proofpoint-GUID: 1eD_cezkFiviCCx1kHW_kFr1d35Au0s4
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e654b6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XjfBnMjlHn5Gu7V44uUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfXyqxCsaw7b1IB
 CGLtIn8WXikzHiMDqyQPo3oL/SOv+lVQIYwNW+YzDhQnogvE8C1xNHbaXMldXufsLrE4AfDKYia
 mbN1NA8288GGaIref2vvwSHZEyMTSXkHgQMge2fd8OLDYcj+P5rwtWV/yagEw/KdjLTOGFl3s1I
 ZXW+Uw/ihiKqEZqEkwrlokcTeABSM22FC6QRy8e5YF5GJrgcnnLMiIrO2NIyyxZFfk4o4EZOdCA
 90GF4RlaCbiTNtW7TjNOGrqtvL5IxY9E50YhoSAtVjDKdAuuIxVnHViT6eT+XPrqSR1qxwp60Lm
 ZngalnYBePG3jWiFjLhyIo5tQh1EWAxdMdO+SMAHLPbxzJP53w7vLcMGm9EvFpEIFBwDeTpT+hD
 sZbVZgP2/NUKD/DR8U2vqERC9K4AzMREts5fVgYmNo9NgH4uohuxgzfAkNjY2PohRIFEcZNt0ki
 JF7bQCRzlr1628NiypA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200159

Add support to control the DISPCC MDSS MDP RCG and the associated display
PLL0 using display CESTA hardware on SM8750 platform. If display CRM is
enabled, the clock ops of these clocks will be updated by the common code
before registration to use CRM specific clock ops, allowing these clocks
to be controlled using display CRM (CESTA Resource Manager) hardware.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm8750.c | 89 +++++++++++++++++++++++++---------------
 1 file changed, 56 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index ca09da111a50e811481fd862b54d454de024d1c9..328e43b52192702dbbfd1ed65737520acdd4a649 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -71,6 +71,16 @@ enum {
 	P_SLEEP_CLK,
 };
 
+static struct clk_crm disp_crm = {
+	.max_perf_ol = 10,
+	.regs = {
+		.reg_cfg_rcgr_lut_base = 0xd8,
+		.reg_l_val_lut_base = 0xdc,
+		.vcd_offset = 0x268,
+		.lut_level_offset = 0x28,
+	},
+};
+
 static const struct pll_vco pongo_elu_vco[] = {
 	{ 38400000, 38400000, 0 },
 };
@@ -89,21 +99,22 @@ static struct alpha_pll_config disp_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+static struct clk_init_data disp_cc_pll0_init = {
+	.name = "disp_cc_pll0",
+	.parent_data = &(const struct clk_parent_data) {
+		.index = DT_BI_TCXO,
+	},
+	.num_parents = 1,
+	.flags = CLK_GET_RATE_NOCACHE,
+	.ops = &clk_alpha_pll_taycan_elu_ops,
+};
+
 static struct clk_alpha_pll disp_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = taycan_elu_vco,
 	.num_vco = ARRAY_SIZE(taycan_elu_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
-	.clkr = {
-		.hw.init = &(const struct clk_init_data) {
-			.name = "disp_cc_pll0",
-			.parent_data = &(const struct clk_parent_data) {
-				.index = DT_BI_TCXO,
-			},
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_taycan_elu_ops,
-		},
-	},
+	.clkr.hw.init = &disp_cc_pll0_init,
 };
 
 static struct alpha_pll_config disp_cc_pll1_config = {
@@ -681,25 +692,25 @@ static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
 	{ }
 };
 
-static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
-	.cmd_rcgr = 0x8150,
-	.mnd_width = 0,
-	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_9,
-	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
-	.clkr.hw.init = &(const struct clk_init_data) {
-		.name = "disp_cc_mdss_mdp_clk_src",
-		.parent_data = disp_cc_parent_data_9,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
-		.flags = CLK_SET_RATE_PARENT,
-		/*
-		 * TODO: Downstream does not manage the clock directly, but
-		 * places votes via new hardware block called "cesta".
-		 * It is not clear whether such approach should be taken instead
-		 * of manual control.
-		 */
-		.ops = &clk_rcg2_shared_ops,
+static struct clk_init_data disp_cc_mdss_mdp_clk_src_init = {
+	.name = "disp_cc_mdss_mdp_clk_src",
+	.parent_data = disp_cc_parent_data_9,
+	.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_ops,
+};
+
+static struct clk_rcg2_crm disp_cc_mdss_mdp_clk_src = {
+	.rcg = {
+		.cmd_rcgr = 0x8150,
+		.mnd_width = 0,
+		.hid_width = 5,
+		.parent_map = disp_cc_parent_map_9,
+		.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
+		.clkr.hw.init = &disp_cc_mdss_mdp_clk_src_init,
 	},
+	.crm_vcd = 1,
+	.crm = &disp_crm,
 };
 
 static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
@@ -1562,7 +1573,7 @@ static struct clk_branch disp_cc_mdss_mdp1_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1580,7 +1591,7 @@ static struct clk_branch disp_cc_mdss_mdp_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp_clk",
 			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1598,7 +1609,7 @@ static struct clk_branch disp_cc_mdss_mdp_lut1_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp_lut1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1616,7 +1627,7 @@ static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp_lut_clk",
 			.parent_hws = (const struct clk_hw*[]) {
-				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1844,7 +1855,7 @@ static struct clk_regmap *disp_cc_sm8750_clocks[] = {
 	[DISP_CC_MDSS_ESC1_CLK_SRC] = &disp_cc_mdss_esc1_clk_src.clkr,
 	[DISP_CC_MDSS_MDP1_CLK] = &disp_cc_mdss_mdp1_clk.clkr,
 	[DISP_CC_MDSS_MDP_CLK] = &disp_cc_mdss_mdp_clk.clkr,
-	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.clkr,
+	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.rcg.clkr,
 	[DISP_CC_MDSS_MDP_LUT1_CLK] = &disp_cc_mdss_mdp_lut1_clk.clkr,
 	[DISP_CC_MDSS_MDP_LUT_CLK] = &disp_cc_mdss_mdp_lut_clk.clkr,
 	[DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &disp_cc_mdss_non_gdsc_ahb_clk.clkr,
@@ -1866,6 +1877,11 @@ static struct clk_regmap *disp_cc_sm8750_clocks[] = {
 	[DISP_CC_XO_CLK_SRC] = &disp_cc_xo_clk_src.clkr,
 };
 
+static const struct crm_clk_data disp_cc_sm8750_crm_clks[] = {
+	CRM_CLK_PLL(disp_cc_pll0),
+	CRM_CLK_RCG_CRMB(disp_cc_mdss_mdp_clk_src),
+};
+
 static const struct qcom_reset_map disp_cc_sm8750_resets[] = {
 	[DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
 	[DISP_CC_MDSS_CORE_INT2_BCR] = { 0xa000 },
@@ -1885,6 +1901,12 @@ static const struct regmap_config disp_cc_sm8750_regmap_config = {
 	.fast_io = true,
 };
 
+static struct qcom_cc_driver_data disp_cc_sm8750_driver_data = {
+	.crm = &disp_crm,
+	.crm_clks = disp_cc_sm8750_crm_clks,
+	.num_crm_clks = ARRAY_SIZE(disp_cc_sm8750_crm_clks),
+};
+
 static const struct qcom_cc_desc disp_cc_sm8750_desc = {
 	.config = &disp_cc_sm8750_regmap_config,
 	.clks = disp_cc_sm8750_clocks,
@@ -1893,6 +1915,7 @@ static const struct qcom_cc_desc disp_cc_sm8750_desc = {
 	.num_resets = ARRAY_SIZE(disp_cc_sm8750_resets),
 	.gdscs = disp_cc_sm8750_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_sm8750_gdscs),
+	.driver_data = &disp_cc_sm8750_driver_data,
 };
 
 static const struct of_device_id disp_cc_sm8750_match_table[] = {

-- 
2.34.1

