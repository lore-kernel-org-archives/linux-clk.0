Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659444756A0
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865868; cv=none; b=M3995zcKNmyQlV3kIQhl4s1gBAz10/rDWmXgJaOpRPoy6Zw9RZQ50+j5RYuUMVtVuG1zCSVoFBPD9epBVIS6RMG3iASLHIB4G5AYKASbLtTYSTTrD9CBlfA66iaiBy0Yosz+kmTbsnT7/TDy5JGBynbLQBcJjjw+JDRDxJQuf/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865868; c=relaxed/simple;
	bh=B3TLsDqArP03LQKcA8ngy2MaXdpHgeOMi+R6ynsdPHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gzmuCxci3xMIdFWYvrTwNKktPftr2WdgzBXl9HrX1z78LA69Oi3/PYG0kvHDrZmeHXEt9gq/4MJEPbWheWiNK68Cni0IQIti/RTbGEflSDr5vHo1ymt8lnJA24xufOU2LJMkI6XmEbVdB/MTOuJiqvpnmb/ByDac0EFyyJ3PRfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MtZro+Pp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=habErOrY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MtZro+Pp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="habErOrY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H0ASk332967
	for <linux-clk@vger.kernel.org>; Tue, 4 Aug 2026 17:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=MtZro+PpmfRPxLfO
	TZQXNmFeTsF5cAnr3iwhnaLiFQNPciKWQRCWB6jTh0OGF4p0l3T/iaBE3pqcueMp
	f63KZ8vtN9c4Xi/Dm9fm+sbXX0bkkMSPp9FqzAZvtJpMoS1rIG+H/fUIqxy9ajWB
	OBXOEw6xK2TAguWvusbjyGhIXuz21jblHHtyJ8XyPotdhvTSavkTzSN0FPlA9wRM
	T3tOmYjUjsLi/P05CHzIfFLBkNlHld54MtljCxpc8nMmdu+MWXp7DiA6/zyJ9l7y
	jRGYT25mWjiT7L4phTC2XgGjRsshtPL3K9iPAidy3KXY3jdvhYWh80xSmbsy3wq3
	3pL/1w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3n88bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 17:51:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce8a76df2dso1906545ad.2
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 10:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865860; x=1786470660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=habErOrYe6dXKYYolOHW2KRa3EbHG6xsZHvRaWwerW2fyiqWf+Dwo6eJXynmyzzY/I
         Lk65HSrk2f0kxyOIMI4V6P1HQIQww4ybETHKOqld/SIPSBbDIMNiRce76aBvQNJGRn3u
         FFb4c8NUGMX2amy/lnx1/5JFjPQc2z3kDFBdXNqNS/tmJdAW6X2KQvifggGoJmna5y8m
         axadePPY+fZQlRLrKyuVsx22WVYbxlIyR4zIogz52eVxA1StPoCN/zlhaJDwL4LkuMtN
         Tmn5w0dO7wrI0l1W5VV9Dlg3x1M6svoCUX37LjO4OyBr+PJwv6Qu9JCz7/AccXai/F5u
         qY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865860; x=1786470660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=g3qCsJerqz/Bpqj0yBk1Fw+77xb6dwNcQkB8WRcp7+mr/B8w8tvZCgQVIinQDQBODB
         tz66Crj1KqgEOGaBeHXgOhpBa/8D3rE3unc/k9Mb+P3B6h0pLlVpKCmPLpO+dmh5jv86
         7UVVyfflxxs++v1bqjQcNCGh2+Sej9i2aTOsJA3kyO65au24fnERHRlqUD0/bw+iXckz
         DKxOBx8++uSiMcsOJ6J5rSw3hYIgdsmh2JfGYQXoMNKLiOkmtIGFJrP/CLL4aJaId1f+
         KmlXzUHtdhl9b8+z1AzGBjVYDAnbBlLgFxrW6WjUrCmzcrrI7+NaKLcXJY5p073Nk1eA
         4R6A==
X-Forwarded-Encrypted: i=1; AHgh+RpwimT1xyUtN/KkC9kO2UHFz1Qb5gckpS+tS2RcjwEutJWC0MqhxmT3YWGb9iTm3QXEdrOmSqO7cLA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz89GqwHAFcPnpwmSqZKCOEk6/Zo/VfiOLC74K6EMHHTB1CkS/0
	FXY/UIHvOJGf9zLGfO3MzFf1tX0N2VmZIH2kCrOAKyh1oOm6WyRD8qvYSt8dPK4aKZ6hlODuDcW
	xj7GD9prtuxkr2p28L1LG4zHiMjPTv8YtIaINj6fzOMA5wwHFtvJLsIXNQOgDDp4=
X-Gm-Gg: AR+sD13csEK1bj4M6Bcy1A4BYc9k7Yh2CPaKyMi6qEYosdrkZVEfnayHzGUO+ocHP+E
	SFAJe6teLjodDPy5Cv8A+SzdrlGC0pNp9fzNLfLAyOeoAQ/tGZXlb8Uo6A9ciFO4FZCQJDKCCSL
	qtxYiQJ1bmDbqfUfhkrlIoxnuDfrM+4NbnLKoow9qWaM64aeisTkxmXUfCcLiKb0zIMreEoktWH
	TEqMlCGTAjqnpTrUzDEuUmjSWr6ePMuhSftWizNQmqlR8tt/Mq3rAr+7Pn8VnXECvN2oyhpWb/x
	JiZgPFxt9gt4dhM0m4D98Sd1DiTA0L9fuZe1XNu31wP7GIF8GMVPMwaFQmQX5K6MpancitCy1Z6
	SjmnVN+DFGSDAUM+YwapfUPIE
X-Received: by 2002:a17:903:26cb:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2d0ca9620cbmr5665815ad.24.1785865860193;
        Tue, 04 Aug 2026 10:51:00 -0700 (PDT)
X-Received: by 2002:a17:903:26cb:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2d0ca9620cbmr5665185ad.24.1785865859768;
        Tue, 04 Aug 2026 10:50:59 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:17 +0530
Subject: [PATCH v9 04/10] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-4-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: gX0wNQ_f_xTbbKlqhsiro7gSynGT70D7
X-Authority-Analysis: v=2.4 cv=EvjiaycA c=1 sm=1 tr=0 ts=6a722685 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: gX0wNQ_f_xTbbKlqhsiro7gSynGT70D7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX4IU5Q1HQebs/
 aXy8YR2VRmWS4at1CVrB9Z/xANsNpMgoB/Sach6wowXZbVa4r4L14MYIxxDLnqODjgftjNeDrWb
 gDK6Gsp9ITu051S+fa9uxzhnO++Mtgk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfXytg2JtJSGDID
 VLzAgUxMNXmnjVNf1A5VrgBq171Zceh4mjrB+m8tBTffSyBBbEVOYSWFbjrMkwh1QiJaJeZV3/y
 D5LuNAVQVOCOaAIRta/gjvHgLTaY/v+2WMpf0yj9RaAOtPbiuiRX1tIHeMj/02mu/RSssWikNvp
 0KagcVFzKsCJAflr1bfV6C1D543xm4FFL+24Rz5p9PlgWhk0vtOSUWRWeg8IbNI4s/x7pl8Uwi1
 6pkpLK7osYAehoEQTQSDWUA6eM88VGwy4lamiYT1JGIhksjjqz+Lry9CA2vuMIVhDIMIitpQ3UV
 CZX5699E06QelFg713dW9CgoSmRkanN7IQi9IEXA1M9ErpTE0EtLAfMknZL7gmnDr0juTWlbIXH
 yzUvS6hzdWmHnlXOOpmXNHBSnmGO3mc/IM11EUyckwPk1+aagdQFpOHvqBclfKJZ/UWjY+hFwDg
 neHjjZmiOZkhDDGMBog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 4d8d109cd304ef0f5afc5c3fc7961a6156003d4b..08898f1d74e4ef0a3921eb7cc5f13d14bd02975b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -41,6 +46,7 @@ required:
   - clocks
   - power-domains
   - required-opps
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1

