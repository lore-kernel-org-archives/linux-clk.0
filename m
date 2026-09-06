Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BBC445AD0
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704306; cv=none; b=dfA9Ic9q60SiFlyAkvscBhFQf08moZC4RuMMq5Ke5PqkX37XQtUIETx3wPB3hIBZUbz9LDNSOi3gx48BhOT3VxIiNXDS43YGcBNkLiFMeLsmqZWLI5c6Nq+ddZ6UtNMJMj9o9//6XIjSVULGabid78lNIG00DCLPiKRtSO5KOWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704306; c=relaxed/simple;
	bh=n/9nX+9VWAPAmte4vZ7msbK6+xnNiSQM3zoM5+FH3Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qlnYejVz5RiCTc1qk3ivt0ZU8MrwAO98WWZfSKZyVrTennqNRiSnGTy1lSYRIwhpGxbTNMzPwNDV2G0bKyN/zj4VuprBZJPVjoqZD9rtP+AEox65lxiXitO3l7cLA5qr2FX3xDfHf1Rv2cbKcTy5Jdssh05yHshuRz0/R76eIPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7uM1Vq9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8GlWDV7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7uM1Vq9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8GlWDV7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68600LCT088162
	for <linux-clk@vger.kernel.org>; Sun, 6 Sep 2026 14:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sO9AjFIsQEFwnO7nSWg6L0VhbmLxxWz8ATySxAgohCs=; b=D7uM1Vq9JbvPx97M
	0iH+owrBiZhBqdMjg1u3PhTRs0cn2QbIYLfXjP6ceGOwc0+TMjS0lFUSp6DM9t36
	rsG0flCSB0qtrEo8HTbwxjcmhcHaHndmZ1GKhB0yQXYv9lB7MFt8eCB3Km5fU+h/
	oqCYkGjQ+dGEsYZ5lpa9p4jIj9Nql9lNCY8tyod5aSorBkWwoBrnSDGZMe9UBHXh
	Q1kFKux70u/BivkiH5DpxrvpQwGn4Z0xilk8rMBRBwg9ZW9XXj2Cl6+1QbAkAHvY
	5Lfj7Cte7h7POFUyyIGlQR4NM3q5ZeqrLdqwxSzO/O/GoG7X2LJ/3n2IRHiobxvx
	5UZgtA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany3gxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 14:18:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so5064271a91.2
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704302; x=1789309102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sO9AjFIsQEFwnO7nSWg6L0VhbmLxxWz8ATySxAgohCs=;
        b=j8GlWDV7+DuQegDJI0oDg8U4RkTuw5w0ibnzFBnkBwl7mzR9+OXHtha0mFFVsqQ7JX
         6jqxtMgTL4qM7KdZwL3PO6pugZqzqhRZVExszLCABAtFvIUcxbXiZC6udHDCV+4Ap3/O
         RKo+t82BcKrkW8VlFNNjm8ceF0rwIzrEgS/exe3Q4bHtMoFOdObG0d+IfG2zIc1QKqB0
         MkO+VTOFADWI8dhs9OwDcCnfhsIeQD1Z9XzpK3oufM0ZQqP259bNWpQnK3Yi7jQhTLZ6
         YMGO3NkEEyoRmwpRruCgUg34/XLPuU+AdBPaUvoE5VgxHo1z4KM72oW/tgq8YYOCXP+h
         LnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704302; x=1789309102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sO9AjFIsQEFwnO7nSWg6L0VhbmLxxWz8ATySxAgohCs=;
        b=FoFlZGU7kZGsqiEMh5nt+uueiDPcZ0zgzRyHapeSSZnayHp/chWcLq+YdIcB6hdC6L
         qaMttdnbyegE1DzmJ1XDT2JsFuYrpVbitrcdOwwGSgL5IlJzEg9SZWNBtDMbc7jCU/O5
         FPdfW03Jf6N7tvMvaGpr89Da1sojVuyUDgZuxgtwrJrrDJKOWdVmcJ//lzp5auRczyRO
         ab46l+ACPlMcraAcOyPrQg8DUt8rD9thV9jJUPxKVUI6ZUWex33K9N+R426KsjwZ1sTU
         fqf9gTDoYWhrjHBXPRGm8jZN+4DBdivG4EVP8EvBsatg8Kc9PtgKwgbUyG36KB75WiM7
         A5vw==
X-Forwarded-Encrypted: i=1; AKwUvBz75usCbkZDtzWEWL8pphFn0jIbKmpiDU1d0UTECAWtwx01s5R1rM9t4mQkDecgmycI2lF8Yd0veUM=@vger.kernel.org
X-Gm-Message-State: AFuF++ktYQ5sRnKxj9QhF6EZ9My7OMq3tP4Ac4ST45sZd29Go9g2f4E7
	GW6m102StJqBXSrGos9MorotLII03fHFV74jjhfeZZQMuBLFF1oqvAdpt3N6d+HngxR56uSJff+
	uxTvuolWuDyhjDDUv/q+gA5VajyGcaYlcNATqA+YvEhAeHsXZehIM9NzFKJrfE1Y=
X-Gm-Gg: AYBFou3owaQHOGeh/oaJxV2RoP/uo17ssjyFTMbPVT2B82DeL1uyNhZo0GRcaueyzdn
	88Mi5u/q6jToh6DG9NNIv8lOMubdJXuFiSFybyrsTxIFICeInnSeCwMM43vbHEypJLROM16X7mJ
	CZrD70Qhw3AbSkjIaBXOPYvcS0DbjjQXFUqtH0+DIeEn5qiQXeSaKRPPxe2YGfAgwNzjucXuMcK
	RgQgWjbTgho78+aAhBP626lJoffFNQLYoMn71rIscCBpxthZc4D8ORTfcpKCLE3lzKojObsVZnP
	rYw/o/De/AZn2RR0wqpMaTH6dWGXNWRKTZwraF7Y1P1Lijsxr0gB+ghDd/Yoxo8R6pfvy2p5U2T
	IglqkL0NRw/yAjavFWrKoT86UOXfMLC9EBKflc0v1LTE=
X-Received: by 2002:a17:90b:55cf:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39b261b1a52mr29811352a91.12.1788704301835;
        Sun, 06 Sep 2026 07:18:21 -0700 (PDT)
X-Received: by 2002:a17:90b:55cf:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39b261b1a52mr29811282a91.12.1788704301343;
        Sun, 06 Sep 2026 07:18:21 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:20 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:15 -0700
Subject: [PATCH v4 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support
 for fixed clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-9-aec5ed642f4f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=6514;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=n/9nX+9VWAPAmte4vZ7msbK6+xnNiSQM3zoM5+FH3Ag=;
 b=hoPlAjPF30wi5TakVJMvs8uZTUfVPehyxnHxWRV6nFdcFD6mQj0gnkWNFu2/Kw0kS01NV1t61
 ADkC/PU3bekCftluMtq80uXko9mIfl5wH0tXLn4jSMCA6pSA3/ZM4gt
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9d762e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nCe7lNtRlW15vj1mKswA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: -DUS4HFvbQoxmRfsdCE4r6NbA8LwuEDU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX+EJeBLFiaIG2
 X834piIzQfoAozZdwvOXlwAOdrQoz2Y3PsoaTVHawDcU2m/lFBvKxIN+QY5xfOCUPV2hNxpkvDa
 BIuuvBgMd11z7SG8w2VyovAm2jZk9ND/CHmXDqj0B8cXVpX/lXqe2IdlEnVBMz4Onqzt93GitrB
 QoS3MMAv80mWScp8o9jbpGUhVkcUSJV/AkZ9M9RMBMWKRdcfAFVaT0n8QFeFRMGpd7ZtpvXY87H
 cfCesLJKzV/3nXn2KkWTIlQajAEq/HN2y/vk8eq9G6rPdpV8oalrrZBkZbwvAHiqUk8SnZD0/3d
 OfqFiaT3WbGhv3s+BA/HTia/9eZpHJiS/p0sprH6Ve4zKiRzheu7n54nd35dvwEXKHkIGDaprBy
 NDJ4Nk7+ADEUlRIiKEYM4iF933RlKMWVAQ1/K3zDURhrjLxLXRXr/MdgKu29s1f026QpTGlj+K9
 gEGIEOHT7pMzVvH050A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXwzspS5Syo9l9
 92U48ZhaT31yNNSnXELS4RXSwDeXWyuXw0Ow8MJZABpZzVNr/Qo65nVpNlRkoyZVuU52PcQhvfI
 IGqtnFQuSGHcJAMrmGB/2FGARi+UsnE=
X-Proofpoint-GUID: -DUS4HFvbQoxmRfsdCE4r6NbA8LwuEDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

Some CMN PLL output clocks require a hardware gate in addition to a
fixed rate. The gate control bits reside in the register
CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered via a
new struct clk_fixed_gate and clk_fixed_gate_ops, combining a fixed
rate with enable/disable/is_enabled gate control through the shared
regmap for CMN_PLL_OUTPUT_RELATED_1.

The enable_bit field is added to struct cmn_pll_fixed_output_clk (set to
-1 for non-gated clocks). The CLK_PLL_OUTPUT_RAW() and CLK_PLL_GATE()
helper macros are introduced alongside the existing CLK_PLL_OUTPUT().

Parent the gated fixed-rate output clocks on `cmn_pll_div2` to reflect
the CMN PLL clock hierarchy. Their rates remain fixed constants returned
by `clk_fixed_gate_recalc_rate()`.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 111 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 106 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 6e09c14d7edb..f94656b8486d 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -94,9 +94,20 @@
 #define CMN_PLL_DIVIDER_CTRL			0x794
 #define CMN_PLL_DIVIDER_CTRL_FACTOR		GENMASK(9, 0)
 
+/* Clock gate enable bits. */
+#define CMN_PLL_OUTPUT_RELATED_1		0x79c
+#define CLK25M_EN_BIT				15
+#define CLK50M_EN_BIT3				14
+/* Documented as CLK250M_EN in the register description; gates ephy-50mhz. */
+#define CLK250M_EN_BIT				13
+#define CLK31P25M_EN_BIT			12
+#define CLK50M_EN_BIT1				11
+#define CLK50M_EN_BIT2				10
+
 /**
  * enum cmn_pll_clk_type - CMN PLL output clock registration type
  * @CMN_PLL_CLK_FIXED_RATE: plain fixed rate clock
+ * @CMN_PLL_CLK_FIXED_GATE: fixed rate clock with a hardware gate
  * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
  * @CMN_PLL_CLK_PPE: PPE clock with configurable divider
  * @CMN_PLL_CLK_PON: PON reference clock
@@ -104,6 +115,7 @@
  */
 enum cmn_pll_clk_type {
 	CMN_PLL_CLK_FIXED_RATE,
+	CMN_PLL_CLK_FIXED_GATE,
 	CMN_PLL_CLK_NSS,
 	CMN_PLL_CLK_PPE,
 	CMN_PLL_CLK_PON,
@@ -116,12 +128,15 @@ enum cmn_pll_clk_type {
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
@@ -137,15 +152,40 @@ struct clk_cmn_pll {
 	struct clk_hw *div2_hw;
 };
 
-#define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
-	.id =		_id,				\
-	.name =		_name,				\
-	.type =		CMN_PLL_CLK_FIXED_RATE,		\
-	.rate =		_rate,				\
+/**
+ * struct clk_fixed_gate - fixed rate clock with a hardware gate
+ * @clkr: handle between common and hardware-specific interfaces; its
+ *        enable_reg/enable_mask are set to CMN_PLL_OUTPUT_RELATED_1 and
+ *        this clock's gate bit, and reused via clk_enable_regmap() and
+ *        friends. That register is shared across multiple gate clocks,
+ *        but regmap already serializes read-modify-write access to a
+ *        given register, so no additional locking is needed here.
+ * @rate: fixed clock rate.
+ */
+struct clk_fixed_gate {
+	struct clk_regmap clkr;
+	unsigned long rate;
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
 
+#define to_clk_fixed_gate(_hw) \
+	container_of(to_clk_regmap(_hw), struct clk_fixed_gate, clkr)
+
 static const struct regmap_config ipq_cmn_pll_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -677,6 +717,60 @@ static struct clk_hw *ipq_cmn_pll_ephy_raw_register(struct device *dev,
 	return &ephy_raw_clk->hw;
 }
 
+static unsigned long clk_fixed_gate_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
+
+	return gate_clk->rate;
+}
+
+static const struct clk_ops clk_fixed_gate_ops = {
+	.enable = clk_enable_regmap,
+	.disable = clk_disable_regmap,
+	.is_enabled = clk_is_enabled_regmap,
+	.recalc_rate = clk_fixed_gate_recalc_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_register_fixed_gate(struct device *dev,
+						      const char *name,
+						      struct clk_hw *parent_hw,
+						      int enable_bit,
+						      unsigned long rate)
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
+	gate_clk->clkr.hw.init = &init;
+	gate_clk->clkr.enable_reg = CMN_PLL_OUTPUT_RELATED_1;
+	gate_clk->clkr.enable_mask = BIT(enable_bit);
+	gate_clk->rate = rate;
+
+	ret = devm_clk_register_regmap(dev, &gate_clk->clkr);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &gate_clk->clkr.hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -731,6 +825,13 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 									 fixed_clk[i].rate);
 			break;
 		}
+		case CMN_PLL_CLK_FIXED_GATE:
+			hw = ipq_cmn_pll_register_fixed_gate(dev,
+							     fixed_clk[i].name,
+							     cmn_pll->div2_hw,
+							     fixed_clk[i].enable_bit,
+							     fixed_clk[i].rate);
+			break;
 		case CMN_PLL_CLK_NSS:
 			hw = ipq_cmn_pll_regmap_div_register(dev,
 							     fixed_clk[i].name,

-- 
2.43.0

