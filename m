Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0544144E679
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 06:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085616; cv=none; b=J4rVoAra7KA1/VCmhz2+lltgIEQvmbGfcJHPANE1ck2jOk8fBuBX5DE82xt4205X6esM6hS0rruVtBGuK+5O5lwyeG5j09LuSeELqaqOUsps+LYvTd9lTjy2vE/DTSTOwjI2DeMrkxxJ29suaU+zpm0p4sY73YQtsa9Xe74Sqms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085616; c=relaxed/simple;
	bh=3SshFUJAe2YCABf7vZhxKHsnDDjDnSisNVo3j+1z8NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NFszKJQXxI9Dpd7hXQv1i0kXJNp4m5pr8S6cBAmLbvfkKS+KwrtZZ31/iYkIQbvyV5QwTkUzoE7q+8ZyHzWxKZ50MPdgSyHo6Jha5m5tL/SU6sJpMMYkzI1RX9kmEJd6MdpKMrrhlbs/LZZCTQ4STyaKWUhdiipIWiNNEXsJeDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMVeEmwU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Edbkdyca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMVeEmwU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Edbkdyca"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GpTt3477199
	for <linux-clk@vger.kernel.org>; Fri, 7 Aug 2026 06:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHcrv3pmf0NdyKKv8pTM6iHq5M+b71roOxSHgPeAzMs=; b=hMVeEmwUeBGSR8LK
	+96w8dRK6jlyHSxUzRPPS7MgiSuu0NRAzWUfDwgBwBdK809w0K9WNJrGxjj+CTDA
	8tb0JiWAPQkJvpy6PYPMXzLYQl3qLuAPg1hZ3KM/vSCQqqYJ1OpDHsw8tJ+2Ga+s
	/UbyVQwg9zxLFHh7iJbs/ZHEVMUw9flIGwb23Cwz0WUDpDNNX+NLb7z+tuLsPhwO
	11nFSQ1LT5zhn5pBPgQLhr4RnGluMUo91pZi6tf3eJVC3XkO0cO7pTuKBH0/SK7G
	IzPOMMwCWz/CgXcJxKdaawJkfLGTaAkS4fCgI5CjPRlN1rvQGLGz7gw6H2ekk3Il
	2tnuEw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hap4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 06:53:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so4799474a91.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 23:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085611; x=1786690411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHcrv3pmf0NdyKKv8pTM6iHq5M+b71roOxSHgPeAzMs=;
        b=EdbkdycaFl5JtyXLPsi4ZEqMQsn5q+nOg9YSay06RqbLb/ppQrzwOuKmqipj4OeiJY
         e5w5FrRzW1McU7NUI79pUwT70mp5NgEm/nPzMgsAonRqeK4WY4E6pXznIo3Dicc0Unmz
         IDYuzU7GeXlTjUhcULcgvCfSJinocHyXroh/IMtr0UCnVBxg2pSAmItK6uq/6eTtXI1i
         wCi6SBvHyJNFcTHtoT3Zr6BXWILjTKYJeJ6am99z0C6qjPBKKh1pfVkXWV1y4FbwdCr9
         bkAT/wpKYA6V4ocUnzeY/X+AnMaQFUq11QLUkDR3SdqPju+qWWm0OL2PQ30M4ikDdXaY
         pL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085611; x=1786690411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHcrv3pmf0NdyKKv8pTM6iHq5M+b71roOxSHgPeAzMs=;
        b=ToL3hZArtGoyhL4yNkgBGzJxwfM7X1T6oZIMxJ1vThsLMGsBInSp5iWtGEMmnPFCD0
         4tbsP6L39vO+pR4NanIMZaliejot3Ly793OFLFT793q0BrP4Mv31V1nPEVyQrbstUDG2
         ivC3qPHIf+W2qkvbigEnYLJHoVQGBptpOOCgd+0jOcoIbwabg1LU7Rtn159mfrsTKvwB
         DxhW7cxWmlnFaV11XgWu4l+tF2wztF0oe7Ep391wh6C6VmfEl9XY6lnO6VqyormwdEhD
         BJbrLWqzl7lN6ZDAPLVI+Hv7FHbEDuXNs4uHTM5q8qaJHWrEm/WOGp+LoaJuS2mvK/Sv
         hiyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHpq57jPc6SieMU1NNLcxS0CmkYZkZrnikHiqjrGcjnqgPSAWi35TdnBvhAkElfVhgl1/zr49ld1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFhOHp9X9fQDddb9QelK1GSdrJJhnH89S7tTVDvftYp7Bc6k60
	eP0UiCeqcaYsZtyeFevWR1/1qq4EKtiFasMMKHYiM7sBhSER4HycJw7IZ3BdqTZLrkEy/81lnPH
	hlZCyAm67DE18jbDLuUZoEszA0ijBj3Jmh4hIxy3K9AW+i+keWM9Eo2miiEgsJ82tNk2UtJc=
X-Gm-Gg: AR+sD137F9JEZWHslLGNdMNbTDTC+w9JWKMJMhdxHVhkbvjVENf19t4aDgIKCJ1N1T2
	nwlYEGpQnWiM22h/71tu3mULPjlyLRBXmPzwbiUcB6GbZTjidZVLeuGumX6p3KuFM++J8uamkWP
	UbNffnRHbCtMqejqXf886VIT0ThtOWq9I1u8zLNf4zldnoeveqfDwEhcE1mIBmyXenmtyE7hVkx
	oHnnmXfu3r0xnbdUi5v+ZZLtGvUNRkSSpKveikEvUDTT4YTJUBZXS9b42k2ucSZraNfrTzKhV7t
	A5QiYZRgYw8B5UHsPp2CPEfmHgyhww/zxXj65uObKEzCCgBklSgCMop2tCWqGqA9C/xkYsOd7PO
	XzSjUWvVuAKaX8DSxVvb2qyO9iUGHn4/hHRo/q15fHOM=
X-Received: by 2002:a05:6a21:3a82:b0:3c3:704d:57c4 with SMTP id adf61e73a8af0-3cb85ded954mr25940091637.12.1786085610546;
        Thu, 06 Aug 2026 23:53:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a82:b0:3c3:704d:57c4 with SMTP id adf61e73a8af0-3cb85ded954mr25940037637.12.1786085610081;
        Thu, 06 Aug 2026 23:53:30 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:29 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:13 -0700
Subject: [PATCH v2 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support
 for fixed clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-9-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085595; l=7262;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=3SshFUJAe2YCABf7vZhxKHsnDDjDnSisNVo3j+1z8NQ=;
 b=hK08ThqyO3RY9ir1gTDl9nHHgGCOoRV14/brbkyv5V35V5k25bLaEsKlm5KnpTeblLgDYEmb6
 TGmRN3Yx9jFAYasJqu2pB5d1ZlZkInAqZiUQfUydrhiZFG+5/STnyTk
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: DY_G5hTxqML6wGYlaIoLw8jasVBd_2T-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXxMkdqG+LJtTH
 1ZQzD7X4oYPmKOShHBUzk0O3mLHEN/Q2apu0MV4Wh2Hu1i9Odt3ENwgf1z6lkSpV2Yeto5IEc+K
 avMou4s9sRo925sZ0G8hZToWYCzlYg4wWfszCC3zA3DKCBnCvWEfQmDNhbaBGARKRd1QHtdF9c+
 iRaheyHt4v13ZERG70uxodRsXP+l2Wc4cVXKKwplIKiThFwhFyBCUz5LXlmreOfimYN1B9NM74O
 fsQP+1tyhXUGpjd1KE8WRW9mOclNB2moXsQRuP0lGsksLcLMyHXw75SOfYGaTdpER9GysCSsFzb
 yLtt/LMqmrndy+AyGl/YNuHIfwjwu54sX/P26xqDrZzeZEZfbK/cTUqg64BwB2hl/EdDCUsUlGH
 x5l+fjPw3fakzRMxI3Q/US6FBTSFLshwDLLyGn45Y00ia+sA2M0va4WZbeQrecIaYQMc5bEq0p1
 POK3bVR+vNCCOrseZKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX6woX33OG+G7c
 Xe2j1W1+Y34uqR+EaFI0mwfikn7JkAQz0YHYr5JeC01TMQbNCoYyaGSN/dxxQ+rzJSZksRhwrCy
 LPAWIwwGZUNh3xJjFlJLKMajOTkh8VM=
X-Proofpoint-ORIG-GUID: DY_G5hTxqML6wGYlaIoLw8jasVBd_2T-
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a7580eb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iNkdjwxjGt8fguHhLfQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

Some CMN PLL output clocks require a hardware gate in addition to a
fixed rate. The gate control bits reside in the register
CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered via a
new struct clk_fixed_gate and clk_fixed_gate_ops, combining a fixed
rate with enable/disable/is_enabled gate control through the shared
regmap for CMN_PLL_OUTPUT_RELATED_1.

The enable_bit field is added to struct cmn_pll_fixed_output_clk (set to
-1 for non-gated clocks). The CLK_PLL_OUTPUT_RAW() and CLK_PLL_GATE()
helper macros are introduced alongside the existing CLK_PLL_OUTPUT().

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 141 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 136 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 586f9c620e7e..2b05896ff00f 100644
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
@@ -115,33 +126,66 @@ enum cmn_pll_clk_type {
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
  * struct clk_cmn_pll - CMN PLL hardware specific data
  * @regmap: hardware regmap.
  * @hw: handle between common and hardware-specific interfaces
+ *
+ * This structure is used for all CMN PLL-derived clocks including
+ * the main PLL, NSS clock, PPE clock, PON reference clock, and
+ * EPHY-RAW clock.
  */
 struct clk_cmn_pll {
 	struct regmap *regmap;
 	struct clk_hw hw;
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
@@ -670,6 +714,85 @@ static struct clk_hw *ipq_cmn_pll_ephy_raw_register(struct platform_device *pdev
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
@@ -709,6 +832,14 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 		hw = ERR_PTR(-EINVAL);
 
 		switch (fixed_clk[i].type) {
+		case CMN_PLL_CLK_FIXED_GATE:
+			hw = ipq_cmn_pll_register_fixed_gate(dev,
+							     fixed_clk[i].name,
+							     cmn_pll_hw,
+							     cmn_pll->regmap,
+							     fixed_clk[i].rate,
+							     fixed_clk[i].enable_bit);
+			break;
 		case CMN_PLL_CLK_FIXED_RATE: {
 			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
 

-- 
2.43.0

