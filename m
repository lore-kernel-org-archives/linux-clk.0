Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C782631AF07
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593675; cv=none; b=MSjXdq3PyOQTMjbSVP+eqZEB3rCCCkK95XK/4vqhmovzNvcnKLzzRjNaqo06AWAIke+++eOL64t0vdZVvHkd8Cmdo8DBM1N80nMDLe9EaCCgz3RIiOU/c2DDGWTF5PpCVw3wTXrTlfze92e7Er0GVuieiw80mpiUg0XI6J0TDvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593675; c=relaxed/simple;
	bh=jy1Y4cPl3VQk/7bYr4aTjkr99qsh9OD+limkdq/wlVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HyXm5HDJfJMOPHIa4w7btgYlis439mTut8KdKXYCnJY0vHaQJBrCWsnh7k5VqI1uyg0nvcqYKF/e9rhFSgR7TfutsLYU2ATTwZfbN4VhwEJ1Xb46TWjkBjwbMcijeSyFV9QAcxSgAyUDFy/9GDJicpPr5xJzQGtgP4VxEuJqov4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVpjCrHz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HD7ITP5K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVpjCrHz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HD7ITP5K"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Cadw53218788
	for <linux-clk@vger.kernel.org>; Sat, 1 Aug 2026 14:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYsuhVJCOMhW7UDz1QnxEptE1z56CTCJNrGIWw/fun0=; b=fVpjCrHz234qtGZe
	5+Qk7X0V7YwFRk3tLFEv6MJznYsDqD0/WbLzo0m2emJsX13VkWDg4JnZbUnPCOXW
	JFPQ4S/PSpnQ4xrFNaRdf58ZfiyVcNVLLHbbv33rNNhRrryE9WuOqNhTYo8RYthx
	CcxHdZwBno6+vUwGjf1KyS0Mmcy4Ru9pQ87Wtokut5TKcOyPWgDeJyNuNy33PKGm
	3o5+O15bRY3mDWYS+9+pPelSs885rXO37Rqki6+9+LOCVrMJyHNWGvF6DarT2iOp
	kKUY+QDxcN9ZQzVxqVnGjeHK+HTilyatQWj7MJCmbXfYAWwX6G3+FYo8LqK0haTC
	/vy91A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx12b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 14:14:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca860baea9fso4631049a12.2
        for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785593671; x=1786198471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYsuhVJCOMhW7UDz1QnxEptE1z56CTCJNrGIWw/fun0=;
        b=HD7ITP5KOvA+RvzB4i5DwFE7fSbKdiC9nG5+/Catbfyl3tEVTgxMaH7YNAGIjWkeHq
         1ZP240QJQ9kL+tQTSe5CwWo7F5ZncD+kMGL0/sk2Ssb8WTlAJRjOV4L3Hy1wJ9NFxfR7
         OKqv487RU2LkMNFCg+5V65Gd+lDjxK0E9Qp40WeynnQqBryQODMudOHBruPEc2FE8eDI
         0QD/I30Z4x+If6xURAk0nK+n6C/6eiEkbFpvYxDiHE1+dV6SkOASR6ViCgqdKbIOhUAu
         xEkrbnVT3VIW+WzqY4nBsOTdCIQc0WHFWIdshpbXoKhCTE4VO8MQRqSzNstkuZdWzEBL
         MdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593671; x=1786198471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYsuhVJCOMhW7UDz1QnxEptE1z56CTCJNrGIWw/fun0=;
        b=Wer1o6Fb4xiynzmfct9I8+SBNWee/FAsh5YpU/x9zFEGw20fZs57aKieSCkvH7wTkS
         HQA8M9bNFlr06R1YecUsDEEm1m0JbTUUP38Fy6ELXgqogpBar6E9fgNBaazFEKTL7cCy
         NKD/yRgPqqFavikdaFHvqmodR+tg4oC20zbz+uo+VfX0JrT1q5VbXuYAYVX0grpCuf8L
         PTtnku+LOQ06QsBuvFD3huI90Ks1cwnKi0rcOLg3YMZY1z3SQHT6gK7ftRB5LJe0Tc6G
         Retu14FwLenUzR8pGx8MyoPUB4T/acitnBW+XzJi6vvR1UP0orDUPs1IjmvrkSI9rP2S
         Ojbg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1CzzNMiKn22/PZBIRkr5Z5Y9tQKzIBtgY+qhs+9nvrXnL4XJEiD9lER6ssLLSTbYSvPVC5ZYhPVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUTlRr2RNNur90ikyUbPEt39T3tk4MqSvbEqY8m60hsZ2OW8wD
	YSd4kJqcaIZYZmZ3QbZ0Eal9UP/H67zlVfL5OGBMOfLo11EIdSokbu+ibZVRc58zjKBJFZsurUb
	o4FCzKt4Q3rHoQsyfoySPeAB6i58ZXmnO42CW/k0GL8y35S/S5ttZrhcp4jLkjGU=
X-Gm-Gg: AR+sD12OnomK77FfODV06kWh4HmzQ4Zsk6kgsC0m6tkSRrWorgjYf3jO152Q3E1lgX5
	WRNs1rwP6afoDVi73a8ABN2j6o5WsZnswURu6JHyxcIHQGTgOIiIjasXNo6zIxutLzfEpRc0enW
	64Sk27RJUxWB7qgMiJ7YaNIaYWSQ/eSX3BHuaMwoCDLAPjUJ9bmZHSarsbQ12BwflwPUtMlOBx6
	qSOsg7EE//Zbk97DYTceDIl4fCp3wJVEVyNXHm9hDm8/7TbFBBCzoLCxofWyoEK5N51glyM6VOj
	SM7snL3QTgpyfK2BlquTrtUw2L28HEx+m/MqdBvoxpapc8X607oGptJrx5vRo4Um4m2ZIVlZoEQ
	qfohe9JWwJ6OsA7iE0oVS0qGo
X-Received: by 2002:a05:6a20:9143:b0:3c0:9c1b:d0b3 with SMTP id adf61e73a8af0-3c92a907f14mr3888441637.62.1785593670634;
        Sat, 01 Aug 2026 07:14:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:9143:b0:3c0:9c1b:d0b3 with SMTP id adf61e73a8af0-3c92a907f14mr3888402637.62.1785593670197;
        Sat, 01 Aug 2026 07:14:30 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm13570696c88.13.2026.08.01.07.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:14:29 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 19:43:56 +0530
Subject: [PATCH v2 5/6] clk: qcom: videocc-glymur: Add video clock
 controller support for Nord
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-nord_videocc_camcc-v2-5-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
In-Reply-To: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX2+qTgk4wBqoT
 Ax1YYRCpApzsZOvKStGU3B5FkGGY0PYBHBgzMqKhy1ke6HLaXNaTeYtzRQp94RnbBASFqOLfbjL
 4iK1soi9WcGzX0jzIbYbjbQNZUGL5djQ7pTmDgqdYB97se5R1G9na6kDYCHR25clljo15aKwAYI
 bWj2pVwBb2OGIFJ9hd40uiMS1VrOsg31TiB38gwR6p37QSdKBgunRwlessdFnaf2IEaYWfN8rQn
 SHoLECuraCxCsivsfhVjRX3COw0p3FT0ZIIly4HSVSyXBiZSpTr50t7GPBbPCRULdLE5bswR+tI
 KAjE6Ub6DHhlCZvnlFQbhG3PFndTNqgjTWJ1Wmy+M78y/aelr7rRsEQsAb9fCWmb+hYkmeiVhpI
 HDC0UB0T7ceBkjbad99W0VqUiSACsthNIzKWrspqU9wl+dyxZ2SL5LvsWkjG+z1DaR6VsndcBff
 WsMi/BprZPhWlXjUTbg==
X-Proofpoint-GUID: WW9iSd_WsB3N2WSP75eqU78e6AYTmU59
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6dff47 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gGps__zzgqUJur19I4wA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX80Te1TWyibXX
 uF74QmcOlaivB3ImsOL1pelLUefH6JfHO/Z+fapwlly47anGO/x/HH7fOs1q6wJNa6OIj9oifYS
 SpCUUpwIGmFTQmxQFn39/RXYwu1cIew=
X-Proofpoint-ORIG-GUID: WW9iSd_WsB3N2WSP75eqU78e6AYTmU59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010114

Nord shares the video clock controller topology with Glymur, differing
only in the PLL0 hardware (Lucid-OLE vs Taycan-EKO-T) and the MVS0
frequency table. Extend the existing Glymur video clock controller
driver to also probe on the qcom,nord-videocc compatible, switching to
the Nord PLL configuration, VCO table, and MVS0 frequency table at
probe time.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig          | 11 +++++++++++
 drivers/clk/qcom/Makefile         |  1 +
 drivers/clk/qcom/videocc-glymur.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 63f271aff1771bea0885fb753dd28d02fd7d4ab6..a5c7faa4dcca1cf7c096ed5c3e16bd1761c46506 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -192,6 +192,17 @@ config CLK_NORD_GCC
 	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
 	  of GCC, SE_GCC, NE_GCC and NW_GCC.
 
+config CLK_NORD_VIDEOCC
+	tristate "Nord VIDEO Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_NORD_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video clock controller on Qualcomm Technologies, Inc.
+	  Nord devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config CLK_SHIKRA_GCC
 	tristate "Shikra Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index fff069da16deb64311b7e9bdfab4248a706f6b0b..8dbca24fafd012cde3c25993a925b756a9b83608 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
+obj-$(CONFIG_CLK_NORD_VIDEOCC) += videocc-glymur.o
 obj-$(CONFIG_CLK_SHIKRA_GCC) += gcc-shikra.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
index 18313a65e78d95426a436c94ddf2b26307d6fa80..2776140de3555d27b388d4235d0530523b8f8590 100644
--- a/drivers/clk/qcom/videocc-glymur.c
+++ b/drivers/clk/qcom/videocc-glymur.c
@@ -37,6 +37,10 @@ static const struct pll_vco taycan_eko_t_vco[] = {
 	{ 249600000, 2500000000, 0 },
 };
 
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
 /* 720.0 MHz Configuration */
 static const struct alpha_pll_config video_cc_pll0_config = {
 	.l = 0x25,
@@ -48,6 +52,21 @@ static const struct alpha_pll_config video_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 720.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config_nord = {
+	.l = 0x25,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
 static struct clk_alpha_pll video_cc_pll0 = {
 	.offset = 0x0,
 	.config = &video_cc_pll0_config,
@@ -112,6 +131,15 @@ static struct clk_rcg2 video_cc_ahb_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src_nord[] = {
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1305000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1440000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1680000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
 static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
 	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
 	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
@@ -508,12 +536,22 @@ static const struct qcom_cc_desc video_cc_glymur_desc = {
 
 static const struct of_device_id video_cc_glymur_match_table[] = {
 	{ .compatible = "qcom,glymur-videocc" },
+	{ .compatible = "qcom,nord-videocc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, video_cc_glymur_match_table);
 
 static int video_cc_glymur_probe(struct platform_device *pdev)
 {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,nord-videocc")) {
+		video_cc_pll0.vco_table = lucid_ole_vco;
+		video_cc_pll0.num_vco = ARRAY_SIZE(lucid_ole_vco);
+		video_cc_pll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		video_cc_pll0.config = &video_cc_pll0_config_nord;
+
+		video_cc_mvs0_clk_src.freq_tbl = ftbl_video_cc_mvs0_clk_src_nord;
+	}
+
 	return qcom_cc_probe(pdev, &video_cc_glymur_desc);
 }
 

-- 
2.34.1

