Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E99A43848F
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012502; cv=none; b=NCb747XBvpwmkibfAELEf0XtJ0rTGAGOyRCcK7SUoHUm5ICwUcfqJfzuRIa97dbwK67HHp4eLp8NPgNAtfh/ljf6bZfMK18epCAHGFehMQNa7ZI9Uy87sfy4CdKdcGddKs+5CvzjVrAi0a39SsmUswubhhGcyOD3fWk0uHQjxeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012502; c=relaxed/simple;
	bh=bAnJzL5nLMKzmc490vK/S9JEOOf+TuZ+2sbk011AeJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S02pnJ4b4g8Cqr+pIDDsXiMEfY1W8yVZvk0O1Xzp1nqaC3Fo1okLS/Sda7P95OMF8kArrfWJcbWrFQJc3/XWqocpnXTSwVygTYZ8+rs/aoRuUI+RRp5D8+G/qUPrciBzmj/SSsD0jfTH9QnfI99BHxgCfUSDjg5Ak17S0SS34Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBi6GZG9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxqJD71q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBi6GZG9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxqJD71q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769neI1865583
	for <linux-clk@vger.kernel.org>; Thu, 6 Aug 2026 10:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=; b=NBi6GZG9XRfhHagt
	zH+IApTp2VtsbO2ygg1kI827cdPE0ftcRJt1pTtQJIkuUAM/1gFez+H26SUHhkxw
	qqOftJ+hBpetUuiQ5Q7oYoz4J8xXlVOj4irY/JFMyi4OE+PRWbZX0uRMNz5rDJ5W
	javcZ9dI99/8PQzfjQYtQ0X2nFimzFsH20hGGkH2A0PDn8zosot/QMysaK62tCen
	P+Bky1PqqbqWjX3oVBBSCxDL1ZBrBKGfwRAcxMxgvU5IU7X7gPvQxsdARP596E6C
	9Go6xYlFINxfBQk5X8kLU1f9b6qDvEkBcGQkW7J8FQTxiFCUwqIYuhDOqPXJHcw8
	M71hcQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9f5bq5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 10:34:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8488ac68185so5059949b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012499; x=1786617299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=;
        b=ZxqJD71qkGwWn/mDg2DqvpyZO4+uk67+FElyPkgoaQjttndF0grvzJoQia3tejQ2C8
         5fRRFlSin1KfUGwK4z6clSpSTPwwS0aKzVGFvJNHhdqoeObJe5VYzBYltrGrEn1Cjlza
         9Up2Dec9CdJwhav49JWeUit1Wn9xP3tDvXsu33lvVKHFFvNt8CnFneAQLcFkfRZ95ngc
         4sOVgPnDUtwTyjcDcMRL9wOVWQS17TS4G0dSRkgMcIGqQO0Zik347HoYkl3gyHS4kHGd
         lO1Gm20e6TttPiQK9hZFEruS2dAxUzyNgzAVCl7eb8bKbqwSIv8zqth00z1RVf1Fm5Nu
         bQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012499; x=1786617299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=;
        b=DAOz+EQQWyAgAmfaqsJK3eKTdlUEUZQwHZYbfTs+L8h7KrwXLlpNSRoPU5sr5Qdqe1
         xuIRUSgGXLEw0WpF/GXR/uCAm2GRKYb0D6RE1DGlwDd3cFJrkZb4y7IQ1oEFWqxOZ0gk
         dug2coB8rXWzznO5Nt2ggivncGEA8co4tmGPgcdJfHF2Iffvgnf1cqhWBWx6uyk0812Y
         XL+4jojf/3iT59RoVIR8tpltos+t8f/0bAZvzNObhiBdo6Bud77h/8KhljjrmXAOAYA2
         VfthGxBbHho3dgT+htvUVJ3gtK7Qash2KWfl+QhqlxV1YCMZZ4aGB8MW0IhRvGJCm9u3
         c0lw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0LDiaSQwr6KpcmQbqWhwKhJMuuBR+iErUOAQMowMUao9sTHAzWkSkr+SeIaqiYiWaS3VYAxmpwWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFc9HluXFBzznCj+BTiJEJbLM2LZQFgBMsUXvh50An3uXxhS/Q
	M32MTAPNIEHInOsdCztXp1K/2JH8vdR4VxschahnRUom5XTMsR5941f9aqGXxnKQ0EUWLBuFiOb
	kp++U+Iy44mKw8s4BevgfK7hpsAr/sH0RN43jrTO39k74Ns/Wg/pLcd+S/92q6X0=
X-Gm-Gg: AR+sD111sm/gPnetEC1ru1XC6JTRJJM2YqLR/tRhTs14h/d6ruY4l0njnV+UFkwZzwU
	z0W8crbBujUhVdwfyoz14MifPWvPHfatrzpLTEr84P0zLHZHNVkbgXHoTLNR72jkBf4o2XQiixP
	bGEkgy8t+27yQWNl7Cp5oZu8DeuS36W5QrWDA+8q2x9Zd+XdFIOIXzH8gxlX90S0lfdp1Otnt5i
	Mts6vjlQBdgxqBLlyG38qGaTgyFpmQ6RSCXCEsE+Zi95vSOMo43Ye68HTKz+m9aMIVjMpN3FcnZ
	dR7qPNgno4iOVPlHuz1n0TPDpbQLtBqj0SxydUGJm83TYuE3A4YUq6kKjrrkxswvIgMj6qCPo7p
	DxZ7Pm5wrGVuWwSZ43q2L9f0E
X-Received: by 2002:a05:6a00:8084:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-84f2e052343mr17148338b3a.24.1786012498632;
        Thu, 06 Aug 2026 03:34:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:8084:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-84f2e052343mr17148250b3a.24.1786012498123;
        Thu, 06 Aug 2026 03:34:58 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:57 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:10 +0530
Subject: [PATCH v10 05/10] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-5-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: iLvPCLa-PDkCtdn_mPh3PXnaTtPA83q1
X-Proofpoint-ORIG-GUID: iLvPCLa-PDkCtdn_mPh3PXnaTtPA83q1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX6I4p43rZ8bWv
 Xq7LPiwMU7RsgosJluLeFLwpWegHOuIq5gJHLoIthAyUxa8k6WqgkYnSiF5TeRr4sQ44O/K66Yj
 oat8+7J9+bZy0nEj/lknXQ4l/HRghMc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXyD9RcBFP52a4
 qgox0tXO9kpO8wOYy1T2QHi0t07QaZGSG/9aFSH2lSaRGN8HLBuw88Bp3TuJTjVtb728Eul7Bs+
 UyTrcQl9vw0Kf5V1euY4X9kYNuIuUJ5tNTF0VrEUHJVCCnkfUg7CO/hcGGcbRtUX/2FR/Fvdbl5
 G6ny5DPekpjeThSlOn1EgGB901n5dZua/epDbYIKXUzmqDadmNO1jz+93OfcFIAOT7w/qVwhLUv
 19jp/i8wG8lL4cSLPWvefwyFCdrZc4LUSrw4oyV/Y1kYSnMr6VqDXc7OPIDPGHwiVs2yGkJFOPp
 EpGV8rWfTUbWyZjlHdzsr5KlB3FqbUIdemRcql4Q97InHRoTFX95U+OqFZcD8wXNv2+P8RGWlMP
 v7umpK3DCiMCfVaNfKVqsa3DmILVefGqnqF4R6XyMsm+B7xM12SbTIr+7L4sY+DwoZMmxwEBuHq
 l2tcjUmU6UHQ7/HOaWw==
X-Authority-Analysis: v=2.4 cv=d4bFDxjE c=1 sm=1 tr=0 ts=6a746353 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=005LtiolIcJ_eoEmTSIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082

Add bindings documentation for the Eliza Graphics Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 2a2d37c59442de427874dfe42849cd0ec1a8b752..7eca456211e476b86cad274a81426f52cf24d527 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -32,6 +33,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -75,6 +77,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c3d9b7827325c5b8db696d1d95b4876e17c01c83
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				12
+#define GPU_CC_HUB_AON_CLK					13
+#define GPU_CC_HUB_CLK_SRC					14
+#define GPU_CC_HUB_CX_INT_CLK					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MND1X_0_GFX3D_CLK				17
+#define GPU_CC_MND1X_1_GFX3D_CLK				18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL1						20
+#define GPU_CC_SLEEP_CLK					21
+#define GPU_CC_XO_CLK_SRC					22
+#define GPU_CC_XO_DIV_CLK_SRC					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1

