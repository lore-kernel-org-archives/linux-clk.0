Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE25388384
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273535; cv=none; b=T3H/U+hebXB7ED63tBBBLoTPHV+Aifw8Y79wWpaiv0N/LBs7ehVCmL+vWuHZvFiNRoit4CMp+HCi1URPZTdIrkIuT4GftWioAOov4XaCaAP4bWSg8pU20GMJqJNdWlvwg9VYYgY1c/nTO6j2eSuiK6BrycTUIWy+VNrDmxXs94c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273535; c=relaxed/simple;
	bh=xsymo1ugehFJSuAXGkDjvH2HKamUbLSlU6g27kRpMqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEJ9fgUgxe6wvqFKOyPNhndrTxbyv+pOJcct8tewNGEmhYR26QL9tumuXz8Th7RBcDFTD0EXDgYIBUWtRpJT0O3GrQOz65abo0LWBoITGtuCy1FHEm82mguwcCyNFoguTmOPYX5RNu1ztxt5B1QTTGhnpib3VG+OVy8D6UGLMoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzpyDCic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDnI3Ftz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzpyDCic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDnI3Ftz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ci9I1093111
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cSMEyKRh5Yb7aSvXdUBKQev/vl7ZJs6RT901GK9RBY=; b=JzpyDCic8QmZQxeS
	ytNwJXOAQf1aPGgP6UoQhbaROFbCwPnWAEpp80oSs0NSgoaajp8lioe5BVJlOg0W
	XP0lrcMvFV0QAEFvpjxS6+UgBT59tqpKmDxHb2HPD3gX2iyOSQMBijG4kvksAFsW
	bp8GVayxVJWG8LmIEPsmXg5JJhwcyMpACngFDHtMNW4K1a32b/S5NptvAt+TXIUp
	3e95eiLaslPWaF9eQX2pFvZQAGaaZHra2H/ze3HIGo2JM2UJv7Eaqe9/oO1Nvxp2
	a15u3gQRojXBzfuUnaSUsznFQw1i23nRHuw1WB5Om7KoLhFXF1vQ5V+LLp1uuGDC
	lbxZxg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0urgyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so154523805ad.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 00:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273524; x=1784878324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cSMEyKRh5Yb7aSvXdUBKQev/vl7ZJs6RT901GK9RBY=;
        b=PDnI3FtzeJrrxYu4nLzh6qPzHrQR5+IKiGQuZI4Wj12Adre7piH4pGhrEYWDBw8vx2
         ypmMXP+MnsVlM/1wW70hFf1EnIjIOWMyemGpBInzmkJoklhHe3ZxkAkUcE6Gwxp6TEOK
         zjy2woac/mL+OUU1VlCoMeiTwcMKMigSdlb+Pv7Jz5H3Y3n3sOfvcCYs+kc+Q33GF1vs
         hqu8CGHC/Tvc+XBM9A64NwjSA43a81ws8RcMaLLC2SJ5D/alCi0ltFiuUpjt/RDTErA+
         b6trE5teojklL8cU/crf3aYrg0/MLkMytddbCp10OMx7dIwJ0pzKFkASf0Xzmg8CbAft
         aziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273524; x=1784878324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cSMEyKRh5Yb7aSvXdUBKQev/vl7ZJs6RT901GK9RBY=;
        b=hWWKbrgjGIW4KWJ2lSp/Ssn+jzQNzA651uD28seN0Hmm8a/VRznVBJwoPJ1ZPAtjph
         kbWu/9puI5Jqqi/Nba6dXajqe/+BipzqudN/rj2EveH7opEVsoXUSegx0t2mYppb7zJs
         JD6lbFyGHdIXlJE38rDzJdmbnhnHw6m8SiqHXDcRvEMqVqcf0w0QpufoIgfe79t0679H
         hjCWjjjPLj3L3Qkwq8JmmYsUA7IxnyNwKd5mV/UET9mZnRgsrfV8S3Hz8QKS0YMQ7wAX
         zbHwdYo5Q+hpENzJN4aGcTmSY6DYidGq9gsruZhel+n6C9utDoGn20WG4f+lcd193dEN
         hnDQ==
X-Forwarded-Encrypted: i=1; AHgh+RoX1pprKmxEXJdstXW5d9uHk/h4NcBBXrOWky965tXkTMu4dHcemrzvla8jzfGtQeUqvBVA+FgbKuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzX5MK1GnIG1WObdM/c+oNlEAeCnjg1QunzRb24Q0DhYoenanA
	oBA6solt+HFSgb64O+tv4atSsxQRCIv3lBnLcop3bZovK4rQs82PohRR00YWk/In4tyvJSaiOBE
	KNwxv3NFd2ju/62OwNPTEtYZj8zUxcmGr5KSlpmC2qlN5TD1Oo8PJqFDR4hfzLFU=
X-Gm-Gg: AfdE7cm4iJ4bXeTqqTttneC8+3ZAX6smexS8ZMtjg+FtZy6op5+TOu5VrxapiEth1gi
	xiG4pdkY0u+9RuQmv20XASzSpSoqd+Tjcs0CfpcjHRhRhqcLmvTFei1xDmHt5LaG62/g/MxAciy
	z+5LR8JKbLdHxVfsGztzjAkJokFYwgdZTp4rSvVFqsIv/P5XxiO/5t8rdN6fsFeuojnDHNc7s+U
	0NsBVRV0+adb47+B7w5uY12B+j7uaH4+19wQVNTI+mVKXhnM1O4nIIeqxxs9Jt06TRJGbwxvcDn
	Pun6hsJdyCulTqzF2zcmqYRLyFGI8dCBXsNN79NhYP2nevZMRKjeKOgZLVYYmiTryRLDsORSP6E
	ktYRvewY+wxReKRxiMyXLLjir
X-Received: by 2002:a17:902:ccc8:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2cf3484b1d7mr17097085ad.9.1784273523783;
        Fri, 17 Jul 2026 00:32:03 -0700 (PDT)
X-Received: by 2002:a17:902:ccc8:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2cf3484b1d7mr17096775ad.9.1784273523334;
        Fri, 17 Jul 2026 00:32:03 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:02 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:45 +0530
Subject: [PATCH v8 01/10] dt-bindings: clock: qcom,milos-camcc: Add missing
 power-domains support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-1-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a59da74 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=90z41mPHMHFWLCXoM8oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX0FqKO3VlkbWb
 j/xkebw/1fgZB8zStLfC/rQPlotflWN7WFbKdMLMthszWFOxPlh7uzolo2sImDNb3EKDLG3BHqx
 mOPEZZpN/AMSF5wiZQ0ywE1i51xKjfvoQo9faUcBvAFcBsAABI2mZXtYj89WM0beqEX2sFEHfBw
 mvymOcY/xbuxdZMkeJo4lTDYkZ1IF8vlSDBqWzVj+u7RwG9gTd2X0GAeWKEDEKkajOzf1NDog5P
 Mjh9DK3fEkLce0WIFWs830ClxyWHSJgfzrFQgZ9i63VNLWKenT4G0ap36i+xM3CZ71GkrDXwGH4
 9WyeRiIs3DueLOYm/m5q3GC5yUVSgO2BoslXgE/q/0Vzo+2QB5hqxpGZsvIOX1URjSf1+TTGc32
 plQe9bZqXXy9oCfOoi8uZ2PEy3I7f+naqUGwFw2ek9Q64y09pM0cJMIezomm31OveDhhRGV9NlA
 jjo5mAO2+oTUd/1BnQg==
X-Proofpoint-ORIG-GUID: DM7L3DWytSbZhn8QnNggcvXmToCBX2r4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX/mn3MfsAHbZ1
 5Yq82GbpLe0JZKuL4yWYbzjOHji4CE9aq9p9V1aXN9l5+tU+j9eaFZF3B6UoWX+YrPF/fmfIwl1
 ahzgU1fLR94a4bed/GKjdL8iBOlUY2A=
X-Proofpoint-GUID: DM7L3DWytSbZhn8QnNggcvXmToCBX2r4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073

The Milos camera clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented qcom,milos-camcc
compatible, this is an ABI break for any devicetree using this binding
without specifying them.

Fixes: dbb9d53b7197 ("dt-bindings: clock: qcom: document the Milos Camera Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-camcc.yaml   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index f63149ecf3e1b98e60dba27093737ec84b66a899..2295e7627ec9feb6a67f3ca952e6192a31cce593 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -25,9 +25,21 @@ properties:
       - description: Sleep clock source
       - description: Camera AHB clock from GCC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -37,12 +49,19 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
         clocks = <&bi_tcxo_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_CAMERA_AHB_CLK>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1

