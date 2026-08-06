Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502EB43F4D7
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012540; cv=none; b=UxzAQgjSdmEQIe1STbNdKXtG9NCLCYnypT97jqFxyauugIV0gVLZAI6hcqHhMGBe9mT0qi+2/NTK7N6O5/ZY4z06UGskru/FDd+vgNRb7Tnt+l8RYy614nDK9HLXzzA3pAR77kvDgu/N7g1sKw2NQRBJC+VlL2UV6P5VqoJro8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012540; c=relaxed/simple;
	bh=++Q2M83Mnhu61fSjZTwzDueu190ET4GBVWfrZXDO9Lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=po6BFF69QoX6PtI+avW11CFD9WYG2qD+K4LwDVV4kgewAddkeVwowD7OFNPxWgfl9tjitIUANr8Xn2z2Kyti1X4V5nudSesMS+AaFCJMW1OPufMe3CQjga7fT3cqdIVTSMJ1wYNpetS7fTJ3VP9LpI/LQtIZbGZwZV/KQBfCvVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SutFMvm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQsUOx5q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SutFMvm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQsUOx5q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nndV1309454
	for <linux-clk@vger.kernel.org>; Thu, 6 Aug 2026 10:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+YcdQwSLXWJG6/mDXjcwWp3iWOMDL1BHi5ApBEA60rU=; b=SutFMvm60EZqsydo
	YDncm5HHnN+nXuRkZND7R0GseUviTGRz+VZUJ7YwW0tt6Be4+uy3GEh5CESjXYoj
	zxzEt1g1nyrhmcxH4W0q7MKeFFG6898JIarDDf1Vo7UkrW3Psx6DBwKICam7Q0OI
	WRyELqh9xrCsI/6XOHWZzpH6N0E51QRsgvL8f+BtMVAA0sBHwAkfSRvJ1TfVd4h9
	iOMMPZvIGP2RyKI+zhMNFZ4wthIoLQFo+eXWjvcE80TQ4/BGeBclKXrAPgTEpSC1
	aOBLzfq0egfSyDILYiXWXlUjeedB8231RZrMPTqvHajQsfWWeHyWAsIimnOGkECH
	XF+Q4w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp728pyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 10:35:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so2298265a12.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 03:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012537; x=1786617337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YcdQwSLXWJG6/mDXjcwWp3iWOMDL1BHi5ApBEA60rU=;
        b=eQsUOx5qrEbtNioEeg02+xyFkkEhRiyKTr9bS+kKV5BwyW0JWcPiEj21txomUpp6Iy
         6gufpvChUVLmlLwDmMJq5b1Ltu/CJEfayyhCeXyAIXYa6W1LLQF2HqVUF175l3U1S79e
         pqFZd7KlWhmbbqZR0njHZAMFGhtih6InIBViRcQ2erzno4JTIVPECflSW7J00cLnLFNt
         17NiJqovSFZ+gW5+JQ0Bftd2n6V0o12S8WNKoS5Qq1SM/YwZEya4sXw1X0zPWNgjJvQE
         JwpffIzhQvpQldMOOq1965EB7TQdXd7W6lQnnuPPpF3GyF18ZjwNjgwVG9hv6chC6iSs
         NKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012537; x=1786617337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YcdQwSLXWJG6/mDXjcwWp3iWOMDL1BHi5ApBEA60rU=;
        b=DpCRDVFRTwG7b5EZvBTbJoIDrSM/NCy1B8dokGLM51GpSMGo7gbe+iKGmxiurJm87z
         De+435WLWNzlt2HMtks0T66PaaOtBGYihPIfpSKX2eNARzCebxOhliRnelJqUAugNsOE
         2W5csOJd5bjx0eI2rlpV2obfiDc3dwJSAXMn2PT07FHYvc3G8wLMUwbYhYOeLZeeElwy
         Ru6z1yR0hoSAOnmTMSEn4ojSWFQwXUtQhdHyAgUw69bEK97hnJmkK/y83bI0doOsiH8V
         /DJftC+owEeh/8m43ok06n9amQ4e3Q7WflmL7dMUm6nKVLiVWWo0UoiAB3py1l3Qg2xg
         oBKA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7jZDPegRHH9nave42mRSQL4NTL/dVkbrlD0pmqO5hMvu0aSH0DOx33m88zH7rclL3b13pJVAmsjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+sNuWw71IBCgtf9I3xzhnCVCcMdmdYGd+xC04hTJcp6fAPx8
	gc9sdQb6Fri+GMFD1CIJKjFHt6nZV6w4+3VRwL7Xr4usi9RXn9doY2IzbYHMnYCRUCXArVc33Ct
	+rHBD2/XDnJmMhhyCTu1LnmcTW5JbaYvFtKzZf1U8NvON6bCehkrXSnvrDegM+H0=
X-Gm-Gg: AR+sD11e5JqfuXdxw+aipUjRhYSfEQqr0IJTNYNWTyE413USsN1G1NuF+9lUTP+pxrY
	9OrlDW7n+3zGlnhJTzlZW7wgqLbkrnnY//AxcI6CiHMDv7qHx3Iag91Ft3/E0Zz2+G2rgKzq/E6
	unsN9hA8VmNvw42jsd/NqTp46blajYk6clKE1nA6FSeacpir2tsuTdO5G62CKnSDsHwoq1c0W0m
	yfOOO6fTD3a/H0ElLby2nf+KLub0/pcKqrGxunaQu12eOMDc0bgX6gfvO/ltYjlX7eRJUq4USzY
	ASalyNOjB38oLRQlTR5IDXSRQ2//h/wJyiZ1UOPej4FMey0Ga9X6SwTSG9EKHdBkg9KvkJOO9qA
	Xuyc/xXGwV9zD2NCVqzIkfs/i
X-Received: by 2002:a05:6a00:300e:b0:84c:4bf4:10c3 with SMTP id d2e1a72fcca58-84f2e0cc682mr16219994b3a.38.1786012536992;
        Thu, 06 Aug 2026 03:35:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:300e:b0:84c:4bf4:10c3 with SMTP id d2e1a72fcca58-84f2e0cc682mr16219901b3a.38.1786012536509;
        Thu, 06 Aug 2026 03:35:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:35:36 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:15 +0530
Subject: [PATCH v10 10/10] arm64: dts: qcom: eliza: Add support for MM
 clock controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-10-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: LerElMx6p2Xkh5-FtWoGVGe8cn1xpH8i
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a74637a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=MvewfubiCEdZUln0E9EA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX1ApNJXYFaVG6
 FKJek6tI20GAMlpGwL36bf7FtPiDRdFMLdJY/l4Lm2/HXV0a0ukQ8ehDVtk0o0ugudGCtFxc7zE
 2ekp9citDpTrsugBIruUrQ7csEOm+rwxJX4IBoGvn/23vlH3sKVMbhLnwg39GoGpNfFWdHzc+Rr
 LyKVR5c358tU/v7f0rh6GgQjkgFvcrukSLdvwgVbQWqdaFYNzkqxd13NWwL6N8y4XJGZgxBEpdw
 JGUgDC9OnMpK3wUujKhlvtR6xJRmSy0mKai1StOUBngrcpEv3VAf8puMkzXrqTKxvnHwnzKL+dU
 EmM7/0Ti1RgD0BVApRXfBa9i5fQ5Zc9zuBDLh1+Rv3BfIxXEg5wNzrkXCfR/oD/H+L2fypJx/K5
 426Cl33uthSvEiTSaGnN1yLgYO4UGTkG+fd7LUXxU1xv425F7wd44hU4ddsobLsf2U7D/UZW/bK
 9C/qnYAIDZ0bdGVR8UQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXwfCIcXdrfMXb
 wHoepalDlA9DWR6+b6OBCSRtvd9U73ccA5exw/GC7Hjc2rS67IOzMIJ6Ag4bpfPNdtH3EOR2OrT
 4Ptw7kFwQ5TgRBr9nSi4/Hy8vJnlMNc=
X-Proofpoint-GUID: LerElMx6p2Xkh5-FtWoGVGe8cn1xpH8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73a37303c1875361b7c03f09d58432..94297e05677aeb5b684c5e7cf0cf677dc93180bf 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1787,6 +1791,23 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2893,6 +2914,60 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1

