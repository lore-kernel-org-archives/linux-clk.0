Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A38352C52
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017187; cv=none; b=mR2NKTTdd0aOrAUaMMdga47qrhQdd2wvh+VvFwUPnSvGW1c+CZgDgRaojjqEHb0Hwim816fM0IFcm2V49kKmWQlRS2CiEVvOA548PMB6FGI5koEKeJTcYBsnDAQVnI+wpZ6zPhK8VlOvO5Wk83URSlRqkSMXJqYrmN4eThwitAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017187; c=relaxed/simple;
	bh=u296xN7DnqwT/c4wVF8FKXi5grt0EmOqRHqz4oSbztY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1dg7aH89LnjHWm4PkFBXjpRMuFgU/Wq8VZ66CXbW74CPLKz2ZIM8NSD7j5Lt2EYJHRatf4PjljhJXXW8SuKna95JyKOXPxRJqR/atf6ZxQ7d2rmG6Pc1DW/P4yS0H6y2UFSWLRaL1FCTABI4D2dnr/iep2CWSvrwf51D8FrcRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZviUj41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1KdItvn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZviUj41";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1KdItvn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662FUdEE866081
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jj/d7NmRhn9U9+C0ZpDDeUtot908Z2SfLT/1dmj7J9w=; b=MZviUj410zj21sz2
	gWIpWJMtwWXYZaQkKutplRjDbYxAlcrwmpt5dGC6JHqhKbqdnDCNrSB+g2NNenGA
	baq97TARiAWDelmey2JVopOiw6wSMegQbzaosvvmNTHLbpCOqqEMPXNiCMGTg+lm
	8mlMUHqOlplGHQwWEcCeC3xMFTydZ2eAMolC2vt3xawPwRwITZDndA3tVQXcy4YQ
	saGarw6+lFRRFiBJR4F7x65ooVjaD2bEdKS4QWaSVULO4XgMK7MMlOr7J2E0DTkG
	89juzJd9bMf/TJot3xgGt7UMon7iN8uO4bAIFkQrn+44JBsguGAz4bLxXpbw6TSJ
	P/Tm9g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpngrbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:33:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478a1ec69fso2964659b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017184; x=1783621984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jj/d7NmRhn9U9+C0ZpDDeUtot908Z2SfLT/1dmj7J9w=;
        b=B1KdItvnfmaoMXp0kz+K/4+qdvx8ZruSZi9myGpefDvNIwco4RdNqlDsxhgEAwHa2M
         OcIWPlgOzeEJNx+7FOwsfegj0bV9IKJA9LAHOaR9Uk29dRCS/WdzPq8tn4uaaVn6NFky
         /KTJ7TINIl66L9x0wGwpgZr8Jf4/nR6ETgc0HExvACR2v/1RhK8qn2Cw352STaJFJlbE
         mQCA2JUjxJ3zzuhBJBMt+K7sp/vKnS94tz7OE/zZxO9pwF+dvWNVXMJrZ7YozjJX1PDk
         nLWWl3EOUihKDGHyYfGk61SSY8DZQJ5JPw22NlwZ+L81QaD4S17aCwVSifShvwwvytm/
         gL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017184; x=1783621984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jj/d7NmRhn9U9+C0ZpDDeUtot908Z2SfLT/1dmj7J9w=;
        b=ddDkifaOuOdL/aUmhc7+/rXZG8qGL54nzjZgfHciy7DnsdWeTZtgREqvuvevvc8ysW
         tv0ND1IGbJQ2/LHg1jjdydW+3wBEo6g4Slx73oKN6NS8SKbIVuoPbZ+8ktdJCLEt32M2
         oiMXUXy4RrVfjkuYFLmLWfFtfbQeoE+eVgpLecKqZ5XlD7Q9hg67zXKTfutVhzpM81yJ
         +HfIODdb+EtAUkaREX/QFiybyllvSriHIlWY7dyeweLwnLcPJrWCLzkL1J7ZWBlz/JX9
         9c6HSlRMztrqrGY7xKxJBKajiB0kH2elobzkZJK88wIzlL/QfpeBu9TP1ex844+VoSQw
         JXIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8s2d2RfONjRfrSdctVtqiIHYBs2XHeeEl+p/JLLEHhKlyPxvC7SrhKV/iW72gDDiEJtj6K7+Gywi8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Qn36AA2KYKYXlMG+4hmcx0MSU4BUn7SO6jRd9hHykRNsJHfm
	s0/rurAfjbSXX83oTvPJpil/dtNxnw82bPYXmCxvs0CuOB/V2xtN90Gf6+ghUQkTZaXmfEF8BXA
	X+G4CFkpx2zjgq1kZQhqIzsgFXSnoiH7bAtbbx/up5g/PEKWAqn+DCSW6XP5Wfoo=
X-Gm-Gg: AfdE7cn7O90OXUQGFBE9nssrk5GEtI463yvaNlmij2xn6Y4+iVtRckz+ed8uHuE22xi
	Ex9PgoFyP9wgY7rCbRm6iDfzgVILLLAdQeTLMHQmLSbOTXoHY5vX1j81PXC7NO7CgG8v3R1nKAl
	9LydiXA+FDeOIbLEuS/uXH5UrnMHsIECRIP6Dpj/4Rs6/tuKxEqcM8xoVUxOYjQkrFwvwirt74v
	GMahYFMgQvF2fdms25aAOUXlrRHWjOXHDE4k6mQy50CqpTGP5M3VF+WpiqzHAnpxIhK9UaImbgf
	5+pDBhREqHnO9ShDNyAOE7B4VTHknb4VDcql80V8/x2cjzMTRkTjSeFy6emRLuDW+O1yJW3aG9C
	osOMPcSKaMtovIUnjiwMqCNwpT3bAi1qEKJ/3DMlLEA==
X-Received: by 2002:a05:6a20:918e:b0:3bf:b6e3:fbe1 with SMTP id adf61e73a8af0-3bfed6117f0mr8444060637.55.1783017183980;
        Thu, 02 Jul 2026 11:33:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3bf:b6e3:fbe1 with SMTP id adf61e73a8af0-3bfed6117f0mr8444019637.55.1783017183523;
        Thu, 02 Jul 2026 11:33:03 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:03 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:24 +0530
Subject: [PATCH v5 02/19] dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1
 PHY and sleep clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-2-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: XmkaDg-TxtJ2-2YMp7hUFNskC_1EQ_TC
X-Proofpoint-ORIG-GUID: XmkaDg-TxtJ2-2YMp7hUFNskC_1EQ_TC
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a46aee0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=z-ZRDpFp9XMTG1_t9IYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX083w/Fbo7FGJ
 ibdzPRqc5pbFAdze/NsGj1CiyEntCvuyfCrzhEwXP+DYvThZbEpFuSNqS52q/F+te7qQqGWI1gr
 woDdIKmwEY6lyeIBQ17tK5aXanG15Ns=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX3+H0AsMt/I7c
 EDQMQfp/H+AgWEKFmDlf3gJs87jkpp+BTBTv+imahVnrant01+VyScllqbAzkioNxbJOYEG+EPz
 8QQv4Both5g7qY186aGsuTPupdlPz5cjLdKgsPnDe9R18nYbRfddFqFPH6Kgi0dDAbUYX+SkV82
 oBIocEIbZGoBi+Aok8mBJ962OZtoXIjr1g1B9xbqqbYYa6h5PrZ2/noTzDEqfU24nXBOhCgiMzs
 v5gNgdMDceI+D/oR84Q3YBQXch+MF6EGu8boiAYiZPNybTB8ztG98Fqrpi9JkWBJvyfXP+Sg5mG
 j+X9NbsvBu+UTVJR1CJjM7FuV6a+DxmsJJuXa+BAesY6IC7IdsAFS/7uRpRx+PULPmP6+OKPRNs
 mjl/J7c+j7E/Ih1pozDXIhkXe1lm4hXSz7PRIn6hnVUJARIrs0GzI8BOeLp5MpLbgQ3dalMbqL5
 ChVE1KnM0+3FqzHxPXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195

Update the QCM2290 DISPCC binding to document additional clock inputs
supported by the hardware, including DSI1 PHY byte/pixel clocks and the
sleep clock, alongside the existing clock list. These external clock inputs
were missing, so update the binding to correctly represent the hardware.
This change breaks the ABI, although the existing clock inputs ordering is
unchanged.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,qcm2290-dispcc.yaml          | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..24f2cce033f6e109b65a79553fba5295eb9adf3a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -25,8 +25,11 @@ properties:
       - description: Board active-only XO source
       - description: GPLL0 source from GCC
       - description: GPLL0 div source from GCC
-      - description: Byte clock from DSI PHY
-      - description: Pixel clock from DSI PHY
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+      - description: Board sleep clock
 
   clock-names:
     items:
@@ -36,6 +39,9 @@ properties:
       - const: gcc_disp_gpll0_div_clk_src
       - const: dsi0_phy_pll_out_byteclk
       - const: dsi0_phy_pll_out_dsiclk
+      - const: dsi1_phy_pll_out_byteclk
+      - const: dsi1_phy_pll_out_dsiclk
+      - const: sleep_clk
 
 required:
   - compatible
@@ -61,13 +67,19 @@ examples:
                      <&gcc GCC_DISP_GPLL0_CLK_SRC>,
                      <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
                      <&dsi0_phy 0>,
-                     <&dsi0_phy 1>;
+                     <&dsi0_phy 1>,
+                     <&dsi1_phy 0>,
+                     <&dsi1_phy 1>,
+                     <&sleep_clk>;
             clock-names = "bi_tcxo",
                           "bi_tcxo_ao",
                           "gcc_disp_gpll0_clk_src",
                           "gcc_disp_gpll0_div_clk_src",
                           "dsi0_phy_pll_out_byteclk",
-                          "dsi0_phy_pll_out_dsiclk";
+                          "dsi0_phy_pll_out_dsiclk",
+                          "dsi1_phy_pll_out_byteclk",
+                          "dsi1_phy_pll_out_dsiclk",
+                          "sleep_clk";
             #clock-cells = <1>;
             #reset-cells = <1>;
             #power-domain-cells = <1>;

-- 
2.34.1

