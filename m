Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45723367B8E
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017288; cv=none; b=GFMSXtL6ZlaqOPlF6/SmxsrqZ1gkPLNxZj4lgDM2JyTyCFBSv0p8s9GtXDofTpWhV75yCfVxe3HX+sTSSHskvVJFPBb89PkvcvPXieGjcsgOddCQ01PRLWoZ+Wl870sQ46w4xHCA5dQg5Y98ZgjBmSxu0CYX5Z2NWNaqsoNpu5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017288; c=relaxed/simple;
	bh=cx9dH+fPvbGPwctfTnUVbOozhcl/R+Um3kyHRpThNdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUpoh9xHUn3UftO/0sbvm9zQIrFDrFpyCzlwgMbEhQxrw2c5xyw73wi0YdPoj6tPv48CrHCeL5QKwigJWzZkYpmq6g82C2UHp+jNAAg6wDUNwXJmpt9jszFAIOJD08OEF+ZVuRDpefYcNHtSctoSoNbmL0VAyfeXJO88hU3wl94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ED2RE4Sd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EL0iMdj8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ED2RE4Sd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EL0iMdj8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3Pe9662008
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lgZwKjPlID3iGtsiOBE7KjJxEWUWSAaIZvGXlBxzDIY=; b=ED2RE4SdTZzGShsT
	7DTAoGBkpVfH8pz2vijZwCXHrQsoRrk8ikDpUKpkkXw7wypremxboNeBrgCID8/l
	hvphS14kNjw7AFUGclFU3vkD4T55bcBltLY+tVVhCZVx/0Zokd3rH+Wua9OxAa2B
	MzsWpfPnk9Xxpr2tBax2lVHXKSH55s3rQ0JSU7ybF+7UEokd1b/qMNnjCSDgIsyv
	z86+PotnyYOF/swrgVhO/yVKXJ/8p0D+bOeRVJTSjFN6dwNmTVhLMzG0Xmbzj8bf
	lfFc+PA3dBoFCzOHnSGXZiJDpBhkm4inEGsDZvL38JcA5cYY2T8Y1uIKQHoL8D/8
	bHv5BQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp9pgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:34:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478d2bea7cso964106b3a.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017285; x=1783622085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgZwKjPlID3iGtsiOBE7KjJxEWUWSAaIZvGXlBxzDIY=;
        b=EL0iMdj8oMxMSJQvXDch+1Ouo+rEk6hVP9qwh+6JFNliKTNlXHr9/iL628JXvoSQyR
         27qX/4rBVlz2mbyE/NjHB5NTcckvTeVaf1+DD17ptG7P/vHY0dREOtep6VkGHgE0KuI+
         w+90VAuRqM7NUsSYg62FS1EB9YdpJbiNIk5TUPoCYRJY9s5y9Xd581DI7pVNCmSzfnTO
         z9cHKglJ60ypobZdXSj90Vg5XCRgFLeaSBWBPlJ6p05Wv0dezEc03PAsoLgYSQ36gjpM
         A2H60jxLEQru8StpqIEs3o6Y4wF/pJVD/rPtiPhnlYA/zLBopysWZ2kWlACsOVpWG9xp
         0m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017285; x=1783622085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lgZwKjPlID3iGtsiOBE7KjJxEWUWSAaIZvGXlBxzDIY=;
        b=n5EFZyV+RXHyVJqjSQSqogsfHuJbVpgKEtVeJqYqKVeMI4z4y3biblsnYLKZe1fk4O
         yxRYOJcLtWifFmPmE633UXlK4pT4QkqJ+MfBC8U6WsqJGd4zPSn3fPqKSJKMAu1Hz7RM
         iWzvcZr1fQpD1Ccap5abVFBU4Q2lWrXohEN/wLPuKe4jvMNjw+66AzgyF42tid/V3rTO
         zgcioFLIu+CxhRMcbfUwUILGOyOQV6zZrnczXFt48FxFMr7MFeamjEUki6ywsiMbaDFv
         zBvNW91JhTFJSSvpZvMVbqg/sxxWvaXY8cwpi0hVOb7EP1QSFhlhcnGTTfXPnXIFqa7H
         R4XA==
X-Forwarded-Encrypted: i=1; AFNElJ8koWCtGzX0z8lAc+O8HVBVdoyGLgsBCPrf47ADWgOw5B+czB2ET5Hh14CwuIRTySeXeGXHM7m1ay4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3wugrnEBThpp+38vUSm7qvB07Tc6mA9H3OapMmDZqtJhfryf
	X2S3okw7//XcRX5SxL3PTL7A9JNt1aBm5fyPwB1FJ7h1Nq6rzp+JJW687oDab8zx6p0bI6VngIL
	SctHhCB4ct0IiBiMBm0vyUExQglY2Pf/CMSLgmFeWUIbIh401k2VzVD/HzCuyNZk=
X-Gm-Gg: AfdE7ck8l8id8LuI6/f8poivE/2LBk4BUPrJb/sk3BlAWOEi31Pnd7wxsu2/ULPpMz6
	JTPDbDrYwUG/zLKMR+dnCFtl6lhZsUXoWdxgfDfn1OvGc45L5G5orfFJa/1znPTRG/3EocyUi8P
	3cUQ4AvNMbSAKFT1BUVncX4GSLnDGEm527JBDIF+BPOeG9Y+tbUy3RlvrTgWOAXrDka9/lrIE7F
	hFDk5SY/WcxLs6LqTt9UE3qAGG/o6KwmWYYLx7BwKzAkH4SALDrjM9SjFM+xo44oa0F/bFBMSER
	RqyzzSfWngCZ626Wn6sqkn63M+bPp/o3lev04LkN7U/Mvp8hQ2mDfiGvtIYHvW18Bqhh8mMUKFH
	mkXOC7WcT/WGLHy3RQi/wSY4ORrgLtsrfn1m4H3p1aA==
X-Received: by 2002:a05:6a20:a124:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3c01c5e8792mr1184360637.1.1783017285201;
        Thu, 02 Jul 2026 11:34:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:a124:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3c01c5e8792mr1184324637.1.1783017284738;
        Thu, 02 Jul 2026 11:34:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:41 +0530
Subject: [PATCH v5 19/19] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-19-cc13826d4d5a@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX3RUPxjP+CX25
 pJonsKFaWbQH2AUrAQdl6pcwz/7Dc13gbGygwNvREUM73VaZu3Ug0rrPB9pdqucW3ceMkPhzYYw
 SrVYMgYFtDgSeqN/eS8fV2wvxK8QUus=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a46af46 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KUIDwAxYdJFQKfevFyUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXxQ03MuTSG9uK
 ks51SAY19ubyR6B4JPD/syCx/BHUpetLaamh2cPiv1M4gb86ek/J10yXmzOqmZMseIfjtQmRRuJ
 CSuvaNZcqTf5XZLEoNpL8uIvpzjNhVCE+a2SstpPNnhbyglS36PudJcm6f80BmUlJPE2a95/zV4
 xEwkJsEwUBFWgyMCAHuN+Jg2ocSKNpBXwYuFz89xf6Og5J2QJGtlu1SKN1qOYR0bCSzli8qjvCm
 aXFUpaPwMYcer0b72K5ZRPEVsDi8XsvEMp1xG4S4ZvHNS5M7IbkrAnFmIaIipGsQ1ph7tjEvXeB
 7TqO7wB//yq30A9A+NKdqndOGmlCOiHpmaoaH92cZrfwtkoDJ03X4NgzSxyeU8c4e+q30QJP5wg
 sBrB54LXEOxmGrfnzS55pyolg1io9IQL4JZRUsaJxcNIW93kDD0wX25fvkRiJ4+ih+yFOBIL3yV
 m7Amoswe69Wonv0kI0Q==
X-Proofpoint-ORIG-GUID: zI_givJuRqYexQQWFD3PdZmD2S2v2xxv
X-Proofpoint-GUID: zI_givJuRqYexQQWFD3PdZmD2S2v2xxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195

Add support for Display clock controller and GPU clock controller nodes
on Qualcomm Shikra SoCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..39aa3a47564c55a3029763fe92cf485d2569a000 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -640,6 +642,46 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		gpucc: clock-controller@5990000 {
+			compatible = "qcom,shikra-gpucc";
+			reg = <0x0 0x05990000 0x0 0x9000>;
+			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@5f00000 {
+			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
+			reg = <0x0 0x05f00000 0x0 0x20000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&sleep_clk>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "gcc_disp_gpll0_clk_src",
+				      "gcc_disp_gpll0_div_clk_src",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "sleep_clk";
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

