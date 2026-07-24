Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828992BD5A8
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905234; cv=none; b=FaGUvVbhvcuzS0WteGW/eXh6liLfFZhl1dReqjqM2rwbNDPHipy4pcAW89y7at6iYyWjxtZACKjDX0kTVDrA09V1MAUeGXLcuteEkw0sQmlI5Rdg1u6iOjWRwC581yKghiKyVvZduQxELEW0EmwsbFRmZPSIQKJmFQtJGgo9Q8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905234; c=relaxed/simple;
	bh=C6bCrhA4GOQmpqayFiDLO3B/ou7vIoV+F+3CvOXkYEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JptQXLKWp2MLgaeXwJAtnDOsveDqbqRRAVGXyit/CMi0Y2QVNs2a9mqztrnSrXZ7Veo+YNpv0fJXwtutNOdCEsR5lQ/mfhNSBVdEQB+EUbV7csYKfga3zBLtb5fbnKKsvcOg8Id3zD4ekyuf2K5W7PHszZByzYByEUQuCCwgQm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erdnW+uO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vkfm2zrk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erdnW+uO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vkfm2zrk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODb8f53344393
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZnZwtwXnJNQ2NDcPGYd+RgMjGx3P5zKofQByL2OzTFc=; b=erdnW+uO882ltTKu
	cmAlEuRHLF3m22i8zWWa7p/0F9IL7tM8iI9Y+l2uel7ZLCpSHuOVtFhJjwXjQy+D
	Mjmx1IhXcAkWZ+0Wz0TcRDQlyaq79M2+avvjx3yhS/Y6pjOhQyR7PZDLKFNYflxL
	KK7RbH3iFB8VxWEs85BeP8ISKuCq7GERlcv0d5eJufdYOTwbVBt7qIAY6Q8ixfqk
	aW3gpVILvF3Qi9WidYL/LAX4RjL/RzkS/aE4MY6oQMva98RzspMfYiH1OJX/MEl4
	26j55FHZ4aAfyQ2QJ8PFKig3ueYeFkcGXRo4Fh4rrTr7eg6qdCUG+y2XxrcUtlzd
	RG9wEw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0gy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so341560a12.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905230; x=1785510030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZnZwtwXnJNQ2NDcPGYd+RgMjGx3P5zKofQByL2OzTFc=;
        b=Vkfm2zrkKatNBphkIQay5a8zFIxSvLHXieZco4RxAH0931L+e1ubmunUpos3EijWig
         zwm5MvlcakaiecoGEPphYS9KXHCjO+WrlM+5Bxh0MN5SJY5El9o5Yo1yFj2is4tsDu8R
         coDZ9NKcTGM/6y82828Dv71qpyGkqpi/FbxY+TlE9+sFOtsm7Pr+K/EvGQ1i+kDFd5ib
         jpijf0fBcGSb0WQpelcOjgxxj0284ur/ootE6x7nxzOJBTt+60uBOigJbBW7bzw2022B
         FcxOdSOSpuELW9DBFdEFMS2khMjgH7lDPBWNL3X04UwnlXo9W5/UF760ay1MYmOTnjaN
         whPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905230; x=1785510030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZnZwtwXnJNQ2NDcPGYd+RgMjGx3P5zKofQByL2OzTFc=;
        b=M9K0BCWZCqYRe+4LoHcS5KkzIYGQRNj4lRk4P5jLgbHqsa+HyOsjHVzqhzD0FZdNcS
         o9fbI8QNRJohGgONUpySTlXGFUwvDulnTp5XmyjVeZVMS3gKZ6CuJSKmhYFL2FLVk0kf
         llVx8HigL7BQ1WEXP3QudBExgNP4gHw5eATFx2hDfNWG2MQvCHSTpXSeZ7BaVWELtWgE
         xA6RcflAxoxU1bgSgIw4gwEPyzUAuGGDt5Yvwwr7BjTaQo6ixkt5JwYj5UvW1ErRwfAX
         pGWdbbVzEc+OvxqKlHu0VyOZI5ApiivVn8NGXTMoicKtGzaApED1twMDAcazzwGXjzUB
         0NqA==
X-Forwarded-Encrypted: i=1; AHgh+RqNzLlq+Uqu9cz8wm4qHelxcsT2iUCVT2E8WWibOkDOiMBE9OHoXKOfP34G7++gBhOjk/DwOCi5rqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwacdFqFop/m/gnuUm4mjclIToYdWEmrsWRNRe3ZR5uP32gJJ0L
	o1R/qtiExRduAy3nUcgYm3F3O9fjRJPxRHApclA5qBGi3Z73X/CgniQB76s4iATeuVYD7TR9A8o
	hZ1nBYZB1y3lNvM+bxkaMhalvfUC77AHwUq96lfy2PZ7or4Hmx4+ovJuMRYUCF/s=
X-Gm-Gg: AR+sD11L8tA6Ucm+wwHrBJNbcHSMY8W/cu4hrwtIhfmNCDi2gxyi3nIcOXpLr6waWFF
	Ug6yrBn7NbUPSfbwB32iDMFTJmGqJAOop8UEJhVhPukdZyoxsZZRAD+x9fRaAXWQ77INzc3cyx7
	emKSk2Jj8XyxEdVVvs9/gGbhbfq4jrtYfX/RzvRaM2YygGbLCjakyJCcmgQUEiZGZjjoBcVnDhR
	zdW3WfSiTM6IK2REWdQiORk03s0ATHC9YpA9gi9IcGOjy8r6A4EDp7d+dske9JnS4QoVLgYoeaD
	HSMTVJ5AHyoZjYWaM4UKW1Z9mztjDhUFepbqqSd52mrn7lzEoVmmpiEjv/3hTARyyjKkKSdi/9G
	JJIpY7/6HyTBCtM0ksWXM+B+ZdA7KkXMVOP5Uf86w/uA=
X-Received: by 2002:a05:6a21:700a:b0:3b3:1b38:d9d6 with SMTP id adf61e73a8af0-3c44b153cfemr8292762637.39.1784905229754;
        Fri, 24 Jul 2026 08:00:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:700a:b0:3b3:1b38:d9d6 with SMTP id adf61e73a8af0-3c44b153cfemr8292689637.39.1784905229140;
        Fri, 24 Jul 2026 08:00:29 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:28 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:26 -0700
Subject: [PATCH 04/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=4885;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=C6bCrhA4GOQmpqayFiDLO3B/ou7vIoV+F+3CvOXkYEc=;
 b=EgDDD0BiUor4EKbt16U1jvez8bprociY00r667OgejSgZzFdAw1N2Yxa0fI7HyZ7oVdsAJNGm
 mCLKj6e6StbBKjXPR9bCH7PWu414T7SJgI88600JF60vjNK0Q79KZOh
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX2nq+xeWgbtA4
 zR6T4vpGPCAByEPdsIGm+HOTWE3J3W7Wmzm84fHi4Usf+qVRgr1gCa11tnTwz+2I6Y/jmCdlzf8
 8HAjFrbWJ5nWkxgbHLX9E7a8P5+fY1g=
X-Proofpoint-GUID: jWbCrrL2rz4ufDyxn7tmZLpm6UGFwO3E
X-Proofpoint-ORIG-GUID: jWbCrrL2rz4ufDyxn7tmZLpm6UGFwO3E
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a637e0e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5lYwWfJxAk1uVq9XzUsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX0501NanEYwFW
 VvwYikZcHtnblor5r/QDE/ubtFvRx9lUQ5nJFEnD6hrN34MwaERS6EfqiUBNcEb/NYH8mmMxDF3
 mRWgIGxNJLSYeaVNvg+ajFXeqgJCeOFZxJuGL08mH8iIA/3tfEpLn6tatTrY4R3eokGzJjt+Mp8
 tjgspsA/Du4/Kg8mzFDQyaYpTM2Nl61hX+xdO+LYF/qGBtK5vJQGhiPNv8Dwdta20hnMvyI6DJr
 7XAWMBEM/Fi6ZD64LDpzJxlZjJ2/x2Aq4ZLqXwhJ100Tuo30vCsXxNfCYoF7EOApHhP2iRjrjPo
 cF8yuwblTUr8uDz/Awey2SQWITeNuU3h7oKxs8zDAZgZUOjaQba0p5m2SMMeBe2j704oOVjYoXk
 q42OAecJTngaMKiEj/eWnoZSPb45lrimYrz5pL86ask85ydUV0DLoP7gSQHxX11ZG4DF116LCPt
 2ESEQRJVWWJdgim+w+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

The NSS (network subsystem) clock is derived from the CMN PLL output
divided by 2 and then further divided by a configurable 6-bit divider
with a valid range of 8-63.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 119 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 114 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index aa319d577871..3df326c22fba 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -66,6 +66,11 @@
 #define CMN_PLL_LOCKED				0x64
 #define CMN_PLL_CLKS_LOCKED			BIT(8)
 
+#define CMN_PLL_NSS_PPE_FREQ_CTRL		0x98
+#define CMN_PLL_NSS_CLK_SEL			GENMASK(13, 8)
+#define CMN_PLL_NSS_PPE_DIV_MIN			8
+#define CMN_PLL_NSS_PPE_DIV_MAX			63
+
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
 
@@ -364,11 +369,105 @@ static struct clk_hw *ipq_cmn_pll_clk_hw_register(struct platform_device *pdev)
 	return &cmn_pll->hw;
 }
 
+/*
+ * NSS (Network Subsystem) clock operations.
+ * The NSS clock is derived from CMN PLL rate / 2, then divided by
+ * a configurable 6-bit divider (8-63).
+ */
+static unsigned long clk_nss_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct clk_cmn_pll *nss_clk = to_clk_cmn_pll(hw);
+	u32 val, div;
+
+	regmap_read(nss_clk->regmap, CMN_PLL_NSS_PPE_FREQ_CTRL, &val);
+	div = FIELD_GET(CMN_PLL_NSS_CLK_SEL, val);
+	if (WARN_ON_ONCE(!div))
+		return 0;
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * div);
+}
+
+static int clk_nss_ppe_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	unsigned long div;
+
+	if (WARN_ON_ONCE(!req->rate))
+		return 0;
+
+	div = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * req->rate);
+	div = clamp_t(unsigned long, div, CMN_PLL_NSS_PPE_DIV_MIN,
+		      CMN_PLL_NSS_PPE_DIV_MAX);
+
+	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * div);
+	return 0;
+}
+
+static int clk_nss_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct clk_cmn_pll *nss_clk = to_clk_cmn_pll(hw);
+	unsigned long div;
+	int ret;
+
+	if (rate == 0)
+		return -EINVAL;
+
+	div = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * rate);
+	if (div < CMN_PLL_NSS_PPE_DIV_MIN || div > CMN_PLL_NSS_PPE_DIV_MAX)
+		return -EINVAL;
+
+	ret = regmap_update_bits(nss_clk->regmap, CMN_PLL_NSS_PPE_FREQ_CTRL,
+				 CMN_PLL_NSS_CLK_SEL,
+				 FIELD_PREP(CMN_PLL_NSS_CLK_SEL, div));
+	if (ret)
+		return ret;
+
+	return clk_cmn_pll_ana_soft_reset(nss_clk->regmap);
+}
+
+static const struct clk_ops clk_nss_ops = {
+	.recalc_rate = clk_nss_recalc_rate,
+	.determine_rate = clk_nss_ppe_determine_rate,
+	.set_rate = clk_nss_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_nss_register(struct platform_device *pdev,
+					       struct regmap *regmap,
+					       struct clk_hw *cmn_pll_hw)
+{
+	struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+	struct device *dev = &pdev->dev;
+	struct clk_init_data init = {};
+	struct clk_cmn_pll *nss_clk;
+	int ret;
+
+	nss_clk = devm_kzalloc(dev, sizeof(*nss_clk), GFP_KERNEL);
+	if (!nss_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = "nss-clk";
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_nss_ops;
+
+	nss_clk->hw.init = &init;
+	nss_clk->regmap = regmap;
+
+	ret = devm_clk_hw_register(dev, &nss_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &nss_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
 	struct clk_hw_onecell_data *hw_data;
 	struct device *dev = &pdev->dev;
+	struct clk_cmn_pll *cmn_pll;
 	struct clk_hw *cmn_pll_hw;
 	unsigned int num_clks;
 	struct clk_hw *hw;
@@ -395,14 +494,24 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	if (IS_ERR(cmn_pll_hw))
 		return PTR_ERR(cmn_pll_hw);
 
+	cmn_pll = to_clk_cmn_pll(cmn_pll_hw);
+
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
-		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+		if (fixed_clk[i].rate) {
+			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+
+			hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
+									 fixed_clk[i].name,
+									 &pdata, 0,
+									 fixed_clk[i].rate);
+		} else if (!strcmp(fixed_clk[i].name, "nss")) {
+			hw = ipq_cmn_pll_nss_register(pdev, cmn_pll->regmap,
+						      cmn_pll_hw);
+		} else {
+			continue;
+		}
 
-		hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
-								 fixed_clk[i].name,
-								 &pdata, 0,
-								 fixed_clk[i].rate);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);
 

-- 
2.43.0

