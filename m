Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7B137AA81
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921399; cv=none; b=qIfIAA/TEZfNb5qiUGxkWFzmBkKb+7JVM4dOnAJVrXMY8FR60XgxweqI3E2vewtts84IBlYOWpElSPMdHml/bUAYy/zDHiOkC6cIs5PpxytFIlX3XdTwRq6mzDYbCi+pG7xbxA+uXOHds8q49HiWVEMXWrL1HL5RH5PyN8HQdGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921399; c=relaxed/simple;
	bh=yLAhiDn0TxgFXYbEMSZ21ewKhKqyCrxym96bpcjMQyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHudnzk+1CsP9tR23IBNVmITKnvnjjQQ0CD95NBSz1febWsY26X4ZhQKMOve6d3/T2EXQ16kfzLVldO8kU4yw5l0DgNdEdhT0vaaUHPDczz0ZO7uC2JDJSOC3bMiOiO9frYIbfLdB2OCiQayCvhYVRKOMQ1+BkXbuB65fbXWojk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeKNkLF0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7vvbAsE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeKNkLF0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7vvbAsE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9jRV2919901
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 12:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTWDxBuWyNKct2rjVP0PVZRb5Kz9GuUlQA8QIoN9hVE=; b=jeKNkLF0pygXz5Mp
	tJ7Gy5QEvp5n2UcNH54EiJQRZIo9uZBxri1z8Oy3QC3/e+389M21b+mCAqSxZs+P
	7PldzENShhErT0Ex+CsUb/yBkFTA1/5TNzIrnGlkz7G8Ch/hLePaqoVGrKwFe11G
	5cgvZzyC4N9y/EJ7cuXrTiJEFnHRDBtE83vjXoGI306t8Jv3xvy8g2vc33J8X5Ns
	mhEkjRwgCuMFbYXVDc4ECxVzvUdE+NOcifldQW4ps+sqxM8wXYL35bIMlhQUX1EY
	p3q0o11GQDwqKpnIrDBzNGylZzFOJNY9ZjCJGuBUwNgC+bj7l9jPYIs+UHRBthg9
	1zc7gA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgyhn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 12:23:16 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7d9222ae3adso76734207b3.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 05:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780921396; x=1781526196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTWDxBuWyNKct2rjVP0PVZRb5Kz9GuUlQA8QIoN9hVE=;
        b=A7vvbAsEJ2TLmxKotJBz8ZDH08LVw5yeL71gxe40Bbco/xZaYc8Jh7exnuOSMn04Pa
         UTw4YpnxXaUOD4eAdII8ALI9k/2cP8yud3DYZ9iKpqXPXzj9s5PvH//KckPurBuSMLAH
         tI2jLObk+yk2hVP6qNyAfWZER2T0eNxxyIdfKkQoCUs1AkpnnHoKSu7ZdCQLdOLKLHfi
         C1KJbO5+mtd8mSp1qr1G+nj+dDJZ3sZY7fpcjkPpm83TzZJEesocdcD6i+4VpUhIktwV
         OhKDG5/Sv5xcM8aDZ16fxFRxmLj9yIQI35PzjtzAo4thp4VddhYaDps0sUbf5kOtKOav
         DUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780921396; x=1781526196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eTWDxBuWyNKct2rjVP0PVZRb5Kz9GuUlQA8QIoN9hVE=;
        b=E9S6n76zBjEeSLPhaXXwZlEbx71u7dYc3uhKS+Nabu4bqoMjILpCPovMafKIDE/Ls9
         8NgPhyTlLvt3crYLA28Y53SunPLgGift7MLwcDuk6znNzD6S8X8S9xTfZj3nRHSLI6U9
         MtjOSghRIWYIy5ONzcDokVzfDenzNvYYm3+WcgMyoYr9gf1I2/Itvfptig/pLpfc2l5F
         +vVThLVlbE+p1LFJLHkhwnJTTHAe+EoH8c/AE8rK2Nkz1g+gJ5hFLR6wdZHxP0umyGyz
         LLZNFyqzbf8EwCoLAx3cmcMiAmFWEtlrkN2eRnYIgmUF09ZBiwg9zhK9hj5xqwQTNOyH
         ztAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XTRPhqOTpJcIB08fXXYd5mdA9QG45wtWFBezd4Q/W2jWkTuYKvpofTPdde7z10B+1i0ntf8awRBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTz0SxZXFFUDC/5H7760UniFLMMxw+F+XLitlEAaUubCixbIRC
	1MTjpQcClZshifmia5EMKjQtBaDjIiSzQFRlwnCFD8yNsGd8LMUTdAeh+rLmxZ4T/oomN1FkEh0
	zXESusuXhA7DssUrsd6hnEEfKDdGQShjH2xxgGuanqgGvy6KTGS6acJ7HBr6nf8g=
X-Gm-Gg: Acq92OFbnC0cp2zgJYTrgWmYFwZFoVSqVwRWF85ejSUfKA7g6M5TDUL/gyvanwS1/N2
	774+9lLVFteH1AdY9Tla6CDZiz/HtT8bXEzmjfN/4Y9h3FYmI7JjNL+s0rYHtsO/JBRlkRCnLb1
	5QZCKl61Y5Sx9nbMSSIDJgikAWKPxHjhSg4abPPTP+Lqrdg38s1wHUPn31ycGR9ObsEix/PlF6f
	Iiz+jWyqNwkmndEeq4XOn4tXPNQcDPYbJ2sM502GDkgA66gtk/6Mi4/QaiJd/v1RqMAWSfZQu5R
	v9hadkvYqOPU20rBfC8M1ySgKLT0E8iSNWsCE77fKPUJ/OopfbHr/nVmh6t+s9jUyfIV4cHgamG
	V7wFYeXzTg6GABUqkbt9/ycCgrXwbDhFbV8UF2P7NCSDNQu2NgPzPuOmipXI7NH8=
X-Received: by 2002:a05:690c:c1d:b0:7b8:338d:7d80 with SMTP id 00721157ae682-7ed0c32bd57mr143829717b3.31.1780921395491;
        Mon, 08 Jun 2026 05:23:15 -0700 (PDT)
X-Received: by 2002:a05:690c:c1d:b0:7b8:338d:7d80 with SMTP id 00721157ae682-7ed0c32bd57mr143829357b3.31.1780921394960;
        Mon, 08 Jun 2026 05:23:14 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea8186sm84076257b3.4.2026.06.08.05.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:23:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 17:51:50 +0530
Subject: [PATCH v5 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra SoC
 Global Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-gcc-rpmcc-clks-v5-2-94cefe092ee3@oss.qualcomm.com>
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a26b434 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=rEY_huOQuSSvoCxIK_IA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: bPsj55_yu_1b3-OPfeApSPQ49Ow7BIOr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExNyBTYWx0ZWRfX0MrebI054oZ2
 CG821D49+H8H9FUpdEIarnuJHUFXs6a8jU+n/6ZaREHpTmuyJS/mmp+Mox+1O+2kqr/YWpzP6pm
 RiJGw7yO0mCqYyucSJXYWoAG1j+VtSWXxL6CrMmn0sc/0evZxBihdEgrbLJ26igM8ScbxTlthRG
 TujY7Daaqrcb8jxNyNvnoEVsSOXNO2qDFTVwM6dQq/DPUGHlZB0TlLN/zQ9R1/Av05aj1qHNm6T
 d8bNHDzDjxYQvf0c8HkiVXoXyt5yxul7Uv1SpJGayVcvWF1cLwHK+eozz7rfY4oNs54ljmuQn4r
 eX3IK+Cz5FaX0qZlVq2l5iEPepxAQiFShU9AKxkrRvPvVVP3YuleGi6cA6TXpbk2Wy3UTaSfcbt
 kL9+5LlyGGb7hayMmYwiDcCRhywJm30TzMDRBy5Ote3p1uFMAihKxp+KFiCfnACkq9AybT5PMl/
 J69fpaLqf3q/ak85MZw==
X-Proofpoint-ORIG-GUID: bPsj55_yu_1b3-OPfeApSPQ49Ow7BIOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080117

Add device tree bindings for the global clock controller on Qualcomm
Shikra SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |  70 ++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        | 263 +++++++++++++++++++++
 2 files changed, 333 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,shikra-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,shikra-gcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..da6eebfa84c22c1b287c194992c04a54ca0aabf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,shikra-gcc.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,shikra-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Global Clock & Reset Controller on Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Global clock control module provides the clocks, resets and power
+  domains on Qualcomm Shikra SoC platform.
+
+  See also: include/dt-bindings/clock/qcom,shikra-gcc.h
+
+properties:
+  compatible:
+    const: qcom,shikra-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: EMAC0 sgmiiphy mac rclk source
+      - description: EMAC0 sgmiiphy mac tclk source
+      - description: EMAC1 sgmiiphy mac rclk source
+      - description: EMAC1 sgmiiphy mac tclk source
+      - description: PCIE Pipe clock source
+      - description: USB3 phy wrapper pipe clock source
+
+  power-domains:
+    items:
+      - description: CX domain
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    clock-controller@1400000 {
+        compatible = "qcom,shikra-gcc";
+        reg = <0x01400000 0x1f0000>;
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+                 <&sleep_clk>,
+                 <&emac0_sgmiiphy_rclk>,
+                 <&emac0_sgmiiphy_tclk>,
+                 <&emac1_sgmiiphy_rclk>,
+                 <&emac1_sgmiiphy_tclk>,
+                 <&pcie_pipe_clk>,
+                 <&usb3_phy_wrapper_gcc_usb30_pipe_clk>;
+        power-domains = <&rpmpd RPMPD_VDDCX>;
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,shikra-gcc.h b/include/dt-bindings/clock/qcom,shikra-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..656c959c7e1251ed9af8fd04285fe616dfe9ecdc
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,shikra-gcc.h
@@ -0,0 +1,263 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SHIKRA_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SHIKRA_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_AUX2						1
+#define GPLL1							2
+#define GPLL10							3
+#define GPLL11							4
+#define GPLL12							5
+#define GPLL12_OUT_AUX2						6
+#define GPLL3							7
+#define GPLL3_OUT_MAIN						8
+#define GPLL4							9
+#define GPLL5							10
+#define GPLL6							11
+#define GPLL6_OUT_MAIN						12
+#define GPLL7							13
+#define GPLL8							14
+#define GPLL8_OUT_MAIN						15
+#define GPLL9							16
+#define GPLL9_OUT_MAIN						17
+#define GCC_AHB2PHY_CSI_CLK					18
+#define GCC_AHB2PHY_USB_CLK					19
+#define GCC_BOOT_ROM_AHB_CLK					20
+#define GCC_CAM_THROTTLE_NRT_CLK				21
+#define GCC_CAM_THROTTLE_RT_CLK					22
+#define GCC_CAMERA_AHB_CLK					23
+#define GCC_CAMERA_XO_CLK					24
+#define GCC_CAMSS_AXI_CLK					25
+#define GCC_CAMSS_AXI_CLK_SRC					26
+#define GCC_CAMSS_CAMNOC_ATB_CLK				27
+#define GCC_CAMSS_CAMNOC_DRAGONLINK_ATB_CLK			28
+#define GCC_CAMSS_CAMNOC_NTS_XO_CLK				29
+#define GCC_CAMSS_CCI_0_CLK					30
+#define GCC_CAMSS_CCI_CLK_SRC					31
+#define GCC_CAMSS_CPHY_0_CLK					32
+#define GCC_CAMSS_CPHY_1_CLK					33
+#define GCC_CAMSS_CSI0PHYTIMER_CLK				34
+#define GCC_CAMSS_CSI0PHYTIMER_CLK_SRC				35
+#define GCC_CAMSS_CSI1PHYTIMER_CLK				36
+#define GCC_CAMSS_CSI1PHYTIMER_CLK_SRC				37
+#define GCC_CAMSS_MCLK0_CLK					38
+#define GCC_CAMSS_MCLK0_CLK_SRC					39
+#define GCC_CAMSS_MCLK1_CLK					40
+#define GCC_CAMSS_MCLK1_CLK_SRC					41
+#define GCC_CAMSS_MCLK2_CLK					42
+#define GCC_CAMSS_MCLK2_CLK_SRC					43
+#define GCC_CAMSS_MCLK3_CLK					44
+#define GCC_CAMSS_MCLK3_CLK_SRC					45
+#define GCC_CAMSS_NRT_AXI_CLK					46
+#define GCC_CAMSS_OPE_AHB_CLK					47
+#define GCC_CAMSS_OPE_AHB_CLK_SRC				48
+#define GCC_CAMSS_OPE_CLK					49
+#define GCC_CAMSS_OPE_CLK_SRC					50
+#define GCC_CAMSS_RT_AXI_CLK					51
+#define GCC_CAMSS_TFE_0_CLK					52
+#define GCC_CAMSS_TFE_0_CLK_SRC					53
+#define GCC_CAMSS_TFE_0_CPHY_RX_CLK				54
+#define GCC_CAMSS_TFE_0_CSID_CLK				55
+#define GCC_CAMSS_TFE_0_CSID_CLK_SRC				56
+#define GCC_CAMSS_TFE_1_CLK					57
+#define GCC_CAMSS_TFE_1_CLK_SRC					58
+#define GCC_CAMSS_TFE_1_CPHY_RX_CLK				59
+#define GCC_CAMSS_TFE_1_CSID_CLK				60
+#define GCC_CAMSS_TFE_1_CSID_CLK_SRC				61
+#define GCC_CAMSS_TFE_CPHY_RX_CLK_SRC				62
+#define GCC_CAMSS_TOP_AHB_CLK					63
+#define GCC_CAMSS_TOP_AHB_CLK_SRC				64
+#define GCC_CFG_NOC_USB2_PRIM_AXI_CLK				65
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				66
+#define GCC_DDRSS_GPU_AXI_CLK					67
+#define GCC_DDRSS_MEMNOC_PCIE_SF_CLK				68
+#define GCC_DISP_AHB_CLK					69
+#define GCC_DISP_GPLL0_CLK_SRC					70
+#define GCC_DISP_GPLL0_DIV_CLK_SRC				71
+#define GCC_DISP_HF_AXI_CLK					72
+#define GCC_DISP_THROTTLE_CORE_CLK				73
+#define GCC_DISP_XO_CLK						74
+#define GCC_EMAC0_AHB_CLK					75
+#define GCC_EMAC0_AXI_CLK					76
+#define GCC_EMAC0_AXI_CLK_SRC					77
+#define GCC_EMAC0_AXI_SYS_NOC_CLK				78
+#define GCC_EMAC0_CC_SGMIIPHY_RX_CLK				79
+#define GCC_EMAC0_CC_SGMIIPHY_RX_CLK_SRC			80
+#define GCC_EMAC0_CC_SGMIIPHY_TX_CLK				81
+#define GCC_EMAC0_CC_SGMIIPHY_TX_CLK_SRC			82
+#define GCC_EMAC0_PHY_AUX_CLK					83
+#define GCC_EMAC0_PHY_AUX_CLK_SRC				84
+#define GCC_EMAC0_PTP_CLK					85
+#define GCC_EMAC0_PTP_CLK_SRC					86
+#define GCC_EMAC0_RGMII_CLK					87
+#define GCC_EMAC0_RGMII_CLK_SRC					88
+#define GCC_EMAC1_AHB_CLK					89
+#define GCC_EMAC1_AXI_CLK					90
+#define GCC_EMAC1_AXI_CLK_SRC					91
+#define GCC_EMAC1_AXI_SYS_NOC_CLK				92
+#define GCC_EMAC1_CC_SGMIIPHY_RX_CLK				93
+#define GCC_EMAC1_CC_SGMIIPHY_RX_CLK_SRC			94
+#define GCC_EMAC1_CC_SGMIIPHY_TX_CLK				95
+#define GCC_EMAC1_CC_SGMIIPHY_TX_CLK_SRC			96
+#define GCC_EMAC1_PHY_AUX_CLK					97
+#define GCC_EMAC1_PHY_AUX_CLK_SRC				98
+#define GCC_EMAC1_PTP_CLK					99
+#define GCC_EMAC1_PTP_CLK_SRC					100
+#define GCC_EMAC1_RGMII_CLK					101
+#define GCC_EMAC1_RGMII_CLK_SRC					102
+#define GCC_GP1_CLK						103
+#define GCC_GP1_CLK_SRC						104
+#define GCC_GP2_CLK						105
+#define GCC_GP2_CLK_SRC						106
+#define GCC_GP3_CLK						107
+#define GCC_GP3_CLK_SRC						108
+#define GCC_GPU_CFG_AHB_CLK					109
+#define GCC_GPU_GPLL0_CLK_SRC					110
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				111
+#define GCC_GPU_IREF_CLK					112
+#define GCC_GPU_MEMNOC_GFX_CLK					113
+#define GCC_GPU_SMMU_VOTE_CLK					114
+#define GCC_GPU_SNOC_DVM_GFX_CLK				115
+#define GCC_GPU_THROTTLE_CORE_CLK				116
+#define GCC_LPASS_CONFIG_CLK					117
+#define GCC_LPASS_CORE_AXIM_CLK					118
+#define GCC_MMU_TCU_VOTE_CLK					119
+#define GCC_PCIE_AUX_CLK					120
+#define GCC_PCIE_AUX_CLK_SRC					121
+#define GCC_PCIE_AUX_PHY_CLK_SRC				122
+#define GCC_PCIE_CFG_AHB_CLK					123
+#define GCC_PCIE_CLKREF_EN					124
+#define GCC_PCIE_MSTR_AXI_CLK					125
+#define GCC_PCIE_PIPE_CLK					126
+#define GCC_PCIE_PIPE_CLK_SRC					127
+#define GCC_PCIE_RCHNG_PHY_CLK					128
+#define GCC_PCIE_RCHNG_PHY_CLK_SRC				129
+#define GCC_PCIE_SLEEP_CLK					130
+#define GCC_PCIE_SLV_AXI_CLK					131
+#define GCC_PCIE_SLV_Q2A_AXI_CLK				132
+#define GCC_PCIE_TBU_CLK					133
+#define GCC_PCIE_THROTTLE_CORE_CLK				134
+#define GCC_PCIE_THROTTLE_XO_CLK				135
+#define GCC_PCIE_TILE_AXI_SYS_NOC_CLK				136
+#define GCC_PDM2_CLK						137
+#define GCC_PDM2_CLK_SRC					138
+#define GCC_PDM_AHB_CLK						139
+#define GCC_PDM_XO4_CLK						140
+#define GCC_PWM0_XO512_CLK					141
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				142
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				143
+#define GCC_QMIP_DISP_AHB_CLK					144
+#define GCC_QMIP_GPU_CFG_AHB_CLK				145
+#define GCC_QMIP_PCIE_CFG_AHB_CLK				146
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				147
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				148
+#define GCC_QUPV3_WRAP0_CORE_CLK				149
+#define GCC_QUPV3_WRAP0_S0_CLK					150
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				151
+#define GCC_QUPV3_WRAP0_S1_CLK					152
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				153
+#define GCC_QUPV3_WRAP0_S2_CLK					154
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				155
+#define GCC_QUPV3_WRAP0_S3_CLK					156
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				157
+#define GCC_QUPV3_WRAP0_S4_CLK					158
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				159
+#define GCC_QUPV3_WRAP0_S5_CLK					160
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				161
+#define GCC_QUPV3_WRAP0_S6_CLK					162
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC				163
+#define GCC_QUPV3_WRAP0_S7_CLK					164
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC				165
+#define GCC_QUPV3_WRAP0_S8_CLK					166
+#define GCC_QUPV3_WRAP0_S8_CLK_SRC				167
+#define GCC_QUPV3_WRAP0_S9_CLK					168
+#define GCC_QUPV3_WRAP0_S9_CLK_SRC				169
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				170
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				171
+#define GCC_SDCC1_AHB_CLK					172
+#define GCC_SDCC1_APPS_CLK					173
+#define GCC_SDCC1_APPS_CLK_SRC					174
+#define GCC_SDCC1_ICE_CORE_CLK					175
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				176
+#define GCC_SDCC2_AHB_CLK					177
+#define GCC_SDCC2_APPS_CLK					178
+#define GCC_SDCC2_APPS_CLK_SRC					179
+#define GCC_SYS_NOC_CPUSS_AHB_CLK				180
+#define GCC_SYS_NOC_USB2_PRIM_AXI_CLK				181
+#define GCC_SYS_NOC_USB3_PRIM_AXI_CLK				182
+#define GCC_TSCSS_AHB_CLK					183
+#define GCC_TSCSS_CLK_SRC					184
+#define GCC_TSCSS_CNTR_CLK					185
+#define GCC_TSCSS_ETU_CLK					186
+#define GCC_UFS_CLKREF_EN					187
+#define GCC_USB20_MASTER_CLK					188
+#define GCC_USB20_MASTER_CLK_SRC				189
+#define GCC_USB20_MOCK_UTMI_CLK					190
+#define GCC_USB20_MOCK_UTMI_CLK_SRC				191
+#define GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC			192
+#define GCC_USB20_SLEEP_CLK					193
+#define GCC_USB30_PRIM_MASTER_CLK				194
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				195
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				196
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			197
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		198
+#define GCC_USB30_PRIM_SLEEP_CLK				199
+#define GCC_USB3_PRIM_CLKREF_EN					200
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				201
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				202
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				203
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				204
+#define GCC_VCODEC0_AXI_CLK					205
+#define GCC_VENUS_AHB_CLK					206
+#define GCC_VENUS_CTL_AXI_CLK					207
+#define GCC_VIDEO_AHB_CLK					208
+#define GCC_VIDEO_AXI0_CLK					209
+#define GCC_VIDEO_THROTTLE_CORE_CLK				210
+#define GCC_VIDEO_VCODEC0_SYS_CLK				211
+#define GCC_VIDEO_VENUS_CLK_SRC					212
+#define GCC_VIDEO_VENUS_CTL_CLK					213
+#define GCC_VIDEO_XO_CLK					214
+
+/* GCC power domains */
+#define GCC_CAMSS_TOP_GDSC					0
+#define GCC_EMAC0_GDSC						1
+#define GCC_EMAC1_GDSC						2
+#define GCC_PCIE_GDSC						3
+#define GCC_USB20_GDSC						4
+#define GCC_USB30_PRIM_GDSC					5
+#define GCC_VCODEC0_GDSC					6
+#define GCC_VENUS_GDSC						7
+
+/* GCC resets */
+#define GCC_CAMSS_OPE_BCR					0
+#define GCC_CAMSS_TFE_BCR					1
+#define GCC_CAMSS_TOP_BCR					2
+#define GCC_EMAC0_BCR						3
+#define GCC_EMAC1_BCR						4
+#define GCC_GPU_BCR						5
+#define GCC_MMSS_BCR						6
+#define GCC_PCIE_BCR						7
+#define GCC_PCIE_PHY_BCR					8
+#define GCC_PDM_BCR						9
+#define GCC_QUPV3_WRAPPER_0_BCR					10
+#define GCC_QUSB2PHY_PRIM_BCR					11
+#define GCC_QUSB2PHY_SEC_BCR					12
+#define GCC_SDCC1_BCR						13
+#define GCC_SDCC2_BCR						14
+#define GCC_TSCSS_BCR						15
+#define GCC_USB20_BCR						16
+#define GCC_USB30_PRIM_BCR					17
+#define GCC_USB3PHY_PHY_PRIM_SP0_BCR				18
+#define GCC_USB3_DP_PHY_PRIM_BCR				19
+#define GCC_USB3_PHY_PRIM_SP0_BCR				20
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				21
+#define GCC_VCODEC0_BCR						22
+#define GCC_VENUS_BCR						23
+#define GCC_VIDEO_INTERFACE_BCR					24
+
+#endif

-- 
2.34.1

