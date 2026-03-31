Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2536D4E1
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 05:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934685; cv=none; b=cx+GumTjOr31jmVj7rc67+Qfzz5r3vwworpjIUYHUgoKyu07X1D9d+0GpIPBm4JBXjbg9Jl+0fALnspBBuyzgV80SBtj/2vZoSMM27mG8dZlROt3qxS+eKL0ATh3Y5m7WwV6k6Ie6HazNIv54D4jkrZu34F2Skfpso/+s0rdD8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934685; c=relaxed/simple;
	bh=DHYJYO3wXSFgCC6+uxk8R1Ye3F0J1gMgx29yqTPfgGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NrdAvD2TAE/+IzxTMtB1sviV3rHt6NZ27IMjZbJfE6xNivPYC/8LE0imFkZ+BvcTfLq5wBcrdvZdj4+S6ejqbn1rqSE213tjH/9sstxd2A5ks77Pan0su+oFd7GrgJ6xKQiMY1mjwcvf/mz5+nlsrk2iESV4ycmdhbwSu7dcWks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2Dw4oBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FuugEoVt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2Dw4oBT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FuugEoVt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5Lvsx1091578
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 05:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+roEa3DW6pSM+Jf8c1kl1v5+8E01NVs1jJPOcGFCCEk=; b=A2Dw4oBT+nuUUzVZ
	g9g5GrQftKEf1LD9yEjFMGRrIsitcbBC2GcAqt/Fjhri1wTIiUvqGu7HjSsVnARA
	+hP+dSq1qM6ocKnue+1MT8Bd2/Lfb1QMMO3NmfdwgQDfpuuM7hkoX2b3lGJYNf70
	Rf5ny70S+ERfK32JUGP0xZf0skSJjmwChmyN+IKUDTC+dtRJ4vSgAwgz/7SZ6XFx
	uMJIJfmVmLsL33Km/vVrtmA30c5Bn0AHx80EJ/QLI3y77xPoKQlmNDbGHKhvzeoa
	LYbzY1A/Dtu6GE3NJjkOZy2GQBt54MgHvX5EtsLCf3ljtr7hLLDjE82Xhgy/HCkf
	nGXvbg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd2ybk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 05:24:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c741b950511so2762492a12.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 22:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934683; x=1775539483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+roEa3DW6pSM+Jf8c1kl1v5+8E01NVs1jJPOcGFCCEk=;
        b=FuugEoVt4Jd5RseQ+H20UpiSp8Y8O//Byl5sdI4TIoo/gI6IyJx8tomdyRK929Z8jZ
         bBiEDR06pOdLKaJPJq6u/mTncu48MurIUzyKnBRYOBUsr1xuc0pzspTnzfR1+9fitqwr
         sR3pCOCB2vkvXhnZYtTfyczNLpxhc2/lO7sLqeJivVjg3K9Av79wxvxaBgn3WBp5FdUd
         raqfzxNEaen/H2oqH/ce51eEZ02ZZV+CHht82B+v/ptK44+ahs21QQvFJuAlraPXpWWH
         JQQbcPZ4yoLxIgyNowI6H2CgP1lM/LSUHIeEFHjXfC0AfOzu2RlLWmDZKzGqFEfAczCK
         gZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934683; x=1775539483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+roEa3DW6pSM+Jf8c1kl1v5+8E01NVs1jJPOcGFCCEk=;
        b=qVwNHzig74c+0FlNjGDK5Romrv2wLQtZZAV61EmEpHwDowsr/VnolBfd1EcQAzRqTE
         3L4PqMW+FaDMzqPyrlRQDE0tVAhy7ATffd6LPSgy/jSwquR3k+QnjHB3GDztIK7P5CdX
         bZGlpzWVnch+fpc8aRjM0D5Y2U0ITAna6648l7eWnRjGaYxDqVWXZ1Zc/9tWi3OU1HlS
         WgUpNn3wsPZbg6uc3WdMJ4mBW+pXeT2ZgFnsRAKW6HGV8tScMfdaz8ptt6HBMMov7Sor
         I8Y9zIS+0pl0G9yjkiXjXcU6CJDKYouAuTsLdJrwbvStmdZz9NC93qLeIgaA5cmVFT2o
         vfdg==
X-Forwarded-Encrypted: i=1; AJvYcCW9av9c54gegLMsCRyklp1wKEKZ7zBX8fquHcC/4AqppnkXVhYGY++27WkXilSLTMzRMm1YeH3Loks=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUR9QH+anPmHSUUGnOhxKPED/IYo21kp0GQ+z029tLAl3eO6b/
	RzgL9GZG4/BLQhbPZATg6G0bd7oFlTeGLFu2eVCGfzWDAqrQJJMyjvyjbJVwNKF9Zl6qYewim3x
	Uhxb4+FNVUriun/mBuSkrXkSltzZrttF1VUJipFjDCwtOPBmOj1SblZvUVlyOzuU=
X-Gm-Gg: ATEYQzzW0o42OTYjcBqW43dm/3UMIz1jd1MgSuBp/ZgoC7OKyrzgtCR6Fx3w4YHi0Lc
	xWL3jrqAKM0t/AFCEDgNU3Wg9IY9JLVv903bQQK9iWzv5kpZkpOOG7Op25zT/2UOu03+8u7NMt+
	hVH4cROSGNcnDCfSish3vdKHHgYlux18RZ9/PxKOzOp9J0fO1bQKtanqqaiN+ecxlpgJ0gHgCPf
	wPm8zP6ncrEeJQ5sMwhx8TFksaO2XTdpnQMKOi4wQn/C2ULBVT09H9sXowdX/BstWEimWVG8j01
	O4mEq+XH9K6KTQGZWNipgcypwD5qHf6qmTk+rPMPiSPtfjJr3LJkX0w5eBgvTfJ2xTdyf3NCEZD
	KAyT21JXBbtg/9ilypr0/0s2SYrM/GW9ai/3cNhDhFXvzLHzASh4Q
X-Received: by 2002:a05:6a00:b4d:b0:82c:9266:624b with SMTP id d2e1a72fcca58-82c960a3472mr14695205b3a.47.1774934682725;
        Mon, 30 Mar 2026 22:24:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4d:b0:82c:9266:624b with SMTP id d2e1a72fcca58-82c960a3472mr14695171b3a.47.1774934682212;
        Mon, 30 Mar 2026 22:24:42 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:24:41 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:54:10 +0530
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-purwa-videocc-camcc-v3-1-6daca180a4b1@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: UPKV8LoNy13eADICx2z9agou1Y_DInPB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OCBTYWx0ZWRfXyYLojB0GXH+s
 SYR7Ot3Qv9zKFvygvSl5+Vw+GMufqYnz5dKOeNg4MtKaeR39zmk992jSqQnswRsHZ4UqUwoYO0k
 o1CIJPO51HsDpmUgfA7Du93zB3uZxk64V8NX4OiGjtA2nSEDwYq0jOK2XROS0myNTLxLUVDWg6b
 jnXDwsPwwWiuP0svPMpmrxne7VlIXQBA23Ara9VBjMYJ6RWF5oUECsKFMrK2/o/gpT8g69ON+HB
 EggV8GFNDLKHmZ2/BzfYrrtxsCcRY+bXAJE9G6mxggYLPB1dmENRrc0VdfnpQnTZ6DoK6waW3Qj
 xaeYGKHk2KPlsud91ZIlaaoPDLzVtVl/n4pLodwlmMFZ9mR8e2d3olnFmxZcaxJDQeKm+/MdMsR
 4pH3+sAejuRz6+KfZ6V0Ns0LH92qqwKrttMeHuTY5wl15Zw2PJ3MO/DEZQDfR0XjmpyKTUQ/UcY
 b9RrtYrzYBE5WencXhA==
X-Proofpoint-ORIG-GUID: UPKV8LoNy13eADICx2z9agou1Y_DInPB
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb5a9b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=E1hum5-uswxXays7BlUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310048

Add device tree bindings for the video clock controller on Qualcomm
X1P42100 (Purwa) SoC.

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

