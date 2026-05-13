Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1F647DD57
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686079; cv=none; b=uc/ii6kg2HTZ6SSvdyZ8fJoZDA43DCXqIQmplM07kdi/PG57SvrasVTOmb5/Aw/YNCS2Evd9S819lto7Vj+My56GoNIkRPQ/6+iojSI+EYI0gGp2sW3q80CH4XT5OYsy251+znRuwS9SfAww0BGw8ckqF48li7hJGbSXHpxLTjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686079; c=relaxed/simple;
	bh=YehWLP7vzVkdqKiWVDK5gDg00nTbj62VF3TyWakSVho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D18wsRHSdkMPyLyLbapi5rUmkMaKssPh/YdVvAOX+T4CQqHuCuzk+1vgmg8F0tonPD6P8XQWgla99eHfP2yeNmPTSU/l82+yweddgTd9NSliZwVmGO6+hjbr3sCGoiPHUNXUstiRWMNK1VeLonBGipRdKUynolgAbYrL+Pw5dJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWAJH0gG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+BeBlz+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWAJH0gG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+BeBlz+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jgNL3007391
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=; b=oWAJH0gGoeGqe/Py
	fAD/C3e8SbEle4ssf6zo+mvxdSdzpNfH7oHhbgyZY7wyk4N8fyALr9ziwv74uCVQ
	iPSCl2vxel3ZrKhW2MODSopZ5GWcUB9cKMb4UGKohtThZmPpoYbXOan8M/mPWSlE
	jhJzdU5aaaEFaYDUZk0qphJWHZEPW67VXeowqw3pqOa0VN9Xbxzfga6YtjHZBBof
	WO95rbqud1VtfkBXHcw4YOX5MlKtTnK/5qETGfRcHNCGe/D9doV0b+0m9q69t/73
	UXo5XNqazeGD8/aqTW2/zeDJXl8MGzDYAWi3L4Odf9P7P/q2So62g9kVqsS8Lvig
	NMnjIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0h9qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:27:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b99eb06178so147227135ad.2
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 08:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686076; x=1779290876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
        b=S+BeBlz+dJzBKMyCdj7NoO/YcJ4Jn2JmqaQY8tQ7MpbfI8zZNunPh5OHqVfNQ3PZX+
         GoW3/g7b1KINCActKzFdKoQpYWYtI778DAxDo7Q9EkAf0u+gZHd3qm/AvusSHG8CVCdI
         CbgghUv9GWP4rBWGaBsZnUQ4IxLVPdsWD8S775ewl/u9bF2THvm3UZyEKsJyw75cDgRo
         74dxPuWk5gyGza4IKovouK7OQbTxmNswCEZ1NTXicCBreZ0N3363YVL4lhwzwiT/C57X
         hnDCcMIIKVvjlsd+VW5G4+DOnZxvLmEbZ54PZPMoePofJ9TKWEmpdVtDoZg2oUF8NwEY
         kRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686076; x=1779290876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
        b=phxrk347S+EG37OQTThv2y08htM2QFk7GTzk25K9/sGSw5cC4/quUJxQTsi5z2d8QV
         SKnlOMmFu9GJg6MsWYZF1QyHPVCQNL4ECJ1emrbbY4pmIMnrMYBQVEdtHUx0gVLe+WG9
         2L6TZ00NeXv0nvCSxWp6cl7EPXkOD2x4rFtnPpbUtyMoTOEWO0PezSAEar5rtNmwqKfQ
         WBEK68/VrCjz5OAe2/Z6QoqOG1xbN2RG/+AH3jDHVEOuh6l35gWXCGrx8l2eBKrbYszb
         2YrdFdhFeoKMTlmC2cm2MN8i0u/rrznd2ZGns5S5DzLavKvccIlJXJgljGFZUtI43z86
         U56Q==
X-Forwarded-Encrypted: i=1; AFNElJ+RX3p7f4TZTJJc6l9eynk8nW+JtkST96n1J81msHoLTk/ZMLf/7fnBodjeyLtQfpVnwOdAi63KJY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvcF1Z/2/bPplo+tRR8UX6pi9g9dOCsACD4SylDtvYi7WoqIAb
	8ZnxGvOtGdeskerv1SbGEtS18RnH24GN9/qLUutYlJmFbiJFu+m2V3gnkSd0I4C0cpIz3YpqAnh
	O+cBVSaRMQuqIlGpQPXud4zj3lp2VcnpPjSXYVVk/7pzn61VlHhq2l+5fj0q/jFyCx6k423o=
X-Gm-Gg: Acq92OH4l22o4QVRHQ9es0RtSErwAESW3g7Toqf0YKmp9xi4dV1i7BApJXHzAakBxIs
	TTdExXCt/F1uiGQa5SrOsJuSSKMNAy2F8uid2ozeJ8En9kYbLo0tUA0551YLEC//Z9ck6RX1IJ5
	rX8mEp1c3DWGYztVttuDKjl/YQKktrfah6kfKOo8NpY9LVH2l8lzKoRTBgkehi79wv8ueMPPjXB
	O7KhzOmZ4186TMH3g/xVHNao4lokAYgSFdUZGmhWxfxVTMoaAGMb2hbqnA0OumZMT2vUGrvV03S
	vBl4RNTme/pW9S/m9N1TJ0COogjr/Q0YHWHsEBEt8lMqGrXzujvFC3qDLn6anftR78H2YVONx57
	KSaHc4Hl6zMHquhpENbcsN+NImjOxxSbXReAbOpWl/guXQA==
X-Received: by 2002:a17:902:e545:b0:2bc:7c62:187 with SMTP id d9443c01a7336-2bd276e6e53mr46132175ad.29.1778686075596;
        Wed, 13 May 2026 08:27:55 -0700 (PDT)
X-Received: by 2002:a17:902:e545:b0:2bc:7c62:187 with SMTP id d9443c01a7336-2bd276e6e53mr46131805ad.29.1778686074996;
        Wed, 13 May 2026 08:27:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:27:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:36 +0530
Subject: [PATCH v4 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v4-1-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX2clwfCaJ23lx
 M753cxoZWCA5uTn9jCrLVoeQknopM4XlWUYrWUImnw5gagYGpnQl0KD4CEOZMebyXCGt/QT/RO/
 n5T7zIgsKyqDSDQs+r+5qEHFfDTkj6lTeikpy4nkMdIgOmrMR/g42qBN6eM8KWZr3v55Zle6Hoi
 SAz6UcRYU5PWwcU1Mc1c+yVtV164xjGwvIzAnWlEfRCJGgBOakpLqjONgQn8NYe9OA44okU70UE
 x+8ZPqJcle0HwK/I0GQwSa95Y3mZI65H6b8SbauuGq9Kjdr4pCLLgr7wsavxojZA2nPnUIm2ajh
 D1PSA91LjMIgZDskeSecjDBZpg6BXFFNTFGWD1GwMorS3Ae4ndBaRufTo1b4b6d5mIbu3JJVyM3
 lHj0qSqMZxvcMxnqX3pj/MyajZuY0krveCtc7eegIEPEgIKo0BWTLn9wLwKdlc7CvexXb0Mhj4P
 YOcGVZ65imx6S135S+A==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04987c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=YkJq1ijSw-fIvXJVljYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 9maKnTeWkcovLT_iaNDWivv18x2w_dS3
X-Proofpoint-GUID: 9maKnTeWkcovLT_iaNDWivv18x2w_dS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..6e3e4424af78a93f6366378a66f2944a3bfdccee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1

