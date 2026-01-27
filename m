Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F2B35CB88
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526236; cv=none; b=MkymcCqXrbMLSgnT9IzgIHrVAxgkqE/sQXfpC/arc7gEgCErPp8vS1ibVnmA1/Ctc9BrmNAWxGqJlgxC0tt4HDoGduLYKDkLaU3RjgBeMq1qsOii/tNar/hFM21TsDk5Nnvn76QYxCWbEd3/N24r9SSyMU0EO+zHw2BAswIlC5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526236; c=relaxed/simple;
	bh=j5wglMmNeIkAtfucmojF7uDjxPcw0Gowp8q8oa64dyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HnpVtDdmjZR/BkmTq2zRVrCe2o8J1QwUgJLwhwlovxp692jAzdUCL3duNYBNP8FXyPlZVr6iAIL1BOgwCLtJO4j0S9dV8SXpo3efSYnXXQRFdwFXDVz+DyUAF5h3OYvECJCDKuA9T3su92vLWfEdnWHbD7xMa39iureeDYlzRk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKPp7rAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMBZ9ePK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKPp7rAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMBZ9ePK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAKCtO496030
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kk5M+PV7SPC2sAWBFx0xBMrzqlSIy4AfeM63MG1rXIg=; b=PKPp7rAM32fBgfTS
	k2Zc9KfgEIpDcfKemFq0GfVkhJT+LZS4IDb8GqwXj3kDagbJr3+As6FIIYt2O/IJ
	eImnZmw47w6NmsvH8xWGn9aFeyHQaGWuOaKug1lfOeKqbddpp1XYtEj4R28IvEzX
	MKkUNsdDkLGCBhph7NIus9NuSTmk1CMJy6H7u4qFbByQVD5Hb9JPjyrVFubJLKQx
	ydsy08/0owuA8Byva0SwwSkbxj31r/3oW6doPPitRtIgEiM3arV6UenBmrJkUjxL
	EsONVzBQ1SZ961OaTB30H4lAx5wtHuUTprjFJ6uQ+8+enADzPDE/4w8l/fpBA2Cc
	JNUL8g==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bk69s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:03:53 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-45e76684274so3424025b6e.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769526233; x=1770131033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kk5M+PV7SPC2sAWBFx0xBMrzqlSIy4AfeM63MG1rXIg=;
        b=TMBZ9ePK2jS6H8Vcd7/s8PPl/V+E9fzxkt82bmNnIXcBmYUNbt2G+N2vlNd3/HxBJm
         7wKkNPDcITnysDv8cscVbSM47skk/fajf3sTiov9QntlIPiC6cAno2uQO/f2MnB1XKg7
         hx2ulpFp+aUYrV0f6kp6t4fr87+6n1iMpES6Dj1IiSX6/mYPpjXdOoUIckIFY31OQgph
         QwMasZTS/FRXOb1Er49zazjAN5+53yH1Qk0JOSPkd1pgmR1uwU5KEdDV04hK43Z0QOqj
         MeQMuX3s/fXTmsVf0fhg6AZ5sQdJkY6o1tFRDsNS6gTFNV7w+H7M4Nv7MX65y+i9QPSZ
         WvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526233; x=1770131033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kk5M+PV7SPC2sAWBFx0xBMrzqlSIy4AfeM63MG1rXIg=;
        b=buHugUPeWVqNynLKDMd5SrxSUPFSp9SMP0G8nJkoaxPgeVHk2Sw3fUe7gI/YdzE5rU
         +VzPv0rZuEMvHra5IAmHF044PgUTg8dYyoebgFvZHmzV/dMZoZdH54StKN2etXnP9r2F
         s621M++OWyhhh0d7FK8bOqw8uUaL5pmDGYeOpSZsp1fnw1+XVxI3rLVboiNtT229dPVP
         1IG0MB555+ruAUgpBXSS4qPLGskazu54zBSsHKjXeBg29HnXNOo6PdIO83vvs1+Rw+3t
         8cpJtgMjrBZQZmPdMKn5NXgrvy/a301ibPH0+xSDPI5eYrdAwXtyqEW+drQZqEu8XXIN
         8oXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa1tNZblTxjvRgu6Ohwcsjr5lVldqUxHpa98ch2rOGXWHRGm3M5bzLsVfRh7mSLEU47yQ1c+Uzsvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwcr5Y7Es/TQ+EHCjHmXoAIkeqGnpHzUxV9zazF2rb9ULS4nse
	BjOd9zwabG3gqIR72cPwyZk3Bd2tfSb5fUywrtFjcCZ5Qjm79nk3oni9uFqwGOD+0GIe84mzrz3
	qMJ7c3OWhNV3FR/jdn5yCoVGKtWLSf64WlUtJiXUCiFNuILn0JtQXgrxWQ1nk0qA=
X-Gm-Gg: AZuq6aIZXZAcQwVlnjJZ/IxSv1GBClVEThzTa7UfwIZ1opFXqKnJA4gA2nZ6QjQDfgS
	cwaU336cVoK/rqINf4ahx0uvb5eL1K8Q6foxkh7TnGWxYACdIBNGTpDngJpqmaO5vHsgV9eFAcd
	2vLv4aBRxONrN/wamN7qO/jmc6P0aTVDTCpfnp9DrMFnH1iTvQtOb0/mAgCfoQrkFvsL2nD4/PT
	W5/n9zgSpuBf2IcUSUk0QAf+alB3qVhYxFs/uWUwifHHbl9ESVYjxYGLNJ54hwHPOpMWyXwTGyG
	0moEaCQ7In9Fp0T1xqi1unUrqWOfEDLY9adYTpqBmoJb9JCIPP1/Xm0DXBGqciNOJd+jXmfaY2B
	pDF14aVoWCz0iZXGWJA==
X-Received: by 2002:a05:6808:2218:b0:43d:24b7:2b93 with SMTP id 5614622812f47-45efc5a781emr1142024b6e.17.1769526231811;
        Tue, 27 Jan 2026 07:03:51 -0800 (PST)
X-Received: by 2002:a05:6808:2218:b0:43d:24b7:2b93 with SMTP id 5614622812f47-45efc5a781emr1141976b6e.17.1769526231202;
        Tue, 27 Jan 2026 07:03:51 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02cd8sm36895097f8f.8.2026.01.27.07.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:03:50 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 17:03:20 +0200
Subject: [PATCH v2 2/6] dt-bindings: clock: qcom: Document the Eliza TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-eliza-clocks-v2-2-ccee9438b5c8@oss.qualcomm.com>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
In-Reply-To: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7nkLWD3sT+wCjfvITR1Dc6nUzmQDoUNZNGDCrbq+iOM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpeNPMcf8kDvAJqip5KoGOy1YDZZRSm9BuEzyPe
 pOffyeHW3iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXjTzAAKCRAbX0TJAJUV
 Vm45EADHGBw3mHrO5RLdX7me+ltge4CesE/gooYda2NhfWGT2FgvCidHQmE80LPTRbenr3SDITN
 XAzY42MEV10YrG5LuhSPx13jaskZYptBAbJZpmwoIpPfJld6Gy2iYTiXlIii8bzM3XJ1jU0ql9U
 qoLkIHZ3x/kOKAVH4M5rPrrZMRD6N0OOv8nqJcfViCg+ZRcxuQrlcT9NMJgiGBREVhiWT684h1T
 FG4fBRR7a6cj4ClGl0vCHOkwcWmgVxhxEfS4QLlwKnBmvYc92g2aIJEV5zo460IICjK2XDvvWTf
 s4nWtET692/Sb8AqhkQ1B3zVZzCkp8xBSLuRCK7rJIxR2zHcuIsc2cbYBN7xN81b0soB8gKrCQX
 +5mX2UmenKJluDFcESvWWSqIgb4szT1+KIyYioxmj6N0GQGo//RBlj9mlk3Ge6U3m/YYOqI4Tx3
 fyMMfbK7Pu5EkRApXcN8EIVM1dWSuNTaT+GleZOeh2+oNato8ndzu0qIwVk3ZT/ZfQfSrfkRqH5
 tGpuz43QltAo32Pd2K5ZnE6g9mmPDM1BEe1xQn5nmHAso4hQHb3e5K3QW4OIbB+196KIaqSP6pV
 ZFJn00fi13djcGIQiKaSIR/kbdbjk4u2heIynkqN7zN3eoJNwwnEL+9au1tCHUhCRESfyMnvQiy
 KSywvhV5f+2Tv2Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: -THQC_uxQ3yirbFjNW4cUBF3kNgYv1gD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMyBTYWx0ZWRfX/mHZgqx4lwYA
 0FwDVU4mLcSvetf+sEhdmKXzQgKDBQQmEXyr7cY7gShKWyjqzaXok5XesvePq06NKjeqjald6SO
 yzoludiu0jZpqVNVNr383ebDxdOkUK/qn5tq71tIdFakraHpXyZHkwmeK8VK/nBPwHusfOOFlGK
 doiqlx+iyCxlDuGPjOsBXgh08UC3YC+rPKCpfUf6TFQdFwLIRqliubFTLCqv5T/XQs4r6pBlAwS
 qVr1QFMNnWwwTATCet0YWTTZEH/QgJvghj+dONFxodbchOJqzsCYT3A+QYReMnvX25Y+nYpp+iJ
 bpP1hxfIB8dQgMxkAsbsyeN3ii7DsE1nuKVZqotBelG6+idkvb+wG+aeUhxqUDHh1Vm8//Jme3T
 BK/Kg87cZkNETyChnyMI8+ex4o1uDj+aWpH/gFM20PbuuiPMCItQHwlDFaQX/igOKU0Hifnvhm0
 gU8+yw7RfaO5SovN3Qg==
X-Proofpoint-GUID: -THQC_uxQ3yirbFjNW4cUBF3kNgYv1gD
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=6978d3d9 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UWqaS1yFD4rTGqj9qVkA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270123

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for TCSR Clock Controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml       |  2 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h               | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 784fef830681..ae9aef0e54e8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -15,6 +15,7 @@ description: |
   power domains on SM8550
 
   See also:
+  - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
@@ -24,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-tcsr
           - qcom,glymur-tcsr
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
diff --git a/include/dt-bindings/clock/qcom,eliza-tcsr.h b/include/dt-bindings/clock/qcom,eliza-tcsr.h
new file mode 100644
index 000000000000..a9ee1e45c17a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-tcsr.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_ELIZA_H
+
+/* TCSR_CC clocks */
+#define TCSR_PCIE_0_CLKREF_EN				0
+#define TCSR_UFS_CLKREF_EN				1
+#define TCSR_USB2_CLKREF_EN				2
+#define TCSR_USB3_CLKREF_EN				3
+
+#endif

-- 
2.48.1

