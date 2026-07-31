Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623E447F2C8
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 19:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785525191; cv=none; b=NYu4HjsLgUAFugFwiDIVqLFUeDR019I9um/WowI2mebHyRv/Gnc2GZapvcH0dZyw759XdnFEAhjIe753BxctHrLHR65Nq2j3GeWLP4uLDPWJXoMmc2tgn99/JNIMwIR/bewe89Jg+ypVvsYHKa/RuSGywKU+nqCNRw9NvlmEutQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785525191; c=relaxed/simple;
	bh=2WQZO9iyYUTAHgUztEBao5IyZKOBUYJ+VfnKcDvPlrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rstVy2/zPRmfkSWzgZibucuOida997kVVVZ70q8qkN3BKXQhL3Y767jAdJq//zUlZypY5tWaaMz4V8lLDSps6P+2tHJW2Sb+SylHnvFNNy14vOX+Q102Sd+wNsWN1weUDCCvFH7lwDY4dGWSpG+XqiLmfLSUDO2uTdtBNEmeq20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVrBuv5d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Etz0WNsN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVrBuv5d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Etz0WNsN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VIcoH21849226
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 19:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iEl0Q/KtLX+7iLgYwaqoubsfIcK7cbxTLVO46xMCJno=; b=fVrBuv5dfRyyeaDM
	uBmx4eI1jocB98nPkdOyNdV43NXaizpeK7mywiLdNRiD1Ekj4MJ7nO2zBKBte8HV
	njipj2BWveI8Bn1v9q9OpDKlmwSjtaCbflEmtgRtVvxk1/RoatsN9pXVM9Re87S6
	LhzK2yEQBHnBrZIzLJ9c3kF6g4vqjI7TvB5RoRh86uPguK60mKY1cQg5XMM9TdmW
	AT33eoPrX8ZcLKKXpPNuReFgksdvHt9mc0Nfyi50cZ6dCyoFbhwMRNJZq/jYcsqc
	rDXUncf5MzPX8V9GdnsRty5Mzz0o8DMEOisMvDbPL5q1DuFKRztH81J+RusXHa5c
	Sm+odg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1xa25x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 19:13:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811279d51aso2300285a91.1
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785525189; x=1786129989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEl0Q/KtLX+7iLgYwaqoubsfIcK7cbxTLVO46xMCJno=;
        b=Etz0WNsNtGiGVQipT+KxqP2wKbRmw1vZb+LwKkbipgmmcDK4JjRdltwXfo/ETxJ4Od
         fP3XLmnv+IbcGB1GymhmPvEt+BJxI2MgBM0MUZN+lylz7Mv9KOLC/zv38CsRFAIEpsqa
         FVSCLcykZiwCtmSdZGfOjL5qgXvr8H3/gvdxz/cWPK28qgLKfuXegZ7LU4Rj60aOVkzo
         0JLJSBp0YrC1RtOgvbgNUP5b9XL2EJBvTLy/12fFbidpVBfarklHeCc/PhEdeDJmTFhJ
         zi7sxMtviGcYPP99uJbi4R0yV9q6cNjgwLZG1NES7IrwXglZ7xdKyRNZqiJ2zf7x/DmB
         qKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785525189; x=1786129989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEl0Q/KtLX+7iLgYwaqoubsfIcK7cbxTLVO46xMCJno=;
        b=BAIGQw4Y1TM+GuqPyxzGInppIwans5SFtoAVuNSfWNGdWUcXDdw3cDYrdwcI5uCSTA
         10TogLpy/x8dRY+FroWczrUFD+NTLoPS4Wjm7lM4Ef4tO6EFJ2cG3wh0odcZ0twmf982
         6h+sBf3vi0wcR1WR4V9FXPK+yoQLWw7wyoArGcSSL03gjWnpRWRI4oZ2Ms+w4S5rXKC0
         nKj+kHIO2USR/dBCR5BVZcXYf5ubpZsbDgapO0KrY83X7zeTi76eVFN1LK7hOu5seqoC
         V84dgcEwH/gCAkQQ9lqKv14U1o+KO+1t6eS0xBwRGFdfuB6b8uvgi80oK4RnRNMfC5bW
         OMzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoteYHwMZbfLFwHV+WpByh6sQIDKkHNwjPUXU5Ia1d1zpAjg3fTb1BOZ2kUlrInlQ65IjovnIDbXL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCRNgoIST2hXaF+w2ZfAsxTccSMKXf6jXBds3F1aMsJW6CGRs+
	gZcwPrA7kcWSJRxOL5iCfFm7bPEZZ+XtzI2o7uKGVeRyABhliCtTccJXAPExCakrog2CtBRd0kN
	lV4q9XJncEk2G8Kw/wBZNYJW7LsgO79XEz/gHbWUYsgHd0RqWWSFqtIj+AXNi8cE=
X-Gm-Gg: AR+sD12DJzjivrkHzk0K+G3oAKLCCg/OebfK3Gq5DCg9T28j5XIOVH3g69D8mRoz/zY
	Chq8N7t+A66excy+QZ0OhRTb35KGOm1uu1X1CtXjXHs5NNtwWrkifZDq/h4MmFfWrr38V3Cyrvk
	8iGMeTQZUOkC3PIXt9k+2ogqkCYBR7PN4mT+wWdfdMEVc4n8EsO49ed1kUqKGeIyjhid+Eo7gQH
	LZGmiX3hbQsnNR50sELJMGWmC+y6DtDIWO2JZVMm6j3Jqip5Ci+ZY7/uvzLjjIWSaZjFaagBrKJ
	MFm2kdQv0n2ehsUj+thcbO44mVV8ucFX1jKgvVSKlO6PK/Ri3uxbznxlGf7tHId4sVOrl4Wn1aC
	3zhxsb5zsG0KOZ1Wsp3RPW8HpmHuhZ0o=
X-Received: by 2002:a17:90b:4b8f:b0:38f:9b7:8c92 with SMTP id 98e67ed59e1d1-38fbc5607a7mr847813a91.34.1785525188864;
        Fri, 31 Jul 2026 12:13:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8f:b0:38f:9b7:8c92 with SMTP id 98e67ed59e1d1-38fbc5607a7mr847793a91.34.1785525188500;
        Fri, 31 Jul 2026 12:13:08 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4d10bbsm4945869c88.11.2026.07.31.12.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 12:13:08 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 00:42:45 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Maili Graphics Clock
 Controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-maili_gpucc-v1-1-9d8c37bded69@oss.qualcomm.com>
References: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
In-Reply-To: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0NiBTYWx0ZWRfX0xutlPyLfkIX
 O+xRv3AO42VjJumLCWYycArAfM2ut0U0uaxnLxqiRA89Mr87Z6C/hI8cw9gVMV60s63EEx7cR1k
 pgLxQ8ZsSAwPOYHFa7xNsoVU7V69P/k=
X-Authority-Analysis: v=2.4 cv=GpByPE1C c=1 sm=1 tr=0 ts=6a6cf3c5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uNidFYLHKZSrdiSmO6cA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0NiBTYWx0ZWRfXzIT6JcTCootX
 ZwBdg87HAhsE2kHX+YNewZTzBNrh9KTT6Df+CAeQNn4pbLd64D74yZpQ4bXMCCPvQSpXCjPQ8+r
 9aKzigLoscgiHyXfPX6ug8rDuJBd+1+BDBkh1XQMFWXLNQjhQrUGTxUPH24+AtXYWYucsegFf/6
 1ZM2SbqtejIKS+56qJpc+GkCzOHTO07Z88RW1ZGzdLSah9kj0BVAYTZxMidnCACFf1owxgfp4wB
 PBQAy7qRJeXG8qiFOeJugCNo+LxPU5wVZU5TVmp/iQNi8qGlpgA1QAGcoummp2h6yJ9QvtnMbA9
 qMHhVlk8McECCkLnbl+ZBq4RuvE8Fycs6WumqVsDjdGG06BrhDpARsrcQaJw4JkO++9+KbFRGsC
 QOD4rYDxdIfI/NioPnuZxV2tL1Q0rdcICn3/2wv/Q9iHYDvDIJM31s434GSB4yTdDUyQpSX2mN9
 3/sxIumnHYYPJkH5htw==
X-Proofpoint-ORIG-GUID: _8nNAX38X-xG15IUqR7yfjHoapXM9B9D
X-Proofpoint-GUID: _8nNAX38X-xG15IUqR7yfjHoapXM9B9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310146

Maili gpucc is a derivative of Hawi gpucc with pll0 configuration
change, and hence reuses the Hawi gpucc driver with Maili fixup.
Maili gxclkctl is the same as Kaanapali gxclkctl and falls back to
it. Add the compatibles for the graphics clock controllers on the
Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml         | 4 +++-
 Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
index 3e40bc3c061d111620a988ac148861ffe9b18b05..b7179d53166f8c72bfe59a290d0e5a406d3f08ea 100644
--- a/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
@@ -17,7 +17,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,hawi-gpucc
+    enum:
+      - qcom,hawi-gpucc
+      - qcom,maili-gpucc
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
index 28b653f6b64d5ca748f8d77f01a250dc0a3101de..94f84d5294c6df8d8c7ac28c26a89a27ad1b8ebb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -28,6 +28,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-gxclkctl
+              - qcom,maili-gxclkctl
           - const: qcom,kaanapali-gxclkctl
 
   power-domains:

-- 
2.34.1

