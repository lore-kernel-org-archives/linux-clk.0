Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB22470446
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711718; cv=none; b=H8tVutCNXf7FkTn8WCMQfy54ysu90V+p0+92HYA2c8BUEL26D9BBXQ5pfkvL5s0cZFAE3/FYGlgSOStpJa4urWmSy/txMzxWm4aMsjPWCpyhAvlpDlWt4xD3E0QDosANO0npMr1MiSiByBEzpgJm/etyORa25QrR3eU6+cmcQQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711718; c=relaxed/simple;
	bh=LpInDpEUWJ19GKOJD8F8/rInbWot2Uwo7fiFfk68V/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CIMveRCOMvg7PV/eghj66lXoUq7AdUX7fv+pVx0xuNxuUYxyqZWKSC8Sv81E0ewqjlrzmnUNEDGilZA/pRhycXKe9NbQrG7NaWMNL8zYfCGhRto2+zjc/ksmQpTcAtM45qqhH/lznUNFxHsCAf+0nuWAoRjswvHqwhcq3xSYZ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GUCmDvu3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E363660z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GUCmDvu3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E363660z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbBH51331190
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6SZn23niFVljmYVGOyh3Y5x3Vk1hRBJqIud6UFrg0Os=; b=GUCmDvu3pami7pOD
	kHzyhk0FbPAogWuiJ/zKxlZ8Jr8yFwQxgfIDfLSx/Pe6yKNX8jck0/1b8fnjJ1/0
	Gv6iqrC5ybwH7aLuv8h7xHBX1GcYYke3mdDiFSha7K7XybiqQ2FprLUhchiLl/F5
	IOoq3O3q1C8DJJHTaa0ybRAdrJgWzT4oUyvDn/Fyljqx7Hp6GjjrjwkYCVPPC7dD
	qXfJRbwO4SDPRdxFCg8oTz/h/3WhBxRKnmUp5Qli/6UNPSGccxx9SbJHH65PxfmW
	wQm1Qe+C8Dnsjf2L/dRUCtDRi26sdy8mxYDQeNu7pBlSlMwB78QVsRJ6n2t1gSM4
	lgkPdg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g21d9ghp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8487eb67173so1419072b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711706; x=1787316506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SZn23niFVljmYVGOyh3Y5x3Vk1hRBJqIud6UFrg0Os=;
        b=E363660zQTRIaZ6EKZAJ3V8rx7aOQZKPrtYkhlXCWlBAa/KWs8+8s4IVifF8jFAQcq
         UHp1pcx1RfdLGNn5tapVvgDr1ajH56jlNHctN0f0Ky8LsNeVffnFXokGn9ViOW/aFPJw
         DLsFDXP+onMcGXGsvEenPLhUjKjrbIRV47jAtQYnJhX4buFQp0nluhSyxhbqMktneDDU
         dslOliASAky6BKadF2Gunq2DoXKotzXlXw9qKqDLD2P8nlf/v38H5Ms4HF4FCD/Sathf
         9RymCt7t/XUlzeiv06NauxqoZreeuCQ/t3CoYDnlrpehvtWyOVzBsT1z3fP/fF3DjYSA
         j7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711706; x=1787316506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SZn23niFVljmYVGOyh3Y5x3Vk1hRBJqIud6UFrg0Os=;
        b=l/gqH5m23cRkipTxvZUddylGIxpBh63js6uJV6sOWsV8Zv3GGuSMIzWSbhqtNUr2t4
         r6QJuWLp7lr7JchDXQBu+Co/RK6q1Z+1smLme+pU0HaK3uKqL4ATwLqxTdwdb/Dbg7DC
         ByyvRbRUnUiU0H7X8/PxYXXYABf+hbX25IKvxcSJ2xKRuiEF+vfJ1eSM83+EHrScsdDl
         Cs1KpB3KeUSGY6edgFgxJqVLRpAlOEgTdewbuaduE+8zAzwrU2xgVA2WK/psPXc1m3wC
         5UITJqg9qY19FDc9wA1kyfphL3Ul/thai1xEqbKwnqjao6BXgGtq63ETeb07BPfi2Vuq
         OBwA==
X-Forwarded-Encrypted: i=1; AHgh+RrJBC/OAnOJ6IRu4sFBFcSGuA9fOpyReRQWUapU0eETYlyZJFSrJEDdp/9pIwb2LuN5h6IH+kWeIL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFK5dRWYHaorybL8PWL8UOTwNFoNBJldpswsjmDGPvnmRA1WBt
	UQY75Cdvk0MrHHciq4kUYbx7wyIqLSTG3r86dU5U74tPBQwfNDWZFHW0UDciVE2lwa0rCbSqgjY
	M6eF5ViywfFZRxRp1fdbO9dotgByCdLGj7gwlIG49W4VO2PrF2DKNkBkDM0Z2Vlc=
X-Gm-Gg: AR+sD1104iUJYTgDdZYAfHTWbaVQjrhDGEtIBqfKi5WvEH5cOdYRpiibovQIA7hmvtr
	9t+plIXI6w91G+92YjEClXtTyPRJOKBiArdHmoD2xZYwRh3ivP0OSJ2vz1SmGmb7cHpuAPsG5u3
	rL/K1y9MWaSu9RdhSUsWJgrWk2/Nv1Lw2H10kBsU+w//EhbrvYEE3GwPmjQlujbh2qqN/Bo8TLm
	/3jTEgIUICUAJxekYeXMAtB/5beWwkKlBmLbvRWF15t20ztloqP0Br2ECDCug8qojUYjMf5DRF9
	74akB0D0uvWIDzoPUF+JfgvvzhYrN/U+4TFMmafAKqCgeiPN5KbqyWkuL3fzndgzRldn3FQuHaT
	tZIGi13bF/Xg8ETSv3EOERyXVwKX9dOYMrmmf7HG1CvY=
X-Received: by 2002:a05:6a00:a242:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-84fde018c5dmr6022663b3a.1.1786711705685;
        Fri, 14 Aug 2026 05:48:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:a242:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-84fde018c5dmr6022614b3a.1.1786711705237;
        Fri, 14 Aug 2026 05:48:25 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:24 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:18 -0700
Subject: [PATCH v3 08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-8-21c3db378611@oss.qualcomm.com>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=5324;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=LpInDpEUWJ19GKOJD8F8/rInbWot2Uwo7fiFfk68V/I=;
 b=51L3vF8gZU9WaaBShZE79eYH24pp+FlPFfVKqsb6F1z7ZDAlD4/vtI8srQ4AAiua/uW3ZEFtN
 HpwgxNPAjw0BNGxyzYFs+9z3K9DvqjCLQmD8udkq+onu9PQ9+FMl4/d
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfXwfUhmD7hAU9i
 kKywKLNILRKB2Lw3OzqDVuCF5XtWU2LIDn6JpF97Xsid1Vckuf76lgd35V/rioKBoLwPtLlk8EZ
 xgfloSydq2/mDSgy7M6GrvC+fNPALms=
X-Authority-Analysis: v=2.4 cv=eqzvCIpX c=1 sm=1 tr=0 ts=6a7f0e9a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nVjtjxfPRRi5vZi_wFUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 8v-cs-8XubkFNEl0hHttV4Kq1p2oEkSb
X-Proofpoint-ORIG-GUID: 8v-cs-8XubkFNEl0hHttV4Kq1p2oEkSb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX8dOym22ixTqs
 8Iosv2PYkTT0boO9Rw8HGkv8P5qjv+64obFR+/nqXY6QIxTh9ik67kr40ecik5dy/Zc1faQtDop
 0qQJkhM3ShSowu24oXi3EkcQxx35/c+5CWQm8osrh0cWJZ/OXT8IJbnLbMiksue4rnF+xF3sVXl
 UxgfpfhEbGJj42aX7S4Av9qSDt23gwr6AVAQvZ7thXNBQlvmROy5cIHI2/NTBgwx3FCwZQD7uwh
 tiOEAEU9eJ7gshySUb2cNPMobRtYond71O4dZ9r86rMH3TZT/SqWQlfXlPpL17GtSEDY6e6emGH
 3l1B0nTY+5DH/dtTsKBAdIMAoGIF0TTJWDkH412E+XbGSeqIWA/BFz6AZxu+vxPQK66wH60wJPF
 Tgb+NqDWtE3BpQvWr8YgHim74RDJm7m0+IEMFFHWtmKoIz9JW7SWOaBRhZAS4WcmaizcMPwpmuY
 JT/cFlwbRdWty6AOf0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140097

The EPHY-RAW clock is an IPQ5210-specific output from the CMN PLL that
provides the raw reference clock to the SoC-integrated Ethernet PHY
(EPHY), which supports up to 2.5G link speed. The output frequency is
selected via bit 10 (CMN_PLL_GEPHY_312P5M_125M_SEL) of the
CMN_PLL_PON_CONFIG register:

- 0: 125 MHz   - for 1G/100M/10M link speed
- 1: 312.5 MHz - for 2.5G link speed

Parent it on cmn_pll_div2, like the rest of IPQ5210's output clocks,
for clock-tree consistency. This is functionally identical: the
output rate is purely register-bit-selected and never depends on the
parent rate.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 114 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 8987e0ff7dea..eadbf6482aa4 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -77,6 +77,7 @@
 #define CMN_PLL_PON_MODE_SEL			BIT(9)
 #define CMN_PLL_PON_EN				BIT(8)
 #define CMN_PLL_PON_DIV_CTRL			GENMASK(7, 0)
+#define CMN_PLL_GEPHY_312P5M_125M_SEL		BIT(10)
 
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
@@ -98,12 +99,14 @@
  * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
  * @CMN_PLL_CLK_PPE: PPE clock with configurable divider
  * @CMN_PLL_CLK_PON: PON reference clock
+ * @CMN_PLL_CLK_EPHY_RAW: EPHY-RAW clock
  */
 enum cmn_pll_clk_type {
 	CMN_PLL_CLK_FIXED_RATE,
 	CMN_PLL_CLK_NSS,
 	CMN_PLL_CLK_PPE,
 	CMN_PLL_CLK_PON,
+	CMN_PLL_CLK_EPHY_RAW,
 };
 
 /**
@@ -603,6 +606,111 @@ static struct clk_hw *ipq_cmn_pll_pon_clk_register(struct platform_device *pdev,
 	return &pon_clk->hw;
 }
 
+/*
+ * EPHY-RAW clock operations for IPQ5210.
+ * The output clock rate is selected via bit 10 of CMN_PLL_PON_CONFIG:
+ *   0: 125 MHz  (for 1G link speed)
+ *   1: 312.5 MHz (for 2.5G link speed)
+ */
+static unsigned long clk_ephy_raw_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct clk_cmn_pll *ephy_raw_clk = to_clk_cmn_pll(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(ephy_raw_clk->regmap, CMN_PLL_PON_CONFIG, &val);
+	if (WARN_ON_ONCE(ret))
+		return 0;
+
+	if (val & CMN_PLL_GEPHY_312P5M_125M_SEL)
+		return 312500000UL;
+
+	return 125000000UL;
+}
+
+static int clk_ephy_raw_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
+{
+	unsigned long rate_125m = 125000000UL, rate_312p5m = 312500000UL;
+	bool rate_125m_valid, rate_312p5m_valid;
+
+	rate_125m_valid = rate_125m >= req->min_rate &&
+			  rate_125m <= req->max_rate;
+	rate_312p5m_valid = rate_312p5m >= req->min_rate &&
+			    rate_312p5m <= req->max_rate;
+
+	if (!rate_125m_valid && !rate_312p5m_valid)
+		return -EINVAL;
+
+	/* Pick whichever of the two supported rates is closer to the request */
+	if (rate_125m_valid && rate_312p5m_valid) {
+		unsigned long diff_125m, diff_312p5m;
+
+		diff_125m = abs_diff(req->rate, rate_125m);
+		diff_312p5m = abs_diff(req->rate, rate_312p5m);
+		req->rate = diff_125m < diff_312p5m ? rate_125m : rate_312p5m;
+	} else {
+		req->rate = rate_125m_valid ? rate_125m : rate_312p5m;
+	}
+
+	return 0;
+}
+
+static int clk_ephy_raw_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct clk_cmn_pll *ephy_raw_clk = to_clk_cmn_pll(hw);
+
+	if (rate == 125000000UL)
+		return regmap_clear_bits(ephy_raw_clk->regmap,
+					 CMN_PLL_PON_CONFIG,
+					 CMN_PLL_GEPHY_312P5M_125M_SEL);
+
+	if (rate == 312500000UL)
+		return regmap_set_bits(ephy_raw_clk->regmap,
+				       CMN_PLL_PON_CONFIG,
+				       CMN_PLL_GEPHY_312P5M_125M_SEL);
+
+	return -EINVAL;
+}
+
+static const struct clk_ops clk_ephy_raw_ops = {
+	.recalc_rate = clk_ephy_raw_recalc_rate,
+	.determine_rate = clk_ephy_raw_determine_rate,
+	.set_rate = clk_ephy_raw_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_ephy_raw_register(struct platform_device *pdev,
+						    struct regmap *regmap,
+						    struct clk_hw *parent_hw,
+						    const char *name)
+{
+	struct clk_parent_data pdata = { .hw = parent_hw };
+	struct clk_cmn_pll *ephy_raw_clk;
+	struct device *dev = &pdev->dev;
+	struct clk_init_data init = {};
+	int ret;
+
+	ephy_raw_clk = devm_kzalloc(dev, sizeof(*ephy_raw_clk), GFP_KERNEL);
+	if (!ephy_raw_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_ephy_raw_ops;
+
+	ephy_raw_clk->hw.init = &init;
+	ephy_raw_clk->regmap = regmap;
+
+	ret = devm_clk_hw_register(dev, &ephy_raw_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &ephy_raw_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -681,6 +789,12 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 							  cmn_pll->div2_hw,
 							  fixed_clk[i].name);
 			break;
+		case CMN_PLL_CLK_EPHY_RAW:
+			hw = ipq_cmn_pll_ephy_raw_register(pdev,
+							   cmn_pll->regmap,
+							   cmn_pll->div2_hw,
+							   fixed_clk[i].name);
+			break;
 		}
 
 		if (IS_ERR(hw))

-- 
2.43.0

