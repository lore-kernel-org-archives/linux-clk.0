Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E614A3D649C
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686096; cv=none; b=naYPh7LCJd29splC03GZUUXu52F9O/mFlHZt7FPzNyFN6abo1lQf7BXQozrIi8rx3oYzwMWuVPDYO/uP7z2wbR734u640OydQkBMrFNKiGYu465Nt1D3RCv7YokjaVgPagCtcfblVsuF6GCbo1eRvY+fSKhCEugpoSo131abCG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686096; c=relaxed/simple;
	bh=+JSg2rnxOn8kFm5iNof0KryGYmglbcQWSe9xB9sS60k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6G9pujz1kC1Q/+nzdG5lsaWZoJuvLSaoQRLL3MF6rtwjU/f+93IWWIW7/pPcijSZAVBFJK8Mip2YGFs31DGW0MTrNhh64KDVs3TQM1G9UwiCf2Ccrb+TXGmYWLlnWUntb31/7nTHObA1HHck+V0BDra0pl/uAj+yo+ohjPTDww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqghWPG4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARCyL6Kk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqghWPG4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARCyL6Kk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVTIl3430351
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2QYtGYBKMUyCVAshRnvELdLAl76aNdMU7XIr2YHbUA=; b=UqghWPG4Ib9X4jdN
	1VxE/BCeaiU9vGbnbIiuXXqCYWBOF+Mqn/gdWC5Hs7XdOwAu2HfsCnzlpDiC8mdk
	QldOufmGMVFaYNLgi8Q2MahIK4mQmrchf05xh0c+YvlancVEalBJXN6VaT8mj+X6
	ZYxvy6nnUXgVW1+GNE2/RM+M6Pr4OzxTpn7x/MnAnUnWt4DoNYU3q0sooVHnOpmG
	R1DUTwOJqt40O5SLtqE6hcONLpL5jo4kzLzu3Qo4bwl9gFKC9g/A/27Z0pVRg99e
	qZhgW+ePIcm7wKhdcvTy3a+UhRMqXqlDz8u9F72dEfrWGOpE9/8R+d7uLG9QL3ro
	gpNt7A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmch4x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 15:28:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba054e0304so59306635ad.0
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 08:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686093; x=1779290893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2QYtGYBKMUyCVAshRnvELdLAl76aNdMU7XIr2YHbUA=;
        b=ARCyL6Kkp1bz0u1CfUk+v/bVTM9q6NWLoVpqT9lsWrlBxR5WU7Vr5SaPDDLWNo+Ebj
         QoaVSJxACwtePvK/NFaE3bx2NQNkRsYqKxn5Ka2ClJMbbDPK8hrUKBqJcQS3aWye7CGn
         pjq/GPg8Ds29wQJugSikfGVo3/qW8fCApmLyRRyUf6GkXcUjKnn6GX76jqDjYl1CjHsx
         HJsxD6ahelAuGP/fW8nPQtBxBC7t2R3Y5T+XBiuS1ykHnKGpv7GnKQbwBJRprXX9ZaGp
         82pxzqZiLBkzKGPNCXeEP+tbXs6MRCduOloQyenBaVe2iZLBrBHZj4+Lsao7891k3exk
         nQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686093; x=1779290893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H2QYtGYBKMUyCVAshRnvELdLAl76aNdMU7XIr2YHbUA=;
        b=indCTPCSufaG4Kpo8SLVJ9CLW7tDDOAmI37CZoaYBNCGTnSkvqh4xAaDEu/xIy5QoO
         wUFX3IdWTmq4Cqvmip8sUoqvUxDRaHTIPsg3CuwDoFpnuZZZJp+dK7/1b3Fqm8LCRYh7
         ZKvMpOK7E5mBfk85QVYzX1PorJqHa7valVpqdS3hwYxQHJaKVgyP2OhwkKrp8dFlRpTa
         FLB7Jlqm21tn2ZmROoPtMm6sMeQ/Yw42gjhH9/4SJHZlPX2jFPBhcHQYd89DZmtDlrle
         NtiZaOe1MqNJIImz+o6bTW0X3cRWUQxRu0IlW8PKzMd0gLft45ZwKViU+hy0lODjehqw
         CoFw==
X-Forwarded-Encrypted: i=1; AFNElJ/t/xGY1jN3HSneRwYLrOaeJErREAcecbr+dusvICnA5UoSqmYurxi9NxXTN/gWE09I+Lkc9XpW0rU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTr6eg0owzD5loms0tK/9LZyBA3I9aI99v92Vb9TF681UWTzwq
	Z+NCCbNxbkGEE7fQ7e2veFvn157k0NpgBP9joUrUQf8RuRn9zBRgXagNwhgpG56DTtGLCBnkbTW
	VsWzBhfNIHWxIKNxSEqfB4mvcHCYzX7i5Dijca9KkmuDaFLvUMHKmnslo7TRHGvk=
X-Gm-Gg: Acq92OFQeoyRxJtu2Wo16qNRIoCsdOYSRaJx32z9IdVaxgxZ0McSuup0EwIBd2xOCRp
	rxgMH8N+17lq3y/mcZZksDEoEXF45pePjA3yv+Z2Tx8KGgICLQIWEFqFPbLIgcDEt/mUY+EteUg
	CypbdkreY9SLl9RX3rHnBbBMDbDAMx8oFYL6ZdH08OYYq2/fPsz1CBCGnwV3treufhrgo+4QYmK
	SSd5tqVLsLSbe1aV6y7ARBEQ6e3rAwTsU/AcKHcKXZsWfj2NPwaUaG/PuH3ctXcbJGFzcwd8ssf
	JMJu5hOz1Dd3uE5l5FLzs2TnrbSZbGVJhEKxHod6Pnx6+3Ruvli8Iv5PrFVcHg1JEPwvm5gNcJK
	pdmCSbl6lST5zCp2lSZ3hsOxsqFCjIw+4z4PAj8GaE1v7Zg==
X-Received: by 2002:a17:903:3d85:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2bcfd12930fmr51453425ad.13.1778686092471;
        Wed, 13 May 2026 08:28:12 -0700 (PDT)
X-Received: by 2002:a17:903:3d85:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2bcfd12930fmr51451415ad.13.1778686087691;
        Wed, 13 May 2026 08:28:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:28:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:38 +0530
Subject: [PATCH v4 3/7] dt-bindings: clock: qcom: Add support for CAMCC for
 Eliza
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v4-3-e61b5434e8d9@oss.qualcomm.com>
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
X-Proofpoint-GUID: QZqJzvR0T6Xe_6bEGT4NGAdFbOZ8qMTJ
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04988d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=YEWKzK2yvWZE8rxvnj4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfXw8CW58yb48oB
 B4w9fqi0uaTXwZ5q0xmmbxJUrLVh2ATYkLSqyHe7xxrIYy5Qf8y8fQjd4WHSN4NKkqyDOPGkKhT
 uQeYBRVrWcYLjCRfTBrb8GjADOk8K39Lqk8CZASIcEoQG6xmvZRxJm9ppFZJ4FCSIkb3N0lWw+u
 cZF8ApD2LA/HDfTtZ/ZfjQufp3UK2e4TBO/9sx85lpn8sG4PUTAiWvmiFmNl1hv+wU9o9yiiMxy
 6xQXmV4WwiX71iatoXg9bntMs0E4vR7Ki0jINlMrrmqL2/7z+M5ab1qzaTd8p31XZCncivwLuXl
 SQqAimx8WOfUA2N73FRLw4C81yQXUJgCIz5Yd/NaSwrYRdh0bQrfyo/8TlAIYc3osB8fOukzBO6
 4dnVEBwctnCHN4V/ZUvGIhi8H8WBtjWhNudymVEK2FjJigxKtMp9H/409SJk6BhBFYtFTCH1LCh
 1DwauPlnrMcLY6hjt2Q==
X-Proofpoint-ORIG-GUID: QZqJzvR0T6Xe_6bEGT4NGAdFbOZ8qMTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158

Eliza camera clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza camera and camera BIST clock
controller to the existing Milos camcc binding and add the
dt-bindings header for Eliza.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-camcc.yaml           |  11 +-
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |  32 +++++
 include/dt-bindings/clock/qcom,eliza-camcc.h       | 151 +++++++++++++++++++++
 3 files changed, 192 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index f63149ecf3e1b98e60dba27093737ec84b66a899..fe94dbeb80c603b64e67b3fe3289db1a81f8991a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -8,16 +8,23 @@ title: Qualcomm Camera Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-camcc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
+    include/dt-bindings/clock/qcom,eliza-camcc.h
+    include/dt-bindings/clock/qcom,milos-camcc.h
 
 properties:
   compatible:
-    const: qcom,milos-camcc
+    enum:
+      - qcom,eliza-cambistmclkcc
+      - qcom,eliza-camcc
+      - qcom,milos-camcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h b/include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..7b8b285f18d2714393885149fc97c715b3fbb042
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_ELIZA_H
+
+/* CAM_BIST_MCLK_CC clocks */
+#define CAM_BIST_MCLK_CC_MCLK0_CLK				0
+#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC				1
+#define CAM_BIST_MCLK_CC_MCLK1_CLK				2
+#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC				3
+#define CAM_BIST_MCLK_CC_MCLK2_CLK				4
+#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC				5
+#define CAM_BIST_MCLK_CC_MCLK3_CLK				6
+#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC				7
+#define CAM_BIST_MCLK_CC_MCLK4_CLK				8
+#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC				9
+#define CAM_BIST_MCLK_CC_MCLK5_CLK				10
+#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC				11
+#define CAM_BIST_MCLK_CC_MCLK6_CLK				12
+#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC				13
+#define CAM_BIST_MCLK_CC_MCLK7_CLK				14
+#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC				15
+#define CAM_BIST_MCLK_CC_PLL0					16
+#define CAM_BIST_MCLK_CC_PLL_TEST_CLK				17
+#define CAM_BIST_MCLK_CC_PLL_TEST_DIV_CLK_SRC			18
+#define CAM_BIST_MCLK_CC_SLEEP_CLK				19
+#define CAM_BIST_MCLK_CC_SLEEP_CLK_SRC				20
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,eliza-camcc.h b/include/dt-bindings/clock/qcom,eliza-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..d85ef9777d08d12ec349d57f6da5e76a305404f8
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-camcc.h
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_ELIZA_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAM_TOP_AHB_CLK					0
+#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
+#define CAM_CC_CAMNOC_DCD_XO_CLK				2
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
+#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
+#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
+#define CAM_CC_CAMNOC_NRT_OFE_ANCHOR_CLK			6
+#define CAM_CC_CAMNOC_NRT_OFE_HDR_CLK				7
+#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				8
+#define CAM_CC_CAMNOC_RT_AXI_CLK				9
+#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				10
+#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				11
+#define CAM_CC_CAMNOC_RT_TFE_0_BAYER_CLK			12
+#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				13
+#define CAM_CC_CAMNOC_RT_TFE_1_BAYER_CLK			14
+#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				15
+#define CAM_CC_CAMNOC_RT_TFE_2_BAYER_CLK			16
+#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				17
+#define CAM_CC_CAMNOC_XO_CLK					18
+#define CAM_CC_CCI_0_CLK					19
+#define CAM_CC_CCI_0_CLK_SRC					20
+#define CAM_CC_CCI_1_CLK					21
+#define CAM_CC_CCI_1_CLK_SRC					22
+#define CAM_CC_CCI_2_CLK					23
+#define CAM_CC_CCI_2_CLK_SRC					24
+#define CAM_CC_CORE_AHB_CLK					25
+#define CAM_CC_CPHY_RX_CLK_SRC					26
+#define CAM_CC_CRE_AHB_CLK					27
+#define CAM_CC_CRE_CLK						28
+#define CAM_CC_CRE_CLK_SRC					29
+#define CAM_CC_CSI0PHYTIMER_CLK					30
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				31
+#define CAM_CC_CSI1PHYTIMER_CLK					32
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				33
+#define CAM_CC_CSI2PHYTIMER_CLK					34
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				35
+#define CAM_CC_CSI3PHYTIMER_CLK					36
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				37
+#define CAM_CC_CSI4PHYTIMER_CLK					38
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				39
+#define CAM_CC_CSI5PHYTIMER_CLK					40
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC				41
+#define CAM_CC_CSID_CLK						42
+#define CAM_CC_CSID_CLK_SRC					43
+#define CAM_CC_CSID_CSIPHY_RX_CLK				44
+#define CAM_CC_CSIPHY0_CLK					45
+#define CAM_CC_CSIPHY1_CLK					46
+#define CAM_CC_CSIPHY2_CLK					47
+#define CAM_CC_CSIPHY3_CLK					48
+#define CAM_CC_CSIPHY4_CLK					49
+#define CAM_CC_CSIPHY5_CLK					50
+#define CAM_CC_DRV_AHB_CLK					51
+#define CAM_CC_DRV_XO_CLK					52
+#define CAM_CC_FAST_AHB_CLK_SRC					53
+#define CAM_CC_GDSC_CLK						54
+#define CAM_CC_ICP_0_AHB_CLK					55
+#define CAM_CC_ICP_0_CLK					56
+#define CAM_CC_ICP_0_CLK_SRC					57
+#define CAM_CC_ICP_1_AHB_CLK					58
+#define CAM_CC_ICP_1_CLK					59
+#define CAM_CC_ICP_1_CLK_SRC					60
+#define CAM_CC_IFE_LITE_AHB_CLK					61
+#define CAM_CC_IFE_LITE_CLK					62
+#define CAM_CC_IFE_LITE_CLK_SRC					63
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				64
+#define CAM_CC_IFE_LITE_CSID_CLK				65
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				66
+#define CAM_CC_IPE_NPS_AHB_CLK					67
+#define CAM_CC_IPE_NPS_CLK					68
+#define CAM_CC_IPE_NPS_CLK_SRC					69
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				70
+#define CAM_CC_IPE_PPS_CLK					71
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				72
+#define CAM_CC_JPEG_0_CLK					73
+#define CAM_CC_JPEG_1_CLK					74
+#define CAM_CC_JPEG_CLK_SRC					75
+#define CAM_CC_OFE_AHB_CLK					76
+#define CAM_CC_OFE_ANCHOR_CLK					77
+#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				78
+#define CAM_CC_OFE_CLK_SRC					79
+#define CAM_CC_OFE_HDR_CLK					80
+#define CAM_CC_OFE_HDR_FAST_AHB_CLK				81
+#define CAM_CC_OFE_MAIN_CLK					82
+#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				83
+#define CAM_CC_PLL0						84
+#define CAM_CC_PLL0_OUT_EVEN					85
+#define CAM_CC_PLL0_OUT_ODD					86
+#define CAM_CC_PLL1						87
+#define CAM_CC_PLL1_OUT_EVEN					88
+#define CAM_CC_PLL2						89
+#define CAM_CC_PLL2_OUT_EVEN					90
+#define CAM_CC_PLL3						91
+#define CAM_CC_PLL3_OUT_EVEN					92
+#define CAM_CC_PLL4						93
+#define CAM_CC_PLL4_OUT_EVEN					94
+#define CAM_CC_PLL5						95
+#define CAM_CC_PLL5_OUT_EVEN					96
+#define CAM_CC_PLL6						97
+#define CAM_CC_PLL6_OUT_EVEN					98
+#define CAM_CC_PLL6_OUT_ODD					99
+#define CAM_CC_QDSS_DEBUG_CLK					100
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				101
+#define CAM_CC_QDSS_DEBUG_XO_CLK				102
+#define CAM_CC_SLEEP_CLK					103
+#define CAM_CC_SLEEP_CLK_SRC					104
+#define CAM_CC_SLOW_AHB_CLK_SRC					105
+#define CAM_CC_TFE_0_BAYER_CLK					106
+#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				107
+#define CAM_CC_TFE_0_CLK_SRC					108
+#define CAM_CC_TFE_0_MAIN_CLK					109
+#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				110
+#define CAM_CC_TFE_1_BAYER_CLK					111
+#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				112
+#define CAM_CC_TFE_1_CLK_SRC					113
+#define CAM_CC_TFE_1_MAIN_CLK					114
+#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				115
+#define CAM_CC_TFE_2_BAYER_CLK					116
+#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				117
+#define CAM_CC_TFE_2_CLK_SRC					118
+#define CAM_CC_TFE_2_MAIN_CLK					119
+#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				120
+#define CAM_CC_XO_CLK_SRC					121
+
+/* CAM_CC power domains */
+#define CAM_CC_IPE_0_GDSC					0
+#define CAM_CC_OFE_GDSC						1
+#define CAM_CC_TFE_0_GDSC					2
+#define CAM_CC_TFE_1_GDSC					3
+#define CAM_CC_TFE_2_GDSC					4
+#define CAM_CC_TITAN_TOP_GDSC					5
+
+/* CAM_CC resets */
+#define CAM_CC_DRV_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IPE_0_BCR					2
+#define CAM_CC_OFE_BCR						3
+#define CAM_CC_QDSS_DEBUG_BCR					4
+#define CAM_CC_TFE_0_BCR					5
+#define CAM_CC_TFE_1_BCR					6
+#define CAM_CC_TFE_2_BCR					7
+
+#endif

-- 
2.34.1

