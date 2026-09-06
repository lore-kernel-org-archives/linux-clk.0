Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F9A440A12
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704304; cv=none; b=JsrSsmQknIG2MEZi9rlxcKEgylrN3XLEj0OtyxmR1njaoiujgawfVPSgwu03ETjhwrkdQ2JVD76ewVPNvtwkZ8P7vAvk4zNx0X5ppr1+HZvOHwDypAtAWwJko0gEhTNdsPZ+Y2rWuYs2dpSmJJ8tWrOltSyguAJ6FzWSwHZgxzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704304; c=relaxed/simple;
	bh=9uHU9v+qizewh6gMHGAfWBsWY0Kyhcw2U7ouav7Z3nQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YjbQZMP/3o9cb1cplqXMx/a9uVNwrEW+9SNXStFGe/IAocCnVKRi/HptwXfLC10kCE8jvOM6D67UZAZrVvVRFaF4n+u7d+sqHhe0KxQeD5MvziZyX0tgJWqT5uW7AZFp0mZxwDvg1rXK/o80dLbgv8qK+zhw8JF7XOv1LtvON2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nK8tjKxI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S6p2Mko5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nK8tjKxI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S6p2Mko5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686003cU3740288
	for <linux-clk@vger.kernel.org>; Sun, 6 Sep 2026 14:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iF8GCJf1wRWyKKmMJQN7GzUbVZ9KZUtKzHLA0EDoUQ8=; b=nK8tjKxIhBS4drn5
	fynBRF7cA9TFJxdIpHL620qkMxTA59tPU2RFl2is12qkL0uv8wwAD84cXjIwN6qd
	88FzHDnR2qzM29Ku3Bk2glA4WIF8ZzlbWeEyBLuKzP9ZlxmXKh+tl1xHWofq0mjP
	lY17XOw6Z9SsvPIAmcjxrgde7gxrGUWZzEGJS/dK8VSl+XB+iSBApCwdqdHYBP+y
	9rG6bM6XwTiubvFGVlk4f6qxiz0abN/E3uPKf4BR8hvUkgbObNY2lORDrmQAIWu0
	xxV4ZLWSqDrK+iSudhI2P90PqXEMMIOEPrQmL6NHp80NiK2g6AKo5D3JGp4h4p++
	O6vyhQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq42gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 14:18:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so5416495ad.1
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704299; x=1789309099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iF8GCJf1wRWyKKmMJQN7GzUbVZ9KZUtKzHLA0EDoUQ8=;
        b=S6p2Mko5Q4CpQVP9DkbyCfEmNJxdSZijLhOkATIBoSsI2nDSqDFZus0lDXoasp2jjw
         oySV6JZ4HEOz9HhiBRRiHit1EFqHuqi7ZsH3u2tZLm1qLtyEWPYAO7CAAhmQH0CXbAyy
         FOWoYPjMgrhJ+aa4SZyPYvZ2W1V9E9Cdq4N22WJV1BsSMupdyHiPrshSvzWPjF2esKJb
         dGV5EERzgCPIIDiaMeIXN70MPjydvWwRKaibX8pabIE5tKJDa2YDZ/JMwPhdJfda+ctT
         34bGvN5b5eQSySVgaJuIYl48Y/KvnnmtuxRsM/j7bIT/bJyNDPCJzmyBEN2NIq8/0BC1
         NB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704299; x=1789309099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iF8GCJf1wRWyKKmMJQN7GzUbVZ9KZUtKzHLA0EDoUQ8=;
        b=GadtVRx1sRPmpHcF8MJi03WMLQvHkYTc9w2iIQIgwKTZBQ4qPqx7QPXNl2NV6/7dfL
         /fD1/S7s7yIiDIVYZvWUcp27mXfoXgZmpL1izxDlA98FOBTlbFkPViSU0m8oG0cMEO0i
         QHZreuDsBWu4jMLZfpyRKPJ+Qt1rYd/DjMGoO4HLU2J/VhtWIBew6NbhcyklT+8s2pEW
         KD1os/90G+lDC/G+E8P1gih+17UnaySZGUvXqXTlIp9rcRyGM7orKvoRedXa0rvVVv8S
         cP3ST8eSrwNSxRmo1h495s2TaoTbariewDXGo2PhgZrn/2FeUIdlAfKhS9/iE2ohGu9W
         hRgg==
X-Forwarded-Encrypted: i=1; AKwUvByOFbbJQGKnIibWfUKqVSudpR36iA51/Oie2QUILUvPmzKp26L85Oj6cxs7I1+Ur3PZtsWKpsY+gnM=@vger.kernel.org
X-Gm-Message-State: AFuF++l2Ro/xNNMbvEDqkWIklh36sy4bBnKTXLapLNg+6XQOgM8zm3FT
	r+pIUVM2W1rkOV7rEuyBNS7Vz/+y+BNOHtADengELEgyWYNP8WwnmHXHmAR9rFKIjOeqcjwp6Zl
	IT0S+Doq3fQfLVsixXhYI3Y7Rn51jfW4P5LENqoz8fB92t7maf7lkuBvpQE5PJXU=
X-Gm-Gg: AYBFou1Jn/E6ZSmrhKtum4gCdZojXHwwvmpzegQlmQUUiW4wg6EVhFf4GgbMls5DEGA
	bE99Oa2Zz/HGEHL/806T8IWKobj12RYED62FUP5Nyd7HZwPZ7vBWdTKCxTQ1pehlNQem+CwMNJf
	TkEIw33hQbOvGxEhZXJ4h0JwVNqCdgu2v9t8qoW4UalzX0IurwypvumFHcFfYLDWh7f5rOg7NKk
	1TA7WTTJZvZ/OthbLw/9Yfp1FkEjihYulFg3NSDYes+tzF1mCrTad+VViByN268looEpQ5UQrxd
	PNE7xN5MZfPt9uNZJPyv9/pMfET4OfxV16BC5WS1J89mN34f8eehLuMzjob3ECuHj8C4vm3OqtG
	0xIqOB+4WTrBKTHu3FhypaoFbcPM7SFLCy6QytvW5eaY=
X-Received: by 2002:a17:90b:2244:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-39b0865353bmr25712093a91.18.1788704299243;
        Sun, 06 Sep 2026 07:18:19 -0700 (PDT)
X-Received: by 2002:a17:90b:2244:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-39b0865353bmr25712050a91.18.1788704298713;
        Sun, 06 Sep 2026 07:18:18 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:18 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:13 -0700
Subject: [PATCH v4 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-7-aec5ed642f4f@oss.qualcomm.com>
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
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=6682;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=9uHU9v+qizewh6gMHGAfWBsWY0Kyhcw2U7ouav7Z3nQ=;
 b=RvT1pK9A3fhHN+WE+FP85MlG6YQB2xVypTvFHai9oNc3XB7nBjrxbXyJ1l0NkedFutmh2LVHv
 fsFDt1ONQPJCKs6b4cK+J/6Vvow05mXnLHTaxFXwJyGG63utV5tmRJF
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9d762c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zIELv-g6gvKEV_YlzUEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX6MhRxMJZrDCJ
 ZoZe9DREY/fLE3TTWuLF2G1Y7PDUybXFpj5jp4o2qw9BUl6RMYNOx7KvW+nWizOCXh1Pg3TgyrI
 FrFPeKZIhlFdQRNEhZWjd9o7AgyqTG4=
X-Proofpoint-ORIG-GUID: UmV-kQ2nrGJ-8aqPwVtISf6Mvg_qj9sY
X-Proofpoint-GUID: UmV-kQ2nrGJ-8aqPwVtISf6Mvg_qj9sY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXzm+3nuQLUmmK
 CZ5Wo0fCoz+smCStIiSi+AmMJhoWisoh24Rq6KA/TSe7WCx/W6Pe6/2G0VKI9CSq5S1yMyMyBgE
 dBYF6cQz/geHcHTx/JITpWTR5KoXv7rKMFhB6eJZZL7JWcV19ufwH0sBjBLaUwtPwL1QhYd9J58
 DFQMSmMRFrJhTPFs+AkEI+s+XHQY7MzMNdX5ublEw8jx7omwE12PP86HMd3VK4uuKoexxVMnlje
 o2eRodDmR8dTLaPSO+uULyaGuxVr/mhD0P0pP4K5jE2zOBhHnEq7QcrtZRN3Q49NXbmDg/eaGtA
 enoXzAt7oy6j3wWKCRTnnXF0zM1saLnU6hv3qI4XvDkjXlmmzVdyw+iUsg+QOr7sn3uzKyhbUvS
 cMDUj1He+fdf0NH8S94DQgU5nOlf3ATM5SCRfHsmlghwRVrq1zIEoOujPI9X2KAyIRvYtC9oHAv
 tfKEo/SrMUkF0Jk9fTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060159

The PON (Passive Optical Network) reference clock's parent is
cmn_pll_div2 (CMN PLL rate / 2); it is then further divided by a
configurable 8-bit divider (1-255). The clock supports two modes:

- UNIPHY mode (CMN_PLL_PON_MODE_SEL = 0): fixed 31.25 MHz output
- PON mode   (CMN_PLL_PON_MODE_SEL = 1): parent_rate / divider

The clock output can be independently enabled and disabled via the
CMN_PLL_PON_EN bit.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 156 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 44d035870a89..f12352a707f7 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -74,6 +74,11 @@
 #define CMN_PLL_NSS_CLK_SEL			GENMASK(13, 8)
 #define CMN_PLL_PPE_CLK_SEL			GENMASK(5, 0)
 
+#define CMN_PLL_PON_CONFIG			0x42c
+#define CMN_PLL_PON_MODE_SEL			BIT(9)
+#define CMN_PLL_PON_EN				BIT(8)
+#define CMN_PLL_PON_DIV_CTRL			GENMASK(7, 0)
+
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
 
@@ -93,11 +98,13 @@
  * @CMN_PLL_CLK_FIXED_RATE: plain fixed rate clock
  * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
  * @CMN_PLL_CLK_PPE: PPE clock with configurable divider
+ * @CMN_PLL_CLK_PON: PON reference clock
  */
 enum cmn_pll_clk_type {
 	CMN_PLL_CLK_FIXED_RATE,
 	CMN_PLL_CLK_NSS,
 	CMN_PLL_CLK_PPE,
+	CMN_PLL_CLK_PON,
 };
 
 /**
@@ -421,6 +428,150 @@ static struct clk_hw *ipq_cmn_pll_regmap_div_register(struct device *dev,
 	return &div_clk->clkr.hw;
 }
 
+/*
+ * PON (Passive Optical Network) reference clock operations.
+ * The PON refclk's parent is cmn_pll_div2 (CMN PLL rate / 2); it is
+ * then divided by a configurable 8-bit divider (1-255).
+ */
+static unsigned long clk_pon_clk_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct clk_regmap *pon_clk = to_clk_regmap(hw);
+	u32 val, div;
+	int ret;
+
+	ret = regmap_read(pon_clk->regmap, CMN_PLL_PON_CONFIG, &val);
+	if (ret)
+		return 0;
+
+	/* Check if in UNIPHY mode (bit 9 = 0) - fixed 31.25 MHz */
+	if (!(val & CMN_PLL_PON_MODE_SEL))
+		return 31250000UL;
+
+	/* PON mode: calculate from divider */
+	div = FIELD_GET(CMN_PLL_PON_DIV_CTRL, val);
+	if (!div)
+		return 0;
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, div);
+}
+
+static int clk_pon_clk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	unsigned long div, pon_rate, uniphy_rate = 31250000UL;
+	bool uniphy_rate_valid, pon_rate_valid;
+
+	if (!req->rate || !req->best_parent_rate)
+		return -EINVAL;
+
+	div = DIV64_U64_ROUND_CLOSEST((u64)req->best_parent_rate, req->rate);
+
+	/* Clamp to valid range (1-255) */
+	div = clamp_t(unsigned long, div, 1, 255);
+
+	pon_rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, div);
+
+	uniphy_rate_valid = uniphy_rate >= req->min_rate &&
+			    uniphy_rate <= req->max_rate;
+	pon_rate_valid = pon_rate >= req->min_rate &&
+			 pon_rate <= req->max_rate;
+
+	if (!uniphy_rate_valid && !pon_rate_valid)
+		return -EINVAL;
+
+	/* Pick whichever mode gets closer to the requested rate */
+	if (uniphy_rate_valid && pon_rate_valid) {
+		unsigned long diff_uniphy, diff_pon;
+
+		diff_uniphy = abs_diff(req->rate, uniphy_rate);
+		diff_pon = abs_diff(req->rate, pon_rate);
+		req->rate = diff_uniphy < diff_pon ? uniphy_rate : pon_rate;
+	} else {
+		req->rate = uniphy_rate_valid ? uniphy_rate : pon_rate;
+	}
+
+	return 0;
+}
+
+static int clk_pon_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct clk_regmap *pon_clk = to_clk_regmap(hw);
+	unsigned long div;
+
+	if (rate == 0)
+		return -EINVAL;
+
+	/*
+	 * An exact request for 31.25 MHz is always satisfiable by UNIPHY
+	 * mode, even though PON mode with a suitable divider can produce
+	 * the same frequency for some parent rates. Preferring UNIPHY here
+	 * is safe: this function is only ever called with a rate produced
+	 * by clk_pon_clk_determine_rate() through the standard
+	 * clk_set_rate() path, and either mode yields the identical output
+	 * rate for this value.
+	 */
+	if (rate == 31250000UL)
+		return regmap_clear_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+					 CMN_PLL_PON_MODE_SEL);
+
+	div = DIV64_U64_ROUND_CLOSEST((u64)parent_rate, rate);
+	if (div == 0 || div > 255)
+		return -EINVAL;
+
+	/* Switch to PON mode and program the divider in a single write */
+	return regmap_update_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+				  CMN_PLL_PON_MODE_SEL | CMN_PLL_PON_DIV_CTRL,
+				  CMN_PLL_PON_MODE_SEL |
+				  FIELD_PREP(CMN_PLL_PON_DIV_CTRL, div));
+}
+
+static const struct clk_ops clk_pon_clk_ops = {
+	.enable = clk_enable_regmap,
+	.disable = clk_disable_regmap,
+	.is_enabled = clk_is_enabled_regmap,
+	.recalc_rate = clk_pon_clk_recalc_rate,
+	.determine_rate = clk_pon_clk_determine_rate,
+	.set_rate = clk_pon_clk_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_pon_clk_register(struct device *dev,
+						   const char *name,
+						   struct clk_hw *parent_hw)
+{
+	struct clk_parent_data pdata = { .hw = parent_hw };
+	struct clk_init_data init = {};
+	struct clk_regmap *pon_clk;
+	int ret;
+
+	pon_clk = devm_kzalloc(dev, sizeof(*pon_clk), GFP_KERNEL);
+	if (!pon_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_pon_clk_ops;
+	/*
+	 * The PON reference clock may already be enabled by bootloader
+	 * or consumed by hardware without an in-kernel client driver.
+	 * Add CLK_IGNORE_UNUSED so the clock framework does not disable
+	 * it when no consumer has claimed it.
+	 */
+	init.flags = CLK_IGNORE_UNUSED;
+
+	pon_clk->hw.init = &init;
+	pon_clk->enable_reg = CMN_PLL_PON_CONFIG;
+	pon_clk->enable_mask = CMN_PLL_PON_EN;
+
+	ret = devm_clk_register_regmap(dev, pon_clk);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &pon_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -487,6 +638,11 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 							     cmn_pll->div2_hw,
 							     CMN_PLL_PPE_CLK_SEL);
 			break;
+		case CMN_PLL_CLK_PON:
+			hw = ipq_cmn_pll_pon_clk_register(dev,
+							  fixed_clk[i].name,
+							  cmn_pll->div2_hw);
+			break;
 		}
 
 		if (IS_ERR(hw))

-- 
2.43.0

