Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8774A36C5B1
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542011; cv=none; b=nlbNl8bDIldGGM+d45L94pPEYb9f8sEwkdF91lahaOO9SKx1ehXx2PsT0eovuG6JAYKMbIqNq4a4cKqAzCRncqnhy9dw2co8BowkoZvzXf/LKPUvm8UPXXYPkvbxkbW6snY5mrDPejFLgkAsCD0apQfkE6I4ZPwvnNrGOIzrz+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542011; c=relaxed/simple;
	bh=Q56vT0zKys9NsMi5zOMlYu4AZGoliX67NAMSEwOrFOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EaOgV3lRVcjegdj0UG/9J9L9clG1jKm8wU+OBAIiIC0MtI8rYb++OMnYRWG2j74FnfTyhOcH2rkL5gq1j6YbrSMHesJQRBU34W8QzIR3rDs3wsZgJasq8ZMXMSSF1sJWalAtJcmwOFS9bZnCd6TWMsNr0h3tNYmfg5E8qCRpbts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxjKLIsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/MT8mUk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxjKLIsl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/MT8mUk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RFCCt32379266
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7efec/OPcsXpTiyc42rnMXxKN6/QBxBrkP/6AKjtVKE=; b=fxjKLIslkKRm1Jpb
	GY3g3lpZ3TAzvcmAgYHRIQmy7TFiQ/JQZBq+tKHryyD7FKXrWlQp8S4vim5J2TfY
	7wGw8hydOBcnzzu6qLb1uYi580Megja5SPCC19cf8hdmv/LHC7yqmVJMBiu4vAwm
	Pk09mvo+w1ZCWuxj54YEzYA/zalTm+zTLRwXMdcQRL4yg1pWcwGEE7MF3ab2YFOe
	4AuQ4fgKZLRFV+EE8+JM23uzgaz6XvuFRGmZNjsRE7O00xUnOd1S/rXLDH1OcUkj
	K1a+cKBhRwEhg9jM9pmuqP1LbtZhJIkN+VDFmC8k4c5MxwscRQVAVrSFvGC+9B2q
	StOlhw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjrabth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 19:26:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f69eec6so59101785ad.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 11:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769542009; x=1770146809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7efec/OPcsXpTiyc42rnMXxKN6/QBxBrkP/6AKjtVKE=;
        b=S/MT8mUk2L0TRTriVA2zFOHPJFQeKWs0CCPei8HdzdTNn0F0YbaytBGYQjvotc3s5c
         GTEH9piEs0vwdUknH2NDZIKmCHwwj/efRDd/PPfsqywCo5lENrqTeXWFWhpzEGgxgB4c
         iBWOAz4283nPchAoUhW9IYWBnF90uPMwnPF9e7plzWJWavW7IWAToYzS+kZtZWh5l01G
         UpdRIOfalrDNWow5JXJlPuZVwZp5TfYTCQYOLrfxwrwYsg7f7sS4PNQiTXoM3IfrMYJh
         bl6Z4AauzRApCBlJjsQfrHTOymFF4uRBa97V8oLt8WtlPGzFtpqLNWslcjUgPojmU80o
         Vv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542009; x=1770146809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7efec/OPcsXpTiyc42rnMXxKN6/QBxBrkP/6AKjtVKE=;
        b=xVF+pFY9CACKCm5+eUJljHlsp88MTWzCvOvdeqsUfzsjgAppDV8QTxtrEAvirksJEU
         vw4jlOTIw6fhCFIqgSzjPr1aNY7ameie/EB1TNNhJMVBiPPwOLgGaWmCTpjEOxIPwgAy
         NjySKr96TIIqOMASA1+5YzxU0Vk0nROV789dEHW4hJKxPjy89ux2GhS0ZDhmCqQ9Jeu4
         jyh/PQvQylX9ilKzGvL0/SMSvIsMBCmCoIeAeCK2q7c95VmWToFiq+VLxqnjZ51vscdG
         n72UginHK/MqaB+jDOpewSV9woxahhgE0sR464dQ9rLHxw1k0/DRu3V13N6SCi77k7Ct
         Lf7w==
X-Forwarded-Encrypted: i=1; AJvYcCUPYA8tq6ApjEQ8swsLwGjsMwva2PHLWlvkM3bGR+u982sAmcTbdVSwowudykLGzvunrHVraJv/g94=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlCQwa/VEHHdNMf0+IPOkDtB5EfMr4gHTZG04vuT9rV73XFFBu
	dtaq28HX2rnp8yvAmHPLzp92De9shLzJFS8m7HFjV1zAnIK5dIA5DDRHQxGyxJ9S46sTFxEGRCF
	w3dZ9cTRFO6gkMXMUvupbrFL2qIPX9NfqETbbYXVVbbgCUcP+MCSQCOWSkxFv0lI=
X-Gm-Gg: AZuq6aId2Wl/ccJvhV5ksODsZThZKhkkPriIF5IckmWCX16NtzCnUa/8U7q3fcIdNZp
	BVXaPiB2+G2hpYHrnNzzExuEEjD4SFCJvo6MIm4vZi/E6TGfbsWWSp8O80/qoOeiEVNzSkx6Buk
	XervmpWZ8kn3zW50EelLrxLld+PZy8d1CxVCuncDM7Uf4aSmbe+HBp2ckwo/oAUDvRNneH030cV
	a4996ackHc1qQvDjKaGGp2P+Tu7iimNLZMb/I7FUw9YOBTPvbN5RGWpSSwzyuFtVl8/ztBzI5k/
	zskpYCqWHv0gSsHeOmwiIhH+uTYSFxKxxmLI7eUKWEQCSTk7jdrlbWu3R1z/Rwxz4771wYs5vht
	G6ayDWrWIPJapWO+KxLRNH0SgGx51K2qPoP/Wnkzh
X-Received: by 2002:a17:903:37d0:b0:2a1:2b5f:d16b with SMTP id d9443c01a7336-2a870db7966mr35000825ad.31.1769542009072;
        Tue, 27 Jan 2026 11:26:49 -0800 (PST)
X-Received: by 2002:a17:903:37d0:b0:2a1:2b5f:d16b with SMTP id d9443c01a7336-2a870db7966mr35000585ad.31.1769542008519;
        Tue, 27 Jan 2026 11:26:48 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm1322225ad.32.2026.01.27.11.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:26:48 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 00:56:32 +0530
Subject: [PATCH 1/8] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-purwa-videocc-camcc-v1-1-b23de57df5ba@oss.qualcomm.com>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7tiYiTsiAkJYiLOvO4SRm5Lin8rTKSCC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1OCBTYWx0ZWRfX1rJgdHOcU7Cg
 kyUE0CUlOwvPeAxgL2gLVFW6yzFikyIV0HHYgDSFOiCcjzigXroaEUNx1JYsPcdrYTx/+IZVBBv
 p9fVEHF+98adjvrP2aQpFJNOCzpiRFyTn0RXlqnbIPaXTgOJbrBd9CvUpa0ErcGbMVOf1YtiohJ
 wQVyy731SSmOwD6FZd+sCZOyN2rHST/P+ZokVUBByFhBfoLQt3TZ/lvZyOWBdGQ2O/a3omonZv8
 3ljel7DwWpqpKMxQyOcZ1iZNMpY1EEjzc0SYwuIW5URozU5rwVwt3GG54X/1SA/kUwYSzaknbbp
 4PxCeC2QYBKbJa43taydOXAoQ6wtuK8s8Fb+Zb7vwqjavCoMRd/RK+NbvUAEiy7XZxgXG5TwpFC
 oKKIf5d7a3xfeQzLb6EHeIxFSb2Y3E4hVuOxOMw3ll+5hKXno8vVz4Am3YptueeUMq6SeuE378n
 fpzMl3ov8oW+ayNavqQ==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=69791179 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RxPbs3uwKBDMNohP2qgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 7tiYiTsiAkJYiLOvO4SRm5Lin8rTKSCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270158

X1P42100 video clock controller has most clocks same as SM8650,
but it also has few additional clocks and resets. Add device
tree bindings for the video clock controller on Qualcomm
X1P42100 platform by defining these additional clocks and resets
on top of SM8650.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml         |  2 ++
 include/dt-bindings/clock/qcom,x1p42100-videocc.h   | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e6beebd6a36ee1ce213a816f60df8a76fa5c44d6..e8bf3fcad3fabc4f3b7e8e692c6c634d1aed9605 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -30,6 +30,7 @@ properties:
       - qcom,sm8650-videocc
       - qcom,sm8750-videocc
       - qcom,x1e80100-videocc
+      - qcom,x1p42100-videocc
 
   clocks:
     items:
@@ -67,6 +68,7 @@ allOf:
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
+              - qcom,x1p42100-videocc
     then:
       required:
         - required-opps
diff --git a/include/dt-bindings/clock/qcom,x1p42100-videocc.h b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..eb6c9b7264f8cbced7cfa0001903238ffa168431
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
+
+#include "qcom,sm8650-videocc.h"
+
+/* X1P42100 introduces below new clocks and resets compared to SM8650 */
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_MVS0_BSE_CLK					17
+#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
+#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_MVS0_BSE_BCR					8
+
+#endif

-- 
2.34.1

