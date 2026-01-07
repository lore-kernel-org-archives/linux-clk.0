Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1055A26FD93
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 05:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767764120; cv=none; b=sKPr9KLDambeqR4OZiYI9kQct8sK9KKKxZhzbKuwXuu+SvpsSWkVOwlhJMV5Lg82ZTpbBDEy4ACplUtRDJ/Pi4+6BmoRoxvGKPvhRvnQ8ZGhse8HzxK3mzykilkaxOcUR8gSy+vyLYCWI0FUsodxxUVdnhwqcKklV40LV/yc/nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767764120; c=relaxed/simple;
	bh=cwBVN2p60rjrKTFiJWlOrsVWPGObKbfTCuIqR47wra4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+8rCtGgPnRbKctmkUqcjeCxZhXmmnw8gYuoyab6sZSJU+7IKQbp8eUIIpngGR9olPZON3FP5T3WYvZ1KKJZn6LLViYZFIbD/8soWX9NoQOOvpHyg1kVhFYgJHaH1MG8jKqAlU0okjkOClEVWKXKgYgY5Z8D+SA/snPlJnEWB5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjnZ1OVL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SP+UX8NX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjnZ1OVL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SP+UX8NX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60752aKC805099
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 05:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	grndNakJefCe7BAMVUGGrGDSXuyP8/t6z8NpUG01rhw=; b=WjnZ1OVL4JK+VBlk
	YzVLIRzhr56WcL80AkVlq9LRuzl6xocVPj5eTGjdCOFuJ3bPB/3bqCM5fJzeUKB0
	kYNdbPe6JvvToEBFYCldgvTJO+yY6jyCKq0DW7SXvl8UDJ92IuSwlF7jyUum4qCU
	zHLIbYGL961DYpYsuXItnXsxh22U48ykfQiM9Cq7zfoV7/p1VXbWYG1MJ18dnCnz
	wMM3QiJvcRzRHdI4AaJrXNNkk8Dk1Yqwdi/uxzYb14kkCPsPP50/C5svcW7IRCvI
	BYaAxqk86xTYDrXJlDacoDS83YPrSouQhupDOJI+xD1IbPuxY8vLkcdjTF6SOpmA
	FMfI8w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh7t9hnjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 05:35:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae51ce0642so896496eec.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 21:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767764116; x=1768368916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grndNakJefCe7BAMVUGGrGDSXuyP8/t6z8NpUG01rhw=;
        b=SP+UX8NX6i/qaadyqCK4NJvCVRYM3jZlr009bE4ucRC+7ZxOOVPkSSQ6VqYsXLcwhU
         ZPsktKUZ7FZcXThndp6ZnQnh9WqMVv3FTtiGJDohuEEpCeJwvUrKLYeSw7S6buPrwr3x
         azVc16E9qwUegRBfiu8vG+gNz4BpFMUXCldsAUYhN6xFOYlrBmwzUuHLukVFIfkm1ewL
         gK2kWoN/QZUelplFN2ja6nV/j/MjKpOgnpazGoh1ht25bZ6/nWZzFqSLU97wLcw8mu8M
         +WZTfXZdUBmRIJbolUsg5ZJND4RsCMfk0Zf3WCoSqcI6CUi3TXhbIhmY4L1Io9NXfadE
         zLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767764116; x=1768368916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=grndNakJefCe7BAMVUGGrGDSXuyP8/t6z8NpUG01rhw=;
        b=PwjSfax4GLrDZTjYf3pLP0raWcAqmJvcN4QqawyHl2g8o6fTcx5y8cQxEoFdRLK/zL
         CJSvtPqQYmM5FQMwgnqu6daFO6Kzr7bgt5XRxsbJdSDw1udZ3mJBeMoJ8Ebkbq6itE8B
         JVbbySWa6YQE0lFj46aUik+HS1/u6osDNmlsDI+9AeQtUmzClfDUm+iCUV6p9OdHkcNu
         vs0Z39k7bphmcAHAmAjFUtWGTSVXUsKBEbDfjeWsFaGB2/lEoFu26k+MOwJ21VcXiKyp
         cPFAP4QhePE+TegnHPIDVZyGuUh3XIUXjHlBcgfaZFNY/Tid1yDWwDpCZOEKbIaBNA4X
         WRGg==
X-Forwarded-Encrypted: i=1; AJvYcCWpHl32Zli0PsB3fzJOM/bYlOf/msxO3pvJ+b5hqfh0r4BKpqfgz1byHrSK1fEadXfn6W28oS58B14=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqrdsUkhBIjBvIv8vEhIYaa1p1MJS+s+JBPHeDaRhJ9Aggq/oy
	MkpZ8V6PYCJ9joDF0PFEyW5LFZxOFD8DJYUaytRpy6CgSYNAuyArxHRbq0PNlfMUFIsfX3ukFNo
	qM3aTqFRai2QG79no74lU42iRC/VmsC0itMP+pp2WKJWMmoWPsqq8m4X2z/DYY0c=
X-Gm-Gg: AY/fxX5g32RYpzHcwioyBGLT5YDGAnoEGY6x3p2BZI1jVJmGi4Q2mMtaRYe+kgihOyx
	2Mx5k2IA7/NhjqzTCmMiWPh5fawTMRzLURY7BRIZ1iIBoP6kKOyfmZ0xxWZdzPZbjgnxq8jGzWo
	3UgsPdvKU5riCpZlTP9f9h6dE49OahnG/ptEN25QeQC2pn3HhiZlI6N/D2ZOvCwB+zSELbG6WLP
	CcGFmB//rjUTa8wub8P0Wbz7Si8dScUbRxoczalo6Lit+cSLtdPUvzrR9sriCJqYkh1dds0CuJ8
	mO1/pwDxb8szkJ4DlUSyJqt7zzs2g1X9NIq01pnafEgHLRv5hYnB5UkH2L0P2OdAaIIimf1QzuJ
	R5XxcM2a7O8nHpZPM8qImBXkC/6odMadRbHeTgwpI1muE4uWG69Vl
X-Received: by 2002:a05:7301:7108:b0:2b0:5609:a593 with SMTP id 5a478bee46e88-2b17d26717fmr866950eec.16.1767764115897;
        Tue, 06 Jan 2026 21:35:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKJc9VqQl3qxyIzMEgyRkYi3m3sUorstQOEpnRABG9L6VGuW02joWgVDTs3xC6psOnY+/e1g==
X-Received: by 2002:a05:7301:7108:b0:2b0:5609:a593 with SMTP id 5a478bee46e88-2b17d26717fmr866922eec.16.1767764115208;
        Tue, 06 Jan 2026 21:35:15 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm6120311eec.2.2026.01.06.21.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 21:35:14 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 21:35:12 -0800
Subject: [PATCH v2 3/5] clk: qcom: cmnpll: Add IPQ5332 SoC support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260106-qcom_ipq5332_cmnpll-v2-3-f9f7e4efbd79@oss.qualcomm.com>
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767764111; l=3013;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=cwBVN2p60rjrKTFiJWlOrsVWPGObKbfTCuIqR47wra4=;
 b=WugIbeZCCo5W2ApK/wCncXzufh38o9v89ziinEJAeHy4ZKwMNWcW3WU5Jv/iv9z9zOsHN3ar6
 /CSE26RDveBC0MS8EkXA4P9JXzyt3ivFQ672lK9r0mmkDaXGZQs61sA
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: IPM564YwiAy3mIZnu-YsbmWs_hCqjzTD
X-Authority-Analysis: v=2.4 cv=QfRrf8bv c=1 sm=1 tr=0 ts=695df094 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=34uckhk-FeckjHo7bNMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0MiBTYWx0ZWRfXz1Vudnqnn8rs
 nmRd6uj++K1vvOI0xVYpsmdL3wplIpVM5Mb/nsA++b9DxxWsPJjbbXsMl2khTeiyvoIJHV36VkZ
 E/MZ9yDZVkJEZ8DH3Xy/jXKz58lk9qMnP7HOE81zKnHA0FpURfVBTTYxMAGL+dMulnSpP6D98SJ
 L4l6fYUXAENzcvTcCNpqJ07raeWMyUO6CkjadHYUJqDcsgTELzBTCKAAoX3xjTxSBL3OUI9++Es
 KGvxp4gxB+gfw28byFabAkfGd8xBFgWDjg9nWRgkCnnKmffBVLuUKkGq9IA+GqXRFvPTY5cWWOE
 IGlHU9AfiRscHOO9HWQLM4EME1YNf0IbWd5i7Iad70YgHGkYyMorbLfR7IC0VLOcNDJeQglSTpd
 w3PUt2yfEqEMPkGFH7T27zTp+SVPPDmLJbGj8JHW2Z8PHICho7O6f6E1G789/oh4u7zG74CVop1
 FoKAA1Rb7ZPpZf1JNOw==
X-Proofpoint-ORIG-GUID: IPM564YwiAy3mIZnu-YsbmWs_hCqjzTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070042

The CMN PLL in IPQ5332 SoC produces different output clocks when compared
to IPQ9574. While most clock outputs match IPQ9574, the ethernet PHY/switch
(50 Mhz) and PPE clocks (200 Mhz) in IPQ5332 are different.

Add IPQ5332-specific clock definitions and of_device_id entry.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 369798d1ce42..962462286837 100644
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

