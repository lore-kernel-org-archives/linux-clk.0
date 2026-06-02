Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98613F0752
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413756; cv=none; b=ptyyvhWdSGpHYc2y8Ade8TAZWB5erXTzlVPjvhh1OartVl2UmzNK7fW22zbqxXvcOpZUCeYbXYHQXBS/Cps617EjfSN/sb6Q+vt87m9uOpjtzqzTGszYbMNN13YD0z34Ik4o1k4Saspo8QcIIUaMdsokexTXqZTd6qckQjyG/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413756; c=relaxed/simple;
	bh=kcsFlQ0y8ffq2yUPH+MjrZDKbFx8blbaS/9oyuSRv98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojZb04H3NTW5EeXdNM3VrSmeZ9cj7kXgftZ5HGh2D/Z/ogSpW9DFiN7P5sxQMlgvQoMr+biFvSBCzOfVEShzA2XnAYUMgYNsDsEgL/C2Lm6hB6V7dslN9a7POZpAHXGOVu8aADZ3gdM/XFNYuiiI1SpBnfzhyzq9sEcpUJpx9qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R190SuZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJpMVine; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R190SuZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJpMVine"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652AvX4j1937415
	for <linux-clk@vger.kernel.org>; Tue, 2 Jun 2026 15:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N30aZi9cDCAXsNhZr7OUSQcHTSPHi+a7WxoDVPotoJY=; b=R190SuZQhVT+dzXF
	9n1X/qUT5Gha/CpxR+ho3DyaHp5Uk/w+4E7VFPajGN2JJmDUnszQQcnHyCNHDV3Z
	/bYAA4OIf7grvPFb/t54Fb71JVzBd2X8ry9Mt69RmMGoHzIP4Otpr04JpKH3Q22D
	dNwRj/I2ze98RRNrGh+nKTwgoNV7e8KGUWRBbgpZMaY7YDPNOpghDG2ac4aX46ax
	sowX0BM2RVDHiPatNWU/w3yZjhv1utSn6eyOD9EaPVfZVPowxbPyKWVFNj4J7U9E
	WxKrN6C1lxAn65IHdX5eLFPEsePHW5bLl4dAnGWIxtKVt3A9U8jDhprfJ1ohbH14
	ScAAMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqubjmd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 15:22:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c331eda3so34877995ad.2
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 08:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780413753; x=1781018553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N30aZi9cDCAXsNhZr7OUSQcHTSPHi+a7WxoDVPotoJY=;
        b=hJpMVine9h0mR4k//Bp8261+2RM5v+SwuN3dfzacCa6+SCQHRfyWFl1cO3u/1M4xDB
         Zt55aawXdFM6MsNLZfA81rPhbMI/QMAA3SKEgSQpuTK1pdej01VoozbueRfLDH5kzmcF
         Mt1IvBULNmgGRCG7Y+VzNck5zz3rjNEwGEoz4WVT7cRetV/zpKYp49c/NRHYqQEn9Aln
         alpTFWT+cpK+ci7GbouoBem8Z+BljxOgKnuF3XbMAVyq9OUq9KybkmYVGpQtgPtWWI7Z
         tYeTgqYUOmoL8Xilna+fTHEaB+uF9+GqpknSrqz9N64X40H49WkCzSXui399QK+/o+mF
         jO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413753; x=1781018553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N30aZi9cDCAXsNhZr7OUSQcHTSPHi+a7WxoDVPotoJY=;
        b=Adxty9RNruTNBKsiaBAcDTmbEaDkG61xrywIOSn3rxsrI1m/FNBa/htmAHFhanId8n
         jxIEUlumCAcnPv2AReEoFVInrCLZgHFz30hpmnzfjfBXctjc1ENJbarr73gRS+nLQx3Z
         HCN1tL76VTI37RDq4PxHdMtjfp2kHoaXo0WIdCHypJ0bQREJ2EtPXV0t52H/d9jWhhmn
         JaWPPUNoHl7ACZtsiM7kmRkL2cvYl7z/FFXtfCCd3w+PvaEeZD1+qt1crHaUajTXwisB
         9Qu29g7Q2Ar4iycN9bzLE12SjnW2NzB/n+ln8hq8uwovhyv06hUcMme8YYkraC+JDpfR
         VKow==
X-Forwarded-Encrypted: i=1; AFNElJ92OvblmToq8shbc00AWYQDjtiVyI0b3meGsk+fTqdgUwBR58YfX6CjXz6+QazsAOvWCgx3YZxlANU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGMIgIjieplAoV4ximi6ZTFIrtANqT/WgRtunD0vyzkdhHhtp0
	p7MCYbI7QsYdfWu5v3YR23UW87WQgxa+7gPSe2kZuiDlhrfPil/o/af9QQ1cF1OBgH8QR9yZvzK
	ZwWlcrHdXzJH0lXKzhv/Rs/wYVTx70wp/Aqw06SzS2MraH6V3h+Pj8I3Y00us100=
X-Gm-Gg: Acq92OFnt4gkcK5dNfhj0CjIcp8pJ8pUWjOSeXuBL05e+cGS8xAr9FALnf4afzAJREx
	yqGayuv94APb70Jdh8yFM7DJmug3LD7IZqzszYE+1umGW2Pe9lQk1nuoxfrbxlG/x5HJbAvT4f8
	EpmaLRoMdKz0CUl9zrR21qfwyN5PnpMaQnKGv0vobToR9ehCDq4T9JurlTtSB6Gz9OUEdRhBXfY
	LmBH/xMNRP6a/AVfE85dlICQNmQUD6NrXsc53qie6DPT5gAp0IlFc1e4PXRaXAUvgBiLY16Zbir
	YZKitlw/Ud98FoGqqeVDBeZMStFYMqEMwMBji/W7WvQHBIEU0Dp2dDg85rWwwig4imQymsg+oBh
	v2GHl0Q26GfEfx+hqsD6hfDbVEYo/htFt6M9I+HIPOVCl8jOW/R7rWnKj
X-Received: by 2002:a17:903:986:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2bf367950ffmr166701735ad.8.1780413752740;
        Tue, 02 Jun 2026 08:22:32 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2bf367950ffmr166701405ad.8.1780413752237;
        Tue, 02 Jun 2026 08:22:32 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm135136465ad.15.2026.06.02.08.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:22:31 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 20:51:53 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: Add GP M/N clock controller node for
 SA8775P and QCS8300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: kREhHS1HzRvCVRTEbFeJ9_VZfUKGnasy
X-Proofpoint-GUID: kREhHS1HzRvCVRTEbFeJ9_VZfUKGnasy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE0OCBTYWx0ZWRfX5EG+c5M80udG
 JJ6Xbd+l1RMN7o/r+7f+denXPCG7iz/PAV8fTnlA/xgj00ANxt9Js1ZXAKk1yehfa3kCYuEa0ec
 CHIdwRLQ+nZwBw87F5N1vDP4J9VLPKLvLi2Jlt9nfQ5CImXk3N0OBE2McJ9egv3TyQRFPKto0UE
 KTpX9RUYl3BbqqsKAlCwy2ghJCrDTSMfYv+7E5uTO7ByHZhiVmuDYF4SAJCX+S9VA7DYLlC4Tfn
 2hGk3OMv/v8PKMxz8egkYWAMRe1GJIjVRETr7AlzolL0FZFejtg55GW26HzY1m+e2KiJtOY+bId
 vRTKsf9soA7kvwHKgae9jF0Fn2gEtDpoJAjEPXC1tBb9PmuTm8Wy3zkYTGLhPPD4FyPBz3Qkgam
 vSE/eAGMydTG8Wg5Mjvvf7BcmOE9ikI7FE1cNCe8a4Qx2X2gAJvTQUiZfxyC4VVA4bCyowpZ6H1
 PVmvsH6JlVGdWB8UEkA==
X-Authority-Analysis: v=2.4 cv=FcoHAp+6 c=1 sm=1 tr=0 ts=6a1ef539 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xYDh6zYGlObRgEhEGzgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020148

Add the GP M/N divider clock controller node at 0x088d3000 to the
SA8775P (kodiak, lemans) and QCS8300 (monaco) SoC device trees.

The node uses the qcom,clk-gp-mnd compatible, is clocked by the PDM
XO4 and AHB clocks from GCC, and exposes a single clock output
(gp_mn_clk) on the dedicated gp_mn pin mux function. The XO4 clock
is pre-assigned to 4.8 MHz (XO/4).

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 14 ++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 1ff9e1598d00429c03b2bcae41fa370ab2c892bd..cbc13ac37f8aeb0b1071ad0609ec11e829d2c798 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4412,6 +4412,20 @@ usb2_role_switch: endpoint {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,clk-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0xc>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			clock-output-names = "gp_mn_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "active";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+		};
+
 		qspi: spi@88dc000 {
 			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 19f8cf4e15482947f6049188050c370340afaead..d192f92a896bb13017abdf82062e8305aab3e5d5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4353,6 +4353,20 @@ opp-384000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,clk-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0xc>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			clock-output-names = "gp_mn_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "active";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index ebe5889daa5300efa7857314e9170d7d2fc33ef7..f6c5ec38c7491b7a16ebfb853f8af88bdf1f0db3 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4867,6 +4867,20 @@ opp-384000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,clk-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0xc>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			clock-output-names = "gp_mn_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "active";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";

-- 
2.34.1

