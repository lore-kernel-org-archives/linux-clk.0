Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9EE330B07
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 05:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132342; cv=none; b=d1LwfAuJ5gPzpFT9zwAWK0c23XNvxn78GeEUtYPY1Xq3C0tDCH44QBmr6QYz9YIdLVeLNTpaoa2UVmbmO9ZgJa0yTcJD/i12Iv8LFM4EC4UXKiTiV2MogqtyROKLb0O5lVppX64S75TEzKmTeuTKEf1xcycmJflANVx2ixmnE4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132342; c=relaxed/simple;
	bh=9LVPDuJ+bbF3M//gO5UB8E/RBRqneTorEHz9vTPLB4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NYoV17wYDFz+EjUST+gsV33gBP3fqErHmlCBO0vR4dagI5moCJtqiPRTAZr0emxjSKW6fA12D/dxc3y5qonyO5FyojwwNiGQQ3bSWEpRnBP6r0Cl4+JgJsC/Jgzk7s2TS6Cx7rleVDKLF/F6uFLUaAPij8ONgjSDL0BtGY1mnxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7bThpzr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvZCaec4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7bThpzr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvZCaec4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745pON879586
	for <linux-clk@vger.kernel.org>; Thu, 7 May 2026 05:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=; b=M7bThpzr2dUJHR2u
	evBoRBs1LEvaMcJ39WkViK9ejYhhYF1hykWaGLD/SqvzBZslELNlPoOZ4UZ8uq/e
	DcVkNapLTQut3jX+xYtBui4mFsZccZLwUCpwe10gI1A/WKomywT1e8QubkdbeBBA
	hBTY9Wf/10QrhVVMK5bJaVCASv3SmPIcvIghyNwBgAaZyc19Up0CMUGWyh6zOsxc
	BHF7WObH6NQDnHjVILG7+qtUQyLxmislIvPJqq9pNgPKUIuZc/rnRPJ2joh8CxsG
	y2KTdfxI1o0UJO9Ge244a1kkWQ/l8nvyfWmAdc50KtgAKge7XbfqmMSxpPK+W8xJ
	X462sg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq08ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:38:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-836d0184333so442674b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 22:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132339; x=1778737139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=;
        b=cvZCaec41lAcB7IOZKskkLp6Zje14bdR5gcXLagXR2AcDx1ShFvlzxISA16KOc0GtW
         qZHQklh8qZdiFnZRZHLBoEMO6zZR2QRGYjaBhIOeu5tWIZeJJOIJJT1KDxaFsaa9yYZM
         3UPXLpuCHGEkOWDqF1eEAB6waCrXpDpte/RqgFow/ZgOgdhN2sv06Jq2bOlZa2th7JPd
         aQEy4/iNWR8a9UCv7znUlPYdW6ciEcZl0y/w3mgxSPF/whfUVEJBbzyyWa2OwMdKDefe
         W7f8RyFUECbhigUAKmeizOn1movmRa6+7pRVZcK9loEFurBFa3YmttzvaocN87itfzNf
         ybDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132339; x=1778737139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=;
        b=DSPhUYPnhwDg00nSp9DZff5h8zAJiUsmH1Z9qbbuyo7PznRG4SIIMYZT7K0eamfzHr
         T8Ink31kPiZ2XH8e934xd2/wv1EsrB+pXlklj04olO8b95Mhy3ajoTo4EqBsCPW5qA/A
         uMYd6Iz3m7RubGit8+HB/0xaClvLApOKaWJXiPRJNgfGsk8DjBW29giUgH3wnIk5zJ2H
         aCI8lPWm5jwIuTaI4u/+GKGZKHXKnbDz+/y9Xr/5NQhdMfSL+8mogy5znCagxlcVEO5p
         gXd976YFj2AnfOyxUauslLbX/Y4033cFU2b3sMsrpIUwdZqlUzEdAhr7XnKtP//gscZQ
         fJUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9O/WS5DJpCURaTYzoZpwVm3T+TLjUzZoShwjhPXhDD/MdyunhGz+eVieVFC68RU7iruN7ttnHTWT8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBdyj+zl/tllLIMTFs1naSDL3MhwTZJ+xsOsjvsAOs6VXyPWz+
	duQts+F6nmEGQhw/2Gyxw4G0aLnRgTXdx91taVCeJs/zXQYWraOtySurefMP/t3HBOVlXGZVQI2
	rwpmJgGm7M10kN6k3RylcaxwFEcR6PIzJVsWUHT+cJ8WQ6HPphmUAJ1JvW5WIzsg=
X-Gm-Gg: AeBDiev5RVpQ6SViE8dIvgVoiioLr7eP3Usa4h0qm6jxxBg/sS8nsu4/q2WlXpNjSvP
	oDCgONI39QrlaAUWPJQd9AvQ2oTGE903IdUZjvguxI8qkzjqeu0x3QRALFItCR5DnwnHvQOe/xf
	cwwmcUuklhBA+Ly9DnW7ylkuUkSEMVu8moUgUUiE/ZsT/Dz6KouoepsECBHAlbKxtB8vG6UDsoL
	TBh253gJTVLa1TgRxJXxPD5cV/ml11Hfr9W5WIuxhRSW0bJNGSILQOps17RYBSpNB6vFJ1MIWcV
	FjVCbP9XXTrL1+KSHJpZxXqGzjalFM+f1Zg662lkArVaGwzVgK8x7xtP77UuxTrJLvomD5gFwAX
	y8sSWRtXd7DH5RuNN77R0gqtdbHV6plDANl++NAu30EM/TiFsa7c1V0AH06Tk7dI=
X-Received: by 2002:a05:6a00:4148:b0:835:3f51:7305 with SMTP id d2e1a72fcca58-83a5bfbfa17mr6534044b3a.15.1778132338861;
        Wed, 06 May 2026 22:38:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4148:b0:835:3f51:7305 with SMTP id d2e1a72fcca58-83a5bfbfa17mr6533686b3a.15.1778132333571;
        Wed, 06 May 2026 22:38:53 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:38:53 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 07 May 2026 11:08:26 +0530
Subject: [PATCH v5 1/6] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-purwa-videocc-camcc-v5-1-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc2573 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=F2P3E8UZIP7xQym9adoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 8f6gk0Nkq00pnti8RZD85YbMwKUklEYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfX6jX6Thl1opN8
 eMLOG4kfebb6Zo4ACXP6uJoOBYjkgzcmlq/1IE/v3wzRLRMQOEECeWDmftlQVM2IT5+PAO6SO+k
 1XEW7wS6AdNfjerHSpr2r9YpH3MEl66uSK7BcCfGe6g8ZeyvZXd2y1UG1mTOQxUogKE0o8oVX3A
 oVVyvgoNbDhAqc2Z21lAzhPJteUKOV81N+kn+SfSJ26rQJtxfDZ3twF+h8XwzRem+0cQcLllzcM
 nzHOFzxtte3oauWEH1kCN9yZNLJKo77SwCL/qMxlFz9/4ASBtW4fhLko02iHv9fNs5EOOypSwWq
 CCE9Vvwp+avX8Svlq5zQURH6pLXJKBPI/1QjpmBNZxH365u2/9tTCX0pmJfmcVzSQ89wE+9WTHe
 fK3nLzgRkZ2M88BCCGX9i7KcUaYMKFsY8X8GZAnerI3AMpph/qCqhpJGyA6tBv0t6YfsyUIEMmn
 KTVcXON823ynq6i++gw==
X-Proofpoint-GUID: 8f6gk0Nkq00pnti8RZD85YbMwKUklEYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070052

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

