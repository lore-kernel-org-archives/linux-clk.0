Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A67744683D
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 14:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704308; cv=none; b=eSdLKnmD7aAVoZFBAx7aPxMNoCl+S8euynHpZFH2xvEsg8D++ZDXsoFIPtfeoEnkd9Di4R91j2WkPUVo/3FpCPa6Y5IbPSw7JH8aG+nkJDlXMWKnp5wSx4f71RVa7ah4SiuUJcUzTFHTJuuIeyK06eG1h7fEF+mGaTAkHg/D+rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704308; c=relaxed/simple;
	bh=hcr2VuSq3luKU7N0o7OKoFiCXrujgoCgSs38Groo04k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EskdgsZ0jusUjQGZeyTeV7+VZv7n8XMWcZxKkH143B3OqWrpe/UrXwA/kJdhunLydoebIpOKMKUER6RTYlS4mJ/g8vmL6GLf3qo96vVdunV51Nhlwj8nQyiF8vGHpUcQ6PINId0BSk+K64AcQU8hDIhcWmpGLkti1yiB96nXWm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQeyqJxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2Yt/Jxe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQeyqJxZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2Yt/Jxe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686BPTL2827586
	for <linux-clk@vger.kernel.org>; Sun, 6 Sep 2026 14:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkzilBYJTCvxB6u8kpbN/ZYJzHO8iax+7Bkft4FDrRw=; b=cQeyqJxZfHQb/huz
	ibsYOmnNwFOxBQKF94/WYerDu+iJ7uRJznCWzBHvw6BsVtyEidEAr8z3jxCHsVqG
	Eo4X+IJJOrLfh+EPz+tcYfpqH4zt2Pz2NeMoiRC0pKckATWbWCx8kyX7GbQYf8x9
	40iDCf7MGhdrppdaq8ZIgbZ+u776XTvy2tpOPS81bPL3uE3YMlkttt+UqJLMHskf
	b6jstesHtTnvcQYDCvp3Xt29xFqlgRAg0+Tj2gkOv+JrcDgsYhh6ny5dP3St9ojF
	IFXpD8lNa6J/2BdJEkyFH5bmRC0gb/DzeG69DtBLxjzsrmBzvDUFEFwI3VsBibDl
	1rPEhA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhkjdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 14:18:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so3253272a12.1
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 07:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704303; x=1789309103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkzilBYJTCvxB6u8kpbN/ZYJzHO8iax+7Bkft4FDrRw=;
        b=S2Yt/Jxetz3U5VAAcSW7P8zRGn+TdtvMghWCb36OxQtGt3JEtDg0fUeRicAMKlxMoP
         lNnVv1ZjK5VSeIm/c6SlmjlomnFYQlerAVmt9yXXVM1k8EgDvOSyFgiFP2CzCKkX3/8o
         +2zmghDIBBR0O6Qq3fKlgGZuBCWGTSryGoQ6wDQosRQB0vTuCYQnxl+SYIFbO6Rqo6/x
         5S2LudTgdTj82/wZbpXfccCTElQUwJEqMJ/UK013UUq525M+1obCU/QayxkbVvG5wam/
         VOQ0eNm/8NJh4M/NG3Knr0bjUW5p2noWbrndxE4R0EUD6hpN0TASjW5Rl0PLSdBIyOoA
         QfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704303; x=1789309103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkzilBYJTCvxB6u8kpbN/ZYJzHO8iax+7Bkft4FDrRw=;
        b=Kmihraeq/cPn5zWEO5leG/pGlTh3AsVR2Fpwsqra5z7Wdg+eZNyHgqSrT6Ei1az4rP
         Sn4gSKrpqwifUmXQASdlT2N/H8Fo+lBEfeea9vJI3QJF8yTQc/W6NeG+T4QeruLgkz2l
         bLehiiESfCT2RwM3LSDKxy6DlZEMCIdsSLmTyVVY2iNQTBTkJzxV3F/hf95BXyDpbADY
         gTCt9GuaIVKUO0ZY9sBPTrsX9lcbmf9B71V18MzDE1qcXne81gjPPgkhImlTI32l1Rqf
         bprcKexLzUyZYSsj0TYYJ4Wo9nPCok4aHWNxYyqhsxNjfdvqr1O8eAuZGa+ogsoDVwKs
         npQA==
X-Forwarded-Encrypted: i=1; AKwUvBw5efGMdNMKmdbMTA4QyQwBFizxvwYxwdtuqoT1iXpp9aOjdvKyssouLN4XEHE2YLF6LLHajXJUdhA=@vger.kernel.org
X-Gm-Message-State: AFuF++mEobUf47fTwj0gBgCuDf4ssNIyBtvcgdpryemsDzFtavkq3AQl
	NXR9xQ7t5RA+0Vkw5wulM8/y3RlPTBdIFKTuufDepcZ5/e8eHLP6TIsCQ/yn+VCGTQwML32zmpO
	j71jcFHHFNSo/F0X4pgeQoGK3Xhd5Ur6uHw9QQbXXEw/GKIqIkvIuSeZGCo2GekQ=
X-Gm-Gg: AYBFou0AUaWQEcsPbh0Sx+6HIPQtwA8fduSeBv7PoCiRbTlgpZCbcLeCEb4otL2XFwB
	DYDsDO/jBBCTZehFwSr91bX+T10R1vs8G+8JlVtdEao6W10c8A6GKM9D4OYcHsj52AA27ZilYQs
	Exc9kZuw1mJahQ5/Zn0Hw+19/B1ZX16WGqlbsnROTCrJ+Ld/Z3/IxQiJjnvLeV5SpgfxZb/+1Ip
	NtF9i/XmZfRSmVO9pGOQ9PkDvY9YBWryhiVb2MvClhtp8a2RyR2hQrnVJBZ227pYP99OZbOuaPt
	91Yvo4SN27d2szTBfzrBCY3pvHS8b3dNb5ycIxYVXB2Mew9ZKx4vTLlOFL21g/McNfRv5dlQa03
	E7kUtDZOp88PfQRrzxcUrhSWBrpVLUNxpc4pelRULK+o=
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr27504737a91.5.1788704302973;
        Sun, 06 Sep 2026 07:18:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr27504676a91.5.1788704302509;
        Sun, 06 Sep 2026 07:18:22 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:22 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:16 -0700
Subject: [PATCH v4 10/12] clk: qcom: ipq-cmn-pll: Add all output clocks for
 IPQ5210
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-10-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=3649;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=hcr2VuSq3luKU7N0o7OKoFiCXrujgoCgSs38Groo04k=;
 b=aThLJQ7pIMKXYqmCwSqvc98NeJM36lgwSCAxZ1RXx11AtuiRXNwFlV6bEKMhVhHglDqJT5L5z
 D7DJ8PINgAZAsYgksnyvfIF4fjOuAtPyxT8pYYDIBHzyR14mfUtFXYK
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: toBRfgwdOCWAfmznfSPmhhiwQnslE3qR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXw3qhEPf3Z5JK
 FEFwVRrgWrqRtsPN2HoFCRv/kZ6bSZmBBNxsQV6uOKdwi4/Nuxz1LZ689hr06fcPerVWirf7Ti5
 yJ9X5fLMQPvqst+OA0PFTT5BSnwyVxO+NNx7fkzwO4ZZaXMmb3iAh6wq07RFVCjI2IDoMbrbOsN
 qN2rx1zrA/VByZ5wJE/JJI0sBYDfyEOnmWzOw4+VJpWVXrB+my9MxVHdUQ8HxIDavoldgOiu0Ne
 0H50T9rpVNM8hNYQKUj6eM+E/dqgH4MI/v8K5xq8qdbeSXAHpKgrkRV9Ubmap04eG9/lzCglcIZ
 zzKK/MrgnnIJQtrfECtOAJ1LUeIAq7zsV2rZ/txXOeqj7Cz0Xsmf0iqNjW65njzZDt492j+V4wq
 E7DTVoJTSIZ9ZT8AOIrTwNTO5nquGS1FTGWRlldNEUWuuUvK4NhB5g2Z9f3XmT/ubMJEPdkYED0
 moXAdDhIiGaqTToWZRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX1X9wIm3edBno
 eYT63cpv09+K4A6C0aYGnkuKuJPu8lAKdRlrSbS1d0OXja56iD2Pn0mf0SV9FZ66GYFDE9oN7hc
 cqCqEf118Zd016UgqGkW7k4U37OiPXM=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9d762f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=P04cmAjberRrbCkX5BgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: toBRfgwdOCWAfmznfSPmhhiwQnslE3qR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

Add the IPQ5210 output clock array and the device match table entry,
wiring together all the infrastructure added in the previous patches.

The IPQ5210 CMN PLL supplies 12 output clocks:

Fixed-rate:           XO 24 MHz, sleep 32 kHz
Gated fixed-rate:     PCS 31.25 MHz, ETH0/1/2 50 MHz, EPHY 50 MHz,
	       	      ETH 25 MHz
Configurable divider: NSS, PPE
PON reference:        PON (enable/disable + 8-bit divider)
EPHY-RAW:             125/312.5 MHz select

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index f94656b8486d..4e5ceae2e449 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -56,6 +56,7 @@
 
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5332-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
@@ -181,6 +182,18 @@ struct clk_fixed_gate {
 #define CLK_PLL_GATE(_id, _name, _rate, _bit)	\
 	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_FIXED_GATE, _rate, _bit)
 
+#define CLK_PLL_NSS(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_NSS, 0, -1)
+
+#define CLK_PLL_PPE(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_PPE, 0, -1)
+
+#define CLK_PLL_PON(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_PON, 0, -1)
+
+#define CLK_PLL_EPHY_RAW(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_EPHY_RAW, 0, -1)
+
 #define to_clk_cmn_pll(_hw) container_of(_hw, struct clk_cmn_pll, hw)
 
 #define to_clk_fixed_gate(_hw) \
@@ -200,6 +213,22 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
 	{ /* Sentinel */ }
 };
 
+static const struct cmn_pll_fixed_output_clk ipq5210_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ5210_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
+	CLK_PLL_OUTPUT(IPQ5210_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
+	CLK_PLL_GATE(IPQ5210_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL, CLK31P25M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL, CLK50M_EN_BIT1),
+	CLK_PLL_GATE(IPQ5210_ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL, CLK50M_EN_BIT2),
+	CLK_PLL_GATE(IPQ5210_ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL, CLK50M_EN_BIT3),
+	CLK_PLL_GATE(IPQ5210_EPHY_50MHZ_CLK, "ephy-50mhz", 50000000UL, CLK250M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH_25MHZ_CLK, "eth-25mhz", 25000000UL, CLK25M_EN_BIT),
+	CLK_PLL_NSS(IPQ5210_NSS_CLK, "nss"),
+	CLK_PLL_PPE(IPQ5210_PPE_CLK, "ppe"),
+	CLK_PLL_PON(IPQ5210_PON_CLK, "pon"),
+	CLK_PLL_EPHY_RAW(IPQ5210_EPHY_RAW_CLK, "ephy-raw"),
+	{ /* Sentinel */ }
+};
+
 static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
@@ -923,6 +952,7 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
 	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
+	{ .compatible = "qcom,ipq5210-cmn-pll", .data = &ipq5210_output_clks },
 	{ .compatible = "qcom,ipq5332-cmn-pll", .data = &ipq5332_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
 	{ .compatible = "qcom,ipq6018-cmn-pll", .data = &ipq6018_output_clks },

-- 
2.43.0

