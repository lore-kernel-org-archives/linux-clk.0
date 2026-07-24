Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5A543B4AA
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905246; cv=none; b=rpF/j7XBQcii2o7vHElc75jK67hBfw4LCpdCMpDYdlCdD0K8xUoEJS5kYk3iVrRLfDGmCusL4T6oa6p/Mp1e56xTL7FLN/xwAvS3NR4N2mwQasaWkBljwIYslKg/kHQctqjzWniv3wQIk4imiZhM/eKl/xTaht2lTearOGoxJh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905246; c=relaxed/simple;
	bh=zD85P6LNvs+Wzn31QuiidOpUYjqw0x5J1/H7IesxRLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NS6Q71Ra+i7i3WIF/fb3KIWEJEwwk3TOHfiJKzwpvIWgomrqwMmwbKb7zr+ToCaarFGuTxw1HXhmMlE1hfJQsT5cmNv2VZmjgESdzZVYBkOQl0FeO4cXpm+Q5D/AX6b2JffzsLBuCd6Fsy3DmBJnTvJ9AaFy7ZgUaSwEz/XBdDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLRYnIAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aT9fbJZo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLRYnIAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aT9fbJZo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbXxc3090588
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfjDXCV/KCJXVxee0B3ZVSl5TGQyuSHkDMx4R4IdQMI=; b=SLRYnIAGZpKoC3FN
	NvsbooIzGQkIeyuaMGDXwaoS88cWC3TYCDs5iHGUoOa1vvAKdqaNv51d1iFuvypH
	OmTzZyd0wthWFxFo4XikJUAyhjh+ROrUsZIiMv63raOWs8Grls4A1p1IYJAOUjKU
	vO+n++6JPhMoPvTul02z6/hNOXuJF6GTmff2JUSKec71eiWO7WvLDmqrVgXeBI3w
	suI0w+/davDPxTC6wyfJHrjO/5SwTyvGrtUP90QF8lBNqJ7MvI7jdaPQwIp1J+Vl
	LGk92v94SSQKy4sj0JcrW/DqJ7uMbhJGwa1o+qnnb/7ZIswvuAjJAbUP/FSrQ4VQ
	yvTBpA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgggcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so691910a12.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905238; x=1785510038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfjDXCV/KCJXVxee0B3ZVSl5TGQyuSHkDMx4R4IdQMI=;
        b=aT9fbJZobTZ8G5X9PEEsrsvqb27ATfxpKWk8SaTavKTzl5dL/qGOzURnHUpL3h9zVf
         mEBXpMFfdyt+YOZ7q5TzFk9Xx+4A1FDK6zIxAByRP8bHfmcnYPCbA9RBfZUe/E2W7KO9
         ECdLbaPDLOYf5aDK/l55PmjElHoyo2QtGAZJBXfoJo09wE//E1GH/MtKUKhx8m/16Wuy
         wabvKYJHJ4ikCp4+UovXTyXZSdKEkuE1o6Zg9ckMfrU5iShLkrGdrIsZO8VeOI3b3z/R
         Ruj+xtcBgoOm1ha2okV6Yf2q5Mb7Cu53XR0soE1QxYyrdMmISQtGThSHMcX6TbMMvGPL
         SFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905238; x=1785510038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfjDXCV/KCJXVxee0B3ZVSl5TGQyuSHkDMx4R4IdQMI=;
        b=FDotng/AEFTbJIYERndRNFDLRnH/XtlxLpFNz/Boic4ru/w2+bK8CQHZaBlF1aWdzf
         yJJDe7vp4KumuLy5jBzeT3CZ+smb1dX8LGTF2caWi8FOrl/qjKsj+4/GXkGINhl9Pa8F
         bRIb0dXhOd1rzVbC/B6Pswh+pyUUsxWP3bo/ZTDAUZmYMeit+eyND+OSol9LzgsYMyqD
         /UV43mYz/02zFy7Lfgf/eGXHaFo8QnV48trGVDdAC2RiWUhP8HYwy4eslYArA0vzDAjM
         bUahWCGI4Oy7Jf47kwuXAgrSwmpReM7qxybcE9OCiBqHI6yRjx0ESnHUKhBQlCbDyLAY
         TAQg==
X-Forwarded-Encrypted: i=1; AHgh+RoIqU+MFEE9S2yujZ9wAbu5SG7IYmkDDieTUicllx+mrB0R76xKvgnE2xhVl1XdoeL2mmQ6QDfXIIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7u9TKar2O0Rp4DGD0RiIMf+4ss0WpQJB99d5syErRG1eNF3Sg
	2dGux8muhTRdHe5DVdHDTWpZbYftyShYHzo144mI8eiBYDNQnBAYs1yzGtVhBV3EjeGOpgwaaMb
	cF4yrRJnGZbRAOiFwZSgpyib9LTLu5C6D3kk4MlADIhURuUGKQk0CGxOLt2ECTd4=
X-Gm-Gg: AR+sD12+VIW7DYrrP4rrmuuw3iSB2SFX5lQmFOcaiq3wu2Kc9yHrD3VCsa4HhlCsT+C
	Z7iPUbys0nCh+Ka/RCgseFoGO5duEI+Ky7dmknVCA7/C3A3ieuYrZehOjhWVEIKI8BnxY2m04iB
	5kDyMmzU4njT9YWH8Es6b95GSODFV4ez4Pd1zcF1Dak/QDIFfW4pMwCgWSBK3FduPmHlMaa5BCH
	8jDBME6/1E9e5KKlcTSMZoICYvpJqPG2gpYdiuEZOVHFH84UlIap4g5M0jkeVrAmDsla3HHAxc5
	M8OpPVR65H93ESfYULwxxi25vkSa+7vdilzjgxBUn3OPjnHX8jZ8nIfxeGZnVLMRODEYxSymRGU
	PvC4oL1se0xg+659D1UueteAF4Mb9exz4Tr9b3a6JOCQ=
X-Received: by 2002:a05:6a20:9189:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3c44b190a96mr8581060637.36.1784905236636;
        Fri, 24 Jul 2026 08:00:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:9189:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3c44b190a96mr8580977637.36.1784905235859;
        Fri, 24 Jul 2026 08:00:35 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:35 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:32 -0700
Subject: [PATCH 10/12] clk: qcom: ipq-cmn-pll: Add all output clocks for
 IPQ5210
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-10-a8b8679d215f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=2989;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=zD85P6LNvs+Wzn31QuiidOpUYjqw0x5J1/H7IesxRLc=;
 b=Q2q2ptGYFI+xtBfmNOhlqW3mJWAQCUQiuOtAQZIRbmS4WW4fQKPik+Fd4ApKXTikHou/S4VdU
 X+vnBENuFivDxqmGWBclAmQwafjAtdmi/cb6UpSfeHRc1q4ba6KphS8
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX01Tsl1AWe23N
 f91l3fpFZeSXz24B1Xn9jDaDmKe6t3PmUJZOSqKfYYtQ3tZBeuG32yP9lYdLTEJM63o3i+gLKeP
 Pa6Ee1t8Fbo9B6BOdd8e1K/URijuj35UamtukPxZGeKqlrD13LrCXKlz0OP+j8ItbqIg/rBhFMD
 xOLVbEULboxVI98ab3POvYp6RyU6/cTh0vP4rt9FkTvc4eD71eWhEBYa2TKkhREIqhZZjy4+DGF
 OKGXE65GLfySsXMcsg3T4BLyfSqTVa2eJirAgSh53Ctm3Qu2gaqDoXikt7UGc4M5kTV9KcO6MYc
 hMC8odoWLC4U7vpX0BloKCuBvE5e1Y7zi/To5rxcNcsns0iuMLJpnRPWqG1SXvmLQLw9SdXNEyp
 CGWiv74Y1EMQvKzZQNcbui6Qs9cvyQUaot6REvq7AvPF3aUj1OCVGdjExROgsOVx1zP3L8g7DCj
 V7ZVD/nvRXP352E4D/w==
X-Proofpoint-GUID: J8wZxDb-SF5IBgrpx1kqCzI0v7w2q8-2
X-Proofpoint-ORIG-GUID: J8wZxDb-SF5IBgrpx1kqCzI0v7w2q8-2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX8Ow+Ml6tA4Pg
 Au4/QYPGDVBVXRU1iPTy237V+VbpCw62z7ZMv6nvgw18QkZnp3ES5Vc6fxT5PaZm6aTXfVlSBAm
 k+9M0Upv2jOiVQJlcj4b8N0uJBYel9U=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a637e16 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EC4oSUd80wHeU967I9AA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

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
 drivers/clk/qcom/ipq-cmn-pll.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 00e243282b31..902a222e4533 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -55,6 +55,7 @@
 
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5332-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
@@ -164,6 +165,22 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
 	{ /* Sentinel */ }
 };
 
+static const struct cmn_pll_fixed_output_clk ipq5210_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ5210_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
+	CLK_PLL_OUTPUT(IPQ5210_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
+	CLK_PLL_GATE(IPQ5210_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL, CLK31P25M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL, CLK50M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL, CLK50M_EN_BIT2_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL, CLK50M_EN_BIT3_BIT),
+	CLK_PLL_GATE(IPQ5210_EPHY_50MHZ_CLK, "ephy-50mhz", 50000000UL, CLK250M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH_25MHZ_CLK, "eth-25mhz", 25000000UL, CLK25M_EN_BIT),
+	CLK_PLL_OUTPUT(IPQ5210_NSS_CLK, "nss", 0),
+	CLK_PLL_OUTPUT(IPQ5210_PPE_CLK, "ppe", 0),
+	CLK_PLL_OUTPUT(IPQ5210_PON_REFCLK, "pon", 0),
+	CLK_PLL_OUTPUT(IPQ5210_EPHY_RAW_CLK, "ephy-raw", 0),
+	{ /* Sentinel */ }
+};
+
 static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
@@ -986,6 +1003,7 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
 	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
+	{ .compatible = "qcom,ipq5210-cmn-pll", .data = &ipq5210_output_clks },
 	{ .compatible = "qcom,ipq5332-cmn-pll", .data = &ipq5332_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
 	{ .compatible = "qcom,ipq6018-cmn-pll", .data = &ipq6018_output_clks },

-- 
2.43.0

