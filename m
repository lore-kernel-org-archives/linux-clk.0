Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED6738944E
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504969; cv=none; b=Wpb6I8JeH6Km0oVwZM5GAvAuYY3aCeAx3cPh53SfZRCO2qfhXFFYbDN4ey16KlzRbYXMgq5eTFypWgIPlqC03vyZonI4DLgHq7+BjNAKi54+3egzSlTNDqNhOk5QbC0OeJD9xwaPNj4BeLQDyHp+rGuFIycUDDvHQt2Fck5Zb1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504969; c=relaxed/simple;
	bh=IIZw68wl/zgbFUJuSWJ+8Js+fM6YD6bI9jBv45CteyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3y2FUyIfcUf539gIhQqjPF0paLSlZtapSFwRfRGW+1PuWAyQMU4RLNoN+VjkzkJ3M9QbSd3kWjOWHMVDAwFRhzaJZH23qKIMZb6h90R8JVR8l/2TO89PLCUxXo43fP2IipH0yUJPK2XeB3nj/e5KiPKIFFy3V506F19LqhSMLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRT0oC1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blG6exLr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRT0oC1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blG6exLr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889Bht2219742
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 10:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=; b=fRT0oC1tXrkVMZHq
	oXrrDEkA1bhNmvv6m+dXEXApXfP6yiZtbqagNeDjn/j2lO1rNlnsA3L7Sy92ze0p
	mGLRGVuwbbXzqCLUk9NvYuDa5AQX4ba1PGZ9huHKdF7kq3i2J5cSw+3EoBshTchf
	P8Mgw12R8k05oskiGPelnwxkZE8M9ioPcpzVp3vbnyw+Ltyr2ggl7VllTVK01sKR
	/43EKYfGiK0pCFam3nhNYFmChqisJ2yQ3H9BpTGbDwX3uET88LdDDsbQ3MP0Y3qZ
	ato9/IsNi2yZ78V0kWHKV4zQbc7wQUb2PehYEZkSUXUjbajtCpwrBJgwhG8E/3An
	PvH8/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hh40t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 10:02:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-383b6012ba4so1043384a91.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 03:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504967; x=1784109767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=;
        b=blG6exLrHzf0NM1u4Ob9t2amREtRm+MKpMWzoyKSrI7hTZgxjBK61REqfze+EZV4XN
         zy/TCcuRhOkaoOG8+MfHf9ZjUblLgshzjrcuUpP8HG+3m99jAfftkn6L7pTp/hCtxUrH
         3KL0sSrGi+z48cPUjFLuesKQk3WfU5tThtJ61ZVFK+P+xkXtuYAJJc5SNnCPoBm303qD
         g8lILImJqVqCfkz6RKTgD7XykIDxTrYfTtQGIF0Pp4XSzpA8I0GWZPJ1EPh/vvAQ+x4t
         uzyd81KAlaj+7/VeOCg0Sq3NRknayM5iZWwCFfTv2XJpE/S20MKmQpiZfCWyROpjLlUf
         k4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504967; x=1784109767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=;
        b=ca9YncRtuRcOgiYKhFIzyOkafh0X6qyKm3s3d7TAa+RlKhIjBWdXHqlhX41txMP6la
         bzgpuPw52pqyUPa1IILbMp87zKFByYG7XQRQHYihhH/ttDwoYZ/2EJ6iQd6WzIFjVH0p
         B775nyQKUvsJ4zFR0fSP/SbQCbqvNmRPHnz07DN21ICIknOEXBySqxHAGpGq7c8EHFqf
         7fapL9O4Ti855qgWf4/Q8p7G1To5a80jY7Xqpy7d+rVMdTIea7qKDI7eXh8EbGq3uyA4
         mXlrnIw/HDS2UuvJA9TMR6c/RqgmqzImMEGqH+/93bTUsCn1OP/PedmtwrHoKtVxG2h3
         6LBw==
X-Forwarded-Encrypted: i=1; AHgh+RpwZaN3RHcT+FuV9nxkaw/8K01ViizojqF07XyipNHKOxMeoKPAVzuuE3hb8Gz8UYwxgoZRs/x+OpY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRlsKrJVbQb/fAC5/r4XvkUgrM3DmVch3JX8tRpUhrHnq9cCfF
	9XZoSYwxb71svSaAeQWa61HSwxS+so7h4uhwfK4QZQjuxPRPqxBgz52EP2SvNNr0pTW64zfJPOj
	FLMTOfYrBgTPMAmX3UKKSSOdch2tXeDMJsKxUHiUTd6hXoF0yHdJO8VxcY9XHpeA=
X-Gm-Gg: AfdE7cltzGmwHNvRDi4bxrBJbEEYmbW/XgsIigo6f1ocBS9HXnJALOg/BpEf526D9/y
	J4v0rIPRMV8cefVYM0KZ8+RVuw/iVCmcUWQ4ppzjGUmtBqM1PMgZSyIZ6YTxzbDrpFTnteeU4cH
	WMlH3cTL1EiYkursg1K0HdzP2yReJL8ktMAWevTrCIPYThxrys6Oq5H11NsfkL3K+01ewWXlaFI
	RdVZrfOk08pdCQWRqHC1gj6kgRNJzxVYpTtGroGSzwbCCosUg4THBtPjiW6NBsyhTyhmALIut97
	E5EuSj9SwfdMfdEUXQSgkKeIVTTB248Y8D5m2nK4ivHRqi1lNVTIk8xxRK/IypbVqVZdhLSxhG5
	h1DADbihXjaW1i469lnNkoKXYUhJz2NAFBSkPZZ3+vX6sGtOeXI0zBpfNIQ==
X-Received: by 2002:a17:90b:1c0f:b0:381:18c3:1b99 with SMTP id 98e67ed59e1d1-38941205917mr2256847a91.23.1783504966695;
        Wed, 08 Jul 2026 03:02:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0f:b0:381:18c3:1b99 with SMTP id 98e67ed59e1d1-38941205917mr2256746a91.23.1783504965910;
        Wed, 08 Jul 2026 03:02:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-389098609c9sm875741a91.13.2026.07.08.03.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:02:45 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 03:02:39 -0700
Subject: [PATCH v8 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcsr_qref_0708-v8-2-62c42b5fa269@oss.qualcomm.com>
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
In-Reply-To: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783504962; l=1807;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=IIZw68wl/zgbFUJuSWJ+8Js+fM6YD6bI9jBv45CteyQ=;
 b=WSWMoqULrv+aluXBvb4fFgmGX+08bQ2NOO1ViXMaUsrjkktC4OQ4mOzBm7S+1SVwHX1O67qP4
 uf0S25sdXKUA77oO3+B8wPGC5FIDGSBPlC+flJ4YRqGofgKug2b6FJu
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX4aRsVCNeMLe6
 6GMzT3y5Y3lRvN1w73a6fD/imQjfUTGFiBDs/q1jHZD0lNz1h+9YDhFq9FIjZq0i6QPfzt963Da
 4Kz7oEY5WpdTTNj572JkHxeYTfAQ5JJyvdYniwS01HorkyHfDV+qAeeKI31wnHpnNsJzrAXf6qr
 DHTFBPWWYdE5aG69IIR5w0OMGg8TFDrLUaPbgMS8gC9LNcT/GBh+0/Lq0a8OXbCDAxfp0SW4TX0
 cEFDXzdTYnEZTQbDN0rqRv/yDwx2t1FO6rvIkqPV649FIGKJdT9nyBXPRlaytN3ziaT4Pffu9iM
 Eg2wXfxksDZkLPe/y1cx4I33GSaU8u9+zYunm1C7fc26zQfDSVKYFfDulqxAGgZGUGFVChjSUZr
 WXh9SDGjIb0Mhuo4briqPNTSvjS0MeDmwmXqpoMKg/XnxjYk2l7UGajdjudAXZoKLybx+2/uqy5
 GJWGrRbao/7kTqDNNfA==
X-Proofpoint-GUID: NWBCvFdbnNN_LqVk7fPho2d747go_TtU
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e2047 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tHEUkVd5BVjdM4dvyhIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfXyecSLoKbaK+4
 SgpDhGq9Y6LPWt1XPuXQ0+r2lOka27OSQMVTMJYuuSI05uXjUM5Kxv/vMFOo19IOjIAmk5GSMIL
 jDJSepAeQOeuZhc55oUJA7BhYPIr0hA=
X-Proofpoint-ORIG-GUID: NWBCvFdbnNN_LqVk7fPho2d747go_TtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080096

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but has a
different topology: a single QREF block fed by REFGEN4 only, rather than
the two independent blocks fed by REFGEN3 and REFGEN4 on Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties. Note that REFGEN4 is supplied by regulators vdda-refgen3-1p2
and vdda-refgen3-0p9 on Mahua.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-tcsr.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
index ec89feff89e4..2b6422627165 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
       - const: syscon
 
   clocks:
@@ -82,6 +83,25 @@ allOf:
         - vdda-refgen3-1p2-supply
         - vdda-refgen4-0p9-supply
         - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
 
 required:
   - compatible

-- 
2.34.1

