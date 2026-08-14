Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E105470448
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711718; cv=none; b=Ocb79rKFWdujWXHx3ZT7T3n2n5SLxRe1AIvxZZ6IcuckpG2A7PrGqtJdspxkgLK39TE9vNRtuumckkkgcHZ37E9EGWAi1gf2nEpUy9cNS7FzLqOkB6AjM1ShP2cHwKvMv9SO6ATwqezGyz1ukKYe7G6qB2Eva017IBMZQmI07BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711718; c=relaxed/simple;
	bh=pUoIbUSL+f38DPS2zkKlmAHQL0qngovWZZsCPqhx2Tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mse+Ykf1773cIjHvf5oH+Jm61aluCQLYNyxONCcouWEVRieU+/mILn6mRAUq2fN5qXMdLS7gnVZVUrAKFQJsbTrHb/vY2xZZszVtMndrTe2aTgAWLPZoZJGi9ipMMOcbRDPqVa8cWFcVJTeEBc5XX5ZXJVO1t2lchpGhxMaUE9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ye+1BxE/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5Uq7RIo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ye+1BxE/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5Uq7RIo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbBH81331190
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OhGo6OLomxSK3hqcXnst3JF08gnTATEUDjURuCQlHhk=; b=Ye+1BxE/XbJTy/gg
	0xdJdgSbpNv21TepeRuMU9pgB1FGNid3dLlT8OJxBHg7Eg2Yo5AAvqH3E9fhQdr/
	cfxmAyAA6vqaEvcaEhZsYkQxF/bySLls1CqaCKRR3qeWFVdx8hktHjE+JDbpMsKX
	xbrWzsj9xohXzsrtZ3lK6Ez5/0XZDEopVrBdL5oqQ1xuVjko3IiHdGYdQYNw+Uta
	1NSnhGrokttFw+4xZLMn8i7ElYrxtBPQptWkPZOR3UWJT4bl/7W93wx+bmBt4M9i
	JYcdXLUlxrdZUUYbhfT3KXOUt75hJpwqovkqE6Aptftpp6rfLeL+/Lo9uztfIg3L
	22m3ow==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g21d9ghpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84865f326efso1091519b3a.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711707; x=1787316507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OhGo6OLomxSK3hqcXnst3JF08gnTATEUDjURuCQlHhk=;
        b=L5Uq7RIoXKfIjwxnOS9kc9X0rmX58fTcZqpS/DG0jDaNzVbH30wlsPQihWdxdGZOqm
         B2IX2eC7wQxxLjiwU2Clae08YmlmwE+MkS1cBauaBvX2iBc7If2u11vHtUI+b08MU0h9
         TSs4BYPImTarQ5fmWAtnLvrSTBekoW2C6n5gpEc1HgCA09jVkSGqC5ZIIVND6yerA5cX
         b5rbOIxjP0lxCILEdxvkzdrP/BiD3LhgYidoMmBoS9JU6cvKw1qNTC0LXOtfIC+Oqb4E
         5+Z5UsQbabSEU23gtatWDzAgE1dVJphT+26ClEeDwEH9ie+bKnpLshlH6ot/y9JDAtb0
         l8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711707; x=1787316507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhGo6OLomxSK3hqcXnst3JF08gnTATEUDjURuCQlHhk=;
        b=lm1HP/aXtObZfAUvCrTuDTMyIaLtpnM89xdq3G/OkwptXlHIBhRPdBfgUOuLVftz2b
         Evla8kG8xVehOqTd0+50tW2h8P1WLrIBmUg1uo6x4ofpqMviN/uC8/qnUwN0ttfQ5XQl
         ioAFw2gU+Z8wPOc6ANdeB1OAYKZoKQQoA5ViviQHP6Ic1huHInc4acohTE6G+VwTPGf4
         hgV27eghdLtKIke1bE5PYXtD3KWbD5F2ssWAhKFGPj4kFiA5fbBIAr87HzzJJ4FJ4rLh
         Ex94BeJ6MLTtNf4pVT2U75tPZaZ8kCUrJJK04Cs/AgJCIKRzZCqyL1zEh5DTHCu8sCFX
         LO3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpkmc3TL3Z+fGCojign5R6nA87lYKmq1byh2/4iBCpptILgy8/XIZCQRqqrY/S5KMGvEYvavfYi2tk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxFZV06bF2YflVCmEz6NQC2mx4s88u+mhliE2CsvfvpK3AUWLv
	zPLTVoEcTJbYgra63Cus1FueM8qOX2n0/TTKAixnYJxGQiMVCS58BDM0xrje0kkvmqTtxV/o7sB
	bjxgONElWLnc8EkmP52IHlvQ0T4frJhe9pPRBViRL0dKM88Yr1gNaOR5trpUPzf8=
X-Gm-Gg: AR+sD11Scmb7tGrl/IZyvbubhM60rJDxZYbE9DApoVKn3+lyXq0Gf/0Moha/P7piUyh
	xNmZ/LvM4BFRZrcpoP5q9p/m2IqTYt6KnRAO0E8Xpm1zWr8px9g+5K4LdfiE5Z8T8ia5o+yj3Kt
	Q5Z+wE625bqLGvxHIpe/fa3sDiE+FgM69z6LpLDwJIH6i4vFJMk30qZLzzieeToqkuCnpYAt19m
	/nLKRTAe7BS2f9IkBN4CIaPls02WhY4BpLR11KKduXsFx7vLV9QrQgUuWxpJyHENphw+RkPTFIw
	mYW1CuI/YPCIZPSnyB0OLrJtVfbeRshndCYEoLajdN6JerzIXdIEbRITheiJalxxxjlbXLlfJby
	bStwTUkncGmXuymLDBAe4SRQ86UXKZztwk0BYqqfVYOQ=
X-Received: by 2002:a05:6a00:b8d:b0:847:712d:19ac with SMTP id d2e1a72fcca58-84fde364f64mr5594824b3a.8.1786711707235;
        Fri, 14 Aug 2026 05:48:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:b8d:b0:847:712d:19ac with SMTP id d2e1a72fcca58-84fde364f64mr5594733b3a.8.1786711706556;
        Fri, 14 Aug 2026 05:48:26 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:26 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:19 -0700
Subject: [PATCH v3 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support
 for fixed clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-9-21c3db378611@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=7664;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=pUoIbUSL+f38DPS2zkKlmAHQL0qngovWZZsCPqhx2Tg=;
 b=In+v8/zFLi2JIHz9JCYovxykSH0TiHi2kXfMkSCaWBK+L7eJvUYTIuQBxkS0ToazzM9u4EdMR
 XXrtLGKgIssB4qwd+uy9hKLcxigpAqgNIyJx9ZlZfH+3ZbZZZn8R8V9
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfXzLuIDUk6v65E
 4SUAr9j9110G/dSr5FENmwKQQZhCnZcNSWDk0oPPF3mgxZ/PTno6XzoLpwrbu3S0ti9Pe4ZGbg1
 DgrfGsZZnXbFlWQdVq3SkICdjM4NPug=
X-Authority-Analysis: v=2.4 cv=eqzvCIpX c=1 sm=1 tr=0 ts=6a7f0e9c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iNkdjwxjGt8fguHhLfQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 8uTH3echpLsXx5CyjPclZjOTthlv3K9c
X-Proofpoint-ORIG-GUID: 8uTH3echpLsXx5CyjPclZjOTthlv3K9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX5hTvf5cyMzjH
 lDCYDUc1NHSbfPJI6vqHzGVrMg2EVR+SoP0Sh8p26NNJU2sDK6b6NewKf77C5r41eDeE4+KMJUB
 zpP7JYhDV7EV7WeSDZOBnUP4L14swqKajgY6Ak+k3xS7OJ78oJ8TTEZHoWcuthTLL1yGWO+Xvaq
 s6BXHSxFBl1tNV9so8v87WY/Nc7Cd+Tw2wNRKMS4cLJxmM/PX81p90XgUjffv/m/wicu65h1YjN
 oLJndtyf/+KViM7wenqqCjmV4hT/IXUNss9AWPCD289MhQrPe/DW/HBXXo+R9D3E51bIwGuU0aN
 tUqBc0ti8py0OAlZuD1e7sUA37mBK0MAxjZXZpe03XfvuT+/kx3C8ZhsrG9uRRCsFrZJa5qStwp
 ZHY3c7NQx/zMPXo8dnR/qa70fO/6fHU3eehwQ6bHxvO55V2hoYpJt7Lpo0L+WPXNb4pJk9zmHq8
 OqIwNeuDMJF73PK4ixA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140097

Some CMN PLL output clocks require a hardware gate in addition to a
fixed rate. The gate control bits reside in the register
CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered via a
new struct clk_fixed_gate and clk_fixed_gate_ops, combining a fixed
rate with enable/disable/is_enabled gate control through the shared
regmap for CMN_PLL_OUTPUT_RELATED_1.

The enable_bit field is added to struct cmn_pll_fixed_output_clk (set to
-1 for non-gated clocks). The CLK_PLL_OUTPUT_RAW() and CLK_PLL_GATE()
helper macros are introduced alongside the existing CLK_PLL_OUTPUT().

Parent these gated fixed-rate clocks on cmn_pll_div2, like the rest
of IPQ5210's output clocks, for clock-tree consistency. This is
functionally identical: clk_fixed_gate_recalc_rate() returns a fixed
constant rate and never depends on the parent rate.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 141 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 136 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index eadbf6482aa4..d5eddedd01ed 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -93,9 +93,19 @@
 #define CMN_PLL_DIVIDER_CTRL			0x794
 #define CMN_PLL_DIVIDER_CTRL_FACTOR		GENMASK(9, 0)
 
+/* Clock gate enable bits. */
+#define CMN_PLL_OUTPUT_RELATED_1		0x79c
+#define CLK25M_EN_BIT				15
+#define CLK50M_EN_BIT3_BIT			14
+#define CLK250M_EN_BIT				13
+#define CLK31P25M_EN_BIT			12
+#define CLK50M_EN_BIT				11
+#define CLK50M_EN_BIT2_BIT			10
+
 /**
  * enum cmn_pll_clk_type - CMN PLL output clock registration type
  * @CMN_PLL_CLK_FIXED_RATE: plain fixed rate clock
+ * @CMN_PLL_CLK_FIXED_GATE: fixed rate clock with a hardware gate
  * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
  * @CMN_PLL_CLK_PPE: PPE clock with configurable divider
  * @CMN_PLL_CLK_PON: PON reference clock
@@ -103,6 +113,7 @@
  */
 enum cmn_pll_clk_type {
 	CMN_PLL_CLK_FIXED_RATE,
+	CMN_PLL_CLK_FIXED_GATE,
 	CMN_PLL_CLK_NSS,
 	CMN_PLL_CLK_PPE,
 	CMN_PLL_CLK_PON,
@@ -115,12 +126,15 @@ enum cmn_pll_clk_type {
  * @name: Clock name to be registered
  * @type: Clock registration type
  * @rate: Clock rate
+ * @enable_bit: Enable bit in CMN_PLL_OUTPUT_RELATED_1 for gate clock,
+ *              -1 for non-gated clocks.
  */
 struct cmn_pll_fixed_output_clk {
 	unsigned int id;
 	const char *name;
 	enum cmn_pll_clk_type type;
 	unsigned long rate;
+	int enable_bit;
 };
 
 /**
@@ -133,6 +147,10 @@ struct cmn_pll_fixed_output_clk {
  *           plain fixed-rate xo/sleep clocks, which stay on the main
  *           PLL); other SoCs' output clocks use hardcoded rates that
  *           never depend on a parent
+ *
+ * This structure is used for all CMN PLL-derived clocks including
+ * the main PLL, NSS clock, PPE clock, PON reference clock, and
+ * EPHY-RAW clock.
  */
 struct clk_cmn_pll {
 	struct regmap *regmap;
@@ -140,15 +158,41 @@ struct clk_cmn_pll {
 	struct clk_hw *div2_hw;
 };
 
-#define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
-	.id =		_id,				\
-	.name =		_name,				\
-	.type =		CMN_PLL_CLK_FIXED_RATE,		\
-	.rate =		_rate,				\
+/**
+ * struct clk_fixed_gate - fixed rate clock with a hardware gate
+ * @regmap: hardware regmap.
+ * @hw: handle between common and hardware-specific interfaces
+ * @rate: fixed clock rate.
+ * @enable_bit: enable bit in CMN_PLL_OUTPUT_RELATED_1, which is shared
+ *              across multiple gate clocks, but regmap already serializes
+ *              read-modify-write access to a given register, so no
+ *              additional locking is needed here.
+ */
+struct clk_fixed_gate {
+	struct regmap *regmap;
+	struct clk_hw hw;
+	unsigned long rate;
+	int enable_bit;
+};
+
+#define CLK_PLL_OUTPUT_RAW(_id, _name, _type, _rate, _bit) {	\
+	.id =		_id,					\
+	.name =		_name,					\
+	.type =		_type,					\
+	.rate =		_rate,					\
+	.enable_bit =	_bit,					\
 }
 
+#define CLK_PLL_OUTPUT(_id, _name, _rate)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_FIXED_RATE, _rate, -1)
+
+#define CLK_PLL_GATE(_id, _name, _rate, _bit)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_FIXED_GATE, _rate, _bit)
+
 #define to_clk_cmn_pll(_hw) container_of(_hw, struct clk_cmn_pll, hw)
 
+#define to_clk_fixed_gate(_hw) container_of(_hw, struct clk_fixed_gate, hw)
+
 static const struct regmap_config ipq_cmn_pll_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -711,6 +755,85 @@ static struct clk_hw *ipq_cmn_pll_ephy_raw_register(struct platform_device *pdev
 	return &ephy_raw_clk->hw;
 }
 
+static int clk_fixed_gate_enable(struct clk_hw *hw)
+{
+	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
+
+	return regmap_set_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
+			       BIT(gate_clk->enable_bit));
+}
+
+static void clk_fixed_gate_disable(struct clk_hw *hw)
+{
+	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
+
+	regmap_clear_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
+			  BIT(gate_clk->enable_bit));
+}
+
+static int clk_fixed_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
+
+	return regmap_test_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
+				BIT(gate_clk->enable_bit));
+}
+
+static unsigned long clk_fixed_gate_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
+
+	return gate_clk->rate;
+}
+
+static const struct clk_ops clk_fixed_gate_ops = {
+	.enable = clk_fixed_gate_enable,
+	.disable = clk_fixed_gate_disable,
+	.is_enabled = clk_fixed_gate_is_enabled,
+	.recalc_rate = clk_fixed_gate_recalc_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_register_fixed_gate(struct device *dev,
+						      const char *name,
+						      struct clk_hw *parent_hw,
+						      struct regmap *regmap,
+						      unsigned long rate,
+						      int enable_bit)
+{
+	struct clk_parent_data pdata = { .hw = parent_hw };
+	struct clk_fixed_gate *gate_clk;
+	struct clk_init_data init = {};
+	int ret;
+
+	gate_clk = devm_kzalloc(dev, sizeof(*gate_clk), GFP_KERNEL);
+	if (!gate_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_fixed_gate_ops;
+	/*
+	 * These gated clocks may be relied on by external hardware or
+	 * bootloader-enabled paths without an in-kernel client driver.
+	 * Add CLK_IGNORE_UNUSED so the clock framework does not disable
+	 * them when no consumer has claimed them.
+	 */
+	init.flags = CLK_IGNORE_UNUSED;
+
+	gate_clk->hw.init = &init;
+	gate_clk->regmap = regmap;
+	gate_clk->rate = rate;
+	gate_clk->enable_bit = enable_bit;
+
+	ret = devm_clk_hw_register(dev, &gate_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &gate_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -762,6 +885,14 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 		hw = ERR_PTR(-EINVAL);
 
 		switch (fixed_clk[i].type) {
+		case CMN_PLL_CLK_FIXED_GATE:
+			hw = ipq_cmn_pll_register_fixed_gate(dev,
+							     fixed_clk[i].name,
+							     cmn_pll->div2_hw,
+							     cmn_pll->regmap,
+							     fixed_clk[i].rate,
+							     fixed_clk[i].enable_bit);
+			break;
 		case CMN_PLL_CLK_FIXED_RATE: {
 			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
 

-- 
2.43.0

