Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739230D40A
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 04:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174895; cv=none; b=m+8Ljn23iJIKNxM6E678IujbU28Dze6HuWyE2kxRO1Fli4Inocz1gmqVadJKrUMeTpvggKG2C/dmYeje7ZuF3k02kfvFno7cbc9/WRuCR+sC7AnhbqyrLQjS8Vu7T48z8M63C5rXERckm0uiXSfknLO96uBo8hudR3gttRSjELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174895; c=relaxed/simple;
	bh=+pmmTLiXO5A66kPSR7UeCsqzMfxV/n2mPqjwEH6MHBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iflT6lGWxAVeL9CuLTIUppU7LOtUG0QF4db+ny/71B7rwAj3a7ljP+pTL/rcQW8gsSEpVCD9VLL+2OB6TISr4D4BNh2bCUHDvip8wvwCb8rwUwRJl0YubI0lG95Vz5jowW+zS+Fw4ixvuLFXgJIYbUjwOt1JJ1lrCm4D4IjGmh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQsSGgd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGZ5Ytgh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQsSGgd8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGZ5Ytgh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wNp21299391
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 04:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0OQcXH2gW0lUun2K3nUAVTX+Nh3eUWT3dg5jaBRZ7Q=; b=KQsSGgd89VWkG6Po
	1a0AD0yE2KkM3AcTJfj1yWUb44On1Oxg7UwZTmjO3Tu/4/lX8Nqq72hoIPdFALMR
	RW7jC9JKjBJ3+FK+itDWH5e6krPZIgDsrJYcwGjUoJiynESc6djqjOeixZ8NNp3j
	XgfjdFdlg2UfVbcneF8YCK4uAutDM1kYoa4MnfoKdf09oABcubSRed9PppiLjHQj
	ip1DcMGU4RpvvOdWyiXLZA1T9UUCGjk6x1vGdcDNWjwhL83lvQCS9B8KGh9eQg6t
	8SzOYOAyS9Z3ihaYH0ncWTW0Q/8ywu+SClqyALeR5w9vzvKwBdYGa2GRUOCh+RWD
	6X6BbA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed062g5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 04:08:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc101287aso7058364a91.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 21:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784174893; x=1784779693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0OQcXH2gW0lUun2K3nUAVTX+Nh3eUWT3dg5jaBRZ7Q=;
        b=ZGZ5YtghDlbibZv/x75SgVWfsZad97A/9ygv4d/eiJkPQo2Dh85BKFakyLjpTp5I2m
         +MW19BnLyXp2KNqwU05ysrPK8+XmVgasIj5xc6gnaKIO4FdEDvUqTi3BqCAv1j+5WnqH
         jNnKaLw+0sbIvyG4dMj87TEIA4qlHN79bJjmJNOTUgVuO+8aotKUJ6ZCLBJ2KNbsngKV
         h9lsXaoF0n2uxyBaERBsXROjwmJO4NwdaqywdiScx1CBsnMngMt3zLHKwyJtp06r7xNq
         HS3BAuSZ9SVs61ze9cYOng0KKE8fBWev5ilW+knkugaOYhFTsEFfRhArEGkGlMFKHrCA
         Cl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784174893; x=1784779693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0OQcXH2gW0lUun2K3nUAVTX+Nh3eUWT3dg5jaBRZ7Q=;
        b=fII2ZGDxr23qxK5J1X2zHfLfHg1dwlOiw43AHYALFnzBvwrun7mWYpmRX4ntnpuVZX
         haG7XE0j0MtkExLSjwngfjAHg+8dByqT/PG+qT1unXncu+mDDO7mH+XnCAiWi6C52NYV
         IfHnRgjPu/ixi9h7XAxUhvIHugaLvhELAtFTvcVPs4PPAPJ1zGiJh/ZO4J604OxltROl
         4vdnCrrMWKaYdhblTzzMovjJkjwRkubyhO4Ed7Ljf7Rqiw/ioT0Tzo3bSE3btxASogFo
         UKbUmX0HbZ74MM/tRx4M9LumBbo9vS8pov8XEGjNWDBCN+KOWW6d5LMaNI4SVR9xwq7Q
         pajA==
X-Forwarded-Encrypted: i=1; AHgh+RoZtjbtMKjOpmdTokIRJ0+6FGppQMJWXuJAB+U0s/33NWlicQv3Kp96lJAdmGFHhU6RuwB3in00eX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzguqE8wTWBXVAJWtA1M1L/iZQ8DP3ZJaDHLIsjwZiqCursq/Fs
	mzVm6miwkN8ptlz1rP2q//yRrV1e4s6UG1pwVn2Zx+jO8x3sMGemHvb7KagRpjTgD8iy7lOIZFP
	miXAy5NOdkoMRXkjbWihWaifa/NtoEgbqno0HsdlkEMUH21lcUEWixtb01gUqXPk=
X-Gm-Gg: AfdE7cmWbyUzB0crycdiwKjyQMcLimg+w2HQ51LEetk6oCYt7cvZ7U4F2Fm4trYhB01
	z+PBqWNsL95BPt8zJ+sdn2AYsEQYzB93lHhRKCd80wUpwWoOKJmYY2FM7mnoFvUk9js6LyxlmZh
	6FOMgIzIbpvT2ub81wDUYQXcIuImnFHlyN5urTsf0uaHCx5Dx1Va0rEmYoPtwgVL8ad6yh4kZmg
	c9QyrwB1b2awqmAjoFzzMtpQWDHosJwDemGH/Z4Wjk6LkZ+qzZzkZo67KlpEAT3rOwcPfYCPgBD
	7hXc/rTMpHkuc9DRHim+rIy6KduClBVeE943Ak84ncZXIC3yINS/UAxPC/VERmP0gtLPL/u6L3/
	YihJP2FRiWLHEUeF8RXEvafQqjwOFLsk=
X-Received: by 2002:a17:90b:134b:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-38e17dce582mr9767458a91.19.1784174893239;
        Wed, 15 Jul 2026 21:08:13 -0700 (PDT)
X-Received: by 2002:a17:90b:134b:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-38e17dce582mr9767409a91.19.1784174892679;
        Wed, 15 Jul 2026 21:08:12 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm7623907eec.17.2026.07.15.21.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 21:08:12 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 09:37:59 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-maili_videocc-v2-1-7ed5ab140770@oss.qualcomm.com>
References: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
In-Reply-To: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX8+nGT3d9d7o+
 xX4gV8G3kMGX1WeIPono4pxhwCxDejMznY+kq0Yzc+kZ/J0B2nm1VzxTIxEGjEHbh+g13zzhAaY
 TjRq65r5jfGil4cFp7epCTDHhNX7A/c=
X-Proofpoint-GUID: jqx8pSWfXVlyShnT8Wv4pz4ycBOovDnL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX/F7lLNqjYrf8
 CynmWsB/pdNvirgEUi+Lcz3ElMC//F7kdov5iDWqJ2t2j35bDtLid/K3yfBeqx/uRkym4L/yKCf
 8i5FgwQWoMjCBY3380rmoGJT7Qrg0zdhUN6It+Q9Co2HEaokkH7rSsfKfY+IZrFwfrwPDdfYlEO
 L2NO7P0KolgSjYqpJW1g9qAOqax8uWrbg/X1kkSHhm+4+32wLLDoqn7ysPFaApoFD6DJ6SDrDW+
 ZBHQ2cvZIa9YH9qPa+lnNFtEXaqxxDbw4Mt/Z61vi32IO1ByGuJbxv7RxCqLWhvjUxVcOraouS1
 LVIwYcbmoluRv7w28qTrwqzvhMkmFdFtw+9xvv/wkQhCKn+BqtGjIAvCZTD0J/FrvdBl37Plc6N
 z5CvDJ0mvWkj2TaPnCg/4WGdCls9oKLin8mwqofPM+TgFWLJy9m2Lnp0bYuodJlqXYxdPRmkYrw
 rlUUciiW6UP/2IY2b1w==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a58592d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_g2Ecp_Vah_XpkdnnNEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: jqx8pSWfXVlyShnT8Wv4pz4ycBOovDnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160038

Add device tree bindings for the video clock controller on Qualcomm
Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  2 +
 include/dt-bindings/clock/qcom,maili-videocc.h     | 49 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 1e1fec1cd7ce96f103348baf85341e775fac690a..910c6d5672b8657f161058c4ceba98637c299b73 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -18,6 +18,7 @@ description: |
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
+    include/dt-bindings/clock/qcom,maili-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -29,6 +30,7 @@ properties:
       - qcom,glymur-videocc
       - qcom,hawi-videocc
       - qcom,kaanapali-videocc
+      - qcom,maili-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
diff --git a/include/dt-bindings/clock/qcom,maili-videocc.h b/include/dt-bindings/clock/qcom,maili-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..ae52686639db3231b8705e28667d3a65192d4de7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,maili-videocc.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MAILI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MAILI_H
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
+#define VIDEO_CC_MVS0B_CLK					8
+#define VIDEO_CC_MVS0B_CLK_SRC					9
+#define VIDEO_CC_MVS0B_FREERUN_CLK				10
+#define VIDEO_CC_MVS0C_CLK					11
+#define VIDEO_CC_MVS0C_CLK_SRC					12
+#define VIDEO_CC_MVS0C_DEBUG_CLK				13
+#define VIDEO_CC_MVS0C_FREERUN_CLK				14
+#define VIDEO_CC_MVS0C_SHIFT_CLK				15
+#define VIDEO_CC_PLL0						16
+#define VIDEO_CC_PLL1						17
+#define VIDEO_CC_PLL2						18
+#define VIDEO_CC_SLEEP_CLK					19
+#define VIDEO_CC_XO_CLK						20
+#define VIDEO_CC_XO_CLK_SRC					21
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0_VPP0_GDSC					1
+#define VIDEO_CC_MVS0C_GDSC					2
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0_CLK_ARES					2
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				3
+#define VIDEO_CC_MVS0_VPP0_BCR					4
+#define VIDEO_CC_MVS0C_BCR					5
+#define VIDEO_CC_MVS0C_CLK_ARES					6
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES                         7
+#define VIDEO_CC_XO_CLK_ARES					8
+
+#endif

-- 
2.34.1

