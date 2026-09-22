Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACB149B447
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102705; cv=none; b=IgG6rB/s7DsqodmkXH0gkEuCptgBzP4d6QPdpEJGHp73CL0O0wATnhhLGJcbzLvib5AVP/SumZrdeIDRuvqTJ1EHEA704rO51GEqwdvhJmu4in23sMGCGNrIk/uasJgXpG3I+oeNYsSPNQmNOp2VyZ6xoRnTz8aRfnSpCVg+r6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102705; c=relaxed/simple;
	bh=xhxIA7Wnqk3AsQNrfoSlf+f+2hDRBWo7ifCUUnxI5LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lll6RTGVhRvRTb2AyEUnQfoHaQGrnF/R3AjaD4/6X/IfvU2YVPhZ+MzjMkq6k1LqjtVHAmBtxEQRPCOA6TAWmPtXF1U+nWB167rT9+iMzv3rtQ3DUVL5d6cVLJKVcBGKZL49AeVNPC9JJ1Rl7caUhedhFd3neCZeJ9XDlGNyvfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcUTCa7W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpMbZQfR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcUTCa7W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpMbZQfR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6tXd2033218
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+yDeC3B2RiB
	ycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=; b=GcUTCa7WMBRAxkM02u7jMbe4Gm5
	IpD/y8+Oooxl1hXB3OvclsuIxpkS+ZuCr2dR3eTWIfCS1nBlcXxjtxig/Y3QeknA
	qeOHU1zHot0Q1Iq6Q8lkSa6VjVAhDu48jeMQRjDHTzxZCP650MMS3j6SXJYpgwAK
	N7MgghTXLHbhHDioBHo5XFn6uBbPuzFCekL5oekdzzfTFTE2yTDvkztAoq/fpwB0
	qqycz0BLCXj3x9ZnffoH/Gp0d/ne+kG5q85rEnvlGNZpIVc31+ZAKNJ/eHs42vH6
	xz0EMa2aIbMj2C7fwJf0cqQftcuHgZTuBQuQf5hLlf2xNZptkP25DYXN4Rg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c0bea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:44:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cc46a7765so69688241.2
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102699; x=1790707499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=bpMbZQfRm4Q2zrH9YFZ3XApmB2i2BrYuL0DgpfjDIIjAkpp5WCwAaEE5+i76AwlOHi
         YZKFyqdrR5W33h9gvnPSD1AuitWQ30rL15aNrddG85BrJcHNAG0fVyYJO05pExBofEfm
         UarZOs2pnS48GqlS/jE6RvTClTlPSGXD9k3nyuE7bKNvU0XInPtB2YBJEOSuVQMkC1Om
         Qq1JXLOFKCxlaxnH3r67XW1WzqbqN8Yo35TieCuZr92+Hw+1+t0kvI6993Vlxhas9XGK
         VQ8zwjtCL0OcGOdDxdV/zZMFGVuXRjyBw1/QTRSLZPclusInkL6CpRbCaTWo/4SdlBzo
         tBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102699; x=1790707499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=tT2oF750XIGtwnSFQH5NtD4qhEREGpFMvoa+87Ups+HOsrSe2XEWPcfnCDB6l5DCFe
         wlWYiXRSXpDYMENJdzLpIQdHJHS/MvkjuSpxbOCtMwX9LtgU2u2RGiHJGooOqyponfY/
         omSvmz9yoGz6r/lJRpLvUgWi/y2OJTqUuiB1Wx9ujJDg9WhoT0kJBr2VEb1x7RgmhI2f
         drQ1bd1p8YbXX4iQEtXvQakiEZlEJlYDuLxbWqYH/4S4AQmu+MGnfzFB9/EVR3Rdznob
         rkFne6l2fqBf8HjKkudk/ChgHMWest5//fa+2Aivt8hpLTApg1HItiwS83cn5TH4vahj
         vVKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDU/ARy++/wtGE568mFMZsHKPUxT7I/JFfTKZjtly4zktj/3SfMg+aBRr/EpUhk7YuK7V6eEo+YWc=@vger.kernel.org
X-Gm-Message-State: AFuF++k5RphFSMiAVeRH04Bkth/oE+jDXsfzFeHIOWDabK5I3MOYsniv
	mMMLkKC7onGslWQhsusHfCQuJHYZ+mvcWQcyCxqClfsEnPNHIlU/8E5vQ4gDDYqHKg2Aea7cS0e
	zfctdYGEN5HwubbV5eF6rF+5fPHdQHgRmcNsMC9QJjlDCQsHwd5vRh4ZbAbCs+tM=
X-Gm-Gg: AYBFou0gaW+iS4+ue7otZaWL7mUHlc5+KZde2x++hRrBXyqcIA5S6ehvjByBTjA4ubI
	rcn99EAC9tdGCHxbiEZ5lmuGorct6JVTqVkM83jTg62XSUFDYOg2LPjvMxZaGxUDXHwM6qBJ+Hg
	UjtJ5iX+37hRK1i+3IIvyI6FefW49VW3Nl5E0jzYhNcFY87OsrmLWRWgamunO+vZu7bZxahBzub
	qfsRF5Wy5iUHsmKSznC6in32MUvNtBJ1Q0p5suJSPMCL+s2bY5AvEwiUEfOqs8vqpgwzmARUKGT
	YXlvZKY54uMRNt4OmGTJqnOnLgg9ZbYUAScH+RPxBfUtqawKG9c7gN+/3F+Q1eAWg+EGoNfDu6L
	2/E+rvqCBMLAhaHbY2FKS7o2vlJPug25o6hdUWTCWUEqwHZGQys8oBedVNqWawSRC
X-Received: by 2002:a05:6122:1312:b0:5c9:a60b:e5d5 with SMTP id 71dfb90a1353d-5c9f1655c76mr762270e0c.15.1790102698807;
        Tue, 22 Sep 2026 11:44:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1312:b0:5c9:a60b:e5d5 with SMTP id 71dfb90a1353d-5c9f1655c76mr762241e0c.15.1790102698356;
        Tue, 22 Sep 2026 11:44:58 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:44:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
Date: Tue, 22 Sep 2026 19:44:22 +0100
Message-ID: <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX2xyhHWLL3xW5
 eCYRh+XsrszBv5fX8SwttRGYKbNUyPNXyY5s7WmYhOAtIejprCBSpriS1dN125dpstEcJWQTVsQ
 vTKX1l7sR9TjW2n5mmZYH8H7u/J1w6LyT93fibJJxUhKWg5cAPWognTleUmNcG1ndUw7KtHkRps
 hQF00KQEUYqHHe71kHMk6dGCpQG2CTrWjbRuFlwYKCwAqGbg6clGD22phU1bN8QQggxP5sJlmwv
 Vnch+dtEUFpjkVZdT7e2BCZDcJcMi8pmfN0pd0NPeEyilxevlJs28zp35KiYXUkPuuw+Bhd1nyb
 KZpk6u3CTgj2UJPeHIK5cFITJm/s3J7ODbuZSc7IbeK9vKPC0QgNYtFPkL3I6uaj9g2c4OFhrt5
 NHBDY0UX6dbrYju2087XKxnNj0V7aogz7ZIVUGxyoAebOgS76HwOU3mMrH4J5szB9euyV1bY9EI
 JHVdnhWACS/a3iWx0CA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab2ccab cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=yiKMOllxs-7wBVDooBUA:9 a=1WsBpfsz9X-RYQiigVTh:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 7r9hmeKzXCy09T9VWvvZfFVFcqiymSvx
X-Proofpoint-GUID: 7r9hmeKzXCy09T9VWvvZfFVFcqiymSvx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX6gIYeLQz6+lo
 +f5TdKdtu19xSfGb6Nq2uzswdCosLSiTE7W4TTHfHsjlR+W5omv0A5ub45AOi6NKd/OeCnTMTTv
 WAC9dsnejKnuh9dhcAJhsI7IfJSwgxc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

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

