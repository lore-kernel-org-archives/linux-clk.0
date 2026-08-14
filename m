Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1149946F48D
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711711; cv=none; b=kItFhiJPklnluJcf33u45/XKGlVtCdQlRXojNgsMCr5VUppgUJwxum8byVhs39/2sncJm9OtDacwetjEm98OnUgfHyyFBSg/7r/8j1bdukwXYZNlWdCGW9Lo/55Jpi3MUwBBXWHmykK/NKDPpMKiWW1BZMr6Jhcc/brTq4Zlqtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711711; c=relaxed/simple;
	bh=NBOmebAkjo38QQYJjn3dCzxwu8AluedJW/7Vx9s6EQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XAAFBp3FLuuq0q4VNSZsn1Qa3klUIJsTW+nCsAXOWTYcR4SWmg5e5fW5/PY8QPDDOlMZ32o1MaBDZbS1JW1XerOaEiRj00pMb4OwHCDKp4IvOm7OasoAIerMnB0Nwu1KzCk3cNZ8t0/c3Ac0t+oIkrKeSA1hDQ1BLXruxzxmryk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsJCKwLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CkGaQnoF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsJCKwLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CkGaQnoF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAb70n1494580
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSpoqOkUKo9VC5cQp885gAHxo3+zGX2yr4wkI6veIZs=; b=fsJCKwLXCLyt+XLk
	3pHPSlSDOm07evSD7QwR0NCqJnmy+L3p60eGiU0KDfmePSkkco2aL4EIkgiDAzpF
	CLl8ULkzZe+cAsTiOJwjHH9pPLGyNsw3CT3YM4h9xBZZXBXEQoYFVf+xtmXd78Lf
	6UJ/G+x8ovGm900ei0d1a6ixj7ooMub8h4Z5gaO1E469ZzTdaQC21ZyqRM09W2a2
	OiZnQ8S0ZG8L79Rm5RwUU7jsVEMp+AZ+yeZjRTQv+jf/7AuuG5VYweEkZ1CJI7pO
	HTS9HGvToRw2GowUiatafaI/Wm5ngbe+8A/pt0SzqzClBrgx6iq5erbbeR0TIJU1
	jQqgSA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20gn8qsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:48:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e04598adeso649317b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711702; x=1787316502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSpoqOkUKo9VC5cQp885gAHxo3+zGX2yr4wkI6veIZs=;
        b=CkGaQnoFuJEKha/ysB41pLSbo8xa/j68dy756WJM17rwewRzIOQtGZHDuwYcOmdny/
         158FllBj8DMViPKMLaUX04UsLRYsODCXWEgKUSGQiqaZVO3fS+q6s9s4YhzE5I3QbpYx
         /AKYIJ8+xpG7M53gXtMZ3qIPezEyub8x34I0Rvv4XLxgXLr0tnXsIaWEsZfQZ1nty/Zm
         2z9ctXjMZyLxZesOKLfRTWoGpYKmY7uVeAHNJ0QdRt3MXKnXWBZi55GwHIQVvmLhvynz
         9FVVSJX7hm1GG9NiLCdI4okpfnMaDQjvz74Tl8/vdGd1EFxEwhKSQOhGHRZHInLmhsLb
         xUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711702; x=1787316502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSpoqOkUKo9VC5cQp885gAHxo3+zGX2yr4wkI6veIZs=;
        b=ABH24U8SCj9e6CqI0mz7BTzY3OjB/T+NGG/0tRieSd0cpkzm6J4YXj/8iZ1d7vA6zm
         dquJzsCtvLloVQREnth/NEkQfQ9vqZmRsbXxhgkh5wt8zyrihoIVXCCE7+KJHWbC8OiN
         BBi3noxMH9qYcJjJEi2DzLh92XOqo3bcE08LDNXK0Y91Ye89cfU/mOXpHLtpgY/D3jdL
         ehZrjtoWCT4EUuCYAYsHUuRhZbtGl2hWc+ctuwBArMoBjLSjsuBWEUIobWS/lFpuN4lK
         jl8gWRgMw3MJCbbeYhN0YciGktAAiYZCaI03XVZe0OAmlG6N49reu81whGP8chIOxDmv
         i0mg==
X-Forwarded-Encrypted: i=1; AHgh+RpUDtGVRcl2ItmvH8KDw64ILmbwK2d8czaUXsUUfkAeHpgmbAFUiM20Es1Yh35VNZrf+iu3YqY8Eh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXRA34Ga+bjOaub+LWuVAHCD1eHaw7b/IV2idESPRptMPFfZx1
	dGPEg4Q3F05BWSDQKStcUZ7w1PkZbjAjdOTEnUUuYKreeKj8W5RMPLm1yE7QPRYzmPz0OZCpeWR
	tQAkfpFL+l5YifRrxtoCOVLyTknN0RBnkIQQqYq4IprJZzXA29p2izN+sWmjNGEo=
X-Gm-Gg: AR+sD10lMquS+QSB7rcnmzzUBU3NWGHVDNSfZAjheMqJHOdOjbTvgm8QWdIJ6fEuQSn
	Vsjc2xkYDsCV1mztpow3NsPoeetHZ8o6Bqrv5KM4PFqEUsD8RrFnRhV0tmxOgI0EoiMk/f+gzlN
	Q0rn9QyTrc3On9v3S5jaqTHatSVaC2in6avQmwvWYC+yhVam8jelff365uekUGKWha4G9ssqtgA
	DZ5ELPFK/aUvWiRquP62V9bEM3fiYSCQQ4lzBzYoyqb9Fy4qkRwczNBEpgpB7JRv07NaeOe3NlV
	alRLODJLChc0KMfSEFxEqGwX7EmcJkE83dX6Sipbgh6CwknWHgYkDHK4qv2QTfC9S2OOJ7X3HaB
	IM8ZiFyOi3Q9Ak20Ph+hmzVn0/9JIZL0Xm60HUNKFpPw=
X-Received: by 2002:a05:6a00:3a11:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-84fde004086mr5244572b3a.12.1786711701656;
        Fri, 14 Aug 2026 05:48:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a11:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-84fde004086mr5244487b3a.12.1786711701197;
        Fri, 14 Aug 2026 05:48:21 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:20 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:15 -0700
Subject: [PATCH v3 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-5-21c3db378611@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=4919;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=NBOmebAkjo38QQYJjn3dCzxwu8AluedJW/7Vx9s6EQc=;
 b=EmsAEeCHxiaRBy7DUNRPkZ1XOzQhBXVX+kQJ8x4IHjKQ5ZtCd360YEMLDsDk3kqLrzwakkp+E
 CDK/zRZ68VPAUBI5L15wR5gJj2zogT5nJUNnym5qHURAXSGiyZZZOlE
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX1rphcwX6JgPt
 VEKaoG3F6viKSUf5OMMaoMSF6d7g53/LxtlKqHROOFEuK3r6H/y7G5e38bub3X6KpeMXw9Flefl
 DbcqUZPfRbt9HWkoJzYI/T7Izp4o2l/sCXaqcm/2cYju+F5OeuxrAPftBlER/sK1wHdE3qMan0S
 EaeEbSWTZsTKbCvK+w1w7qwaw44BDuL+a9kzAkIxl4CZPFwE/mhQoW8/pGR3h/3jZQ23lNTI2GP
 En0tqPkPa+8OAAw1Mqmhs52wNNR2xP2LoDmIJJpyVB2NPoTMuI9PdNfr/Qr0Z6YMcgz2crms73g
 yQQnbYF+K0c5rGyoe1UJQGO8g8mAcQM6Sz0FOK+WzIMRlXTOT38+yA7WzmfjnCKctcMMZRryDRe
 ROB2xVFiFGKYiSH3R+skfUs5iyB0xnACIGeMAnFJKKo+fqD5V43nbZBBjMxaf8VLDjEEZAoPV9j
 fq+C8bf05Yek4Jwr6/A==
X-Authority-Analysis: v=2.4 cv=DdMnbPtW c=1 sm=1 tr=0 ts=6a7f0e96 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=g-8Oty4yfJ5la9H7Sy8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX024LPNmBmXXn
 FwWtyi2QHm1niCthP7QFm0yzDHAJLw2VIRPuQ026qhl7diQsFgFg9HUpCmfbLzdVF3Ocgv6Dymy
 KMOjpEj2XtpsAie92h9vx8Y/RoJRs9c=
X-Proofpoint-GUID: etPA6sMiy4ekfTKRFOMT9fLUhrWTvpSy
X-Proofpoint-ORIG-GUID: etPA6sMiy4ekfTKRFOMT9fLUhrWTvpSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140097

The NSS (network subsystem) clock's parent is cmn_pll_div2 (CMN PLL
rate / 2); it is then further divided by a configurable 6-bit divider.

Register the NSS clock through a new ipq_cmn_pll_regmap_div_register()
helper, built as a plain struct clk_regmap_div instance instead of
hand-rolling recalc_rate/set_rate. The helper takes the register field
mask and clock name as parameters so that the upcoming PPE clock, which
shares the same register with a different field, can reuse it.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 84 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 79 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index bcb51a5f559a..59978789f493 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -60,12 +60,18 @@
 #include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq8074-cmn-pll.h>
 
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+
 #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
 #define CMN_PLL_REFCLK_SRC_DIV			GENMASK(9, 8)
 
 #define CMN_PLL_LOCKED				0x64
 #define CMN_PLL_CLKS_LOCKED			BIT(8)
 
+#define CMN_PLL_NSS_PPE_FREQ_CTRL		0x98
+#define CMN_PLL_NSS_CLK_SEL			GENMASK(13, 8)
+
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
 
@@ -80,15 +86,27 @@
 #define CMN_PLL_DIVIDER_CTRL			0x794
 #define CMN_PLL_DIVIDER_CTRL_FACTOR		GENMASK(9, 0)
 
+/**
+ * enum cmn_pll_clk_type - CMN PLL output clock registration type
+ * @CMN_PLL_CLK_FIXED_RATE: plain fixed rate clock
+ * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
+ */
+enum cmn_pll_clk_type {
+	CMN_PLL_CLK_FIXED_RATE,
+	CMN_PLL_CLK_NSS,
+};
+
 /**
  * struct cmn_pll_fixed_output_clk - CMN PLL output clocks information
  * @id:	Clock specifier to be supplied
  * @name: Clock name to be registered
+ * @type: Clock registration type
  * @rate: Clock rate
  */
 struct cmn_pll_fixed_output_clk {
 	unsigned int id;
 	const char *name;
+	enum cmn_pll_clk_type type;
 	unsigned long rate;
 };
 
@@ -112,6 +130,7 @@ struct clk_cmn_pll {
 #define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
 	.id =		_id,				\
 	.name =		_name,				\
+	.type =		CMN_PLL_CLK_FIXED_RATE,		\
 	.rate =		_rate,				\
 }
 
@@ -364,6 +383,47 @@ static struct clk_hw *ipq_cmn_pll_clk_hw_register(struct platform_device *pdev)
 	return &cmn_pll->hw;
 }
 
+static struct clk_hw *ipq_cmn_pll_regmap_div_register(struct platform_device *pdev,
+						      struct regmap *regmap,
+						      struct clk_hw *parent_hw,
+						      const char *name,
+						      u32 field_mask)
+{
+	struct clk_parent_data pdata = { .hw = parent_hw };
+	struct device *dev = &pdev->dev;
+	struct clk_regmap_div *div_clk;
+	int ret;
+
+	div_clk = devm_kzalloc(dev, sizeof(*div_clk), GFP_KERNEL);
+	if (!div_clk)
+		return ERR_PTR(-ENOMEM);
+
+	div_clk->reg = CMN_PLL_NSS_PPE_FREQ_CTRL;
+	div_clk->shift = __ffs(field_mask);
+	div_clk->width = hweight32(field_mask);
+	/*
+	 * CMN_PLL_NSS_CLK_SEL / CMN_PLL_PPE_CLK_SEL reset to a valid, non-zero
+	 * divider in hardware. CLK_DIVIDER_ALLOW_ZERO is deliberately not set:
+	 * a divider field read back as 0 is genuinely invalid and should trip
+	 * the core clk-divider's zero-divisor WARN rather than be silently
+	 * tolerated.
+	 */
+	div_clk->flags = CLK_DIVIDER_ONE_BASED;
+	div_clk->clkr.regmap = regmap;
+	div_clk->clkr.hw.init = &(struct clk_init_data){
+		.name = name,
+		.parent_data = &pdata,
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	};
+
+	ret = devm_clk_register_regmap(dev, &div_clk->clkr);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &div_clk->clkr.hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -412,12 +472,26 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
-		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+		hw = ERR_PTR(-EINVAL);
+
+		switch (fixed_clk[i].type) {
+		case CMN_PLL_CLK_FIXED_RATE: {
+			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+
+			hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
+									 fixed_clk[i].name,
+									 &pdata, 0,
+									 fixed_clk[i].rate);
+			break;
+		}
+		case CMN_PLL_CLK_NSS:
+			hw = ipq_cmn_pll_regmap_div_register(pdev, cmn_pll->regmap,
+							     cmn_pll->div2_hw,
+							     fixed_clk[i].name,
+							     CMN_PLL_NSS_CLK_SEL);
+			break;
+		}
 
-		hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
-								 fixed_clk[i].name,
-								 &pdata, 0,
-								 fixed_clk[i].rate);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);
 

-- 
2.43.0

