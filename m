Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06FC326D65
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 09:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779045; cv=none; b=KDhoyGIrNyexFxPewtfw5jbxSMwS3vxD7JyOjRUdOo47FmvMTwrUQfKFn9qTmdzMxVE8t+rI+4cHQ8CYpwxHyd4J6WVeHvLcvLHXgTrqMgCoDSYTZDSbUitGfzLRiSFwMu7ZNfX/KYcFmbtrySLUMpj1AFTr52UHsUgDylCDf20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779045; c=relaxed/simple;
	bh=Qpe4XE+oFu96iyGhRGB2R19aD+NSvO8gRu2cZLM6XWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zcg30WrcyTlep0iO9wRsN9i0c5mAUKwESsfJPHXsRkUcmqnvpYN+J/FBOlZNoyw/YdNJqBjuSZ9drAvF5l8iFcTGAeFxWNqVbYkoxdebmRdqBC/6x7XJuDlIhL4axwysk4FWPcqya8+bEtD8ts6NWw8t/CFA6LJ3OWcbzpiijgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aF3TKZEJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZfB3UAs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aF3TKZEJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZfB3UAs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tHSo2378917
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 09:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=; b=aF3TKZEJ6v73HHqG
	d05iyFZX60Wm1hxG0Ew1f9lRKKvuVtYpiKraE2mOV5U2l+3eIfiWGrzYbxIgfkNI
	W+0l+kMZjwrEAWwcNZqESmUpbq1DBfN27Mt/hYqpHT3Mt6lyVs1puP7eC4ADj11G
	+Dr4cheiY6IC8DmmT24D+W/db3kwlM4m92stsDFJqK4T8to+aOZneIhTBYa/mChm
	Nyzp1oAuMo9Wgl8FtpjEuUZG0/5Q4bkawVX2PXEq0M+AUfeovPimd1z24BTygkY+
	wZV6bFpkrgY4Tsudt0wtnDeXSwAi4WHYDEtqJXjQ9YDCcvKMhrXqyVQslNEZEnGr
	tgtkYg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4rhs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 09:44:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a31087af17so42457075ad.1
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 01:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779042; x=1768383842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=;
        b=KZfB3UAs+YEKkgTVQFnxIUbyv0X5pI1kdXRSbgwWndXqvqFs+CfYP3jNg19zJLT8U+
         XuWZ1eYuy/+NJrfHYKqMLHRhfjhM2IIKOAqqZNHlI2XoF2mD26mzcY7s5epb37pI+49l
         GFq7/IOSd9rwrnqlsHzB4AiqbmIPNu/e33m6/U1J6TaHYHpLIpabgPvQ4cPfrUSEeG50
         5iUm4ANZc5zoqCSzWhFFMSjl+Tu69HspwMOB68BgIp+Kdz9r96NvkEtPTkTrwSLfaHSZ
         gGXxtcxHJPChUOzoG3+3PlKE12dRTFTGjAOcOo1qjKj6Lt94oTJDlxG4UQuTKSCZX4NH
         md0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779042; x=1768383842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fffkGVCzEeTlGXV+NA8q2hgDOX5MJ1TUXnLYVSq/nF8=;
        b=V/2EF7krfKknbPoWUwPwPCSt4ZBEFQRwPX2XBvTzN184x+OwMcctYmjoukAw5M24Id
         3OR5XckB+8G+fqIOmulzb8BMFoYqZ3f2I2MEDjVO8faXWUO1d7keAp/2XCwr8w9V8uWV
         yil8C/Lc9FgRLk5Z+Hiwyo+Zmqm6/9FKMyRA7PJ2Vxccsq3su/490cijKA9axmFeAcsS
         1tzDlOKyRxWekVo4yb/xCd3eSTpUm8WKg5E/GlI5czJPElfokifPTYPIiQZoT9F8BFjR
         yGOfifpoNoHCpYMFkxlty2BgkRKXwXRkSrJ38IyydNb20xW2Dbyw3sGvx2oTNVP2D0SV
         jQqA==
X-Forwarded-Encrypted: i=1; AJvYcCU/8i70UUpuUxWFjVj+u15EN4OGVUjZ6e1EsdYK1AKdeMne1T3ADkMJ43zoiG/kK2YoCgJrLsDgP0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZmGyGjw6apj2EbIVwtjR1tK538yOQ49E5Y/UmNk8XxbmWEJ8F
	jEmPYEPlNkrKN3DMHBU3KcyLmzL2d+FAFKcD59uNUP94BuljjtokN3WBcnBVXVroNihG6tagvp2
	RQqWSlQzThT8Uu09tYLW4e7zM2UW89weozAJxdL60Yd5NYTfBfbhR5kKFyaLYAyc=
X-Gm-Gg: AY/fxX7ZPyVjA/LoWX8vtQYwFFMtuUKhfywWROnMJDfkgjmKxkZsQspfKcrH2l8xl4E
	geB75ky9D+0AY1mlD9AG3ABR+g67G/Odqgtt41C2t3ry5rx7kHifL7CPIUxq+VEEaSIXcmFfpIl
	+5Kq6opoRvgCHOHacW7KT0MN6bD/UpCfS1+x+xBBNU3MFafVq2A4GCGBjgN8e31MSzM02eySM0g
	Q0e51f4GyS2yfeOXqml7f23AowB8bW1spa88mcU2e42uw+9yvT9j6QSg3f0PuzfxDWTA8muLTvU
	uMlB/yHotXpDo38f/wrTdqFsggAow8bfEO9YR/FFRqq1JDTL6gzIPVFdbqPpJUPeJ5Az/231FEQ
	wVEoY3m9wYLAZRz/PTyjZHt+/lRm3goetsg==
X-Received: by 2002:a05:6a20:2588:b0:244:d3d0:962a with SMTP id adf61e73a8af0-3898f91d2e5mr1676324637.22.1767779042368;
        Wed, 07 Jan 2026 01:44:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIH4Z2Oahxy0UxkXkDyW/3P3Ci/gp4BIgoLAtCTUiDQ8zlt5KFUGw+C/ySvBhCDKkSEmp+cw==
X-Received: by 2002:a05:6a20:2588:b0:244:d3d0:962a with SMTP id adf61e73a8af0-3898f91d2e5mr1676298637.22.1767779041824;
        Wed, 07 Jan 2026 01:44:01 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:44:01 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:09 +0530
Subject: [PATCH v3 06/11] dt-bindings: clock: qcom: Add Kaanapali video
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-6-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e2ae3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=_xnZC5tmkvlqoiR1VIgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX2vov9T/aCeKo
 3kcUHC6P9eRHKU/R31zaPlbNmqLvKxOyH4VdhRoeEsHS3KPWKftftT0FJ9TifZEEGEKAR4YyLgS
 hahWatFtvnQQLExTzmWbzTLr5qV02xhXNEykSBIgtn1S9qCDMkl+pUrG68tsOJW1FQob24ftyWa
 JeQoZtxpi3WHXdlAgZWs2VtrbWDcJeiVjWi4uu5N3nc29Opcx18D5bwnCHlb8mgXmDQ77+TMhfr
 /zyAMc6BNioBIGBQxxHz9EznkS+yE9QZMidL6SCZAZL6PfDiZ9kZsEDQvDCZPMzbaF9NQROYUQU
 7gOARszmyKpQJw2zu5STAwxmM9MAZXO9zRp2dFbcIi7XmlnzN/VsK19mDW2J57o14dvLiI7Z2KI
 mlodqbklr+wRNhGc+Tq5j6AoLwWEvP8Huxk0GDQSX8DWUGXoosmPswm9rpF45+9DOs5zRME7AyV
 AZA4hwCyC/myJdpsv1g==
X-Proofpoint-GUID: 6KuNZmyeh4eVYD9Q0HvlqkgghXXn-NAH
X-Proofpoint-ORIG-GUID: 6KuNZmyeh4eVYD9Q0HvlqkgghXXn-NAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070078

Add device tree bindings for the video clock controller on Qualcomm
Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,kaanapali-videocc.h | 58 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index b31bd833552937fa896f69966cfe5c79d9cfdd21..e6beebd6a36ee1ce213a816f60df8a76fa5c44d6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,kaanapali-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -22,6 +23,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
@@ -61,6 +63,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
diff --git a/include/dt-bindings/clock/qcom,kaanapali-videocc.h b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..cc0d41b895c92e1d0b84067093d2d7220c671a91
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_FREERUN_CLK				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0_VPP0_CLK					6
+#define VIDEO_CC_MVS0_VPP0_FREERUN_CLK				7
+#define VIDEO_CC_MVS0_VPP1_CLK					8
+#define VIDEO_CC_MVS0_VPP1_FREERUN_CLK				9
+#define VIDEO_CC_MVS0A_CLK					10
+#define VIDEO_CC_MVS0A_CLK_SRC					11
+#define VIDEO_CC_MVS0A_FREERUN_CLK				12
+#define VIDEO_CC_MVS0B_CLK					13
+#define VIDEO_CC_MVS0B_CLK_SRC					14
+#define VIDEO_CC_MVS0B_FREERUN_CLK				15
+#define VIDEO_CC_MVS0C_CLK					16
+#define VIDEO_CC_MVS0C_CLK_SRC					17
+#define VIDEO_CC_MVS0C_FREERUN_CLK				18
+#define VIDEO_CC_MVS0C_SHIFT_CLK				19
+#define VIDEO_CC_PLL0						20
+#define VIDEO_CC_PLL1						21
+#define VIDEO_CC_PLL2						22
+#define VIDEO_CC_PLL3						23
+#define VIDEO_CC_SLEEP_CLK					24
+#define VIDEO_CC_TS_XO_CLK					25
+#define VIDEO_CC_XO_CLK						26
+#define VIDEO_CC_XO_CLK_SRC					27
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0A_GDSC					0
+#define VIDEO_CC_MVS0_GDSC					1
+#define VIDEO_CC_MVS0_VPP1_GDSC					2
+#define VIDEO_CC_MVS0_VPP0_GDSC					3
+#define VIDEO_CC_MVS0C_GDSC					4
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0_VPP0_BCR					2
+#define VIDEO_CC_MVS0_VPP1_BCR					3
+#define VIDEO_CC_MVS0A_BCR					4
+#define VIDEO_CC_MVS0C_CLK_ARES					5
+#define VIDEO_CC_MVS0C_BCR					6
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				7
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				8
+#define VIDEO_CC_XO_CLK_ARES					9
+
+#endif

-- 
2.34.1

