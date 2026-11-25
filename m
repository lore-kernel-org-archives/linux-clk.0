Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612706;
	b=kElg5iVjh+jH1qMXX2FMAPL8IP1a6L3QajsrJvG/7Ylk42DPtlcRQMutzhhmufliw8r2
	 20qtPCpv50CUJHIWCh3OAG+2iYH5BOBXIbwOUW5ypOe0yCKD7yZOd/1+tdlvPbJffKswz
	 TQBm27vO20SBlKdTCSIXoc33OnPdIVdIknc82Hfk3muKHzLlcPcA69p3hrSRFJj0CQLnQ
	 Pvh/EhYsJj7f2ybWrRY2qYRezQPBEjIQYdfvBaeiGVge/hWUbsJuGcCd9bbRLoRS7GE1a
	 62A8YlibHM1WEM0LhZ97Tk8/vnH8tLq7FCjKf9cLgfjBI81S4fxq7kKqjn/DRCthALg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D0rA4mbm0SnOvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=;
	b=bTU6yJOuRD7bEogl1Nzc4iCfZTpEWUezfaylBrCHHlMQMGZQCQ/LFJ4KE6TJDzBHSOM/
	 4lr7D8eZxn1eM9m8b8yvA3XuCvuYJGg2GyjxXolY5ncKU36Qrogeh5mtnAhJlmlOQTC41
	 wRJVpVrXpR/ylb4X4cmPx7kMPldbxLSsHEiIhvQxugd0BElH+ps6zkm6ulBUfFI30MdeV
	 X98brXfIrNKqG6VhVLNaP6dDhPUbQgSmfwE7usGkMgDf9iYhqFDU38RMkAqIZrZVO3MAk
	 zjdGONAklZY6jVMvvpfGQjl00LhHHoWi7Wag+qpA9/QKfDgbReez57DmSkXqiQbvXIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YsH/mTW8";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c6dhz6dN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C00606A33E
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C00606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YsH/mTW8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c6dhz6dN
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9midK3642180
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D0rA4mbm0Sn
	OvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=; b=YsH/mTW8Yfze59pzM5U4jIYv2AR
	BxHVjutTBhlqU+LBEjrFMFvNOZLZndmn5wfLF0IEWgYaZnnRc2s+QXSaUX0xRHJC
	LUyNVan2XKBTxTj0+gSXoU7stPJ2/fSrRY8JTiZeDoIL7O6S06vR76kdu25obYEA
	HGTJ0Ki6JLP2aTfyU/FHA9oquSZR7MHlxHMchdhIdgU0g96vOwF2TByBon7oJgZr
	0P7YXTRzC5nLQLEM0FJkHQbXDVcUNVuY8/X+9EtlxatAUJmiHwc0UEKgbEGEZCnq
	8/2mRMF++2pns8NMIrdqc2u3wsUKIa4ZT1PKh/isxQgNjsxl2jS3/hcoFyw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2b0fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:18:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ed100ed770so509187e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 05:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612701; x=1796217501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0rA4mbm0SnOvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=;
        b=c6dhz6dN3FwuJ6WDuZdvcEA7x5ATZMTXQDkK25+dCgcWYQE+KaM1NyxDYuSrrMULLV
         ZwwMhsYJ4xb7lfZ2/4SpbxAj57UXFEzbQ6/u1wkBpUspgIXZs3/GgOkyocFgdkb4sQW1
         xGhsBqzlJ6cQEOm3hKxnWHSweZKwCdmjjuFrZSkX05Zugjl0CbA1V+lyTHb/W/97LLUL
         dtqQ8MM0x1H4XWEs8WBiUhkiakKZlONMEII7CFnxLfkkfFpl1ayJm/ghHORc8lUPyjwy
         mzBX+kt9ArcdxSXvAbVGWOVG2ZUTpxgLD9yjXvoKUfrPblGaYoCW3n/JA4Kg+5C5WAcy
         pGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612701; x=1796217501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0rA4mbm0SnOvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=;
        b=xIK4Ym3IteOyJtKK6X93fELAA8zB62WUsWx9tGuC7PBta2PJVP+8iNbLEZdw3UWBil
         J1Q7yyrnsUwbs3JAolizU/Frq7nxqcj/3c2IQCIsHLGkp4Rg6yS7uOlbGzCJD3SGZZdz
         kdHaiKsDF+LFfTzTOYqBDWsfZsRrJ8YfHf6coxmNfagAEtLwZQRaKyHH/SZnOeDtD4Ok
         0RKG9pKMLx5yeOW7ZJT6yzrL8C9JZz/bvFRnR3YrIJRRwpkq17yohhA5uTdjkpk63y6/
         +1VzS5kkAfKTq/r3kt/u2RSI1wWwwyxMtGPW2Rr7elmY1GvO46MOdcNGpQpa6JU4E/zR
         uwKw==
X-Forwarded-Encrypted: i=1; AL+hErGNXarUJaTX+FpGoRcWBcLca8ZN/bLltP0uJZSlOFaSLQBwtlBCoc6TNwvXX8eLNC9wV0VHEaVRONo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uUoEBfHDdgL+j0vCwAgq+6kL7FSeMYjW9LtHqS5l7MSNg7yCA
	MbELv3ZoLsr/ChaFfGP53fTP97l0XGCwYs7COxgzqdFF03qNaIEBR3UKLBfpIvnwFokAz8JTeM/
	zAv+VFiZezbi7YN/hyGcuqG9haB2xcgDNhlhUjuEyq1Cxx2K2F/ANnq7GawHxxls=
X-Gm-Gg: AZFdTZdGIGMXlOsA/VIcX2GaxtYPHrdAqdb9b7eosXZ81fOH5uDTZ6Zsem3LA9pp0dN
	bQ2FFVHOxYQ8Wm/h5MtW6NEnYYynZBFXxVN+xm6AAdBfwscavgtfpxUN0o/1fHfS5s8p9ELlG5Z
	QKVx7V45sBC3wH60U8hO2DV9e+0Kpd4GNaSYGBT0td45xA3r66CBz56TD+90uFlhSkl8xrWRm3N
	KTvQ8UIopt5IBlnAkM5SsONl0SLVh4toDGGey4mhs56M7JfET86CF+WWvxV2IWOVDzMpM5WuMvf
	oIBqFEyyDWelqLwtp2zAAtfzbE+7J3ezoPE7qAZUxg210Elrk3xnAHot3cboEYCI6RZNoZiyKA9
	EPNPR3HxOzeX9LEltC5cejg6LLOWc20aW7AQbns1jI6CKxYXyFM8fCE/Zoc5JAQnf
X-Received: by 2002:a05:6122:d03:b0:5e4:f6c8:b0a5 with SMTP id 71dfb90a1353d-5ee8ad0eb56mr9557114e0c.0.1795612701286;
        Wed, 25 Nov 2026 05:18:21 -0800 (PST)
X-Received: by 2002:a05:6122:d03:b0:5e4:f6c8:b0a5 with SMTP id 71dfb90a1353d-5ee8ad0eb56mr9557053e0c.0.1795612700624;
        Wed, 25 Nov 2026 05:18:20 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:18 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: clock: qcom: Add LPASS AUDIOCC reset controller for Glymur
Date: Wed, 25 Nov 2026 13:17:54 +0000
Message-ID: <20261125131757.1163466-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06e01e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=peyyOT9P35Ab0jvJzsIA:9
 a=XD7yVLdPMpWraOa8Un9W:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iX7MKL2utoaovd3QRrQPp42gSv07lrhG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX8Y6MH+SWPoet
 vlA0KPv+L6NcRykeMhYqAcQ2aHPNH3juk1a+8BRT/HZUraDn3CbqPA/CZGdISDdHzz52oAb73Da
 l1EG0jYLIGwZl/B1b4jHhwNpWvHCc7XK05Gs2Pq57Xrtdcj8SkSvF41P19d1t/mPUAqtfQJFUjk
 ht3MUfNVqYC3NHreoGc/Dz3w+xlNRlus+udUCHnGUv5IWzreVRBT9oy2/Bm/g1KJtdecAErIi0M
 y4pUygrvQ2jYdRBODOiV1oA8gC7/vAkLh5VDWRDsjnMuPG58QPI/f/cOo2Xoi0U8Q3taJsxvOYP
 nu+VjwqhYx1r9psMYdqKtioy7pAXPUbCZkxMxHsiOxRWWmIclpRFQeElgwZZdpyd0VvzXIsAC7Z
 ePYfeNMiPaW2aziwJXYRVi54b21EPsBQwWIeyic7KOfKmzTK5i/FnaXj3b5Nrt/YLC+PZ8PmfbJ
 zYkGeivbIxqrkyfK3nw==
X-Proofpoint-ORIG-GUID: iX7MKL2utoaovd3QRrQPp42gSv07lrhG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX+FjMr2PiEOar
 YaPNmazWjvT5EEI8TOCYcGLeNdttkSUrMiUeiyTI61DWheJNU2jcgQwiwJXgXNiAmCkBGQrsZco
 cw5skVJzeoSs6Onh/q8piEGB4S/xfcQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250052

The LPASS (Low Power Audio Subsystem) Audio clock controller on Glymur
provides reset support for the SoundWire RX and WSA1..4 masters when
LPASS is under the control of Q6DSP.

The programming model is a near-exact match for the existing SC8280XP
LPASS AUDIOCC, so add the qcom,glymur-lpassaudiocc compatible to the
existing qcom,sc8280xp-lpasscc.yaml rather than creating a new file,
and add a Glymur reset-ID header for the clients.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml    |  6 ++++--
 include/dt-bindings/clock/qcom,glymur-lpasscc.h  | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index f235b4e24cc7..a25e043ab894 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -4,22 +4,24 @@
 $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP
+title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP and Glymur
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
   Qualcomm LPASS core and audio clock control module provides the clocks,
-  and reset on SC8280XP.
+  and reset on SC8280XP and Glymur.
 
   See also:
     include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
+    include/dt-bindings/clock/qcom,glymur-lpasscc.h
 
 properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-lpassaudiocc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
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

