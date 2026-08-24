Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F638243956
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572509; cv=none; b=CQoCSMuE9cuyq6hMmqrEzZSv1jpOr+uWd4Qdr+msUGCTjIgA/EgXN+Znnzky6XBoH1HFl7Wp34OcXjZULeWq2eRiUShkDezFv3eBsCbim8w3oS7v4ISRxsLXk5QiVpapKI+r/yYXSGa9Xsh0fE1Qs2PjArj/h22iW8Iohvftlto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572509; c=relaxed/simple;
	bh=1G7ulVQky/ointLS6R+9kp+1rcIWPRl/0UWlihoY1tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPDCPwGNIV4669biiEU7PTumEYoLWtMQWSOgtL7qh1Y3m7lQ2sTj7/Mc/ubaAnGtNhlPcVQJTW4MGMrJ7Fb374Ajn1MV76H/vrOh2sV0kCns03aNzsxqNPpSb91tR9IIlf6Fb1Oir1UddoVQ/C+xfU5zpN68vl4LxDqzirOorTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEQykwr2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kkmsfxbu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEQykwr2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kkmsfxbu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMZYk1673221
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txJ+hSeexQtxSY48PknJL/i+7XIW+liJ921ytGQIGhI=; b=OEQykwr2CGsk0tPJ
	Kq7qT24u6pWpAuolZtiroPGdscZWPsUOFj5cOfbnOWO0sn9BaieUDOk9UUpo107h
	w03TtoeeO9mD/djvLcKcfquSfzQxICg5RqintxonTj3/hAuIdvGamT4qKhmmHeU8
	OzhJOKvnlYb+Bf1CwJDJwZ/vW5zIGB9ES1cMSGpukMI7r4zIWQ87r70iSDf8rxS7
	Xv21zp2G8tS3YNmbtCZUmegOaaAGZxHMmIA+QOT4psoshpEd6gcToqN4ZIyBrFAd
	4ybXw5z9Czk+EUDxjhb3ePChne3F9f9AuKEFP9an3WDAraTZWOAEQ608rXxaARTQ
	N0EW5w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf1167-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso29869966d6.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572506; x=1788177306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txJ+hSeexQtxSY48PknJL/i+7XIW+liJ921ytGQIGhI=;
        b=KkmsfxbuoU/lIv1aPhJretfZnQiqEjKLkaEhswhZQn4CIC1OvByxUiF++duQn1+ihn
         4/GDcZKmiNJWuWO67YJ3Was2tyEuSo4WvCsMLI4+PRFFXGlwKJjdJJ/vbamKhtFCv0cr
         6TRAuHdrRmMq+vdM9yrhHbXIbAHlTpbsi8U3iQIkVowa6JV0UGcgu99ZvDFISNaYm82b
         MzMh6xl7riABDb8YKREOnZTZv10FwEJwYT5jm+HXz4J/lqDbOiF6ASbpY+gL9oc3+aB7
         h7mQguxOXFuu5Dgt6bMsAuljypNfF0haFE2reTAlU1NvIUYBW1oPkbIyoM9XQ797bX9A
         e1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572506; x=1788177306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txJ+hSeexQtxSY48PknJL/i+7XIW+liJ921ytGQIGhI=;
        b=YWratDnUmr0LN+N72AxAcRm75EC7pfzUcjNEj12uIkyS0Pdg7wBAFUHWEaJRuBcT8O
         5KySMWk05HR2vc4VGNGB/zbeTIWPooAzc04VqMrxze4dglMyez9whowCu2+N8xoml7YP
         G5fWjOC8cC6XGrh64ArfGInhEQjnKaV7YMrT5SGO78hGnFGXtQfglUzctu9d0Ka48YmF
         NPubIaE9xrq93t9VNFEHfP8DHAswTRZEXN77fdIx3a6C82OLjpatJAMOndvw++pm5+ql
         K7bwPbIHDUwEk1N8tbPcdM60K1CnCx6GugDGh0y9jidXuvNAc864Dj/c40/u+gxBK9T6
         z5cQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8YlFtosh3dEe96IRrBVLmhDCy8Dbyg9LqiVXAFAtD5wvi6/Gb/jmuMueCGzdrcJijUSNdDGsUEPI=@vger.kernel.org
X-Gm-Message-State: AFuF++n1lOEXY+ADQhONAg07n7XjnmQ9gX5esyLWkambkL3ovlYY411P
	VQUektJAlO5EIrbl3Bb4gvbNS3dL4TNdlkzLtgXjr4yaJ04RI32AUJ0iuInZyXcKkOw4ERjDPlT
	VUT2JPbPhigKh44Kokp6aTCIFTLXqT+tJ97O9uRuEm4SU7vz79PwCAnbDiLPSAok=
X-Gm-Gg: AR+sD10VLFMlKt/lBKc4iTUY8geJ9HxybxJVPAhJ/42nJTVJZdcIRNhIPJIN8oS6SIZ
	k4dN4TGn15DM0MGtjCa79nm7ORxoMnvTfe8uhoR/RsujdvpvtF9IPsPJc3kMrxIwehf1DBcHYYh
	Ic7iGoBv2I8vv2D9En91RBPcyBlZi7zOPOywXW1ayxHvaowOgUVML0LOBdfOXNCCb8OALUuVUxk
	oHOIhm22p/lfD7gLimOYH2YjsQ7xe4tPA35CB4vAj3irtBtQiOswj2GEVr+qwmZTItGEM9Idr+q
	yH+Z0K1aaKFz1/JuOy5b1wsc/KV72RLBy5cLfrq9hicZvdMb2PJG4rn58nQ1XC0a8MCjx2gzd//
	uIiYKKa01
X-Received: by 2002:a05:6214:3293:b0:8f2:3472:5b33 with SMTP id 6a1803df08f44-90c81010fd3mr238751986d6.23.1787572505977;
        Mon, 24 Aug 2026 04:55:05 -0700 (PDT)
X-Received: by 2002:a05:6214:3293:b0:8f2:3472:5b33 with SMTP id 6a1803df08f44-90c81010fd3mr238750846d6.23.1787572505266;
        Mon, 24 Aug 2026 04:55:05 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:54 +0300
Subject: [PATCH v3 07/47] dt-bindings: clock: qcom: sm8550-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-7-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1G7ulVQky/ointLS6R+9kp+1rcIWPRl/0UWlihoY1tk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDc/cJqBp4Z07otOHOpvaGcAPBqvb2UE0bLZ
 W04PZ2BFU+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww3AAKCRAbX0TJAJUV
 VggpD/9Sb34tM6MyR9EIv+aFToL2QjKmSCIu+dH1/GvFudL7nhTmLPpmSdHkzHMQAeDu2hYg7P4
 i3IpeTKTH/UrDF3yq7J9khk9XblQnjVhupHCr/2uL6h0grcr4I2IxJjlv8zVsUk31C89M64ITmD
 rOBq+W3sCfQ5zrd4KRVQdbpS/T+xAKo6LeelKH/dt1o0ite+ECpLOY9vNUm02+ZcCD3xxbMWjP9
 gRfEfMP5gNo/Ag9xHz8GhOWYY4G6Uui65Roy1P8LCsEeo17yNJeY65/L9TyrMxoPJFQsM8d6X4a
 xasM6/J4+VBbSgSU69JM+i/V8r0xm6nZ+rj9iscOuxCGZaWE60rsPDxjqRXgZczs0sJIiWRt9qd
 JBi9dwHPJVZKtSjvTNVbqZNXukhA75wD4rTxkOiHIDsqBUbyQQz5jBmTb8ae0z+bq74xXjo4nud
 3d9s++2vd5th4KyZfPKLkmP7a4OxEAWyEOEFMKrFOAPasGMOLYn7kjqu3S/6txeKnwWeAhr3yeo
 DBw5iT9QyKvgQp8eD1d2keriDr/tJM1Q8tCYdtPNjVkICTmwyP92yhxJQejem80H2XaByjDhkja
 AFBLYLAO/1PcFjaFjxCoi4OE+KboeEtIssv/H4fhxtOA3IJe5xDeMr88MA7GzmGM1JmdKy6Rnb2
 ant550+vMUDKTYQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX0qAOx5HBcNlM
 7XKLjDODFYO5BBhRVU8ka4tdsMoGLRRtvTW+zb2FO3UyNyHkJTC9sHo+tcedX8MNTTiB3Gij5X/
 C68SJU2VHwNHJCnXRUubsovmbRBaU8o=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c311b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 2ltbi4w6IqfrgDoycMCjAAgWcYhZt2pf
X-Proofpoint-GUID: 2ltbi4w6IqfrgDoycMCjAAgWcYhZt2pf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXwup2EpFFeJNB
 GUBtiZ8lTGuH+9m1VPAaZcxaMMNgVdQisBX5FCaXQZudcQmBat/dauN7c+859UB6ySzP8+qkKud
 manPCLfb2Fn8wQx/a06rgWmvuMwf3inRS26espTdfyXNTVrE69HG8OH/IUaixxyyqi6hOgYYH18
 5nFINfKhwkcfrb20Ds3MJAoXOtac6Z6qv8V45wn8Lad26pocQcPXXY2hTjkQZB5khk+7r9GrYfh
 Stty9n1lx0qgdEu6uGdsh+UjpnRw4mXyWOGF4FMR0Qp7BrnKDzb2DCoIGHPhaHEIriYqHjKywec
 ywcJCwieFjp60zIAnLJ2j0ZEOzW9+++Gl3jA3zcN/CjWxtgRizBCJ3dP7ERoCw7VJZwn4D25Z1M
 8jQFu3Z7e1KPvYlfWze2d9wDPNtgmOvC5k3pSqfvKNS0QPDWThXHdOj2dFk/iQ+oN0SDzC1fo5O
 UqXM2AyL/41G49jMZgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GDSCs provided by the SM8550 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
index c4e9b9bb63f5..26b78bd0afe6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
@@ -31,9 +31,15 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -44,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8550-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -55,6 +62,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+       power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

