Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAA53C1996
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 05:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550858; cv=none; b=Y6GA+ZMKv2Bdu7tzmuuPP8mtGujgQm7s9I0ZfIH1Eif+ItDW3tX7JFcFpKnKMjGbbtfmSQJeaTSnZ+7u5fbO+dUcbYKDsIOYxaag7P6YQMQDKdUsGxROhL91gDbseCJIZFAgQnxCzwJO/oS2K3zm5Ut83F5xQ75M/IQIVah0Uoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550858; c=relaxed/simple;
	bh=3XPM5GTfEWus5e7nz7aKCY0rPQs4qFX+m9ud6edOuUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ebzrlt4GEzRw0szTa2IHwKph4mr+pKRE2KPldomJpT2bH904Zc+ff0djQjni098TRmQ3anKgucn3A8EKOLm5Kg5TGYDn/RXteWYGgZOT0iCGF9v6VXX6s5SaowUbDN8hB6MnE4T2Dp8aZIKfboRyXxze6fIv7KtLUVM6ZDxL4b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYNjxrI0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJKcdeyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYNjxrI0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJKcdeyG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65402ocJ1476732
	for <linux-clk@vger.kernel.org>; Thu, 4 Jun 2026 05:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L/xsy2u+YlnkV58dJ2Zzap4FwbISqgE32SWxOXPVdM4=; b=WYNjxrI0Gc+ekDf/
	gdHC6iiEP14XnhLrkytRon7paS7BsuziPxkkjLVG+3k3JWomdDHM+0CJDBit7Sjd
	Uc5sbn3PjpOyyfxX84XmdBvqqlKv2VeXQ+oPPGjaVIe5OpAMlow+vrSVkdrcr+ea
	7VL/MVbl6sxhhme/bATSZpv5lRDXFFSTezxSmvIDJ1FZ6huKjkf/YvpxoXzrgUyZ
	L6KlGbIrfHXVntTpwB4ppwlGWJaht5uGPtamglhkSGlsoYAPuYeRKdSPDxvJGaTd
	hOfF1Vfcn4U+URMycvHAVfXBA1H93H4Uz6FPMgJlfuplUK55U7FvLSCfCbpIVcxi
	JRGG9g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nu4pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:27:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84240b58211so267693b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 22:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550856; x=1781155656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/xsy2u+YlnkV58dJ2Zzap4FwbISqgE32SWxOXPVdM4=;
        b=HJKcdeyGJlXvu5pRKb/OAp5zqmQPVVBSykw+X/0W2nsuwvfz3J/3scBPukjjxxOaCr
         2p9cXHiUNDD9LEABuRvs8P4BgpWaS/m90yW56EflzvHRMtK2fKoDF1CqwSig8nHHUSdi
         Pm6pnbshVvLQqYF+fHHzl9xYTHkF5P65dpjLfZrKI+dC12TTFHepb9tN56Do8UZXVclE
         8RyIQmpcn3y2sRebA0io6EhwwCMCA/dEnJjxYRcafFCpmNMEk8+S8efbdNZCpif7A4rU
         AUgTOkJslkSODsGnuWLIaDOvJIVMVrtLPnk4H7WPbylfKruH+efZ0HvgkbeYFVIQhoNt
         LfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550856; x=1781155656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L/xsy2u+YlnkV58dJ2Zzap4FwbISqgE32SWxOXPVdM4=;
        b=WwwqM91ExWafnkJQT1o7kg/ylA1QjBs9IdCTES9TSw7uFXEsUF/q4/RjI2Lx1gxop4
         ICJUQPc9Tg/VPhjNgSCtdwQyEPdkyoJ39mtkkM054tAwvVChFjcbMJAUVpmUttHlzlTF
         0a648N6tHoK1Sz21Gy7kh4YYcEvmYn2w2mmjKWOKGLYTrVrBaErnzr9g0zglz0ogqxK8
         txjhAY3kqXUeibkVw88XC4SSAYSqqlKD02XN+NvOxWWpB/nIQBPN4BUWqk6z5PknBhdh
         oiI5K2x+o+la9v4UxogcOdJipBuRQrE5klFISw+YP0IXZNSF8CPz97Wm7+6gwowy++lP
         vzMA==
X-Forwarded-Encrypted: i=1; AFNElJ9OGXmsSsD2sDVIqY7DXvlB6eboqXqMG/TugH0SfudxzNUsdQbLHAO835eGMSduWsq6pmWFIkT7B2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0WKg9Rs2MWTo9RBZnYAFRo4aBJsZB4v/BeSJ0IUlpdGnx6nAS
	LTPSq1w+mPmlXJJcokuF/GD7oN/hMOssCAUiuVsEIFMldFaPfIbpLqsRbqSh9xsxvMX+q3o2BMh
	K2vcX9NvUWQTaIipQAySQiIb6Ib892nGMOQ/oOCFPn9COB4UmnRBSCSP/jdEFgPM=
X-Gm-Gg: Acq92OEggSf9Gdkpwmx7svpCi4urQRVYTDQuBQ+cAuEc0ypZKt5rx+HF4wTaO9JoZPD
	TRRycpk6CsIdtUPYL8FqZc879NgIXdoHThdw6Bxg3XIQtU4nvwtNUjDwrMiXfzKsYjt3RzXzvcZ
	7oIEn/ig9tK3iJh69yKAPQsJ5pEGqL6gIdLSNN6SHYt5ea4Aal4U4sMr4FBI/UXDYMiYo4Re4SC
	qpdk1Su4ZxW3orgjtGNlJVDcEi1ur5lH2t7xZTQHad96vjV2SUlRqRy5ySR+kvLiX7fGmQcLL0D
	CrfzNyw53BpT+dUIg+rJtjBjbbOilW+W2J+l0+R7xmFdRg9uizzjsB+8kr2LzwdKr202ioDqmQu
	VKkovdqkib0OSe1dcQ+3cKsPb9gxmzIbEYG1OTso3WbyGx1jP4vmw1/JCEXWQ+Xo=
X-Received: by 2002:a05:6a00:ad09:b0:835:3f51:730e with SMTP id d2e1a72fcca58-84284e6ddb6mr6505548b3a.13.1780550855808;
        Wed, 03 Jun 2026 22:27:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad09:b0:835:3f51:730e with SMTP id d2e1a72fcca58-84284e6ddb6mr6505515b3a.13.1780550855371;
        Wed, 03 Jun 2026 22:27:35 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:35 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:19 +0530
Subject: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: pqFFfWyfgs2X5EHUOfn_TUkA68W_OFfN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX7lQAty/f8VXK
 X+HkFveAps3nIf+Jpz4hEeT5iFgLAuKoT96yaAd2hwztxxR7WwGo10NNkoW8s2Sg8RBmv4wGKCJ
 6G4uiFmss6Mu8i6k/+3Jv+V03/0sye8EVqh/ZCd7ZkIROEDjIe0jCZBbjPvL8+xyC0FDACIlXgn
 O9ECOhx93kytHylZKoXHPZ7HqK/YkITTooYFLboaWPZxO3ERBq97Mvh05BDrwQX19KY4BuKiT0S
 xcOOiqr2/B2DDxwwubx18wXecIyB+iBrKHGjeESV72kVnbvX3aOAlnoF15N1ZQNup2QsTv+AHCE
 Dsq16Im1mKtctNte9oy8UEfrTAJrZZXUvJZxyBb0tCLLKxjHTVVYTw0ptg2DGMzmQb0b1i16Qiy
 FraykGDpbOx+cNsRhb4Ra1M2AcmSeM88uzhxO1Yoj1OwS1PZ4BV4H4prtbN0HwmImapQ8ii/KpK
 wmoAJbLMN2Vu8+sfzVw==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a210cc8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KUIDwAxYdJFQKfevFyUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: pqFFfWyfgs2X5EHUOfn_TUkA68W_OFfN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050

Add support for Display clock controller and GPU clock controller nodes
on Qualcomm Shikra SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..1ccb0f1419aaa34d32f3c3eaabdb8727a497b501 100644
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
@@ -640,6 +642,45 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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

