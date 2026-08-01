Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C90530DECE
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 14:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593668; cv=none; b=ISdqAz46+ZOpuFilidqldufB/GZQdXg6vpTd0N7q8JncNfXW/HlFAiNbh3uipCCpWs8qEsNfMwSaG0dLzpLNFErZKy2gHxXGIQk+ro6GlCuFi62nJbT9wKwyy/UtvgLB6XsVP8+cNxSxQGi5Xwj0lNen9gSAtzb2lR5Low9v2SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593668; c=relaxed/simple;
	bh=TB/Kjode0YLoqDMB8IrGx7SLQGCvzRphoTKGerThxjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GaqNFFUUyIST/dPNqTg20ecjrhzM+gRa4NLbzSTwgpyw97f/Ns3yN95gCRlM7J3kWz2zBf1SzfUfjfblza9VMyp/9X2vab9ggCNMFh6HA3zfWvjWIHr5OPNeWi0/6TV8dDSlc1AbbVJ7JQSAuWTTSEbQBwf+09WGfzCKnN4d2/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3eNsSzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDBFjAAu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3eNsSzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDBFjAAu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CaYZx2924962
	for <linux-clk@vger.kernel.org>; Sat, 1 Aug 2026 14:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sln8nJ7sApAc/Ct+mkqUSRQoOuL1+heJn+LGuT2lmnI=; b=S3eNsSzcof1Kn9Ik
	NLkXQUD01AHWIowESjY/mwx8tiyyXW1c7ZuzDY9Fngb5oj0TsJFDiEzWLt1Sn3xL
	v5OLRyRimHKQYfDQvIPTAa7M0Tra4NKLGxUjO7PotbKYu9LEQYe9Nushy0+Zcmps
	fViipQjeox2SRaGZ01fX2vRmQcqJ5W/SvI3FoFwbU8zH9GGWwoVle3EHNHPizEce
	71azKpeuzZNx9yXMZbXeIL9VR1jQ0Ku6BarwnvxzdwtTlkVLvgln5UT6EP5R1UeY
	IEcEmQ1O/tzGqpuMeJ++Rka6PyFJy94eyqx/P22gHWUN/9gglnfW12zV3guQwmjm
	OXdnZw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6h3af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 14:14:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1676275a12.0
        for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785593665; x=1786198465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sln8nJ7sApAc/Ct+mkqUSRQoOuL1+heJn+LGuT2lmnI=;
        b=QDBFjAAuSLKLzY1B0H0OjG+YZfBDAtETPL4sje/U2TUqtnhWnZfH+ffjfnHdScmET+
         9AavRXQ3fqLYSzffYObqb/R/zlAYNAurB8DkEISN4K3XSsmo0T75RVIBFl+FGxQAjtKk
         rj8dQUvyxFOWX3Iz6YGDX8vPSRyO13rqqZmgv0vATH9IzYMIz5PC1Qt6eQbyRbMC01IX
         OcUWrBH2oAxiabNHlyxDDVATv5s53V6WtOsH47is6NtvUaevoWZgvR51w2VTvXZ2Kfeq
         pNm54JZNCiBaxoRoEZr/YKhZYnpalDT8yjihxqgAZ8uF94aFXfjDaHWxXGgZkUaYN/GT
         aYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593665; x=1786198465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sln8nJ7sApAc/Ct+mkqUSRQoOuL1+heJn+LGuT2lmnI=;
        b=Fnl1E/yAhcj0/+NrFlDKZc60HE9KPJTkTf6Whci36EME+D7IWLZWI2EnjNgW574dOS
         3ApZUtepB+xslAxng71m5j8skGABrKoOiCXmL6D5eTP5vMENogfDIMp8U6p9MfWgYOYP
         318lM0dwRZ/SPERnvf6U5XZPTf2jAKPNh0/tR5U9MfppfdTMYkU1HnbjRlcoFcHWwkux
         erTBWcJ8F0XJMdGgRpMu/sWxquROQJpF9exBjEkIX2UOPV4erfpv6nvUkLTjsEAfmrNZ
         cShzoNkql3xWRu1mSqwIV/mDD8SO+joRdsUoNHO5F8fCgSVm9dN1i1RkwuKbwrp0rZr4
         /VtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaLOtXqKjqZvkGw0Ih4Yix3Rms3Wn4NvB61pthPwAIU/5x7tcnEAigbeOWpZGu2iuH3Ag1BVkMHtk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX6fg+ga9O/1et3OE5MzqD3taUirPjd8sWrXSc6Zoi9gS0DtU4
	1Wl5hVZg5c2Dy4qrAft5ogYAZb1Xbnom0CyjR8pLB2rjOKgPNKI3KeLzb0o/sC4U9+9+uc0BE8p
	5Wf+liaWgMP1HRJwv3oICjrek41Yj2Qjzs6iNiC/dFCt8koJOdjTv2Cl+rQ6X7f4=
X-Gm-Gg: AR+sD12EC7ASWX9S9EXTzcs3YRLcq9dKdSPfbywfV6lA7/xcGwYt9jiTHJjk8BBcyck
	RnA3IObwnhXRxQDwV92WtsX8OS1vl07VEDh9ILEYTcQl5rNRhY+qeBr8ZZJEJvG45dgFrs4Xw9U
	CJwi/fpmdP0d1x7xsRGNTJ8MYFot2qr19gn6YlZPt8PIpoVGa4S4wcocB5myhy90684L9dEeeZR
	wkgOpvrKqXdCZq29diJX10EHdRhlvY1T+6vZNELikhoeE1AmU5g5KErAvN2vVNDiBT9n+PmHQlw
	JeFFXOP2J6hgoY6tKG/t+sRE1RCJTOWZskdsl9SlCBHn94+ndlQpvprWAy7xzsUxnNuJi3mO49q
	ovtQo8b7j5J3P5kIM6Hu3JlTV
X-Received: by 2002:a05:6a21:e8b:b0:3a8:800:bdf4 with SMTP id adf61e73a8af0-3c91a9ce3b8mr6205910637.33.1785593664996;
        Sat, 01 Aug 2026 07:14:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:e8b:b0:3a8:800:bdf4 with SMTP id adf61e73a8af0-3c91a9ce3b8mr6205890637.33.1785593664573;
        Sat, 01 Aug 2026 07:14:24 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm13570696c88.13.2026.08.01.07.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:14:24 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 19:43:55 +0530
Subject: [PATCH v2 4/6] dt-bindings: clock: qcom: Add support for Camera
 Clock Controller for Nord
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-nord_videocc_camcc-v2-4-674d7718e41f@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfXyA+RrrBH8EkJ
 rA5N018OzyiCArG5Lm1UodeXSClP/wiV5GJbkmaA6qLBVYaej2BmEn/r0l60VBGKOiDaReoCPqw
 +8RVY5+5pSyrtjSFyzapL/+POug+Gj8=
X-Proofpoint-GUID: T_cUwRuSKd-sjvF9temF2gF2Gb5IBWtj
X-Proofpoint-ORIG-GUID: T_cUwRuSKd-sjvF9temF2gF2Gb5IBWtj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfXwt2YT6aM1YH3
 9etrEAVrroTRFNu6do9UIhUh7iDlgJjtSUuWfL2vqGJThOdga+GCQC/JAD4FM2496skvGOO6l8h
 q3lq/bf+gV7RVY/L0Mmorywv0EsXNICvdCYxUZFBu6QPNffvWm4MHqQCo3dqEJQEcVdzODOhc/L
 9PCsiVKjsl86ATngG8tkCnnHcoYSfGunl+sZqDT0PNLmagWgoT+IVr3Kxv+ohs8bKSlWOEFwwlq
 qmmv+DjLsiHPUJeKdU7ZHejx5itasni3DnjyMsGpldIU8/nabohveON0lTo/Q+zG47XwvOGDRfR
 7ia4BxS08i9HUnCjded8Z8/mTBo6Thh3/+psCSaIFxnYsqtX0VdhAmmSrTtJRCgJ0R8myPMwEbE
 m2jDLx8623CFnHa7xZOkZarsWsS+HDfrii5kFDVNhzHJHodCYjyBlJRiPfpnVHgI/D/iGAZNaE8
 xqYCLWCchyU0Va617RQ==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6dff42 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=npxppRvg8dUom-5OBigA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010114

Update the compatible and the bindings for CAMCC support on Nord
SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   2 +
 include/dt-bindings/clock/qcom,nord-camcc.h        | 167 +++++++++++++++++++++
 2 files changed, 169 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index b41247b257b193ce1a70e7100b2f88880f9d9bc5..f653807472201e731f9bea43e2c8ab781d817430 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -18,6 +18,7 @@ description: |
   See also:
     include/dt-bindings/clock/qcom,kaanapali-camcc.h
     include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
+    include/dt-bindings/clock/qcom,nord-camcc.h
     include/dt-bindings/clock/qcom,sm8450-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
     include/dt-bindings/clock/qcom,sm8650-camcc.h
@@ -29,6 +30,7 @@ properties:
     enum:
       - qcom,kaanapali-cambistmclkcc
       - qcom,kaanapali-camcc
+      - qcom,nord-camcc
       - qcom,sm8450-camcc
       - qcom,sm8475-camcc
       - qcom,sm8550-camcc
diff --git a/include/dt-bindings/clock/qcom,nord-camcc.h b/include/dt-bindings/clock/qcom,nord-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..655fef2084a580cdaabf8870a209b32b604c8af0
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-camcc.h
@@ -0,0 +1,167 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_NORD_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAMNOC_DCD_XO_CLK				0
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				1
+#define CAM_CC_CAMNOC_RT_AXI_CLK				2
+#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				3
+#define CAM_CC_CAMNOC_XO_CLK					4
+#define CAM_CC_CCI_0_CLK					5
+#define CAM_CC_CCI_0_CLK_SRC					6
+#define CAM_CC_CCI_1_CLK					7
+#define CAM_CC_CCI_1_CLK_SRC					8
+#define CAM_CC_CCI_2_CLK					9
+#define CAM_CC_CCI_2_CLK_SRC					10
+#define CAM_CC_CCI_3_CLK					11
+#define CAM_CC_CCI_3_CLK_SRC					12
+#define CAM_CC_CCI_4_CLK					13
+#define CAM_CC_CCI_4_CLK_SRC					14
+#define CAM_CC_CCU_FAST_AHB_CLK					15
+#define CAM_CC_CORE_AHB_CLK					16
+#define CAM_CC_CPHY_RX_CLK_SRC					17
+#define CAM_CC_CSI0PHYTIMER_CLK					18
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				19
+#define CAM_CC_CSI1PHYTIMER_CLK					20
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				21
+#define CAM_CC_CSI2PHYTIMER_CLK					22
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				23
+#define CAM_CC_CSI3PHYTIMER_CLK					24
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				25
+#define CAM_CC_CSI4PHYTIMER_CLK					26
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				27
+#define CAM_CC_CSID_CLK						28
+#define CAM_CC_CSID_CLK_SRC					29
+#define CAM_CC_CSID_CSIPHY_RX_CLK				30
+#define CAM_CC_CSIPHY0_CLK					31
+#define CAM_CC_CSIPHY1_CLK					32
+#define CAM_CC_CSIPHY2_CLK					33
+#define CAM_CC_CSIPHY3_CLK					34
+#define CAM_CC_CSIPHY4_CLK					35
+#define CAM_CC_FAST_AHB_CLK_SRC					36
+#define CAM_CC_GDSC_CLK						37
+#define CAM_CC_ICP_0_AHB_CLK					38
+#define CAM_CC_ICP_0_CLK					39
+#define CAM_CC_ICP_0_CLK_SRC					40
+#define CAM_CC_ICP_1_AHB_CLK					41
+#define CAM_CC_ICP_1_CLK					42
+#define CAM_CC_ICP_1_CLK_SRC					43
+#define CAM_CC_IFE_0_MAIN_CLK					44
+#define CAM_CC_IFE_0_MAIN_CLK_SRC				45
+#define CAM_CC_IFE_0_MAIN_FAST_AHB_CLK				46
+#define CAM_CC_IFE_0_PCP_CLK					47
+#define CAM_CC_IFE_0_PCP_FAST_AHB_CLK				48
+#define CAM_CC_IFE_0_SCALAR_CLK					49
+#define CAM_CC_IFE_0_SCALAR_FAST_AHB_CLK			50
+#define CAM_CC_IFE_0_TMC_CLK					51
+#define CAM_CC_IFE_0_TMC_FAST_AHB_CLK				52
+#define CAM_CC_IFE_1_MAIN_CLK					53
+#define CAM_CC_IFE_1_MAIN_CLK_SRC				54
+#define CAM_CC_IFE_1_MAIN_FAST_AHB_CLK				55
+#define CAM_CC_IFE_1_PCP_CLK					56
+#define CAM_CC_IFE_1_PCP_FAST_AHB_CLK				57
+#define CAM_CC_IFE_1_SCALAR_CLK					58
+#define CAM_CC_IFE_1_SCALAR_FAST_AHB_CLK			59
+#define CAM_CC_IFE_1_TMC_CLK					60
+#define CAM_CC_IFE_1_TMC_FAST_AHB_CLK				61
+#define CAM_CC_IFE_2_MAIN_CLK					62
+#define CAM_CC_IFE_2_MAIN_CLK_SRC				63
+#define CAM_CC_IFE_2_MAIN_FAST_AHB_CLK				64
+#define CAM_CC_IFE_2_PCP_CLK					65
+#define CAM_CC_IFE_2_PCP_FAST_AHB_CLK				66
+#define CAM_CC_IFE_2_SCALAR_CLK					67
+#define CAM_CC_IFE_2_SCALAR_FAST_AHB_CLK			68
+#define CAM_CC_IFE_2_TMC_CLK					69
+#define CAM_CC_IFE_2_TMC_FAST_AHB_CLK				70
+#define CAM_CC_IFE_LITE_AHB_CLK					71
+#define CAM_CC_IFE_LITE_CLK					72
+#define CAM_CC_IFE_LITE_CLK_SRC					73
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				74
+#define CAM_CC_IFE_LITE_CSID_CLK				75
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				76
+#define CAM_CC_IPE_0_AHB_CLK					77
+#define CAM_CC_IPE_0_CLK					78
+#define CAM_CC_IPE_0_CLK_SRC					79
+#define CAM_CC_IPE_0_FAST_AHB_CLK				80
+#define CAM_CC_IPE_1_AHB_CLK					81
+#define CAM_CC_IPE_1_CLK					82
+#define CAM_CC_IPE_1_CLK_SRC					83
+#define CAM_CC_IPE_1_FAST_AHB_CLK				84
+#define CAM_CC_PLL0						85
+#define CAM_CC_PLL0_OUT_EVEN					86
+#define CAM_CC_PLL0_OUT_ODD					87
+#define CAM_CC_PLL2						88
+#define CAM_CC_PLL2_OUT_EVEN					89
+#define CAM_CC_PLL3						90
+#define CAM_CC_PLL3_OUT_EVEN					91
+#define CAM_CC_PLL4						92
+#define CAM_CC_PLL4_OUT_EVEN					93
+#define CAM_CC_PLL5						94
+#define CAM_CC_PLL5_OUT_EVEN					95
+#define CAM_CC_PLL6						96
+#define CAM_CC_PLL6_OUT_EVEN					97
+#define CAM_CC_QDSS_DEBUG_CLK					98
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				99
+#define CAM_CC_QDSS_DEBUG_XO_CLK				100
+#define CAM_CC_QUP_AHBM_CLK					101
+#define CAM_CC_QUP_AHBM_CLK_SRC					102
+#define CAM_CC_QUP_CORE_2X_CLK					103
+#define CAM_CC_QUP_CORE_2X_CLK_SRC				104
+#define CAM_CC_QUP_CORE_2X_DIV_CLK_SRC				105
+#define CAM_CC_QUP_CORE_CLK					106
+#define CAM_CC_QUP_SE_CLK					107
+#define CAM_CC_QUP_SE_CLK_SRC					108
+#define CAM_CC_QUP_SLEEP_CLK					109
+#define CAM_CC_SFE_LITE_0_CLK					110
+#define CAM_CC_SFE_LITE_0_FAST_AHB_CLK				111
+#define CAM_CC_SFE_LITE_1_CLK					112
+#define CAM_CC_SFE_LITE_1_FAST_AHB_CLK				113
+#define CAM_CC_SFE_LITE_2_CLK					114
+#define CAM_CC_SFE_LITE_2_FAST_AHB_CLK				115
+#define CAM_CC_SLEEP_CLK					116
+#define CAM_CC_SLEEP_CLK_SRC					117
+#define CAM_CC_SLOW_AHB_CLK_SRC					118
+#define CAM_CC_SM_OBS_CLK					119
+#define CAM_CC_TOP_AHB_CLK					120
+#define CAM_CC_TOP_FAST_AHB_CLK					121
+#define CAM_CC_TOP_IFE_0_CLK					122
+#define CAM_CC_TOP_IFE_1_CLK					123
+#define CAM_CC_TOP_IFE_2_CLK					124
+#define CAM_CC_TOP_IFE_LITE_CLK					125
+#define CAM_CC_TOP_IPE_0_CLK					126
+#define CAM_CC_TOP_IPE_1_CLK					127
+#define CAM_CC_TOP_QUP_AHBM_CLK					128
+#define CAM_CC_TOP_SFE_LITE_0_CLK				129
+#define CAM_CC_TOP_SFE_LITE_1_CLK				130
+#define CAM_CC_TOP_SFE_LITE_2_CLK				131
+#define CAM_CC_TPG_CSIPHY_RX_CLK				132
+#define CAM_CC_XO_CLK_SRC					133
+
+/* CAM_CC power domains */
+#define CAM_CC_IFE_0_GDSC					0
+#define CAM_CC_IFE_1_GDSC					1
+#define CAM_CC_IFE_2_GDSC					2
+#define CAM_CC_IPE_0_GDSC					3
+#define CAM_CC_IPE_1_GDSC					4
+#define CAM_CC_TITAN_TOP_GDSC					5
+
+/* CAM_CC resets */
+#define CAM_CC_CCU_BCR						0
+#define CAM_CC_ICP_0_BCR					1
+#define CAM_CC_ICP_1_BCR					2
+#define CAM_CC_IFE_0_BCR					3
+#define CAM_CC_IFE_1_BCR					4
+#define CAM_CC_IFE_2_BCR					5
+#define CAM_CC_IPE_0_BCR					6
+#define CAM_CC_IPE_1_BCR					7
+#define CAM_CC_QDSS_DEBUG_BCR					8
+#define CAM_CC_SFE_LITE_0_BCR					9
+#define CAM_CC_SFE_LITE_1_BCR					10
+#define CAM_CC_SFE_LITE_2_BCR					11
+
+#endif

-- 
2.34.1

