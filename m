Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8C743C7C5
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 18:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448050; cv=none; b=KT15qfhfVln9/gsmX70zh0Ucm+CcgDmL460tRgbc9E6NxPmDD/YC/6SHtSIyNoOrKI2itClmwxEcAxv8EN0O8mHta/7mTK2BHAaNwmN+4s4jSAGc3gfeu+hvwbJDy9lKoi3PblpxxtbGd3sQNcZoc1HkWIMYMTho1HkF1qAl1Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448050; c=relaxed/simple;
	bh=ZVo2+PYmKzH58zl1Mu0LYWtv2AZPMxLsH9FtdHkNoRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmmLhfKzZ2GU0Liq4ECpvkZEVgA/Fm2bnG+np+qA8NNffZ8kbjU2y33IShendFipt1Xcp5fJ0F62gwmvtNkE/WwhiBq0L6RwdYD4hW4AsSPkFj9H+xXMG2bfVP/5LW3vYvQXPIGRfATGC6LRujPBw3wq614RPgKAq+/Gw1JBnYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZbuoeO6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNpkMo6K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZbuoeO6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNpkMo6K"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667GxYuc187935
	for <linux-clk@vger.kernel.org>; Tue, 7 Jul 2026 18:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTtAXNPOzx0l73ZyAiH4LCOhEpBudaRMo+eDCe0KHEE=; b=WZbuoeO6zcCoVD4u
	Bm3sYReqpYHHkT/nrAs/CrVeCMhadZOQuRmmBlU6y9DdduDzMbBeBo4YMgpzffV4
	6BZXcK2No+4mhk9qLM2mvFrUy7ji7kX2AZFM+awFjimeYFF24aPFbh10LYtuJR04
	mrgq1UDZF6IaE1FV6Thal0pKtRMv0SE9G9/lTVRhSjLa9M19/LIjcp1MEWQjcCt0
	l1eS03gewHz5Pv44oDRAAIu0D5Ne+8Jha3tXZ4+C360kiHr3eXPNBXrxo6QE5FFE
	crPUaZou2eBP/mcOAJNs7yhToqHdCUaw8GsZ8pADNYzfYKWz3YC+7dUpD61BxQDQ
	ppbJ4A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd0btw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 18:14:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso194583a91.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 11:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783448047; x=1784052847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTtAXNPOzx0l73ZyAiH4LCOhEpBudaRMo+eDCe0KHEE=;
        b=KNpkMo6Kaw8wHWJTQvXr221KJ69tbW9ZKtNyTwCvmLuORsSsXG4/V+6Qldm5vDjQaQ
         XjV0oD+7jUHHSQdTfQmby2GWzM9COdgbWtuliyKYP+l4mwJgyJWDrb2O/WoEO30iw5Vu
         EAmgCQmitTDURPAF2IUbZbqZihiegWLqhOW2oGgXGk/27sp4jHdo82pNpD6uDw6DasF1
         G/emDjSrXa6lPlXdjXBr+NvqAQlLvCE8bGCFCuI3fC7BOA7IJ0vnBgf0qKeR71iNzMZo
         r9RkICAIrMj+YvhJqkMO1dS21AP001gXvVRJtOR5mVOKBAdejHSBhA5HXPLPxDVANpLv
         +PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448047; x=1784052847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTtAXNPOzx0l73ZyAiH4LCOhEpBudaRMo+eDCe0KHEE=;
        b=fdNUGZQDJUkvCabfmTXWkEz6lK0WmSEvmba8c1nrNk5zxObig+Fsk5e69oRC4FkH54
         HE5zylLTl+K6aWAbqTjlmiYD6SIbsqvOIsNIGfXMupwuXXYCqfkqdksOs9uLuc0Zt34s
         F0OmI/rG0DvmcjMVUn4AVrP2a1RQwHR0wWt3DH8sL45JvWfuN8fxYRAvuK47ejs/mJ3+
         JJI+BQekbmAYt6/vR3/0ITj4mcljaz7lp5C/U87O3hD5S9EU2mcSejgwC2XdqftNh/IS
         1u1tkZD9/JDmna753LW23qRoYvaqdMzsmUx3OtiFvQMyFbY65mLTTOwwIUu1HAxVyac0
         OBiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgTNxEWJs46UdnERRZpQ3wUpyA/1NG/Kdfsji1ovu5uq6t/UxxTlc4U4vU1K0Yn8L+tweTXsREv7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbin/8xVm5QDmaa4/trhFvnVYaSvH8fQtuR8gFX+ibqEsA6gpA
	Rux0ekzHUzVeJNoKUjJLCfKiJNXwEv1HuiuMWSnmObiSeoWQAhA4BK9UA7Cplqa6Dbek+UVsoiL
	ws1mz0EUwuISugxaHAWKDwwwtW+m4s9dz9gkKWQbc3bcWZgiNOI2z0YTKvxMxY8A=
X-Gm-Gg: AfdE7cnLh3+SfBqT+aivaVjBi5i7k/rB/I+sfk+gafRgTAHwf+1dauxSZKVGzNaxYqF
	uXJ7mBuOSjj/hV42Q0pKIHn2+LBlHh/Cl/cnz7AESo27IHW+bQr9cNX8CEOV6Wium3QZ3IuDs3Q
	A0dgYuO1FR8Alm1GADROKC0WtVSzEzikRo5E5VZiK9xo4SQpqZV+GNKGAfw+Z7o/WjdnXq1vU1w
	QtWsTewOptuQXtIFtdyHTlDJM7hYbqfDyg0DmSWZffd0uyAlTQ/t7ZBhw2QefqTCO0/Psmv7Z+A
	xhkStK4Pg8x+6bjax6pskrbnnDykiDxt8XyRXA6CDtwWclMBoaQ4V4ZqcswsZ3CH5JlpbaxkaEE
	JJLzSkI48StURZ+OrpfIBmuhALrEa+ll+wfb8vBFFWg==
X-Received: by 2002:a17:90b:270b:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-387572b45fbmr5907572a91.18.1783448047053;
        Tue, 07 Jul 2026 11:14:07 -0700 (PDT)
X-Received: by 2002:a17:90b:270b:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-387572b45fbmr5907535a91.18.1783448046531;
        Tue, 07 Jul 2026 11:14:06 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm15731521eec.29.2026.07.07.11.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:14:06 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 23:43:10 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-maili_videocc-v1-1-ef0828c0bf6e@oss.qualcomm.com>
References: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
In-Reply-To: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfXxuyoGE+xeJO1
 JlcJY8cWXgmeQIL7nzq025pgMEnOUyQLDRZF+rZgHA03TIfZhQCqIgLPu2UNlLVILgi4ms3HlUj
 xrREw5CJHFENWssp/LnuQfPNvrKDmbTlsNaQw901fX4Tcjt95eHWTLPVCgTN8Pvakh5mNEmPU+9
 Oflf+EAEPsUwsgi8Rhw4WMtAt5FE/G5qoKI7Yfh3VyUoiBSs9KEi+SOo4IWcmxb0HWvZrpPzM3C
 WwzM+HDjc/rdto0HQ5R8Vivud+qMgO6o+mf5cP01izsZoF1+9JHYlQDE6pzc8vVnZ8Ukg/9irD6
 0N/IxWdBuci+Kb0o82rOnHavwyuykhVv88OUJRmh7zVE2A0mqGg2JXvv7bwMuaBuC7M5MQrUhik
 H2ius0O5xRa78FeDRYFU8XGjUrCuAAi6NkQS1wGTUZ40CzguPqyi2puH3bpgnDHgk9P3qsm5Jju
 bY2zVMfQHnN7jnzwSJA==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4d41f0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_g2Ecp_Vah_XpkdnnNEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 89NuXPTfkcCzqI1-K0995lJoEtnWqyqD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX3q+yihECYqwC
 Rj5Wvo6zWsKYc6vJzY/in7B7VyvrOfiI3TRCaP0xZgkIy0X/wDCspBBEl5IDaxfhFBFpWpSqDKQ
 JezviWCgSgf+r3DLkFaxueSlMlN5X8k=
X-Proofpoint-GUID: 89NuXPTfkcCzqI1-K0995lJoEtnWqyqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070179

Add device tree bindings for the video clock controller on Qualcomm
Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,maili-videocc.h     | 49 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index a6fd1992d6d2f9c05751de2dbf2b53fb96de2958..6281e5ec8036b99ca21740c7f679f4b55edbb87c 100644
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
@@ -72,6 +74,7 @@ allOf:
               - qcom,glymur-videocc
               - qcom,hawi-videocc
               - qcom,kaanapali-videocc
+              - qcom,maili-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
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

