Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBBC368D70
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017216; cv=none; b=LrlaEJ+Bv3ayZAFm6An/QfKWRE44aR4gd41FV42fn4ulL47ZuyPoxjMxWwZtlGdjN6KqKamtCFtQ8JCL1RmjGQPx3+hz86tbFAFZw95sGh3Z/qPLV8Jct36zRruVOCEy+fXgXii6skkXl7rNah1Sj6ZZY+lXViSbG4VzYTpx8xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017216; c=relaxed/simple;
	bh=f04v58ZZNTOahJAo8xzjMKBEVvR48rP96vy1EEi2h68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SC2ubTUjUFBiMppld1Sb158BW4iGoRJ95oH/PpldXvJPOFq6o+JgjMl9nno0RwnW/XOzf/89R0XBaBbQs/3V45p7iHvFgfIte5eCK99Gd1b+vvLwPgHusAiyRG7SXP7YyYlceRiJ8DKu0zJxxiJ2GfBZ+TBAzq/aec3iADiz6k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUJ32g4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3iaOSyM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUJ32g4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3iaOSyM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3d5t560417
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7G8WuOpWOXdO6mPUOkBtKO0klhvM2s+Q8xGsy890q4=; b=IUJ32g4sTx2gTEXl
	2jI4xEpO5wUxhu0K+lkDC7Fm+ZtAczYIbv6++SSbu5+9Q7gClHn1czqo/5wSkJtc
	bes8tVYeKgSd1s5UL8KB182bCoAH3MPegs6fAQyiRryQxbfUbHwH+Hxy5tElqd1d
	xf6wmHvZXGbBlgu+F/IvrBDzkBJertsZP99koJ9FcGAOOosvQcBrFTTKpNHKS4A7
	shAUiL4N2onuHD5zkNcSb/pvSeomn5wlkUVDkRyfiV89sLcZlNDJB+T3AUdcTVm0
	jDyitpf4jNvdgrdDZNDTkMVEz4WiMlytE6JUJkN7zn+eKkN8fQC0cjTRxKW1QS8V
	ZWhd8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bjbjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:33:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9f0073e20so32176925ad.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017214; x=1783622014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7G8WuOpWOXdO6mPUOkBtKO0klhvM2s+Q8xGsy890q4=;
        b=L3iaOSyMRm3pYazRDxbDZqhO0Qb5u40+gr0gt1xrGKUIIINK3k9sPSU9Fq6AEfIi+R
         iKKWEB/kwCYGALuO8HG7ewS1LfncaE/5wB7C6ErxVQVE77fZy6ljxK+j1oavRu0gjnYn
         FVSKqe2t2+ZOnJr/d3k0REdaOy6zOBFaquwz8fLDMv25WVnOokx/KrdGQoXAH1UO816J
         hzjpZXdcLt6Ps+TYJ7J2praKqUUc4esJ9dV3QLmy3uJ7krr9NZ5Cqc90MymHPLyB3JYl
         O0edRfxGL23VpUVjSzytBxKcARbcZsts4/OLwM1Tkbk5aOqbcIKirbmOCw+orJdMbCLG
         d64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017214; x=1783622014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c7G8WuOpWOXdO6mPUOkBtKO0klhvM2s+Q8xGsy890q4=;
        b=BQu3V1wn+3L2dLaNil6hpgekErGoYehDDpuIcCcLmWVvxCfwIBwkX+Sf3ZpsIHfj5i
         CpSVYYhOfCZv1mlswadNoXo94FHD3+EcKv0Ny4VUfwqZBsK0JEcS7BeB4iJGfRkeiHdn
         RG+BfLoaFk0nMS3fjJ5E0ItLyFVg7+EXdWU3tDLn9I5RGGMiCccd49lRoEF/gtbvavvw
         BPtq6YTV/k5DWqjHbsV0VR6WHP5WbFy2Tqoz5i8hCsrdhy9ntFfsYi8GjCIzujFsiikJ
         TI6TUOozJwQbwZDojTKdsXQHMRgyp3Q6x2fdk0sgDqWUZzya4PpVtJc90Z/SHiQeU4rD
         ZF+A==
X-Forwarded-Encrypted: i=1; AFNElJ+nA9R3PGIHjxg0fWT4OzSOLvdXJ7thtYrfsk+KW3RZnHD1EoPyrh/HVA2WwJYlKd4gfvv9Ssj2pPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkd9LlAvfL4KU4JAgs0KSWrfLBwNEeup/46NIjgQWpM7aXE6V3
	cyzipW7zb75RZMBMxxNyPtsXXDaqMYbXcFv6OWwam0T/O7ierZYrMaYwYvcSDfZdnSKYkG8IUFx
	ZcY20oHG86qWck59ZNFtmXOOlc+OBeRG4iU2cDj1MN8Thmf22zx/A4lJakJc4Vro=
X-Gm-Gg: AfdE7cmduMBqSu1qVF/csBxIOWsreS2snBzJO7Szi71lVOX/2KX7mzsVcOEOC7iuHTY
	GYyYUyM8XgQnrMg1UYe/oXljEyebk3FawMaDPkUIPQBerHSzjAcBomvSRl1thTQiZV0IjQRu6ou
	KrH3xzm+r/mRkQ91RIZ3VDDYG9oqRvNDuHIHMthJmbOUyFX+XPHyw+I/0Zu+C9/XCiAyX6zUxah
	CLIARnaDAhX033xEIJu9AFqbe6BU1uO9euVs/07P8Z6vg5XYCBbrFOtLPrMPtoY9KPoE5V3xc8g
	LCQYlHzVHh+Cdukgi02bVEJhUzUVyKfx7LaUCMlU1r/4v1W2tQ3UHc6tjscEAZEilNv/G+QWZRq
	LHDveVYMw7hNgjA3XlTDj26nqrm5e2jXyNzO0Op0gnw==
X-Received: by 2002:a05:6a20:914b:b0:3bf:e291:496c with SMTP id adf61e73a8af0-3bfed18b282mr8517592637.17.1783017213608;
        Thu, 02 Jul 2026 11:33:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:914b:b0:3bf:e291:496c with SMTP id adf61e73a8af0-3bfed18b282mr8517556637.17.1783017213063;
        Thu, 02 Jul 2026 11:33:33 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:32 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:29 +0530
Subject: [PATCH v5 07/19] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: aTmKUBPCco_MfcgHUMYod9znQijjN9iV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX/Tz1S7br/0eL
 /oZvUtCI5nqv22Y7vUiUa1ow98xMtM3tSaS8/ydFZ71NaJ1HSgdwJwnnv1BIoMEhFIkQtRjJHCR
 e2zhNzFnRrVQzpx6gshNydpJNSMTq7g=
X-Proofpoint-GUID: aTmKUBPCco_MfcgHUMYod9znQijjN9iV
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a46aefe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5-E6Jl9njFXL_0F9BXgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXx4tULKdLazo0
 8fRtTU1WG4EJakDhFKQNehj3ONUh3JE+96OcvFJLs1zT+n1WFayOsSIx3zA1PTUpo2cq2VVH9e4
 04RQlXr2kwskbrApLNt7FzXaeBCueLKuAq8ortyKIfHJEeIx6O/60br9iRX8wi767E2ZZkyro3C
 iCdgiicpaS2jfx+kKYLWNJ5dz4MiJdSyayalcsPpx3SjP2FQde9Gkr7VrDmGwHnU1Uz/+ydhrS3
 7lhmEo6GK17M3TcevaC+grFI7L8Dd0sOLaPGccBDMVtviGXLDSOwVcraSWbT3YqNhSMyqRR/Wi2
 Bou8dzD4jprfSW11ILC1P+UtttMl/dyD2KLEPst4kDe+1Onl+W1paGOG0RvjeBWYCbN6WKVoVsR
 viBA/0CB4/BRlsoKADZRF2sFvwwJXO1sEwh7tymMO6Thf90deKN6hr838cBRHq5I3Uelb5SZVMH
 4gnJbcZ1BIFD34W2+kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

Update the QCM2290 DISPCC driver to use the DT index based parent clock
lookup to align with the latest convention. While updating the parent data,
fix the MDSS MDP clock source parent to use gcc_disp_gpll0_div_clk_src
instead of gcc_disp_gpll0_clk_src. This parent is currently unused by the
frequency tables, but should be corrected to match the hardware clock plan.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 50a0705128a37073a077b560d0c9e57544d54348..6f8c21f05ba4536d45c2a609d152f871cb875bbb 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -23,6 +23,18 @@
 #include "gdsc.h"
 #include "reset.h"
 
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_GPLL0,
+	DT_GPLL0_OUT_DIV,
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+	DT_SLEEP_CLK,
+};
+
 enum {
 	P_BI_TCXO,
 	P_BI_TCXO_AO,
@@ -57,7 +69,7 @@ static struct clk_alpha_pll disp_cc_pll0 = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_pll0",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "bi_tcxo",
+				.index = DT_BI_TCXO,
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
@@ -71,8 +83,8 @@ static const struct parent_map disp_cc_parent_map_0[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_byteclk" },
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
@@ -80,7 +92,7 @@ static const struct parent_map disp_cc_parent_map_1[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_1[] = {
-	{ .fw_name = "bi_tcxo" },
+	{ .index = DT_BI_TCXO },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
@@ -89,20 +101,20 @@ static const struct parent_map disp_cc_parent_map_2[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
-	{ .fw_name = "bi_tcxo_ao" },
-	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
+	{ .index = DT_BI_TCXO_AO },
+	{ .index = DT_GPLL0_OUT_DIV },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
-	{ P_GPLL0_OUT_MAIN, 4 },
+	{ P_GPLL0_OUT_DIV, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
-	{ .fw_name = "bi_tcxo" },
+	{ .index = DT_BI_TCXO },
 	{ .hw = &disp_cc_pll0.clkr.hw },
-	{ .fw_name = "gcc_disp_gpll0_clk_src" },
+	{ .index = DT_GPLL0_OUT_DIV },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
@@ -111,8 +123,8 @@ static const struct parent_map disp_cc_parent_map_4[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
@@ -120,7 +132,7 @@ static const struct parent_map disp_cc_parent_map_5[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
-	{ .fw_name = "sleep_clk" },
+	{ .index = DT_SLEEP_CLK },
 };
 
 static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {

-- 
2.34.1

