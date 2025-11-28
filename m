Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B932EC54D
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319222; cv=none; b=C1wWpizthqWCrEhdF0v2EUZnimFZ1ZuAbWMOnaFd2h8ncKpIWhYqjJ493s2GPfL7DItGyTXHdDsZcBuGl58cntfiH7JxokoSljtgyTiJKhhg6pEKmYTTBOBz1ZHPZivP7C1N0vKHB05SFCz8XFSESmtEbOcfRHDI76iJScMPi34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319222; c=relaxed/simple;
	bh=fngTMAlj8/JOrVqugfPFt+lT3tloNMK4jV2wmbRbI54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NxnnhUzorm1rL3izlMocHGVF2gbd5yS5yYUd7UQHvatC4OnyBuq+pmtfh/HhFuwnC9RlCL5CJCQGK0mvPIt2GKFEdKq15ihTUzfoAI8iwGvdRHzYUVpo9R590w0BqGFg2O8pWygiFGhnUV0zU3hCo7WMZ3a2YjC5nrMhGHx7J3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpfoCnW6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UnpJOWss; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpfoCnW6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UnpJOWss"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8OpMQ3621196
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 08:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhODlRoTJ7qVC/2V+TnZmMJl4LfMZeHxFqqvPBHyinc=; b=mpfoCnW6hUIiWPQT
	UtFrMufr9Jdt1HruOzTv9XOcSleDukB1mqOPFY/M0J/dmO8o4CKwfxKN8rnWgRZH
	6Z0VB5yFQTcsMFMlhl0Qp/KH8I+BHc7HVuMKHEGQh/he0fmK+prT3avbbyRuVlUO
	O++Jj/ib+3IitOtU/fAsMWRbUQlQrsRakDJGuFuuOabD7OUhyBe3Sk2Aq4scC/HI
	G8nO/GLQoaEHGw6EbIFVPPL7jkbZp9k7ca0GopFR1l+HfDN7ycj8xtzNEEauzKDk
	USaOYZajLDSW9Z2HfBLIw4bcLS+wQdxNwEEDwRflCPhBV7INzErLor6xd1N76XEG
	AlZCDg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjdaqqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 08:40:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b993eb2701bso1690478a12.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 00:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764319217; x=1764924017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhODlRoTJ7qVC/2V+TnZmMJl4LfMZeHxFqqvPBHyinc=;
        b=UnpJOWssMC9shmFU4bvmfNqkYmO0ARkbLzgAIhVR5BQIWQjsK2YPa97R8Zh6mrDpPm
         exzWy5pB2pkIPWOMpRPSGRHPrkFF1YZGhVeeaF/H15lezySdxgypj5lX8uc2CEiDUSej
         YzF8He3V/HXy0mEXT6t9xUztKfdlPJAZeEmHwR8aSJKtUU43l3dMJ0bzP3Ky24esXDWi
         5VBKPKrdewXGgeD+x/cmmCGofP3CYEDks9j90wz/hG77yCNjtWquSOoV3hGxI2amoMZI
         u0muwUmIQpHEY42Tlhct7iYUcppb3lJa3Etn8AxrD+7rUyxXGfodxOJrIghyUWVluBYm
         KV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319217; x=1764924017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PhODlRoTJ7qVC/2V+TnZmMJl4LfMZeHxFqqvPBHyinc=;
        b=qvV4Qke2ooID+t3orP5mOF0ldpNp41XowP7n/qoo+RRVTxrfrPIE2RDdDCUpFXzN8+
         HZ5KkL5hCfifrb/VVnJPH+mdSI10MFSSn45H31nsz8TdJoIq1BFlJba90p7ZH2ocsGXT
         h4IPKH7/ZCTGuFwz00jDqqF4HkXTgN/xBV1d6abUC7NaaMvA47XpAvxsMEniixkNldDN
         lwfU+u/Y3es3sNEiwje03hCURKhjIG3TxVPCHsUoyOE/m6SlIhAx0G6HazTR2X4xOL7n
         IYbA2vPfIE934pVQk/GvS1rojTQaOYEApbM63ciJjF3ogfIkHqdIWZYptAk1lI/8SgXV
         FJ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXP6D+LqI+Cfa+xtGSXMVTwYMMTh2LGUzG/8oGSiSSBxeVPMRJeT91w0QP8F7UIS4xztlVVcMn9kjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5j8PZgiqDTs+P+gkndRg6c4byPZ+qTVpLeYxw1ZkU1DVsvtHq
	xlfONKhQfSOY7iBrrlSUGGdrcNOJe/6rcGP1Dubd2qCodhxPzJ8UtGuuYVIqZhq3u64i3ziYLC+
	38sjOv4HhTxJyh//4T5mlCz9MoUMJQTjJWT+ITJUz7Zdpk9a0MTsh9gTl1HrBf+g=
X-Gm-Gg: ASbGnctOTI/eQm60/7QGsUBez4ebe+jmrDvoKrQAlhTnKUaCXCuGniEeQuL2wjXekGK
	mddXbPsobm1Y6KcQ4KGRpxtQhr1effO4qidjHa5Xo+BN3jJcl1dm5ua9fj/bph5zQcy4mGoabwk
	3Y9xZNJFvD5z1gC6LhtakpWH6EDKrvtON8bUR3Sb/BezuO7NsydKwZ4Sb6Kq5r/U6DSg/2IqzRx
	vAyqr0C1rBxJfJ2+7WrJisL57cXESszDF+GiPH+4tTPUILUmQlpnp7s3/Tg1PKxkP67KuvRpKvl
	9yEpR912pQ7yDKYgEbI1b6EMXbHfF7mdFr3eVw8XfSilBSsfGbesbjC24UCgr/Wyn+14h9LI3Ok
	LC2QSzA4GB/uqXv3fvM+b8OUDg6/fV6U7ez+ChRHs8mjcx/2dz/OJ
X-Received: by 2002:a05:7300:d4ca:b0:2a4:3592:c600 with SMTP id 5a478bee46e88-2a9415ba3acmr7907310eec.17.1764319216810;
        Fri, 28 Nov 2025 00:40:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoYq5NfdOWQ33VjWq75DPbPBOkH+zaUlbzwGG8PWLO78JeXM99PhHk+EAQ9/Gg0eg3WKmLqw==
X-Received: by 2002:a05:7300:d4ca:b0:2a4:3592:c600 with SMTP id 5a478bee46e88-2a9415ba3acmr7907301eec.17.1764319216277;
        Fri, 28 Nov 2025 00:40:16 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm21895872eec.2.2025.11.28.00.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:40:15 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 00:40:13 -0800
Subject: [PATCH 3/5] clk: qcom: cmnpll: Add IPQ5332 SoC support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251128-qcom_ipq5332_cmnpll-v1-3-55127ba85613@oss.qualcomm.com>
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
In-Reply-To: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764319213; l=3013;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=fngTMAlj8/JOrVqugfPFt+lT3tloNMK4jV2wmbRbI54=;
 b=2zCgXlKllG9ymmhK1oO9iNdHYOknYIxlqktRebfVe5MQlPoa9FiZPiNo96aA4/8Fjwzq9uN2H
 g3ubmrMdxRQCop0q7zvQ0pTNP1sEAPR5jrUlDf0mGfBPMPSDYELNNK9
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: dvuhOMHsgJfQZIiiZSAxuvsF4VQFz-Ew
X-Proofpoint-ORIG-GUID: dvuhOMHsgJfQZIiiZSAxuvsF4VQFz-Ew
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=69295ff1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=34uckhk-FeckjHo7bNMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2MiBTYWx0ZWRfX3XiaUOjIziQm
 VCGw/JCT6fvEBIR6kAKk20Uyar7hVLr4Qq84M4XAzJMavO/e2dDG7i2Ykp4hvyMtNmcyL84/MNR
 soHEVp9XzsTjhXB3AGDNGB8FqxhVYBHFyEfMFiz6uh+Ds5AUcmBq+W1e+IMdWwf9pXwBrBr3UGC
 vH4O5WoCuTUSvjTDFmYkrdmXk5btTFgcaK7C8I1YC6IktFwczdxvsP7O7XTlX31t4AdoiYts688
 nHecOfRiqbB2Giq96Dm6bNAwOB1qLnb6MbRYzTvODm+QA8kmNGkXUgjwSLHCJ+u/dUVP5gSBmP8
 ml2uF0RcMK8aEX/qj4s59/mxjrPIk7rzPorK207LJLb5eKnnio5yhFkNMZmf/VzmcKZAhoK9ekY
 MuP0ulGEF05rgPoierbxRC6RY6/8sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280062

The CMN PLL in IPQ5332 SoC produces different output clocks when compared
to IPQ9574. While most clock outputs match IPQ9574, the ethernet PHY/switch
(50 Mhz) and PPE clocks (200 Mhz) in IPQ5332 are different.

Add IPQ5332-specific clock definitions and of_device_id entry.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index c6180116e1fc..08159b427f89 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 /*
@@ -20,6 +20,11 @@
  * and an output clock to NSS (network subsystem) at 300 MHZ. The other output
  * clocks from CMN PLL on IPQ5424 are the same as IPQ9574.
  *
+ * On the IPQ5332 SoC, the CMN PLL provides a single 50 MHZ clock output to
+ * the Ethernet PHY (or switch) via the UNIPHY (PCS). It also supplies a 200
+ * MHZ clock to the PPE. The remaining fixed-rate clocks to the GCC and PCS
+ * are the same as those in the IPQ9574 SoC.
+ *
  *               +---------+
  *               |   GCC   |
  *               +--+---+--+
@@ -51,6 +56,7 @@
 
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq5332-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 
 #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
@@ -117,6 +123,16 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
 	{ /* Sentinel */ }
 };
 
+static const struct cmn_pll_fixed_output_clk ipq5332_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ5332_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
+	CLK_PLL_OUTPUT(IPQ5332_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
+	CLK_PLL_OUTPUT(IPQ5332_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
+	CLK_PLL_OUTPUT(IPQ5332_NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
+	CLK_PLL_OUTPUT(IPQ5332_PPE_200MHZ_CLK, "ppe-200mhz", 200000000UL),
+	CLK_PLL_OUTPUT(IPQ5332_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),
+	{ /* Sentinel */ }
+};
+
 static const struct cmn_pll_fixed_output_clk ipq5424_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ5424_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
 	CLK_PLL_OUTPUT(IPQ5424_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
@@ -454,6 +470,7 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
 	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
+	{ .compatible = "qcom,ipq5332-cmn-pll", .data = &ipq5332_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
 	{ .compatible = "qcom,ipq9574-cmn-pll", .data = &ipq9574_output_clks },
 	{ }

-- 
2.43.0

