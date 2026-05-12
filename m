Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC34B37204C
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591153; cv=none; b=MzzmELvHMFXZYsoOoxVvc7E2pnm7gArG4yw7fbYcKylWzVvUTFZ5MxLJ9r3KBsF0+LF1w8TR6kDmPtg5CaCTJT6TFRes0XvbaWmOefuwOPMJvQqhsKRawlAVA0SZLOi7YCvEBs8jydFXQ+xi89qZXd0tvCEmAt0cfonPXv50kEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591153; c=relaxed/simple;
	bh=9e/rU3y9FiY3ZktFyJuwJcqEkyq+fjBmIt3hjGxM5Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XYYkOQ7xMafm6PWFEibIpa39M1q9lM1xKTWpNzHozm36NELRwkCpHn52Hi1RbuzdbPTGsOzl9u3QUt096HHADeej7dM6Jl4NwlnYsPubJxUMJS1j+yg6o+eBCOsddlkU9fus9CD4BmFQ193MF7MI1OrCTGdolY2uc/dYl+c+sAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzxJlhe0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDoUPlTH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzxJlhe0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDoUPlTH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAqA1W2519075
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCH7Ji4S72tbjTt1JN9O0xKaoBsRwmicvzKvcsw0nFo=; b=EzxJlhe01ZrDf6LO
	fq07NTi0HCAceDsKuJ1AL/cF+sSSoeTV2MrWOX/fTi2Ovl+EzMISIp4Unm05/wVr
	7B/qSxfU4e8es7mv3AWXld4Hb2JaY2Zac2yTgNlVE/3fc+aryhLYi0oQGVhR76GT
	VoogPxgSRvxbiFvsja/dFUh1QAQGO0bXW0q3rzqiTEfj8buWUrx450izsgi16v+v
	vp9FAuyCusIZvSTyUY1QHrnuPJZfWHhQBADlbsrcam6Xtg+HLetsluYqKU2vZPTo
	yIo2McoDu3I0etMpBIfxYOhtcwHHkN/YtlJvHF5TYtdvJ/eBvnV9w9l1WZno+Ezv
	fpwJWQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1kdf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:05:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b99eb06178so117617025ad.2
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591150; x=1779195950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCH7Ji4S72tbjTt1JN9O0xKaoBsRwmicvzKvcsw0nFo=;
        b=iDoUPlTHmi6CKDVeOZhBc5PKzWK9ecxdgVrcNq07tNRZuRXwczC+gpkYEnoJxRgGDd
         sBRjeYBuxczq/Hz/0NXsk8dil8p4+jbVIFtRUp/twXGoazSY7PvCmMZvbRvbp0vXPqLa
         m4ciC/L/dOsAfcq2cA+ZnP+d+wiULupNpAyigjZ8EIcv8urDp5iSzmH8gP0tE0gLaVd4
         mdwY5c6PHY817AbWwB3YVqfD+cifQawmzx23PUKzRo6K4qEQUEdxXQg8w+qqwBe4zpkg
         /s68XXKC2kN4gKOXdDp0VPEwG9CBEegs9IG64u1j5q8DEtOIPJRdAR6IBkaAGHqjkeiE
         e1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591150; x=1779195950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sCH7Ji4S72tbjTt1JN9O0xKaoBsRwmicvzKvcsw0nFo=;
        b=cNI6cfNEDo6UmyKx1wDiTwxTVWluq08sY+Mo7sIWXEW+yk5U9RwvpWALUhmi7KjJ9G
         XEbQvbw3SaI7xc6iqLVnEyr7lctwx5+AEZFxxEuyGoxIvIMFIjfFsZvzgh78vwVbIoOH
         SFM+Li/LcuGE91JAzm3iqCn7DVCZozmsUfrwo34LfqBgGmfxkgzZe5BjVuN0vWy2nxlK
         WQY6dDfkB9IxgmLuPC7D3U0pm9QuKfpgcwKIa8ikuR6jiAbzQ8hRCQtTxgY+qGmI/7AE
         7qGIVBBqqqnpTehJmra++PtYoBd9E+32WZqb5cg069DvBeNVAarVmcj485KGAtfZ7/iK
         VF4g==
X-Forwarded-Encrypted: i=1; AFNElJ+JZvXPCc2cO34WjPGTCUaYDXTBkSkgq9d4dQCXCxG6F5no0VlNlCEIUiHtYPn6UFRSkSaDpDcNLC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg7LFVzpfXxd8egCB6h3VBa04C7Aq6MCha+/Mkl5D0SZjSDNcb
	z8FQDmTIF2SZ45m3hKKw2KoDIM1MXHn0UqSRB6+gl8IL0p+EcxqRLBy9Krm8u2gHoXPmSwm6qay
	6tXPvDssPCNLPv1vtFAKzckHT4WbI6BikYL1LZeMAuITfgIWgO5QfKDJSmmGClV0=
X-Gm-Gg: Acq92OFCk/hV6CSQXAHh3TRy0DhwywNCcMWTVIFZaYDGeJsp/VGonGLL0j9qZ6MFCLr
	OQwnADGg8pJmUrvmgbcPJV6794t8+5VgS2NS8prRNoIlAIBbY5HC4cAwvVe3npP79nWAGrDr91L
	ZMK6Hii9JSXIrYNcwiVA3ENqqZnwFcqxd/+r/00KdLmv+Qm86SV0ypejFTi4AegwO3YnCBPQOxf
	D4P96X9HWDNAxrnAzfUUxNZTATVId2tbzESO81FkycJSsGWa5KRY6loRQwKLwpq8GwcdL//Vfkl
	W7hk3c/I01oikYFIzx6C17hAuV6ElyzcLlYx9HR8j1g/BEJ6XUHQ/40wpYiP9L+ZZyGqa2l5suC
	OXcbMywjms7LhvHynhI+mpi5dyh85c48dkmuB/qGSC76jSdJRbg+TjF8vIzAVEjo=
X-Received: by 2002:a17:903:3b8f:b0:2ba:e66b:ce34 with SMTP id d9443c01a7336-2bd012d5a61mr34126815ad.21.1778591149623;
        Tue, 12 May 2026 06:05:49 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2ba:e66b:ce34 with SMTP id d9443c01a7336-2bd012d5a61mr34126255ad.21.1778591149083;
        Tue, 12 May 2026 06:05:49 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e36c65sm137630785ad.40.2026.05.12.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:05:48 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 12 May 2026 18:35:26 +0530
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom: Add Glymur camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-glymur_camcc-v3-1-a7196fee2779@oss.qualcomm.com>
References: <20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com>
In-Reply-To: <20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: tVWwJoYvN535mB8LRG-W_tWUHBL3uuSS
X-Proofpoint-ORIG-GUID: tVWwJoYvN535mB8LRG-W_tWUHBL3uuSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX0P4zBJnpnFzq
 XSJAep9ecVd1nH4wCD9iO+LeyPW+cd3Mqstk5yxIzEurlQYoudf0Hli4ZLlMoFXkfB6mVHTIwXX
 Q5QofBypuxNKycTw5ULLVJ6XmoAldrUxh0W2b4xYR1HfTPFB+3jiilaRLHGm7f+0jxr6jwNnwWS
 YKj+gaxMxbHedisuQ2gpYXW5JfkBnYGYuZwFK8IJocmL8JAgEQ1aWfqzagfoWuZED7C2DkS++Ob
 IfPCTG/u1IkZJoTMz1E+wIVkcaGu2PJyCSbXV4SHAntliUeP1zWG+pupjT4BY8VDCddxJXA2sZA
 wZhalS2P+Tx+DPZ8nsFr/qnd4uieWzapRCRmDYfwkrEW1RTKchv5wk6GyksM/zwVas2BMkrZkHZ
 2a30jFN8CJjhYLtkDAICLr5IuKtjBYZr71sUEggW+ZKGiP2kiWT2V+XpctQ07QTrJa2WDC1tTL2
 anagjugp2ZglC5xKWbg==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a0325ae cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Dk9EUgma8fqr-VUMxRAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136

Add device tree bindings for the camera clock controller on
Qualcomm Glymur SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |   3 +
 include/dt-bindings/clock/qcom,glymur-camcc.h      | 122 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..93a379a4347cfc83f647e6f52d2af2713cd06514 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -8,12 +8,14 @@ title: Qualcomm Camera Clock & Reset Controller on x1e80100
 
 maintainers:
   - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+  - Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and power
   domains on x1e80100.
 
   See also:
+    include/dt-bindings/clock/qcom,glymur-camcc.h
     include/dt-bindings/clock/qcom,x1e80100-camcc.h
 
 allOf:
@@ -22,6 +24,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,glymur-camcc
       - qcom,x1e80100-camcc
 
   reg:
diff --git a/include/dt-bindings/clock/qcom,glymur-camcc.h b/include/dt-bindings/clock/qcom,glymur-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..0c93fc77ef268b5971e671c57ea5cfca3d630471
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-camcc.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_GLYMUR_H
+
+/* CAM_CC clocks */
+#define CAM_CC_BPS_AHB_CLK					0
+#define CAM_CC_BPS_CLK						1
+#define CAM_CC_BPS_CLK_SRC					2
+#define CAM_CC_BPS_FAST_AHB_CLK					3
+#define CAM_CC_CAMNOC_AXI_NRT_CLK				4
+#define CAM_CC_CAMNOC_AXI_RT_CLK				5
+#define CAM_CC_CAMNOC_AXI_RT_CLK_SRC				6
+#define CAM_CC_CAMNOC_DCD_XO_CLK				7
+#define CAM_CC_CAMNOC_XO_CLK					8
+#define CAM_CC_CCI_0_CLK					9
+#define CAM_CC_CCI_0_CLK_SRC					10
+#define CAM_CC_CCI_1_CLK					11
+#define CAM_CC_CCI_1_CLK_SRC					12
+#define CAM_CC_CORE_AHB_CLK					13
+#define CAM_CC_CPAS_AHB_CLK					14
+#define CAM_CC_CPAS_BPS_CLK					15
+#define CAM_CC_CPAS_FAST_AHB_CLK				16
+#define CAM_CC_CPAS_IFE_0_CLK					17
+#define CAM_CC_CPAS_IFE_1_CLK					18
+#define CAM_CC_CPAS_IFE_LITE_CLK				19
+#define CAM_CC_CPAS_IPE_NPS_CLK					20
+#define CAM_CC_CPHY_RX_CLK_SRC					21
+#define CAM_CC_CSI0PHYTIMER_CLK					22
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				23
+#define CAM_CC_CSI1PHYTIMER_CLK					24
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				25
+#define CAM_CC_CSI4PHYTIMER_CLK					26
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				27
+#define CAM_CC_CSID_CLK						28
+#define CAM_CC_CSID_CLK_SRC					29
+#define CAM_CC_CSID_CSIPHY_RX_CLK				30
+#define CAM_CC_CSIPHY0_CLK					31
+#define CAM_CC_CSIPHY1_CLK					32
+#define CAM_CC_CSIPHY4_CLK					33
+#define CAM_CC_FAST_AHB_CLK_SRC					34
+#define CAM_CC_GDSC_CLK						35
+#define CAM_CC_ICP_AHB_CLK					36
+#define CAM_CC_ICP_CLK						37
+#define CAM_CC_ICP_CLK_SRC					38
+#define CAM_CC_IFE_0_CLK					39
+#define CAM_CC_IFE_0_CLK_SRC					40
+#define CAM_CC_IFE_0_DSP_CLK					41
+#define CAM_CC_IFE_0_FAST_AHB_CLK				42
+#define CAM_CC_IFE_1_CLK					43
+#define CAM_CC_IFE_1_CLK_SRC					44
+#define CAM_CC_IFE_1_DSP_CLK					45
+#define CAM_CC_IFE_1_FAST_AHB_CLK				46
+#define CAM_CC_IFE_LITE_AHB_CLK					47
+#define CAM_CC_IFE_LITE_CLK					48
+#define CAM_CC_IFE_LITE_CLK_SRC					49
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				50
+#define CAM_CC_IFE_LITE_CSID_CLK				51
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				52
+#define CAM_CC_IPE_NPS_AHB_CLK					53
+#define CAM_CC_IPE_NPS_CLK					54
+#define CAM_CC_IPE_NPS_CLK_SRC					55
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				56
+#define CAM_CC_IPE_PPS_CLK					57
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				58
+#define CAM_CC_JPEG_CLK						59
+#define CAM_CC_JPEG_CLK_SRC					60
+#define CAM_CC_MCLK0_CLK					61
+#define CAM_CC_MCLK0_CLK_SRC					62
+#define CAM_CC_MCLK1_CLK					63
+#define CAM_CC_MCLK1_CLK_SRC					64
+#define CAM_CC_MCLK2_CLK					65
+#define CAM_CC_MCLK2_CLK_SRC					66
+#define CAM_CC_MCLK3_CLK					67
+#define CAM_CC_MCLK3_CLK_SRC					68
+#define CAM_CC_MCLK4_CLK					69
+#define CAM_CC_MCLK4_CLK_SRC					70
+#define CAM_CC_MCLK5_CLK					71
+#define CAM_CC_MCLK5_CLK_SRC					72
+#define CAM_CC_MCLK6_CLK					73
+#define CAM_CC_MCLK6_CLK_SRC					74
+#define CAM_CC_MCLK7_CLK					75
+#define CAM_CC_MCLK7_CLK_SRC					76
+#define CAM_CC_PLL0						77
+#define CAM_CC_PLL0_OUT_EVEN					78
+#define CAM_CC_PLL0_OUT_ODD					79
+#define CAM_CC_PLL1						80
+#define CAM_CC_PLL1_OUT_EVEN					81
+#define CAM_CC_PLL2						82
+#define CAM_CC_PLL3						83
+#define CAM_CC_PLL3_OUT_EVEN					84
+#define CAM_CC_PLL4						85
+#define CAM_CC_PLL4_OUT_EVEN					86
+#define CAM_CC_PLL5						87
+#define CAM_CC_PLL5_OUT_EVEN					88
+#define CAM_CC_QDSS_DEBUG_CLK					89
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				90
+#define CAM_CC_QDSS_DEBUG_XO_CLK				91
+#define CAM_CC_SLEEP_CLK					92
+#define CAM_CC_SLEEP_CLK_SRC					93
+#define CAM_CC_SLOW_AHB_CLK_SRC					94
+#define CAM_CC_XO_CLK_SRC					95
+
+/* CAM_CC power domains */
+#define CAM_CC_BPS_GDSC						0
+#define CAM_CC_IFE_0_GDSC					1
+#define CAM_CC_IFE_1_GDSC					2
+#define CAM_CC_IPE_0_GDSC					3
+#define CAM_CC_TITAN_TOP_GDSC					4
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IFE_0_BCR					2
+#define CAM_CC_IFE_1_BCR					3
+#define CAM_CC_IPE_0_BCR					4
+#define CAM_CC_QDSS_DEBUG_BCR					5
+
+#endif

-- 
2.34.1

