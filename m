Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4C3AEF5A
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726504; cv=none; b=n68kWC2l5BbheUP72vHd4/lcr44GpDwYiIrS+n+/dgD7CGr6EbOJnBHN/jMiZf5IEajBE+mOiOi9i2oFc4L49zi0TSRMpx6MziMwpH4bZGIenS4U+SpPlOV3waxdEjzVzUa2d/F+pDeM0wrym/x1Ei5vuo8EmwO6URA1gpQ/seg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726504; c=relaxed/simple;
	bh=9LVPDuJ+bbF3M//gO5UB8E/RBRqneTorEHz9vTPLB4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iw65Ybk8r8PaOFFBv+xgFpNGeJwfWECKwUMRfuU7Lc2TUGidYJW6aaOvb7UbltL22y+GDtIhoFK745iyMsMbYJaYkwGMbWQef8Ng4Lq/ABHlE5CwdJ26zUn2tOGRGNAdLTXoNADyCQ648AdO7cECiRxS9SVB8JpDJnEB3mRQ3lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+4jdapk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqEpphxe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+4jdapk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqEpphxe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395TjYw4107703
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 09:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=; b=P+4jdapkl4NECgSf
	+oXs3ETcyEQR4PKBVeaoJGKDjTsIEh/IVjtVMER2NN9y4drEERi8pijBvfAxZdJ8
	HjdyY8YWHvnk6MOW2Pm6NnUXIU2B2cGpDWFQ8OWPfXwp0K6NOwzt1C7P8C6ni1PQ
	IOTmWCxUEeJ23I2r8MKrZuJ/EcvPw1VotrLcUMOpth0Guk5cKMeVURQZcrhJnBwZ
	9sFZN5tC1neXIDZcp9HsXrNuSXi/eK/Ijylbq9geqXMmL71rdrmih7aoKMYnLqio
	TIQTWPqb73jdc7sIpZQEjhJn6H/MmpgQVisFdc+kzK4wuzdJyFklx5gVK566QQRj
	W3YCVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxhaj6hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 09:21:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0b57e192bso5095955ad.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726495; x=1776331295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=;
        b=kqEpphxezovsIJXRn00/R+LZOiDw2yZsNjsFQGkyUqjZRqhFz9dbg25u7m8GpCYmFs
         7DR2Cg0mVyb+2Q5+KAHRDL63TpgmKqEyrXENJicYMwvCm63Dxwi1a1w3mDIVt6bc2Fkj
         WKEyHgeZfIPkTGeOkWvETVKmw/Shw0njA07hgA+sodLGxmIOcF67h8SuKjaxw75STHRm
         d3pg3W5KYcW2+IwpxAonyuTQViaN5+VxXVXA/E77JFebcXeiYzpltKo471QxtkoBUujy
         5DSyfVGejOblDhIbXi3epWoOIjGGS9yF+67f8uisgDliWXqF4Scks7uJGdbZcHrBLx2q
         3niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726495; x=1776331295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=;
        b=S1GGRBza/N+MV70DcSJIaSQfUTta490lHzRH0pCqOR1dBLVB+UC+G9dX7X1T+yvaTQ
         9cHK3P7BQC2VasCjsm6ZCQiyFY/xAX+1b2T6D3FqGyIJxit0L45gwFutxuFp5Al+Sroc
         bJaSfJB1EEHq5zejsNq0D9XAbcgyubRLkQf3L3OUz5rAqu2VijNstQNLjhFuU4S113o5
         k43l4dcy4+PJEMCIghOD3BAvz6qgDXXXFJ0MGU1q740rFzoqX8wgBxdp+zCJbZSlo3Qp
         HP/TfJu5d3xBTsS/IzfMOq0+LlfD2MiaqC3sjLZ6szp+1sCO6Z6R9u+KJXToB5Wx9HIy
         rrjw==
X-Forwarded-Encrypted: i=1; AJvYcCVddTk7tvIbbZJTtlwKjkTwBKoTeZnMDYwpwtqRiiuPAvb6V22c3WZV6e4Sh/nKAQQQH5uMFVGPmQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/A8ZsanciTckJmejZfuyr2HYNMg2QQOVJkCwqL44KUT2IKjHE
	SFZLn0YLwcFShLVsdZH91zmmMPfM31v+LfjSeKcVshsurF0Dxzs4xwQKBh79UouNb8ufNi4l/P0
	wDlyv8GQ5837cN5GedsIU1xi4hBelECLBipxea5WgVS5A2s0LxlYrisoNRkB5Bnk=
X-Gm-Gg: AeBDietpKW9cgQe+TMNjWmjXrKk/R36YAlSQjERLjGPncRVy1t7bUalhtgevKj9mFia
	usR6V7NLBKQRp1jFD9CHSG8XLY7EramOVwtEgYUA55FaPYZ5gGpPgAi+w85N5Nh0Pkc44OJnZBH
	7h7io4MDlCif/fwMKRrulzz2DdzClVLSSeL7vSuNsZJW5daDolMKRz1MttDttuJBPDoALDSeaDS
	+6aruoHS1sSZY0NFXynaK6n1MlWRexd1y4dMc/eH+tYmFQBPUA5XYV+NtrhzXSJGdD4PVpuUk4f
	6jk4m2YUFWXBvNw717IPY/5wcixQrsPwQlT1aN/aA6T0gSU9q0S6WzbZtyGPLC+JCNrDRvr/bcd
	6OhANhRcfIiZgQF7jRaWALkRB8/OGhwjXy+IzL8PCdulfpBleSKUt
X-Received: by 2002:a17:903:2c06:b0:2b2:4b4e:e4d8 with SMTP id d9443c01a7336-2b28164c3ccmr261183285ad.4.1775726494749;
        Thu, 09 Apr 2026 02:21:34 -0700 (PDT)
X-Received: by 2002:a17:903:2c06:b0:2b2:4b4e:e4d8 with SMTP id d9443c01a7336-2b28164c3ccmr261182815ad.4.1775726494146;
        Thu, 09 Apr 2026 02:21:34 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:21:33 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:03 +0530
Subject: [PATCH v4 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-1-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
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
X-Proofpoint-ORIG-GUID: cEz7uQk4NmHR_llQq841xkr-7ze7KoYC
X-Proofpoint-GUID: cEz7uQk4NmHR_llQq841xkr-7ze7KoYC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfX3ng6Oia46eFH
 AcL29wImmwbJ20odf9Dh4AyGFrRKzngplw7yljlkeEdR5soEIA/SLi9Sz0Pa/rrccYEb5fkg8j6
 xlXfl95ifGS8kmBvdeLo4hPrWsFHu0isn+jhflE1ulrqfg3YotfXH6G+upFgFQnq1x58xRcbDLh
 e4mWyyZfpzbZ81OqzFa3GA/jgzpaAcFDYBXiGHjKZ2gPqwIuehHxM05zaZD8HHll4me0nF12qxQ
 nrRVQ5ATvz4/3pBdyAzSwSUQF8gYu5wKXivoF77mfFKYcvnowxQeZ1E3CVdmrrBVOqa9rTJRysw
 0dFX2ChfXZUdWZwbnXEHa1RwM0ULxNMrrShYw4F6Boi9vdS7gukHJPtFu5egcQpQof9U0uXjfqE
 wajLc/ApgGzumFWdj1N4XGjTU+rZKBFA+zHGFAUPEgBA7TvBnzvgcEZWMkech6ABKi+3wPwBP8w
 iaML7V175siCJjkyxow==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d76f9f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=F2P3E8UZIP7xQym9adoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090083

Add device tree bindings for the video clock controller on Qualcomm
X1P42100 (Purwa) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,x1p42100-videocc.h  | 48 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 7bbf120d928cc506a4f7aaeaa1c24e5da760e450..5d77029bfaf8830e2bc0c3b8f323c818ee48dba2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -20,6 +20,7 @@ description: |
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
+    include/dt-bindings/clock/qcom,x1p42100-videocc.h
 
 properties:
   compatible:
@@ -32,6 +33,7 @@ properties:
       - qcom,sm8650-videocc
       - qcom,sm8750-videocc
       - qcom,x1e80100-videocc
+      - qcom,x1p42100-videocc
 
   clocks:
     items:
@@ -70,6 +72,7 @@ allOf:
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
+              - qcom,x1p42100-videocc
     then:
       required:
         - required-opps
diff --git a/include/dt-bindings/clock/qcom,x1p42100-videocc.h b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..996408d1a0c32e175e5d4dd65c09bdc8dd47dacf
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_MVS0_CLK					0
+#define VIDEO_CC_MVS0_CLK_SRC					1
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				2
+#define VIDEO_CC_MVS0C_CLK					3
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS1_CLK					5
+#define VIDEO_CC_MVS1_CLK_SRC					6
+#define VIDEO_CC_MVS1_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS1C_CLK					8
+#define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC				9
+#define VIDEO_CC_PLL0						10
+#define VIDEO_CC_PLL1						11
+#define VIDEO_CC_MVS0_SHIFT_CLK					12
+#define VIDEO_CC_MVS0C_SHIFT_CLK				13
+#define VIDEO_CC_MVS1_SHIFT_CLK					14
+#define VIDEO_CC_MVS1C_SHIFT_CLK				15
+#define VIDEO_CC_XO_CLK_SRC					16
+#define VIDEO_CC_MVS0_BSE_CLK					17
+#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
+#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0C_GDSC					0
+#define VIDEO_CC_MVS0_GDSC					1
+#define VIDEO_CC_MVS1C_GDSC					2
+#define VIDEO_CC_MVS1_GDSC					3
+
+/* VIDEO_CC resets */
+#define CVP_VIDEO_CC_INTERFACE_BCR				0
+#define CVP_VIDEO_CC_MVS0_BCR					1
+#define CVP_VIDEO_CC_MVS0C_BCR					2
+#define CVP_VIDEO_CC_MVS1_BCR					3
+#define CVP_VIDEO_CC_MVS1C_BCR					4
+#define VIDEO_CC_MVS0C_CLK_ARES					5
+#define VIDEO_CC_MVS1C_CLK_ARES					6
+#define VIDEO_CC_XO_CLK_ARES					7
+#define VIDEO_CC_MVS0_BSE_BCR					8
+
+#endif

-- 
2.34.1

