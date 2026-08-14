Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F815470125
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711718; cv=none; b=fFFlewnTJA6OqznYFNPKC+z/XzcNOzfWTRjcGcC91lUlvpnj4udpwnHrM+gJCVpvni9mV+i3WlAqra0tKfn0yBHFRnmsZ7/meUYOZ250EClQLamtMKPHP4vTSM5xBAf6obYuvAPy+/37RWa5/ZQo7bBykdJQlxWaMJy+L5ZvqaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711718; c=relaxed/simple;
	bh=MU7GZ+tytzeAu/0p/zI6nSVXQYTHMyfWxKiBJwhCzz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KtCiOM1ZpztWNVa/ScI9pUyVeAXIO1ogJ70rZ6CXFpsyHuxrjQR43fmp/AEAlbKlcHnet0HXDdWraCYQVvg/zElW5ygIIzL1/aAf0b+VIVTqi/T0XAjd15Cj+dI/SE/PmgW0agOc7RyjLReYZWJ09qpUlbOpNarowLNaW/8MoNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nw2WpJHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGA2BHmd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nw2WpJHc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGA2BHmd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAb99H1412972
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fo7K6utPiMB2sMeCDB5NwBTEFfITjjUc0Pyc8AOuNz8=; b=Nw2WpJHcnvOdUmsi
	AFZysEbnrVbe6hevfc4gc6DUKTKEAj0FhH7mcyjLlnn+FuT/PzrGe0WLcN9UMbim
	Ux5VSejmpN5MaL4v1yebAD7zO+lG+KJ7RxxaK503ePSJyj/W1Wu5Ov/fmXbK5blM
	GVg/8himloCsBAErT6EHjrfpOm22DzO9pmt+TdtB1ZQNU96ltueKKdgcBPbM5JVU
	t019Q4motwy5P0+wiPjV5hNV9eZ6Ki72gvqt5Alb7IVfFbnkCbZlVKoQriAf0CW+
	e3AoDpHSHWt8/xWFYiJltuYqSSmxkRCk8YEf26gRXLks3gSZxTpNIoTjph0w9P5J
	O3z3Ww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20638usy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e024d2129so1332753b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711704; x=1787316504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fo7K6utPiMB2sMeCDB5NwBTEFfITjjUc0Pyc8AOuNz8=;
        b=SGA2BHmd0g0lDySWA4Y5GDomhkuItTon9r9UqLDHH0FYIWXp6QctDxLvpLt77ALiz4
         H1dLngW/riHyotHh00n6LFlRd7giXkv055uWVi3FMmlKUESGFUZTS8h+p5zEhWOTLGdB
         qMmVWbMPy652MTXCH27uNiMJkNnNwdEjf5dviFR2/c7rwh2uOPSlrbGTIPZprU4TyvHM
         7Qpn/Qx1RG18bN7JwM7ZDWfzmFl6xWNMlPT7qjcmw2j38yis+RhwFykhXNHeyV7h/1hc
         Nr8qIHMsgTnaLjSQvLzWFeNR3hL4d9iN2whvcQowBm/B+26R8ziixGVoRtp7Ju0WmtMg
         Gc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711704; x=1787316504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fo7K6utPiMB2sMeCDB5NwBTEFfITjjUc0Pyc8AOuNz8=;
        b=pmUbxhZ6+LDBGEI6wAKtE0v/8D9T6bt1/LLFxN3xzgu9PXRLLJAQesju1Oc7X5kt9Z
         utnfiByWmz2jsjv6ziD0QVX02ZheW+WlqU9D02BKBEw4CTIqK6m5qB9Gs8YxL1ypUIbB
         45rU4IvPUuoKjsnx1uuL0/6hUoCt9+ghersiwkMRevM0QO9hv1i25JJZzoKKBTxulKaj
         CxkvgvPMzGN1fHp2m5LcAJhxymNUGEjFQ7+Coe3KwzPfjj671eGo+f+g7SDfe+B+09x5
         IM5FwdSF0i2dG08o0wpBs2sbcVCETIH/VXxpc+GIlY5A34UvhucDiiYP+oq1Te0QpJVU
         x9MQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2/kvXryqJoemJ3hSfAFOZxoURO7rGAhh8iaGNL20jeHocFzElNWTlgfS/4qC9Ww33GBrbXn+EiS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/RBSstQ9WFc+zAd3Q0HBtBVFzPV47+vXUEhyW+1zx4SbqOLnK
	609wqY2itgFhDe/MxyEp8JOG8A0j2Y0yBpOosDS5HuhHX41rZ8CDQQ25T1K/gArf+3PcT0BEOg2
	GI+kNJuH3/UGtl1QYYSUBto3gZh941xFuOSHhMy3Ghqf16fxhfaeCOYDjFw3oIxI=
X-Gm-Gg: AR+sD10Nna5HXKI1eUOa2sNB+FuNuz1zqviVHWrxA9P+TT2q+baMZKALQnRu55rFdkW
	asPPAwzJTvv15/W92iPY+O2FMWD/26TWG+WUimdCywKR84a8LXnWKCoA3Ru6noG5OMkjzGikMDz
	0tmUrvBhehWD8ArLkLb6n35LtD+Epc8ce05Z2v6QXdP8qBD6AEXOdoeS4iZV/yMTRKjpAUsR510
	0c9zpKH6Wq8PudC05i2A3TH0/hAtQTTKI6KqSReTNeC7kFxbxBES8Ixtb3dgmjtvhY3If1iL5B5
	ngcGqyNUshVO8jqyDkdMLFETDKKHGwWkjY5oYaWJZxxGO+lEuKXjSWj3is+0SlsqrCiy2OVs+jX
	mOoADhXt9okVAt4sIYTpUhoxY2rexiMsiSnXpNUDWyXU=
X-Received: by 2002:a05:6a00:a118:b0:845:c5d5:3745 with SMTP id d2e1a72fcca58-84fde2bdd05mr6381097b3a.34.1786711704493;
        Fri, 14 Aug 2026 05:48:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:a118:b0:845:c5d5:3745 with SMTP id d2e1a72fcca58-84fde2bdd05mr6381056b3a.34.1786711704048;
        Fri, 14 Aug 2026 05:48:24 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:23 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:17 -0700
Subject: [PATCH v3 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=7292;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=MU7GZ+tytzeAu/0p/zI6nSVXQYTHMyfWxKiBJwhCzz0=;
 b=SGaxl/G9vwdBk0nUB1upnaWduGYG3KhHe8FUVBY6TO+SgXQh/SL5OYZo+kAxTTd/s9IUtFVBb
 SeyjWwvnTSBDdLL12JeZTa5uG4XGajPNYb20RCvkJhxGUZ3kAq9GlQM
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfXymXmD95VnujN
 I1X+9VJrVOJmyLf/t7dQoLP3IN+pUnrkT/JPnSOaQ1PlKPtTCEqf+Ae+EkBGHFdg6hEXHnj/4/V
 Ve3ZauwG7BwP3C/s8LJdu7Y5PvEfkPc=
X-Authority-Analysis: v=2.4 cv=Z/Hc2nRA c=1 sm=1 tr=0 ts=6a7f0e99 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BtlTzcViXokOtVCNP0UA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: uSl5FG9--IRp5wEkVynhXL3CBonryPS7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX5JWxJ5zeJMi5
 m3uCfWkZirttKmlzo4Qti4KA2Lg7bP+QTyYuTpVCSxZ1acMCW/+us36KTuCpZlCut2mBgESzT34
 lYAKs13fdLNKeft9DfUXkRhlx2GaHP8mRRFYFD5DB2gJahPdFSjuvCNKp3yew8yPXJ1En04sug6
 hmIzyebkTJ4w6kS/blgldeOQ8CunHFFENj3wkv6bsp+5jVG70fh64OymiMVL7Pqs1vsodE7Bj0v
 UmMCIke2tphjfSx6vIiBgnxsuR6VlwDKontAuBAFBaxYrtibkUbAg4KJVfwzmya5kDmYXyKo3xe
 ePQUdyWB9OzGPt0Gm7nUYPk+hPJNF33wljAcMpwPgZ9FG3PG8XogKK9yowxUtIj07P0En/So7aj
 Z+6KgDdFTldHM6rSiceygEUcgPVHlf5eXdKqd4E+oNxFD5ol8chncwiCa0TNUwZ7TgmNiVa574x
 ZtPaSamNE8b3pF2g0Gg==
X-Proofpoint-GUID: uSl5FG9--IRp5wEkVynhXL3CBonryPS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140097

The PON (Passive Optical Network) reference clock's parent is
cmn_pll_div2 (CMN PLL rate / 2); it is then further divided by a
configurable 8-bit divider (1-255). The clock supports two modes:

- UNIPHY mode (CMN_PLL_PON_MODE_SEL = 0): fixed 31.25 MHz output
- PON mode   (CMN_PLL_PON_MODE_SEL = 1): parent_rate / divider

The clock output can be independently enabled and disabled via the
CMN_PLL_PON_EN bit.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 182 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index a5c2224ff22e..8987e0ff7dea 100644
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
@@ -427,6 +434,175 @@ static struct clk_hw *ipq_cmn_pll_regmap_div_register(struct platform_device *pd
 	return &div_clk->clkr.hw;
 }
 
+/*
+ * PON (Passive Optical Network) reference clock operations.
+ * The PON refclk's parent is cmn_pll_div2 (CMN PLL rate / 2); it is
+ * then divided by a configurable 8-bit divider (1-255).
+ */
+static int clk_pon_clk_enable(struct clk_hw *hw)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+
+	return regmap_set_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+			       CMN_PLL_PON_EN);
+}
+
+static void clk_pon_clk_disable(struct clk_hw *hw)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+
+	regmap_clear_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+			  CMN_PLL_PON_EN);
+}
+
+static int clk_pon_clk_is_enabled(struct clk_hw *hw)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
+
+	return regmap_test_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
+				CMN_PLL_PON_EN);
+}
+
+static unsigned long clk_pon_clk_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
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
+	if (!req->rate)
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
+	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
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
+	.enable = clk_pon_clk_enable,
+	.disable = clk_pon_clk_disable,
+	.is_enabled = clk_pon_clk_is_enabled,
+	.recalc_rate = clk_pon_clk_recalc_rate,
+	.determine_rate = clk_pon_clk_determine_rate,
+	.set_rate = clk_pon_clk_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_pon_clk_register(struct platform_device *pdev,
+						   struct regmap *regmap,
+						   struct clk_hw *parent_hw,
+						   const char *name)
+{
+	struct clk_parent_data pdata = { .hw = parent_hw };
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
@@ -499,6 +675,12 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 							     fixed_clk[i].name,
 							     CMN_PLL_PPE_CLK_SEL);
 			break;
+		case CMN_PLL_CLK_PON:
+			hw = ipq_cmn_pll_pon_clk_register(pdev,
+							  cmn_pll->regmap,
+							  cmn_pll->div2_hw,
+							  fixed_clk[i].name);
+			break;
 		}
 
 		if (IS_ERR(hw))

-- 
2.43.0

