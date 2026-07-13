Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2667E3DD531
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933479; cv=none; b=dn722F+Uv8R+RDg77K39SdKaOHtIT2gyIOTbPhVEhjwl41iz21smvrq1wxxXH0HsFWGzQuN/75qTgLUt+gscARoQE0gBdPv01jDElm4jv0GR+3nal5jZvAtKV626KuSCIlFxgZO3HQK4YFsyiPx78jQphvG6MracLPSzvn7hHIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933479; c=relaxed/simple;
	bh=AzmlBXROR8iQCdEb1BFK578xEWcRCr8BSs+1i6E6Fvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCtJ6N2f1kYwQEpt3yItQMR+NGRHp0HAImucwiPX0/+Y3oOp5YhWtbIPOh9gew0GYblWKh6ZfLXMfmFxu96LndWNdb3aAKzxEomBHqmkiNFlFBX+y8qgntIGqZgyheA2uvhP5xyQkdF7wksAWKQSS4eExGX+3ujR68cFvr0Svdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m38nCxlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9hRO5JD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m38nCxlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9hRO5JD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77RO0810576
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SLkAwoLVoj6Qwjd/dBDZ8C0ko9gsRMNeDqMng9Ci0XA=; b=m38nCxlMUljM7c7d
	Snds/9fkN9ZZrI/s329Y4CqL0s6ep2yMm6os9w2ivKiO8vj+Kr8i6+Uqatu5D/us
	uqOYTXENqMF5LaTJ8q0RcnIGwXZAynw3Lj/Bh4Y/4GasfFdeq+1yGXbZ2aKMWbkT
	fPPx/q/RFmSUNU8BPLon5BuvyV9hrE/ZtqVrL246yixbnIFxhPNhRnF4Finn7X1j
	D6E/5SPCV5XPf6h+IVutv6Cq2Az5PEfscXWd+qEIp2xCKV1Qu7z/wAzieBCUseK0
	LMrf/QRsilmAaib7Qmbdd+I9yuJx62fYioBEq7ws1FV8lT7W1MPV9Zed2S1uB6Yj
	eCLtZA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsre0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso3515691a91.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 02:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933476; x=1784538276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SLkAwoLVoj6Qwjd/dBDZ8C0ko9gsRMNeDqMng9Ci0XA=;
        b=O9hRO5JDF3TXWPXzUIXIKFu/SFwK9W3eXTOQXYKQVOEQZ4GBWVXzOePYCcEf+RQtjm
         4qtukeZ9OswcaSImlTfChka1pPO32V7r5/tlfU7ziJEB8GHbcnM8QIEbCGHoW8Thz7I2
         lOj7/pnqR9yg4LB6xyH9P2ZL1wiabKHHdb/nvZd7aLAaSZ4N8s3bJX1uxW2PtMhbBQE1
         DT5fxI0eVUpI6s7ikw05Upq4bmmdx5p7o1ulm/m6pYHtxA36hPVPRmN0Nfkm1iL92K1p
         i4HoC84evwPNDk8T5SFbkcc6bTfBIdTtalo2H9gjHH3Z+9AJyYEWsWn3L7+HMVxS4W0U
         lc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933476; x=1784538276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLkAwoLVoj6Qwjd/dBDZ8C0ko9gsRMNeDqMng9Ci0XA=;
        b=eE8Em3jHTvSg70hCCerwkiimSMcaIndVFJYWhR7zuTnqoD+Yl+TYEI5/jn606t83gp
         PWQehWnm6MpqMnFRxCaLvEMXX+xaDXj/v3+wlpKSFEjxe2WPKfYRZEoxIaI3MyZ5EMIa
         6kI2upb4b82oo5OrxIzqklrPdw2AOGIATQNJZrESBnUBPu3DHKJTXyZ6bShC1nl7cG/P
         KW5s2EYeG9hDbbFr447mnFz7Z+oQXQIk73Npq8ncMmF4kV237mcGIk5lgDLEwb6aOmYe
         RP45OxQNAUTYXPZsCrcd33IeNnI620gO1KwjJpgNCyNR59tuPoBrIg9m+J+06cDFX64N
         7JNA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8iFCPvHYe1EL+G2xkx5Psq0azSoc4cn4BjTFDQn3aJlbOxSrlkZXk9hsOXIGhyG3ch/0EyfCyp/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YysAGRKVq/Jrq6RzQzosLla18zuu2Z7+y3L9HsPvTcKn1G3ULKA
	4zINrOuWgr8mHlczKO6r7p+F3SREgvAu/vquZeJ6QUGVbo9wPgqjYSzrFRCDmAfBUBDHVbrAyoV
	Z/kzt/OwM/jIfCZg2CSKWspuzL7nfsvE7MgZvuAr08tRV7sM0Ny3dVeV+teWhZ4giCQY66Tk=
X-Gm-Gg: AfdE7ckhHi51EbkmRedUOCTy6UfgjiofsRThhaVAj3xDwMRv2uBYAr2mZJAVIX24tDI
	jLUtur9ovoKoNu5kYWN6iG7Ljzda6PxVlAOkAzjtToDBIRmYrP8PXdQIhOhpIxNOKxPFyBpvT0K
	mwwZI9QSId2QzgGoScZU98t4TsFGHXpqxCbfFMtTfEvFXEaOmYyypH84ut//tV/UlBcLYeVGYhv
	mFzxJnvntHnlAHcw1HsOK8r9RKq11LACTZBOEUbU/JDqoKCQQI6frQ6wC5J9COpk8g1GiZZ42kQ
	fCRjLEPfpXMZpknuifEgT51LC4gvqvw8e1XZegRn9zcNKvzGP2lZoZVlSJpRTb293bkQE+LL5a9
	ocCf0iIqt5WpOG55X9WEL3NYvYPixRfl3Puc=
X-Received: by 2002:a17:90b:164f:b0:37f:9ce1:735e with SMTP id 98e67ed59e1d1-38dc779ecabmr7418664a91.31.1783933476015;
        Mon, 13 Jul 2026 02:04:36 -0700 (PDT)
X-Received: by 2002:a17:90b:164f:b0:37f:9ce1:735e with SMTP id 98e67ed59e1d1-38dc779ecabmr7418618a91.31.1783933475496;
        Mon, 13 Jul 2026 02:04:35 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:34:09 +0530
Subject: [PATCH v2 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili_initial_clock-v2-3-79548f0bb58f@oss.qualcomm.com>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
In-Reply-To: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54aa25 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4s9NPNi6RWkeKLmGOYIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: J-oi5cu5Cp0ZDTPb8WjKsuy6YZjsXZff
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfXx1lP7vvtBP9m
 MS39VRmGuGJvVX4d6FyKd+HBk6WCsUlDsOddJQwMXgoGcJwVbmpmK0UqKy79K3yv+gLT+QSXtTE
 1hAr4snEvGlkUvPySq5h0jyMtisWajE=
X-Proofpoint-GUID: J-oi5cu5Cp0ZDTPb8WjKsuy6YZjsXZff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX/KP7waWw29p7
 dxxaC7CTFluSWbhcmrFcjXd3bNtJh96n8JZNiDPD/bF7wVLec2mM3VyBNtNNpHamVO0EYwsLFez
 ADHfZfxGMN17v8glOVIDiDudi3eZSn6w681RTTKqyLG4OThDTT2dHhfar7yxvt/oZajo6YMVksk
 FhHgAQiIs7G53sISljMtgt+bLDFmgHQ546MMQDDLHv/JNwp5if8Cb4H3EfhBLYGigUzGjJyKAm0
 CvC+hdQYwgHDtUq+OVtF6rzddyPW+sRQlfiQKbBElZw7oO4fgq1IlruribHagjtwUiaAwHnTxtP
 2JGAayrbGukP3nhQLwLMkkeUPgJamaYq+XpG0imHa62v2EBbL/M+BBXZOVBUFhnKjk9TWhgcLs4
 zj655y4+sLBt3bfIkpPTFmNPgtnxPlRhVQnN4MNmN2B7QjETZ4YmdjPrTha7S6+axiZls0ZeM8k
 o+q34JuuTJRbiHu69Hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130094

Add device tree bindings for the global clock controller (GCC) on
the Qualcomm Maili SoC by extending the existing Qualcomm Hawi GCC
bindings, since the Maili GCC is identical to the Hawi GCC apart
from a few additional clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml    | 11 ++++++++---
 include/dt-bindings/clock/qcom,maili-gcc.h          | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
index 4f428c0f7286e83683a65cbe60b2cfeff67f5b8b..2101f4e4bb0d37f5cff42290f88c2f816038c402 100644
--- a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Global Clock & Reset Controller on Hawi
 
 maintainers:
   - Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on Hawi.
+  domains on Hawi and Maili.
 
-  See also: include/dt-bindings/clock/qcom,hawi-gcc.h
+  See also:
+    include/dt-bindings/clock/qcom,hawi-gcc.h
+    include/dt-bindings/clock/qcom,maili-gcc.h
 
 properties:
   compatible:
-    const: qcom,hawi-gcc
+    enum:
+      - qcom,hawi-gcc
+      - qcom,maili-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,maili-gcc.h b/include/dt-bindings/clock/qcom,maili-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..9bea90adb988ed9050ec30550d8723ede01ff6d6
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,maili-gcc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
+
+#include "qcom,hawi-gcc.h"
+
+/* Maili has below additional clocks on top of Hawi */
+#define GCC_QUPV3_WRAP5_CORE_2X_CLK				188
+#define GCC_QUPV3_WRAP5_CORE_CLK				189
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK				190
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC			191
+#define GCC_QUPV3_WRAP5_S0_CLK					192
+#define GCC_QUPV3_WRAP5_S0_CLK_SRC				193
+#define GCC_QUPV3_WRAP_5_M_AHB_CLK				194
+#define GCC_QUPV3_WRAP_5_S_AHB_CLK				195
+
+#endif

-- 
2.34.1

