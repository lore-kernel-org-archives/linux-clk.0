Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A8E3FF1BB
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 21:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842790; cv=none; b=D2rvnsvSgvg547sNTGXJMdeBOXm3R5cKuRpW5+8k6ahXGtOj8M2PFLxGYTXUtZ7HrBvVVV4sQNrf9+rVhU8fn2UL9EiUQe01W+plLZc3pPrxfQHZFaUxliVvhd1+mrRjVerrpL26f9WprdhpRB2MEKj5HNO5VpGwLXBIa6sLuzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842790; c=relaxed/simple;
	bh=UlHHjeUs4qtF7+tlF/1bOMeXAjrF3fHbE7UjpwQKG8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZUhrmciTdnL4RAnC+vwy07lkJYX5zk/r1ooKEdpZRcvP3fN6Uh94PMnL70FaXxOEkh46uIYSDqkSVqoJ6FK9km5RgwC1ljlzwg90bZLbaJnwCPgQOcXxwfG1lFhOV61y1vJufDzhPvsZ7eOe4rx7cqpSOXyEHXJ4mtbRGHM/Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJzfTAU9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ep3GNN/8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJzfTAU9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ep3GNN/8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NIm43f828120
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 21:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDlxtjvdkhwl9Rdwpe34LqXjiMLtoLJH3Z8dev61p+g=; b=PJzfTAU94Z8wP4OU
	/nn/On5ZSxwwdfR6I453unSl7UW4A3+4NQjYoxCjGjkvN4NTBngTzSYERZuc4/Pf
	xYXXFfBfuoPk0s1nrYfeowleC9qDARHtrAbK4tYWj6u0eFCsyZntep8b0nuuQ4TO
	NknTR8DtZk0o9AZ6PIHbTV57uR5a+iCEvB+4Rr+CWDTc8EErwHXROR2tJbrX42YB
	XQLeRC8Jc/Q6d/zNbBnavEaH70Zruu3C8yLkGICuebNxL6wUtilwS4RF5eefnN5D
	HVG1Dr1+IAsdF2sVixcTe5ffssht8tpXb9g+hqvGdhdTywp4mRfh9Jo3z3WmWn0T
	409HlQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamrwn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 21:39:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso1047412a12.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 14:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784842781; x=1785447581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDlxtjvdkhwl9Rdwpe34LqXjiMLtoLJH3Z8dev61p+g=;
        b=ep3GNN/888bv8OCAFgqDS0gnNW2msaUNU2xsXxxI7yUDKKnem7MVCfhNCbejS631Nm
         X1/q62uPiTn+63MO3Gjzo2kLrk4tTY2mBLYOdbWXdDTeMGkrNG2g3p81iy2/wyS61BNf
         1CGTGSpLYJeZDMqGavS6sSzLlh9Ui9u7n6m5iSY9SoAjm9wy5GXGyyzYG01xJspffj38
         0/X8tJZSOHnKjr0DFPwTa1I2t1QrBXWVEWNC0U5Ov5R1Dnf9tvXDp6y3bcXKiK75UI24
         o3YMOXsXDa6z7v2nLvdXyAf6Jcz/5ICHITc9CSGUpwg44xkZda4biL1PA5sMtxaLPUb2
         Spng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784842781; x=1785447581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDlxtjvdkhwl9Rdwpe34LqXjiMLtoLJH3Z8dev61p+g=;
        b=hDBWLmZNONV+OxXWZhZRRj7I2vXLGE3Q2YoDCCxD4dttX0Uide0QBsCrCvdF1upbSC
         EUWWi1uvVw8dcRWoSo9yKM6o4Ib741pXJjwfhXcEk2IY4cYMssVbAdPbc7NrnqDduWW+
         1vWJ2JOeaEU3VA1qlegw0S1aw5V4FO6Nqd4QK6DPOWzhhXrbPkgsMrkNlpxjpez/NgCM
         CG4H8vMMcFjhLzNFBP3Ej7U0LSulIaHLjWM2PkIvIqvyJM2iPUqO3TnpiEHOR4VniWfx
         p/1zOSBHJlm6qfFJVLJbqaZinEupjZY3RYo1wzg3lb0M3dBrTa7a6eZNaR9XQHtSoX9S
         chjg==
X-Forwarded-Encrypted: i=1; AHgh+Rpke4GYWsm9FMpjl0N0JkTGoal5K4Mm2ZzTd63C/3BPiwIHkxILb0uIOAzp926SjzZTQEmsytdb5jk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYpsAs9tpG1OgU0O85uJqYu5hRfvdiQ2gJqn0E2OFTT/qbzYKm
	nMqjDuakeKLmqimBK+Ez/BfuYkB+poQ1C23LGG0ntefh+VeLZZAB2UnP+xAGaTnlfniTSMjSrS1
	Cc/YvWBoNI1OjQlC4ilJwm70B5Rk8p8lhXexUfl+oc5Wo15GSxgVyTwpQvCFH6Fw=
X-Gm-Gg: AR+sD13Z8l3tvL6KWRCpqfkzOfhFALXiEkHlqqNWlpBE+uf4FsHHAq41WRdMHr9EEsB
	b4Y9uL+UuTM02L2F4zkCH9BbjQc04D5pnm6UrDDW7zILSojTB1OzK6JhLJBzta9Cw8XNmuz/u3S
	f6BLS+4BapQUVxDNZHZAlA5BU/UJ0VQK0ce/m5MWI0x/8SL9DFVjHtzU+E1TG3l0dgInkrsVQkM
	VJIYRVhS7a7kOYG0/UgVxdB4Ujk3c+Mtrg0YnvzDtrx9y2/VCRSPQrdNokQMY7l4DQoGkhwi+k0
	rTaZZG++1MFUDKG0Olptad8vfBye4NTfnNEji90ZcK47JuzLo9NHgErjlju2FwWjRLnJzE/EA2F
	c5i5DoLeerFE3ePzoSrBbpIX0QxIft393EONGEMXhcF+PongQ6UxHgcg=
X-Received: by 2002:a05:6a21:69a:b0:3bf:7498:9cd1 with SMTP id adf61e73a8af0-3c44b159054mr5423715637.45.1784842780612;
        Thu, 23 Jul 2026 14:39:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:69a:b0:3bf:7498:9cd1 with SMTP id adf61e73a8af0-3c44b159054mr5423697637.45.1784842780076;
        Thu, 23 Jul 2026 14:39:40 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e070538sm22904174eec.20.2026.07.23.14.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:39:39 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:38:57 -0700
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-camcc-hawi-v1-1-7057658c5c47@oss.qualcomm.com>
References: <20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com>
In-Reply-To: <20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784842777; l=8640;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=UlHHjeUs4qtF7+tlF/1bOMeXAjrF3fHbE7UjpwQKG8Q=;
 b=DH2txUeMcn2KgSwzF+P7qKdzAaUtztSWsXdP+9buQ7FxYeOQ1Hcx94LZWn7A1XUhMO70VYaUQ
 JLXn3TcRlRXAD3khwYpiM8xnT44FeXyFW0dkAFm7FISNbyGI5sS185m
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDIwOSBTYWx0ZWRfX0W9bUFXZBW01
 6Waey11zgQq7y9iRFxyDTSQxgeufD4HOhBUGXJyKSS1nOQFERF6oo2N+pcM3Q8lymQ/gE324Eae
 OPNWYyeW+vnKaBKjhpc/bO/dRRNZq871GH1L17DSGDcg4Dtg0ucnN/o13646Vdtcc5BLWpDk6X5
 +kk88CPkYPBdEKK6Mo6Lv7rjRw5/2rkRfU8B/I/6hAJtraBVy0812q5mIBAaUC8rrTfG0Q7bUx5
 sSChFY201F3lgdeLDer4+MxKHfif4KALSzYVPnhKLmSDl9yhXEZM7XhRcOFhNA+lemEOiLxXQp4
 KbkaYd9nve8LWVHK6XK+huCKNEwZLWbpiZlTC4CIWAysiO66/sRlfiKDUwCixa9R9P3A1WAhBKZ
 mEjd9cZN/lYeFJEVIGiNh3X2+6sBDtXRzVGXgWFjsvTUI2t81NO4Vh8tX/aYOAULoZ2P0x3QO7j
 ZOP4tjfuvU9CSFjDpZw==
X-Proofpoint-GUID: 6dlju5Eq04yC-hr5e3EZt1ERhUVvVqT0
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a628a1d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EHHCaTPsYsbjK_O0ER8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDIwOSBTYWx0ZWRfX9gve6wnsa5pC
 kFemvOQfXVGt4Mk26ZehtxjN+c0mNSxBoSC7XPyS311VOIuDo52+lQ70jHBsaZFheVfI2keRG6e
 aaeTh/I/x233J0IsngJ+Zus646sr+6E=
X-Proofpoint-ORIG-GUID: 6dlju5Eq04yC-hr5e3EZt1ERhUVvVqT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230209

Update the compatible and bindings for camera clock controller (CAMCC)
support on the Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          |  36 +++--
 include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
 2 files changed, 192 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index b41247b257b1..cdc19418c064 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -16,6 +16,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,hawi-camcc.h
     include/dt-bindings/clock/qcom,kaanapali-camcc.h
     include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
     include/dt-bindings/clock/qcom,sm8450-camcc.h
@@ -26,15 +27,21 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-cambistmclkcc
-      - qcom,kaanapali-camcc
-      - qcom,sm8450-camcc
-      - qcom,sm8475-camcc
-      - qcom,sm8550-camcc
-      - qcom,sm8650-camcc
-      - qcom,sm8750-cambistmclkcc
-      - qcom,sm8750-camcc
+    oneOf:
+      - enum:
+          - qcom,hawi-camcc
+          - qcom,kaanapali-cambistmclkcc
+          - qcom,kaanapali-camcc
+          - qcom,sm8450-camcc
+          - qcom,sm8475-camcc
+          - qcom,sm8550-camcc
+          - qcom,sm8650-camcc
+          - qcom,sm8750-cambistmclkcc
+          - qcom,sm8750-camcc
+      - items:
+          - enum:
+              - qcom,hawi-cambistmclkcc
+          - const: qcom,kaanapali-cambistmclkcc
 
   clocks:
     items:
@@ -67,6 +74,17 @@ required:
 
 allOf:
   - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - qcom,kaanapali-cambistmclkcc
+                - qcom,sm8750-cambistmclkcc
+    then:
+      required:
+        - '#power-domain-cells'
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/qcom,hawi-camcc.h b/include/dt-bindings/clock/qcom,hawi-camcc.h
new file mode 100644
index 000000000000..6ef731738e6e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-camcc.h
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_HAWI_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAM_TOP_AHB_CLK					0
+#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
+#define CAM_CC_CAMNOC_DCD_XO_CLK				2
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
+#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
+#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
+#define CAM_CC_CAMNOC_NRT_IPE_SCALERS_CLK			6
+#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				7
+#define CAM_CC_CAMNOC_NRT_SQPF_CLK				8
+#define CAM_CC_CAMNOC_RT_AXI_CLK				9
+#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				10
+#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				11
+#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				12
+#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				13
+#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				14
+#define CAM_CC_CCI_0_CLK					15
+#define CAM_CC_CCI_0_CLK_SRC					16
+#define CAM_CC_CCI_1_CLK					17
+#define CAM_CC_CCI_1_CLK_SRC					18
+#define CAM_CC_CCI_2_CLK					19
+#define CAM_CC_CCI_2_CLK_SRC					20
+#define CAM_CC_CORE_AHB_CLK					21
+#define CAM_CC_CPHY_RX_CLK_SRC					22
+#define CAM_CC_CRE_AHB_CLK					23
+#define CAM_CC_CRE_CLK						24
+#define CAM_CC_CRE_CLK_SRC					25
+#define CAM_CC_CSI0PHYTIMER_CLK					26
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				27
+#define CAM_CC_CSI1PHYTIMER_CLK					28
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				29
+#define CAM_CC_CSI2PHYTIMER_CLK					30
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				31
+#define CAM_CC_CSI3PHYTIMER_CLK					32
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				33
+#define CAM_CC_CSI4PHYTIMER_CLK					34
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				35
+#define CAM_CC_CSI5PHYTIMER_CLK					36
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC				37
+#define CAM_CC_CSID_CLK						38
+#define CAM_CC_CSID_CLK_SRC					39
+#define CAM_CC_CSID_CSIPHY_RX_CLK				40
+#define CAM_CC_CSIPHY0_CLK					41
+#define CAM_CC_CSIPHY1_CLK					42
+#define CAM_CC_CSIPHY2_CLK					43
+#define CAM_CC_CSIPHY3_CLK					44
+#define CAM_CC_CSIPHY4_CLK					45
+#define CAM_CC_CSIPHY5_CLK					46
+#define CAM_CC_CX_GDSC_CLK					47
+#define CAM_CC_DRV_AHB_CLK					48
+#define CAM_CC_DRV_XO_CLK					49
+#define CAM_CC_FAST_AHB_CLK_SRC					50
+#define CAM_CC_GDSC_CLK						51
+#define CAM_CC_ICP_0_AHB_CLK					52
+#define CAM_CC_ICP_0_CLK					53
+#define CAM_CC_ICP_0_CLK_SRC					54
+#define CAM_CC_ICP_1_AHB_CLK					55
+#define CAM_CC_ICP_1_CLK					56
+#define CAM_CC_ICP_1_CLK_SRC					57
+#define CAM_CC_IFE_LITE_AHB_CLK					58
+#define CAM_CC_IFE_LITE_CLK					59
+#define CAM_CC_IFE_LITE_CLK_SRC					60
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				61
+#define CAM_CC_IFE_LITE_CSID_CLK				62
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				63
+#define CAM_CC_IPE_NPS_AHB_CLK					64
+#define CAM_CC_IPE_NPS_CLK					65
+#define CAM_CC_IPE_NPS_CLK_SRC					66
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				67
+#define CAM_CC_IPE_PPS_CLK					68
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				69
+#define CAM_CC_IPE_SCALERS_CLK					70
+#define CAM_CC_IPE_SCALERS_FAST_AHB_CLK				71
+#define CAM_CC_JPEG_CLK						72
+#define CAM_CC_JPEG_CLK_SRC					73
+#define CAM_CC_MMSS_AHB_CLK					74
+#define CAM_CC_OFE_AHB_CLK					75
+#define CAM_CC_OFE_ANCHOR_CLK					76
+#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				77
+#define CAM_CC_OFE_CLK_SRC					78
+#define CAM_CC_OFE_HDR_CLK					79
+#define CAM_CC_OFE_HDR_FAST_AHB_CLK				80
+#define CAM_CC_OFE_MAIN_CLK					81
+#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				82
+#define CAM_CC_OFE_MP_CLK					83
+#define CAM_CC_OFE_MP_FAST_AHB_CLK				84
+#define CAM_CC_PLL0						85
+#define CAM_CC_PLL0_OUT_EVEN					86
+#define CAM_CC_PLL0_OUT_ODD					87
+#define CAM_CC_PLL1						88
+#define CAM_CC_PLL1_OUT_EVEN					89
+#define CAM_CC_PLL2						90
+#define CAM_CC_PLL2_OUT_EVEN					91
+#define CAM_CC_PLL3						92
+#define CAM_CC_PLL3_OUT_EVEN					93
+#define CAM_CC_PLL4						94
+#define CAM_CC_PLL4_OUT_EVEN					95
+#define CAM_CC_PLL5						96
+#define CAM_CC_PLL5_OUT_EVEN					97
+#define CAM_CC_PLL6						98
+#define CAM_CC_PLL6_OUT_EVEN					99
+#define CAM_CC_PLL6_OUT_ODD					100
+#define CAM_CC_PLL7						101
+#define CAM_CC_PLL8						102
+#define CAM_CC_PLL8_OUT_EVEN					103
+#define CAM_CC_QDSS_DEBUG_CLK					104
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				105
+#define CAM_CC_QDSS_DEBUG_XO_CLK				106
+#define CAM_CC_SLEEP_CLK					107
+#define CAM_CC_SLOW_AHB_CLK_SRC					108
+#define CAM_CC_SQPF_AHB_CLK					109
+#define CAM_CC_SQPF_CLK						110
+#define CAM_CC_SQPF_CLK_SRC					111
+#define CAM_CC_SQPF_FAST_AHB_CLK				112
+#define CAM_CC_TFE_0_BAYER_CLK					113
+#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				114
+#define CAM_CC_TFE_0_CLK_SRC					115
+#define CAM_CC_TFE_0_MAIN_CLK					116
+#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				117
+#define CAM_CC_TFE_1_BAYER_CLK					118
+#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				119
+#define CAM_CC_TFE_1_CLK_SRC					120
+#define CAM_CC_TFE_1_MAIN_CLK					121
+#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				122
+#define CAM_CC_TFE_2_BAYER_CLK					123
+#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				124
+#define CAM_CC_TFE_2_CLK_SRC					125
+#define CAM_CC_TFE_2_MAIN_CLK					126
+#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				127
+#define CAM_CC_TITAN_CAMNOC_XO_CLK				128
+#define CAM_CC_TITAN_MNOC_HF_CLK				129
+#define CAM_CC_TITAN_MNOC_SF_CLK				130
+#define CAM_CC_TRACENOC_TPDM_1_CMB_CLK				131
+#define CAM_CC_XO_CLK_SRC					132
+
+/* CAM_CC power domains */
+#define CAM_CC_IPE_0_GDSC					0
+#define CAM_CC_OFE_GDSC						1
+#define CAM_CC_SQPF_GDSC					2
+#define CAM_CC_TFE_0_GDSC					3
+#define CAM_CC_TFE_1_GDSC					4
+#define CAM_CC_TFE_2_GDSC					5
+#define CAM_CC_TITAN_TOP_CX_GDSC				6
+#define CAM_CC_TITAN_TOP_GDSC					7
+
+/* CAM_CC resets */
+#define CAM_CC_DRV_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IPE_0_BCR					2
+#define CAM_CC_OFE_BCR						3
+#define CAM_CC_QDSS_DEBUG_BCR					4
+#define CAM_CC_SQPF_BCR						5
+#define CAM_CC_TFE_0_BCR					6
+#define CAM_CC_TFE_1_BCR					7
+#define CAM_CC_TFE_2_BCR					8
+
+#endif

-- 
2.34.1

