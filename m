Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86D45041B
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 06:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085614; cv=none; b=mWhOY5YN/p5jVTXQK1K+x+uCPoq+mFAXJmb+Abmb3igLRL+6xgy7cj02ghIAPyATXB1h9Zvht1oMJFfirYTRZxtaSIX19FQAVjBEu36YRZHfSHt17JdLiM12x6WxmwKJEPwNzUCk8qhIoCYhyCyENRpsdKSkIWQOFr3DzRFw5hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085614; c=relaxed/simple;
	bh=AJC5Vy5cYaputpiPxiRR3kf3ciQhUvXNBdfghb/Toes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nck70+t/l9nUNHZDdXdrKN6okm0PDmlUeqIxJlj3a5Ij9yrbaaxzvbLFBferKcz9x23Fn3dN9pvjh1AqpF4c9T9IW0ajOOimT6VxmvuKY3A5OTU17a2BoA8G+O4/8pJUn7cPa06vmSTVlTNPdiKfa4i6ZsjaN8pYjzqqDT7Gj7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOQaE7OF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPFZuEu4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOQaE7OF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WPFZuEu4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GiLw3218040
	for <linux-clk@vger.kernel.org>; Fri, 7 Aug 2026 06:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0co8xXihWvgCIMWQrNRsJ1hs4zLo8L/i4vYLB9Aywrw=; b=cOQaE7OFM4Usg0Pi
	sl7NSxVgyWXL5s1UkYdzj7EMbGdq+pPceR597EBvYQhY6MWzdwQ1a7xQMoe+c8+Y
	3RFXI8B5wD0hXROqPJ0cV8oolzhLisi687nLDY0rWHclg1vlYCWG0MPpTZ6uk3sj
	/ENYi0P1Ap3y5iSeTILydeue5BBfVTwlB41C6G6pdanmeNs4ufyIJvHZZrqam7Nr
	0gdLDloXXHqIbuCQuvjZimP2mztsBwiuPjG6JHWkt+UPIkyjl4GPWALiB4KHjsF5
	iuTMTRTh0ukQ9mL8/q2Qp0XAMczCDSJXJJLhvHRaELZvDkq53wlkVpAdddA5MsoN
	o0O4yg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6htky5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 06:53:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca124bf0189so1396844a12.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 23:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085608; x=1786690408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0co8xXihWvgCIMWQrNRsJ1hs4zLo8L/i4vYLB9Aywrw=;
        b=WPFZuEu4Vsg4pW/U+ordOwVKT6jgXeFIPa225Mer7uaYqWluAZC+d+7G1iHkjAWCD0
         bvrWttfNkYsensJdZrUoFdy82S1YhFl7uPQI3jz4fECvnMJnjIKL7aJA/eSwXkTUz58Q
         hR9EvRaK3DZ5uhTGZAsBPuzDtHxc3UI+G3NAgQGWBXpqCTlSnw7bI9zrc/u7kaX9lqDz
         ogSnluypt6TavtOVmlLMBKCqcp6sEQJRdm7k/DmhW7L1VcP5ybDyrpK5ns5170+otnzJ
         tP8s5jJ/wrtdLPSoI6Lmj+1oHnwZ2gRecWKOIW1NBzuwkUmDyusVV4tf/i9AUOzgYDW8
         /3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085608; x=1786690408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0co8xXihWvgCIMWQrNRsJ1hs4zLo8L/i4vYLB9Aywrw=;
        b=jsYg2MJMUoCEHTcERxyavabxah/gRUIgJwNHR7GYAz2xEoLGHD8iN2mGL76W8MX4w+
         hcEmGrV4eznbrX9R2SEBp3Y971RukTGCLtWBCPN44u7PAyZrLSpnme00vgj4Rvt9qD9N
         7dnqpr5Xk+qjjRdHvQVUV9UOvvJE11emZ9JhrssOH3k7BszH1ZAF+rigPIWdYXg6leaC
         7XmyjH9e/TGVqzdT8B8qG9hyPrpGGuhNCKcza/KjCG7BLCGOsprAStvm61kiyTOz41GF
         2cjhHzKI206E+22lIAaX52ROeEsciKvgMfG0/GaF8pllCHSC+K+Uim/vPePtHCHM0K1y
         Kw3w==
X-Forwarded-Encrypted: i=1; AHgh+RpkLQSobuEwXtMQu7my3exw96eMaCfuHkLbOnbxstI+41k0OyUAC5w+f/Q2fPk+JMHL3P/ZKlmOrcg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ZFuVbX4E38NayFwwjKH1Og7COT/tpZnsVhkkbBt01vFyTrDj
	WbGFwcLOcynKtS7Yiznw7/WV+IEGOdRqQxr87liMzNk7WV/0wbpjmWjas8d1GSRqExumnVoYJGx
	hmzOug/PIXyJ/M8lSO2M+6uZIa7EeJkzvRaFeS9R1pcVNgwBjnuYpSCRHgK6aR7k=
X-Gm-Gg: AR+sD11W8HEzhtFVa4WvMhC6oAmnOjbqMG/2V6iOh3oSWyznoFOYLyWQelniTGhyunu
	cSpwIwvv78c7sX+vGHcb58UMJP96y1mdj1VWI6eJaoO1+jxleNaGCqgd542gLZWrCvhfJJL4IGp
	R2dWRIqN8cysSLd3w9zaNAVQyxJa0fYcL4jLfBpnlHMcD49U4BwSo9t6/8q4yDPOTXg0ut6OGY7
	FoDid3W8Uv8rmn8o9HoHkYPuJwfDGub7goqQB/Oq1eLZFA9NpvRXVwwX56gA0uSQQqFlGYqkGEj
	BpIVGZcijaNJ5TyGYGbFgZZwzB7pAzckvncJmpfdvWZFwoPf8iKdmdJCJQXzMxFLZ7p5+7eIUOz
	T4WZSWPY11t4gKeVFZCKDglWnsBt3fgzJsgvNI5YPXZU=
X-Received: by 2002:a05:6a20:3d82:b0:3a3:adea:83bc with SMTP id adf61e73a8af0-3cba2aea1efmr10071808637.15.1786085607705;
        Thu, 06 Aug 2026 23:53:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d82:b0:3a3:adea:83bc with SMTP id adf61e73a8af0-3cba2aea1efmr10071771637.15.1786085607216;
        Thu, 06 Aug 2026 23:53:27 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:26 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:11 -0700
Subject: [PATCH v2 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-7-cce718b8ec17@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085595; l=6945;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=AJC5Vy5cYaputpiPxiRR3kf3ciQhUvXNBdfghb/Toes=;
 b=agcKUv6CpQEUmZfNyGJ8XXjQfm7byhm7SSmjMV4Gkp780pB7mRTUhKbFyFmdGsiL3OAr2LTNg
 rIw8yiK619eAdJAVjhXyDZJQytC/0CEe1SaBcRyEiH5xnpdYkCLhFJw
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXwpmiN2SWoTj9
 Ze7fGjYFtW1ZMZ1kL6U597dU7tHc2+L7lV/HQYYGZu8sS5mx4g0UD7Fs0+VuGYVUpQTEMDhAzzb
 3VmwYGgBg0IWJB9W5641SquC/oJvUVE=
X-Authority-Analysis: v=2.4 cv=PK0/P/qC c=1 sm=1 tr=0 ts=6a7580e8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Vzc9HlkDlmRur2svsm8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX+0ZA+YbxKxvP
 EGYTC97FBywH362K8lZP876a0Kjol232kvGUfzJJHWk8NDwN3TO5/C6E0PeefD+gKxc/HKMM98l
 RHTX0nH6deHuVxD4HDxk0iHVKrOTC2ghe0oAyjrpkXMcBSJwwOvM1A2DD8ZlCZshaqyc8/XjA26
 KgfTa60pEPPmKJiSxnWaJIajdV85mPek9HpJTJbKUXC5/+lPlYiJorivd37WvFCMddPh+4kHA7q
 r2EuKl8yB1Pg8AI+i0t7+WROS9A/9fHBv1I2OKCMUUAah/vzQcnnfgOK7/ycmBLrVyaKzMjLC+3
 68Imn6aP64RBv0BZ3h9+FLFf82t6Gz2rK/DQnrDzJgkKQnSwBIQySMbWQltXa8nC9rXDpenBcIn
 sqNfnMeD6NaxZj8zLwbGIYSjuAVLTEfcPCylgNhF5MlaW5gmLgcijtCreZ5L7zZ+uxJ9OBZAQEC
 HcEs2WEEbh63Hbobtdg==
X-Proofpoint-GUID: N5JhqEiSFwvVKg75UlTG3PZvcxcffkg4
X-Proofpoint-ORIG-GUID: N5JhqEiSFwvVKg75UlTG3PZvcxcffkg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

The PON (Passive Optical Network) reference clock is derived from the
CMN PLL output divided by 2 and then further divided by a configurable
8-bit divider (1-255). The clock supports two modes:

- UNIPHY mode (CMN_PLL_PON_MODE_SEL = 0): fixed 31.25 MHz output
- PON mode   (CMN_PLL_PON_MODE_SEL = 1): pll_rate / (2 * divider)

The clock output can be independently enabled and disabled via the
CMN_PLL_PON_EN bit.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 171 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index a24e57b33c6b..356988c03a7a 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -73,6 +73,11 @@
 #define CMN_PLL_NSS_CLK_SEL			GENMASK(13, 8)
 #define CMN_PLL_PPE_CLK_SEL			GENMASK(5, 0)
 
+#define CMN_PLL_PON_CONFIG			0x42c
+#define CMN_PLL_PON_MODE_SEL			BIT(9)
+#define CMN_PLL_PON_EN				BIT(8)
+#define CMN_PLL_PON_DIV_CTRL			GENMASK(7, 0)
+
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
 
@@ -92,11 +97,13 @@
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
@@ -413,6 +420,164 @@ static struct clk_hw *ipq_cmn_pll_regmap_div_register(struct platform_device *pd
 	return &div_clk->clkr.hw;
 }
 
+/*
+ * PON (Passive Optical Network) reference clock operations.
+ * The PON refclk is derived from CMN PLL rate / 2, then divided by
+ * a configurable 8-bit divider (1-255).
+ */
+static int clk_pon_refclk_enable(struct clk_hw *hw)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+
+	return regmap_set_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+			       CMN_PLL_PON_EN);
+}
+
+static void clk_pon_refclk_disable(struct clk_hw *hw)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+
+	regmap_clear_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+			  CMN_PLL_PON_EN);
+}
+
+static int clk_pon_refclk_is_enabled(struct clk_hw *hw)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+
+	return regmap_test_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+				CMN_PLL_PON_EN);
+}
+
+static unsigned long clk_pon_refclk_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+	u32 val, div;
+	int ret;
+
+	ret = regmap_read(pon_clk->regmap, CMN_PLL_PON_CONFIG, &val);
+	if (WARN_ON_ONCE(ret))
+		return 0;
+
+	/* Check if in UNIPHY mode (bit 9 = 0) - fixed 31.25 MHz */
+	if (!(val & CMN_PLL_PON_MODE_SEL))
+		return 31250000UL;
+
+	/* PON mode: calculate from divider */
+	div = FIELD_GET(CMN_PLL_PON_DIV_CTRL, val);
+	if (WARN_ON_ONCE(!div))
+		return 0;
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * div);
+}
+
+static int clk_pon_refclk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	unsigned long div, pon_rate, uniphy_rate = 31250000UL;
+
+	if (WARN_ON_ONCE(!req->rate))
+		return -EINVAL;
+
+	div = DIV64_U64_ROUND_CLOSEST((u64)req->best_parent_rate, 2ULL * req->rate);
+
+	/* Clamp to valid range (1-255) */
+	div = clamp_t(unsigned long, div, 1, 255);
+
+	pon_rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * div);
+
+	/* Pick whichever mode gets closer to the requested rate */
+	req->rate = abs_diff(req->rate, uniphy_rate) < abs_diff(req->rate, pon_rate) ?
+		    uniphy_rate : pon_rate;
+
+	return 0;
+}
+
+static int clk_pon_refclk_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+	unsigned long div;
+	int ret;
+
+	if (rate == 0)
+		return -EINVAL;
+
+	/*
+	 * An exact request for 31.25 MHz is always satisfiable by UNIPHY
+	 * mode, even though PON mode with a suitable divider can produce
+	 * the same frequency for some parent rates. Preferring UNIPHY here
+	 * is safe: this function is only ever called with a rate produced
+	 * by clk_pon_refclk_determine_rate() through the standard
+	 * clk_set_rate() path, and either mode yields the identical output
+	 * rate for this value.
+	 */
+	if (rate == 31250000UL)
+		return regmap_clear_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+					 CMN_PLL_PON_MODE_SEL);
+
+	div = DIV64_U64_ROUND_CLOSEST((u64)parent_rate, 2ULL * rate);
+	if (div == 0 || div > 255)
+		return -EINVAL;
+
+	/* Switch to PON mode */
+	ret = regmap_set_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+			      CMN_PLL_PON_MODE_SEL);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+				  CMN_PLL_PON_DIV_CTRL,
+				  FIELD_PREP(CMN_PLL_PON_DIV_CTRL, div));
+}
+
+static const struct clk_ops clk_pon_refclk_ops = {
+	.enable = clk_pon_refclk_enable,
+	.disable = clk_pon_refclk_disable,
+	.is_enabled = clk_pon_refclk_is_enabled,
+	.recalc_rate = clk_pon_refclk_recalc_rate,
+	.determine_rate = clk_pon_refclk_determine_rate,
+	.set_rate = clk_pon_refclk_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_pon_refclk_register(struct platform_device *pdev,
+						      struct regmap *regmap,
+						      struct clk_hw *cmn_pll_hw,
+						      const char *name)
+{
+	struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+	struct device *dev = &pdev->dev;
+	struct clk_init_data init = {};
+	struct clk_cmn_pll *pon_clk;
+	int ret;
+
+	pon_clk = devm_kzalloc(dev, sizeof(*pon_clk), GFP_KERNEL);
+	if (!pon_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_pon_refclk_ops;
+	/*
+	 * The PON reference clock may already be enabled by bootloader
+	 * or consumed by hardware without an in-kernel client driver.
+	 * Add CLK_IGNORE_UNUSED so the clock framework does not disable
+	 * it when no consumer has claimed it.
+	 */
+	init.flags = CLK_IGNORE_UNUSED;
+
+	pon_clk->hw.init = &init;
+	pon_clk->regmap = regmap;
+
+	ret = devm_clk_hw_register(dev, &pon_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &pon_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -473,6 +638,12 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 							     fixed_clk[i].name,
 							     CMN_PLL_PPE_CLK_SEL);
 			break;
+		case CMN_PLL_CLK_PON:
+			hw = ipq_cmn_pll_pon_refclk_register(pdev,
+							     cmn_pll->regmap,
+							     cmn_pll_hw,
+							     fixed_clk[i].name);
+			break;
 		}
 
 		if (IS_ERR(hw))

-- 
2.43.0

