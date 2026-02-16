Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536B2311963
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249406; cv=none; b=myOiPi129fN27pIIgVI0jqN8iy/0S3pIhpNL4OZeIDazABOmeO0Tg8qXjGNwfeKAgJcI/xg5I3Gn+igiX0U5BBlvNOtRX/clpldqz8gT+Wf48+NMUXs2Mbn6EY3gTOo98mb3nH/bVOdScpavSAEnqtdzk8QYqi1ABIdMSa4LCj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249406; c=relaxed/simple;
	bh=SQLY7yycRmVhiAc1lszTTzufCTHi/kKPaigRgdl5JMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIIUJTCUiIm1TBLJbJ7pq3hO4Hz2eh40csJIZYBdhJhARwnAbOe5p8coouBaSw0Jw5DoRACq/glNbmTX7ZSyib8cjtolyu9iNYm0/sDzo9cSi4JD56CnTOlr1bfZRph7Mt0MZYRUNnoAASjb8yk5PPc7KUT7EHG0Zs4o1R2GanI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8lXk3z4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4xKU0mb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8lXk3z4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4xKU0mb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBJL723463329
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ytIAvmSBJZTUbWunkOqfIWwLGmvF9FvxLsp0T3SAps=; b=L8lXk3z4+0s35sqq
	ymkxvTr781ZcMmMWErP1LTyffzpO1ucG/MLO1BN5XsJVJ+ndKaf+qxysxpx4yReo
	/MNQpNadtAYxt5AM2fo9dnYonEf7E9HRrFHKsRNb/L6c1d1eYPOCGK/1Ja9GJSjU
	WkG0f/LRtXi33/VgLp9fQBFk4xipscJIqkab2r3zTNI4GmuI83JgkXAtpYXrbO8U
	H+MRN2cxOg+fZdl9VkFzEGKqzdCupssLxBzmDfkO4DPPbfBjEC7NJ9bIbbOGFJLp
	zDmxCxvi9IZzl54Tc/TEpqIZqV6hEZSFScAWuNy0Qf6Gepqo0E7HQay4B487Faw0
	AIo3ow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag24cqkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 13:43:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c7166a4643so1941070685a.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 05:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771249402; x=1771854202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ytIAvmSBJZTUbWunkOqfIWwLGmvF9FvxLsp0T3SAps=;
        b=T4xKU0mbB5Xb2AZEZ5fgA8IlYqnwztN34fEVJnE5Fz80bMuD4HJMI7m1gFfe42Cbdp
         MEu53sbhS7GOyGpWztJvwnxjgpcDWRD63LpSLd5lqmj0tYMUJHJhT+B/+d993gXsQDiJ
         EqfY416YyX4LU0E5yIGzC8dgBov2Hb95QsvLaMlzVmzC/w9sDwoF+utSj/PfNTj5Wi1R
         KtdZ6YBtRl+TdbZhXVKE2FFbO8QrNRy4tbAWUi2kHlJ+dbevz/UGUFNHNeyYmRhHHi99
         hUrgz43BR5A/b62gTu+Z+fpYcAT01+bJGzmkcynnjRlLA4oqWWVsvexRYrZFhYltiGHK
         bXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771249402; x=1771854202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ytIAvmSBJZTUbWunkOqfIWwLGmvF9FvxLsp0T3SAps=;
        b=M2Jt9HTOGw9giOPUMNBrkhYor0pAGYHGZGDCC4Unj6kzwH5pXF3Dg5BPoHI7/xQG43
         CzRpKG7bRo6ZxROwEPOHeoBQLAduTop3Ki5YyGAIwONWmWKFdetU8Lx6zfoty+xhijvo
         IRCCxvdlEoTwLNDR1342xITqosnFufMAAXvU1/ML0yhQcsYsSUY8BxrHqQ0dHNNgGNqN
         r5xzTCirbJwlIAelwdfgEILhlMhmXHw3Iw1ZAUJpEomIyMMsm/JfgYb9cX6vIZPQawFh
         RahLV2iNkYwFurVbw0nzebTS0zY8uGbClO+prfhICp2CnvtEa+OroA12+1l7zope058L
         NGLw==
X-Forwarded-Encrypted: i=1; AJvYcCX33zrLbgpY9dZKwVlkpcxBFe1d9oPva9fnrE9RJggqCPpdNqtCwxbb8Iy2Xooyyud/m1uVum/ftX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwojIF65NVnnD/TUBn86tOsuqmS+0aDzjdTdjtQiQllh/cYMc2I
	ue94cb+CCbL4wYDQgdJWLPQ7psE80gPgQ2HCUkT6ssaFaH1TOsGClNq7b6WvDeBBD/9HjoJFIDB
	iRU2nE5u9Q1WVfikDiinMwtPc/QaTpwXE8JJacOG8WdahXJMNfwQeCFlmwxurMZs=
X-Gm-Gg: AZuq6aLYfCJflAOVwlkYo+V8it6w0eg9LLwMZaZNAfKf/O/ncsX2VUYErYtyQpwoPjh
	cHQfKYq9P2gck4Piz1+NcwKPo76Y9aZ3lroFaIOcmm8O+qxr6NS9b40tQaWXqWnZ+9zYUX7J+Wv
	jyYhnDsDPssovRbNmItxMsPFPunN89bp9NXt1+Hu4VwYymBl8FkZzlT58YF5vIhOmKzj8oT3qOh
	/ivyrhqGfT0Ne+g4LztRmyoVQyTW1YNbtrREEusuMpdKaKAjFLiRE2/zt+4O2L85JEp6JhMcYEw
	gXo9qcCf54xCTYneSON2GqBdH46VKdfd0jf1G/97yGVZUHWFtyx5uN+subkJAklc9w3PpbfYvmJ
	cQetNDBtjB+uMwEJx6dy9Qow5G1f6+g==
X-Received: by 2002:a05:620a:4054:b0:8ca:41af:32cb with SMTP id af79cd13be357-8cb42484da5mr1112413985a.77.1771249401671;
        Mon, 16 Feb 2026 05:43:21 -0800 (PST)
X-Received: by 2002:a05:620a:4054:b0:8ca:41af:32cb with SMTP id af79cd13be357-8cb42484da5mr1112410885a.77.1771249401118;
        Mon, 16 Feb 2026 05:43:21 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm28883025f8f.13.2026.02.16.05.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:43:20 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:43:04 +0200
Subject: [PATCH v3 2/6] dt-bindings: clock: qcom: Document the Eliza TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-eliza-clocks-v3-2-8afc5a7e3a98@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1931;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iLqJ3HR0ZBFPxN6sYQdmeq4FjBmHkwz30j1mLzc0NYI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkx7uialzMKse+0zUvscMeirANSA5uj/we3pVT
 bC4WDcY+x6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMe7gAKCRAbX0TJAJUV
 ViNbEAC9RBodtD5jpXv8T53IjM5GMj6r84Th5tlGOK2Icswmn/vqlekZItJClkqsJxC+04pFgSh
 YGl1qtqPF0gD01N7oalP/UXWBLdQIKJggU0J7OpaSTRfjpTaNPsMok3FCSkgEl0pd2PuGe4Bhaq
 vC3Yr58k+PhjKAJEYaowOu6bYRORPOhHe69uxaJZeC9jI3lbjpedM51KpY81fJ+btbRmJ1Y+ZpM
 BAArlcmaSYiXYUUXcw8KEUsev6vPy2fl3jD5jbdVuKQVVy1ZEq8tP8k8Ngjap/FZez9fGXpvOp+
 v8C4tOTN2YBbFpe7AVbuFs0TzcA4kkWEp8CkExztVwtzSncpLpmj3JpQPOlAMad1xQb90H5a42e
 C6Sp1cf/jc9LLFS4qZlRb9HMnQSoG0Ow7vIimZS73U0kMpJB/cCyxr8Ga2ioNCs0ERyOJmhJuwx
 PO3mAvqd6V2IXthO3cMNM2Gq1+2wZurHpVqtMkOyfm7rtv15/vTItUmdPnvjR9XhE0h792d94xo
 HAr92SYrFjKzSQeRTsR+lByS4vf8XZBPeh/2Bw1cr2JrPNnumx33dAH4zRr06y6jYoM7tVS5lgn
 YvLo7VRp9+jjnJaMHNSvkTh8iB2Pc1UwyAlKMUWgVjWfmNYuZQxcV4Drj1kn2nToMPa/C7B7tdN
 Wmm66v6CuHYW8tg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: iLSBG290nuRqvuK6K21Q0biR1Ltnb_Hk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfXx0rrJWhSjTtR
 eMchu1CBa4VWsMBz1ZUg/ZONeTck1I91GPfTCg4vE+FRMCXCJBkdr5R8e7CP73fEyeydxN3YpyH
 JK4lxztkXEkVxYAmOfiwpu+xpREFc3fSTAFblM9eIvP5kLtHuv137F8uOvImlSGq9ZAD0zENw7R
 a7mA7U5H57ecrHiDSImD9lamWwR8anzSOy/NYUt6Wyqnsu1Wf6xIpphDs87VMsgadpErwGhodRJ
 r8Y9AVSfr+pHFV+O2/YG8YhXD776bgPAoY2LwElzNHVvIDJYJGEknSAzNv1HnWYLkdNkG1EWgJS
 jGOqhGv+t6w4sCdnc4nSBVt4VTxDvg2z7IkaG4ub9JZcWJdx8QkuHriVhlsSVSl2NrWzRYqmhlu
 fckIKyGZ/cods/rVpQZNRIRqV8pv3O8/6JFsVEFvQegKW37HWuZJQJaO8e5LC5flLo4RUTXGCIQ
 nIaPTXvFilYgghbMlPw==
X-Proofpoint-ORIG-GUID: iLSBG290nuRqvuK6K21Q0biR1Ltnb_Hk
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=69931efa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=UWqaS1yFD4rTGqj9qVkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160116

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for TCSR Clock Controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

