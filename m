Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB313F8231
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326028; cv=none; b=hnvXqlGeB8G5qI6PzvJS/SpL/HClJexaZvK/zdLm3HgcEJBxa2yCnSKTd9Mi1VSFEgLXWsazeu3KWTPq7F2mSjmFu+uzm26zwLz8CwbsD9WPOciwRolIhWVe2wNp0yU1d6+PtcC456hmOOvfHzIcR+6Y4ymKiheeDjRKMgRaexw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326028; c=relaxed/simple;
	bh=xhxIA7Wnqk3AsQNrfoSlf+f+2hDRBWo7ifCUUnxI5LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uhwN6UK2UoQeHC8oaCc6E4yvuJA6GRJrq0q+zuhNRiQyJmbqukskE5wNI1Bcpp84qDb3YUKAJjZHXyAr1lz37aj4J31lHtFf0azw6DmXIXKlzoVKoxtvzSU5URWkprHBM2iCpYPY/ZedjWPwhZO7SXVHWIoSuHz7m+fVsqD/fpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ox+TPQ4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ua0mOtIi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ox+TPQ4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ua0mOtIi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z08I290325
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+yDeC3B2RiB
	ycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=; b=Ox+TPQ4Ic/Vkj/LiIilebPImI2s
	OCUTYvJLAE/64M6JYrWbQOyLJ7eFI/03p9DjfB1ibi7Z68F9ShjHa5MRlE5va0a9
	3jpYrph1daX1rC9NcawOYbfTY2NYG23rBYcmC+Wue9Ci9oLXL0smkJlbYGGkopYe
	hsHaMbCB8qt76k9RuPnzcx4RYYTXfnvZlFk3BpXvDzaGyRv107CobCbybUKzh9rC
	PQ9uOQURmJx/uQ8pAw76bWb5pj6uwfk0/zXHP33t0L6mUAbbKVUJl50bp5L3dGA2
	Gy2qJ3FkvO2Izxpa+F1U5ZOASyjyX/GvxJT8VtEqAiu/wvVSHfmEAMTQeUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881trv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso167272885a.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 01:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326008; x=1790930808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=Ua0mOtIiZPvM3YgLgGpi8pZ3NTRuXLJ+BOgiI0mdCugxV3M6i6Osi3SgbxXjPw+me9
         4W8cJzI8+rLSGPomAlorxgOjkadtJ/sok0upb4F+4uLnWbqBuO7HjvEPjm+/L2KY5O2m
         P5vXLUeGOXF1n82J4YrkY+JX8GO3hy1zrWhBjGjaLtlneXECOijdXjAeqfosZRiW/U69
         gaLlV3w7mwJQzzJXNrhk3njd48zBkBGa9zUx87GoZOjuI9kVhi4jJR+JMnwLh6hCkKT9
         hP0qNvrgq+RPV1X5L4XmbUv14fteRBLF/BG8ihP0g2gaFsYBNKgacrsooGBEcfWzdwao
         FuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326008; x=1790930808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=oU9dfnPMXRmoizISLy+rI4KlBOJnObtwz43UJhwkx3hOTarOCOZ0kdkAJ4EBFwRMc2
         2G7iuWNA7Vhf9hMo6za21Z/y1aVD+ZrKj3mLWSlwzhAUij7lvB675Vi7TSBcKnVO2S2k
         aKzkYzDTLr00JoyylKVqKlWQVoeR0W5CzyaEqJCk9gXmN1zzZbJWRKjJR/J52Wu7SIvC
         PHcdHhACu7s5DYMD9BfEPM+nvPZCrTl0cvi7DhVs4xC/cgQDfXYUdScqXR/YMKwJSMnE
         hqafiZutQx5+Bjw1RUkvqG3t+pR2PCBHkrFJ4xM/7XsGzux2ucBAHsGOgjxurdJDznhl
         40YQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXtyDl7cbRB7ZK2VIRIaJ4wncGzWhrqdu0TPn8rMggGeF7LdwwVuBOUcSqNY2U4chQk2H/QhQGjH0=@vger.kernel.org
X-Gm-Message-State: AFuF++k3ZYduHyrofPVwCLL31wdpk+7kUyeBaqvdj5RnPIZMcCJCvjqn
	ww/u4zXh+zPOOlv82uot1+9LPVLpJIOHmTIADVWMj7Dk94J61kYWlbVpRUyg0tLpNZQMXuq8hhs
	8G53DLa4zoh5JgGW5hj9fcEdsi8GBzpv65YKPw98AQwF0Nzv/KGGaPbfTnqxYgzA=
X-Gm-Gg: AYBFou2BtJtqdlUYinnW+c3mLq94fp9irjS623InJlTMhUbGldlxwFqLIfQY14CaIZl
	I0ZvVjNhqTU/ctIzRQf2c9/b3KuJDe/NmucmvEnY58N0XDQ0DxqhlRuBEcjrxG5LEqCEJCQgIu3
	Ux8AqqfbqVKzOGiz66df2yge61EIl+yufsX89WuYHOR10xcIgLmiQwR0KqIncPH35QTyIi3dYPs
	hS2+syKCJ1zdECMFAMoQyhfhQc5h9NFPLr2DMgMjHWic6y8fZYXKQGQfhEkzcIKS+joTugigSvJ
	JeYJinqzqEBA/5bI4xS4BWZLE+VG0IuqUmb29+DnYzsUs8UAAkC1vRDUUFpHNbpDCrhQpywiNnd
	iVaht+zN0cbAS
X-Received: by 2002:a05:620a:40c3:b0:93a:c102:1123 with SMTP id af79cd13be357-93c43bc8ee5mr325646985a.15.1790326008342;
        Fri, 25 Sep 2026 01:46:48 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93a:c102:1123 with SMTP id af79cd13be357-93c43bc8ee5mr325644585a.15.1790326007881;
        Fri, 25 Sep 2026 01:46:47 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
Date: Fri, 25 Sep 2026 09:46:32 +0100
Message-ID: <20260925084635.112399-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab634f9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=yiKMOllxs-7wBVDooBUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX4fOGhvegwUbl
 RnZ9r6z2SooL98Foc8421qQ5EBKIoQVtXZKMyCrXV+dDrJ6Jf6tajLDok32Vw+p9ksIVVXcDGj1
 WNOxWj5sW4WKEBAQ5Xz780P3X2bP4aBJ6a3MhaZNL3K4Ev20JKcNRYCOf8UiiB2zwUi6SGP+0k4
 Jz0bpnFwHXywN+XC2QsMQ4MErPSJ3dNUbbDfYQrhOTn/Jm9jQ0/BOGotdJdlnJQJpGT00cnFmBq
 lWBUuRltKNgDBWqXgj072EG4J0sSaUvM3/D/elds9eMDZRCnTMErW9Kvo+WAnkWDJTLH+awQRPG
 6/RvUFuQ+kRp0n4+YIIM+CD+Aw1i3+dwG3iLn+Aj+DWe5SaLWFtZz1Rjih+f8FWDsxO+8Br5gDr
 BFuAwZPpSPEFJcxUuZv1aCVgQikCTnXx6Gv0CqsHmzoOoGXKZLi2G6IYE42dqLxMCES/7dF4d7a
 7QL2OmkwaudKs+1gQZw==
X-Proofpoint-ORIG-GUID: p9WzkGljvgnFkNI25DIHWzvwo9xlR47t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX2LjPA5Xltyqc
 3AamlMELdbYmu6r0KhGz/Da0cIrH+PNKJmtxXtwCpq0944bJDkmx0Z7iH6G1Z87EARojUvK4tDK
 SNikhz5ueTJFdvqZL6uj0Fa12E6Sh/8=
X-Proofpoint-GUID: p9WzkGljvgnFkNI25DIHWzvwo9xlR47t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250034

The LPASS (Low Power Audio Subsystem) Audio clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-lpasscc.yaml   | 50 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 16 ++++++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
new file mode 100644
index 000000000000..c047c0174a93
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-lpasscc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core & Audio Clock Controller on Glymur
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description: |
+  Qualcomm LPASS core and audio clock control module provides the clocks,
+  and reset on Glymur.
+
+  See also:
+    include/dt-bindings/clock/qcom,glymur-lpasscc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-lpassaudiocc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+    lpass_audiocc: clock-controller@32a9000 {
+        compatible = "qcom,glymur-lpassaudiocc";
+        reg = <0x032a9000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
new file mode 100644
index 000000000000..3006b12e385e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA1_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+#define LPASS_AUDIO_SWR_WSA3_CGCR			3
+#define LPASS_AUDIO_SWR_WSA4_CGCR			4
+
+#endif
-- 
2.53.0

