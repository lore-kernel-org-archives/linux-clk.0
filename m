Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A7227281D
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 18:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758271; cv=none; b=nMVddfECCVzdDINNtM0mstUICJl57Tw15YcJ2IQdDcGkdG8ozPZXzON18ko7834DVvFg47ogfpFmLYl3pLRooIPETiCcnMBM8litGrgEuldP6o4B+s3Ktzcv2y3Ki/0DIlYuZ2BRw2gVwYi3ZQ2+KA6jiiP0yN+RRDcriZap4O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758271; c=relaxed/simple;
	bh=1yjzO1sLMiJzWkzUgEx7Z3qRZZ14NfNa5E01DO1kMUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QvcglL2RU6jfMRLOw5r22N0zWvCnPaRdZLq10M9VoTzCov7MinndRICqSr5jZrPg8va5l1eJPZhbA2/yfRLtE2bjgwmo2XZG+iQwDsUbzpbCQImZlAo731AQ2FJNzkNKGHE+tbT1XScWLa3Z8iSjmAjOKHxOub8vgG6fsYv/Mhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKvrJSQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeaynBQV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKvrJSQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeaynBQV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1R2M1972534
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 18:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=; b=XKvrJSQDAgXU8sK3
	xbOjc8eraxv+LNeSD8Eq9ob7R9xjRHIl6mnk/g5ngqdG4Sw4eTrnsf6lYhK8nXbV
	ZJnswpX7BKqcdN7CrMQzv91IJhIE2exj/5WnzYMrMqdVEBfECnIdmsGp4nR6iQZY
	IHITAuUgU0HDbIywHv6QQg1E7nd2/0VDlL7va2iN4++fTRAULc+plre7OWbCPhV5
	Zl7bNSYS2iFNujDhIYuLDgh/TEsTkL3HCgdyl1rSif8LHaMuz7sBtHSX3ZXkqXcs
	awVH1bllaa9171wbpCMBBuPtD/BMjEOGP3VUSaQmsH2RBgsZ5P756+tsgQP3BaPA
	bGJRBw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms1653-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 18:11:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76c60c74f3so875370a12.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 11:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758268; x=1776363068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=;
        b=WeaynBQVFyudviqQgMJ4eF8tOfnYafZNJ1PRusE1yFrn36rnJSO+uxtmEa+FAAyo4M
         VRbdUPEXAUFzCot8TxfeNKalNERCAAM4bpBBPhbIRpPX6vrSJLRoS6NreQDPe/VDArzY
         KFhXp4wX0ZPc1Bqe9ODfy2ElKNhuLc3fGs/hGUCnC/KppEXhPUnmcwU2yZlstRL9+9U5
         7ZDqFGm9x9MtfFW4EiZzX/L43e0BweYqgXQst/TCJgDmoW4QQlRUxLAxGGfEH3bIbxBt
         /tVEcAZzkeymrP5U4o1vojvl/tMlQHUxc4JJkFFrbBtuhg71hraBdu9KrdRvUgGlp7et
         EHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758268; x=1776363068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=;
        b=K8IXfEgc3q69Lc0esQiRxBEfW2C7kaHHy9x8Zfkh3I+SRSzyqWttgBXZ6/jIk0tpOk
         Wyd+76HbqfJgHdZ2/v+8VDnFRoRiHIhDDBqxkz7vp3/1rA2C1J8KyCoa+xhf4SBuKtTQ
         stG4AEHxk8EkH+ul9vccB8bGug8kQUTSnfR71wKG6l5ol7/7QACYE4oFGfkZZceFvlaC
         O+cE+nn5G0QFrFDaxG87E2oPi4C8eWpOv2IKhHYD1LoQF/t0OEoatvAXlVieJiqGxT/0
         3Upf1JFA6bupWmoh/oeolu9V+9ElAkD2UAJaVnKeSw2tVneqrJUq09Ruvi6qosgEBGnV
         dJKw==
X-Forwarded-Encrypted: i=1; AJvYcCXbU8SrAp+G8j9+MI2SesbU+b7/fyRBJCk7S2L9rLOrbUTwa67TqXffoGiifRo51dLCitB+HefbaSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRm2Yv/v5ilhMBaOctXo41OOpznPia6McpNhXCPLwS7qrFDV1b
	iGPV2sCMP/nmDjJpHtwNbBOjw4fKM2WNTtVfNvHwqekbzbbnFxiH2M8frJQGdLm7BBTSUP2bkHs
	FqXCXpsbSb6QcV0gAyHoVS/pEUtFiGiRmUHEQMk0HMtlNk52513vJxwH3BZTC0rmzUTWNQ6c=
X-Gm-Gg: AeBDies+wtO7lfC9gqI8qobaJgdpQMZUB7u/V1hKlJ/Ej9Iu2O11X9LeyWOMH5xkYvU
	MgvEUFoPMFwgwN2vRERqfI8T+q5zZqabUWu6hpiTU7MV5p2/V9++UnlzY7wS6z+RO8fPxMQ4iTz
	Bd+9PBcb32VnUUtqNTguOYYocAOWQHJ6t3gwOOzyDVqZ4GqF1DvwC3e8JzLm0DWKaKJzGnP2mLp
	GS2uVX5CuwtgKT7R/KBd5VxB4Y4A4SECR0TfpbACEj5t02hI4z0LVg3uDpbs/fNgmH4xsv7LDGK
	tgbhOBQNsxFyX2cf1NFDt+9EjG6ImuHqCvn7qRiEoffyIDE8sM9hh9xJLA/9x3MocGQOLJQ1yzx
	KsSHXm/p5BX2RJ02f1ZmnSFSyR+Dbl+t4vGoErbiKWR+vSg==
X-Received: by 2002:a05:6a20:3d0d:b0:39f:2b71:d79c with SMTP id adf61e73a8af0-39f2f2f733emr26752532637.60.1775758268185;
        Thu, 09 Apr 2026 11:11:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0d:b0:39f:2b71:d79c with SMTP id adf61e73a8af0-39f2f2f733emr26752500637.60.1775758267599;
        Thu, 09 Apr 2026 11:11:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:42 +0530
Subject: [PATCH v2 1/8] dt-bindings: clock: qcom: Add video clock
 controller on Eliza SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-1-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: KRbMnLr4mnoWMxRXtt2TXE0xsICKgNe8
X-Proofpoint-GUID: KRbMnLr4mnoWMxRXtt2TXE0xsICKgNe8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX9YUEobXdCc0f
 cd3BvkTZHZtpWdSKpiclQ4sLNEMnGr3yt0a7cAsFzU1Bn1lZbAqmdQBomzw5f+w6Qw0dX1R9ClL
 fiBWhoCy7amFfY9KCP+qjSrUDVwcgJlOrKSo2FVFhq8SEsXmfQst3aJ2mTdWbRZxvwHsgZnVGSl
 WU4Su+ZA/PL+c0iKHspjyKqHp4pwrczWSGqwi5lCzGbIUyo5dKjcj/bsVAEH8QmiNmKIrgke2uB
 vvWMAEW2FkwaEsumJui7GnR1gfE5glfCddThWi6amd7QdmVxkOtpdMJ04CXAlBNBg+kEW5nbzrS
 IbEmZcUmNCzymPeFU7t4LtFGXWyS/EfLjW9G0CKhoKegPUXkZH8NDXGYfNKMVf5WfMF856ITxfC
 MFqeL0z+LQgaySh8kMjB37uAxWycR+53KqN1wZNJPF1ekoYm75kRz0klxGlCVhUMegwBT4JCyDi
 R5kEIVRTnOinEwDUwzA==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d7ebbd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=O5AFsRJ8ltlpu4YWMHwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167

Add compatible string for Eliza video clock controller and the bindings
for Eliza Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,eliza-videocc.yaml         | 51 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..26a0c85f26b13ca8e7a4f5f418e8c98235f10558
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,eliza-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on Eliza
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on Eliza.
+
+  See also: include/dt-bindings/clock/qcom,eliza-videocc.h
+
+properties:
+  compatible:
+    const: qcom,eliza-videocc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: Video AHB clock from GCC
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,eliza-gcc.h>
+    clock-controller@aaf0000 {
+        compatible = "qcom,eliza-videocc";
+        reg = <0x0aaf0000 0x10000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_VIDEO_AHB_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
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

