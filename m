Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DC243B3DE
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954456; cv=none; b=JHtReBFbFAHVlHw4IHFMhCeuF3Hjw2Cbid0HTrJFA02LFfli3AP0xEkRaDwJSNXb212pMKC91dsR3RELYsRhsMcKN7tVfV3ry9gYzif88a4rznzvk1MtvlqTRRA2YWhTPM7VoZQF/yBr6HJWvvHV+N2lpdJjXp0a6iws3rQH6d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954456; c=relaxed/simple;
	bh=/MQJsUKl7dlqiAcb7deGVSnq8frhZRWs5A4bt8zOj9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAk331htCgoz6m5BHE9+mmLTyBVFGUgJqz3KPFdV3hUFlpFuonEr+FCV17U0x13YG9Y1FPv9pmI9d7aurNieO6B+kIdjpY9wj2MS63ndBWSvBnbYj+XqXZdk34MvVe4JKKcDneErJOXs28MMjWw+Aei6t03tF07G1X8ktfbnm3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofQorq/F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+hnow26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofQorq/F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+hnow26"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDdG61480703
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 14:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=; b=ofQorq/FVZQXrf/h
	muej9Xe6JugH2Vf4rCykWBdZPw2WxMym6btcT0gpDG6bFDG8gfkJgb6deXkN+Knx
	VfYwOLAmOQUcDXWYuyMY9pJJDnE867w+Y+NdiH3HshdsZ0sTauLMy0XbFRBj1RUf
	Ph3TQIOIzvWdjkYNZJeZ2VKOXom4OA0npNi0JFL8R0omgOsSgPG9a4Rc1xysCsL8
	U1LrASJ1/QdMtzPqevW0ijYTF7LigMlPCMJyQ6kCTkRCM/03wBRkLvTCPynEcBwN
	EsXM7DqdwEgwlNV1mm9ICwQuNZ81keaml09aQz9bIJCwzcga6S5+mwaxraokTULm
	XH40AQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavsa0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 14:54:11 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-448bb8bd2efso5552831fac.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954451; x=1784559251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=;
        b=Q+hnow26g56Rfc2+LzLoDtgiHX6tfw8+wzNHpnTEFiuiKRrl7TIyyw/BMQwmgWajYh
         C1xLP/hCRrMOGvuZTzNDPZ5PfZPoE+LyOtc9S5STrXWcqG/1i5mWaViamwCw/LgeZs45
         dU1IdjQmDYx0c3mGVNq3zr4da4HAVFi1FbyB87ThxCGnzaPijK1z08bmvZA1VRjTnput
         +2kRdbwth5lNmMGJ4R1BuIwCzVx5nZlNA12M6kLBZjF5I/gNOIiemTbbNVaePr4aW+Iu
         t/OCz5b7epg1gqTMa/4WIMYPqc7eIkCkpibyWsbfPFIiOVhjb9vq3+UhOsK4z7tT3QGa
         2NNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954451; x=1784559251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=;
        b=GpmD/ZC/0wcy31NPLOL3EotIonHtLoUSJkvVQn6hDNXKA0Cjc9mTXtVCnyWZ47I6xJ
         qIolWdAIz46dvsAZq6mO5okvF4r3oHPsEgaUZNd0bm0QlnZL+0Y9MVasCJLgawXsO9+b
         OTfMt8n1I3l/r/prKzvh4rSwPaQ0tkz9SDfyWBuvJPW2+EbSNKJXWAlWllRMEvFR65MA
         bnbaOQSRaA5xRKreA71DDiasCAt4AXRoAw/B2VUrvQFsmX5BnJ5XXJJ4QtMJOC2zkzcT
         /DLQLcB9mRBE2yKj5dTfhXBKFRlntL3jyQGYohE87sqSki8OTFIaQJia4pbufuG9TqJ5
         rPyg==
X-Forwarded-Encrypted: i=1; AFNElJ9H3P3ra1VQ8W/k+jNRsClK/7vUjn2g/DfF8Ykt3CJuL0c4kHhR1Fi7jqH5kscKdZ+07bulhno9la0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWZ8dnGnWU4C6OUlG9CrUosFNemoc0FqeLa8zfCAnMDwmpZtf2
	JHoSI3luPu4EAmcEMmeQ7CuF66XHrC4j/Y52jxA9Fm4NlcJoxXuUF/uvOgSoIqTFXPvIUL9w285
	kafralEjsvdOWcbvNRQULeFbshYaBh/CgAg+4H/NAd3ActSwGFwhnjBLvOzsEQc4=
X-Gm-Gg: AfdE7cn6yDSd51Szlmcw8zPWRZBue3NiyYaaG1r2bSI+m1nYqezdK8+G+pQknU1R6Uj
	JYCN4GbPw5jariJGecDaV4PO6cqSEu6IwwxOfAnc0fnNR7c/NKYVwDdeZYPBRqypHQq5vXjlRHZ
	tSzg8L3iZmBcR3hcfEXLhc3KUxKKMSlUBLdCp9pWzo3SoCELQXMHCoD8bfh1uPdriq8G2EMR3rB
	oXNAF12ilKYXlOOgnJBno5HF2D/pfutK3CNx3ElKabqBIuwpMXyJoGq8qrcB4wyV5/zU4ldGk+0
	KHnGoXR/CrOcglBfY5QMp7Bc1yo41q8jGrMl4cJctQW+l3xq96aU3rhLxXIIJYCmXrKvK/3T7sV
	SUeKEDN4JVzOy3VTKF/A1DyQHwOrnuMBPdaI=
X-Received: by 2002:a05:6820:98a:b0:6a0:e15d:7a with SMTP id 006d021491bc7-6a39a54b726mr5693303eaf.1.1783954451006;
        Mon, 13 Jul 2026 07:54:11 -0700 (PDT)
X-Received: by 2002:a05:6820:98a:b0:6a0:e15d:7a with SMTP id 006d021491bc7-6a39a54b726mr5693280eaf.1.1783954450612;
        Mon, 13 Jul 2026 07:54:10 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:40 +0530
Subject: [PATCH v7 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-2-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: NAWjpGhvhllT7BnVcxL_dCxoBJ3rGWB9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX62ONQnQCqaN4
 y/mpNaOCwDbBl3tlF04lbnpof72tE1xcVPXds9HEFL8zQ2SfZ9kCnI1xVljLvnXKHO8cJ56YwJt
 1Zx+WVyCVbevYKLsJIO0edbV1zqsvmFJ2PVTnDJYoal2EsYQbNb7i4pEaol9ChHZOufjV8tX/6R
 ZDvDQnR12X+8+Vfq84eo7r27VEo/znDar6e/4bmCfZOWg+hKYp1I0rHLAZO2E/LvuypiAFDAV+B
 AAv0g7evUPdPX9IJci0ldwsRFsrWOliD4IBraNNeGbKitXvtRpreA5M340U7+i3gbWnFM+5X89n
 DiNAF/s/16NqqHqqywT9brd4/xXmWfqzQC1VFc5qbuOzpiAYokLbmpZRRWLNdBC01iWiPUcnNiY
 0blcIFU7+dYWga2A+dr7Gsm3bDoGCstboddExeYkbPxao4ZngdYKX5WAsG5VGxiuAHg+nuumsaJ
 U6FvVHvD+C5aggs+egQ==
X-Proofpoint-ORIG-GUID: NAWjpGhvhllT7BnVcxL_dCxoBJ3rGWB9
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54fc13 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX55mOs4/hN3HH
 XvW8CHy7BvuWTE+bB50sC++qP8kKNxc9gKcv3CGpUkiuHWMk7hxifu2c4tJCyvH5HQrQdHfpjTX
 xnwOl0hWDvFWbk+hr1yyOH7KloAdF/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155

The Milos video clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented
qcom,milos-videocc compatible, this is an ABI break for any devicetree
using this binding without specifying them.

Fixes: a4937e974186 ("dt-bindings: clock: qcom: document the Milos Video Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-videocc.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..4d8d109cd304ef0f5afc5c3fc7961a6156003d4b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -26,9 +26,21 @@ properties:
       - description: Sleep clock source
       - description: Video AHB clock from GCC
 
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
@@ -38,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@aaf0000 {
         compatible = "qcom,milos-videocc";
         reg = <0x0aaf0000 0x10000>;
@@ -45,6 +58,12 @@ examples:
                  <&bi_tcxo_ao_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_VIDEO_AHB_CLK>;
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

