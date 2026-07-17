Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C553E00A6
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273610; cv=none; b=KN566Yh2b2WOYWxcqHEeJ3DYexwyPDX3QEeKmth22WhWv7cfKe5UOZULlnNADNreeJpLukU48p2j2iNrbuVqaVxxU7TTjyspezAG8DMGmrUSsVFuBzVUY0xnQOFc/gIEsQO1GiXJXXaxfs67vpYpQexLocNA9yG8Bn1z6fR8y0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273610; c=relaxed/simple;
	bh=3RYoy3NwCnlF9xpy5kV6jgraHpowonDh8P0V9h6Z3hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c+Sr/PRFx/P369iH0PKiZk7NQ3SxrSJ6SMMFTv/hyz8ewUttKwUrUIXcjw/GyzsOLJEVeGP5t96lZjR8WXBkO3yC1Pbjtxy3bZzL3nrjFvpxUpue5lGQmeDYAKe77qZEJqYbZqiyoyZLN03nSsK+Zz9w1uTbpu5ud5qV+fjYEG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnJV9wEr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQHUICwy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnJV9wEr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQHUICwy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cFKN1160799
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=; b=MnJV9wErPEdcL4v/
	WKSR65zU1JUYIwRbmwphgTiecxEYF0PY2JjDk/ZyIWSX+n9PA5Cz701OLOMc9IC4
	SBsbmPbfI3xm0re/ch+V+4HQ7QlW0u3joQCw4030+CC+Ey/DqcBQ94bI42EXEbD2
	us9LDxyeN0q3y6uGLX8bg0AyqgjRTY9LI4xUplnLS3E/zLe14I9JkMOMsDZw0JP9
	Vg3OkzEnIcUlvm588nO/hpke/7LGc7lX8nIhHK2X6LhBUvOuvHTkmQomes7YELSE
	no3zRQEKtwRVME09mZadihIrZ216L9tE4vPw4OTNNXZHPznERfiywsWozSM9JFrO
	zAaUmA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3arpww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:33:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cea6a46766so102361685ad.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 00:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273589; x=1784878389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=;
        b=VQHUICwyEamFmF+nOUkeiYvpNVMl1D64rOe4E3CnotzX6cYDcKTOTiqW1XGErkCZVN
         dyT7bRxH1YdId8fI4rZIbnoTiyl5yMBfTFrjJYi3P3KvjkBJtJKDR3969LKE9cHW3ziv
         j2WHNO7T7NUuyobP8hLfCMgGsk1pMxDQVSNLnHZ0paaLbgJ/+4UjbnoNRGxKjrRqq4yh
         /ms/a5/9ZpQSCfvWQCQ0s+DBXXqQRKloWLawWSh9+9r6Cum8+pscfrRhI+X1aaus38kw
         GYn8LSN1n12/bqZgJHLY1ClLYTPcyDwA5eyABhDoYGzQ7KhRZ7JZjEO34Nbdp70/11O4
         foyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273589; x=1784878389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RBNDWpZ0ECEPwpAEHCXeSOceBEtakk936rxO1jOWpw=;
        b=Jk0lsyxDaNHvwoCYcvCWlb8lTkVUV6V3bEQy6+HvyxAefqpp5hOkcblR5QzvY5SDo7
         XjFDT67rjDClat3MtaTiqOg9Q+ftynvS231YEYrIISypSEdEceW5m8YN8rNKVEQ5xckF
         Ym3hUfwJjJFzg5gulKauMlN8+jp0TI/pFEE+DRChfKBUGBrC8b9SO1dwPSx6ViVr6oCa
         d0pqNWbGbPar+a3xXHCmw/+WOWM7UvdymMii2UEVX1sVcLoCO4dyf1BWPViSJw6tbLTb
         j0qqGymXpJj7ZRlu3Q2nVy2MiYJQkGFfuh5FBz/X8JhY7XPjOYjM48mGqO7y8uS8QSkt
         NBtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rquf33VGYDRCcUrddmb5gQke3/4gK9JhBSF6Q4cmRYBJlYUWC3GaOe/acGojEgTg1W4KBPTlNMnYpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9XgefNTWIb2wckwzzIcYOOSGpkYWcnokbfipa7oy6/OX2gNSH
	X7O1Wi9deYUCri3vFKfy/V+KjpPBHB97Qltjyi9UfGSPXxk+YNd1DtCbKYwKF0/UldCGlJrtsUV
	cSGQbzV0wbC+QzmmwBw1wFSbDLBhId6mitPVbF4gG2nU2LoFZlraJ2EemRqe+Zbo=
X-Gm-Gg: AfdE7cnA2Osl9rUmk8B5CwRuTjnzqb0m06Tlm25iW+/FRHTIj7q7mWwkPapeyaGey2z
	b1SlC73+QUmjgAaENxzsWL0BVWaBHGVUzlOAb0jEQMGTRGpCBeFr8LroF2S6vyOFpr9DTp/qJnF
	YDj1OHBl3pqWFdSwbhR9xt2zvUSr8lp1kOVpeI3wX3RrDacpusz940fbJdtMOp4Ybci3vz5DLmt
	ZFHbnBiDkxersX/s87ZIUwTGy4lAhaNlLLF576jZXxg4ElNPczK+5W7ll6kXdBNKQHvkBeMRVMl
	bkEcDeKsCvUS/fKR+nkuBxTWJOjRC0fZ14gKrdntu70Nb/WUIVLE6r/ZK/hO4otWDwy+fp7MOuZ
	fPsILrFYF9wE8n6o+NrdZO4dJ
X-Received: by 2002:a17:903:249:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2cf3489556dmr16156745ad.2.1784273588716;
        Fri, 17 Jul 2026 00:33:08 -0700 (PDT)
X-Received: by 2002:a17:903:249:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2cf3489556dmr16156265ad.2.1784273588273;
        Fri, 17 Jul 2026 00:33:08 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:33:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:54 +0530
Subject: [PATCH v8 10/10] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-10-5cca1bef2e48@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NCBTYWx0ZWRfXx55SFfSHU63H
 75SY/+6IIMqfkFsNnJbvBsjnVwSu6tWl5voU6oL+CPRKWWh+TWnaBoWQJhO0CVTQlXxVUq7klmq
 J3RpS9LB4NJCfi3pMCYUKyjGQjrpPFs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NCBTYWx0ZWRfXyQ+OMywLusWB
 B2hPmicC7GL+NcDkUB8RFsrEXMAXde1XJQbWjJc0igS7CtzuyOQzhGN4/cq4pSs8j/QfSmOKw8D
 GiPUwCg5j7g1QvOT5/cZtgDSpkmQhJGIZMTbZSvHtVSwtPzcUGnikkXF/IRQJ3lXq3DMGVhQJ9g
 Z7P7BqA2UELKWM1pn8MoNaG/hh32i4J2KILF9sNqqUZjXu1Oh9uAb/ctEKUN5IiogHDLa4OW83C
 9L3VYoo52VEBTxWoECyF0urK639SmlmO1gVl3aTsZB5aCQCuPxcBHy+arAUOwuz1nj++aPfYi8/
 4tByq7fRCaBzYUIYpVgSBNL8kxWQBNgcfWzX0rl4atrCVguAxf3iTfEIg7uQf5a+J8l82mtQyx2
 mPxk/8tnAmaX4UUHlbGTsVvwi0n9cml4WZ7JLN/scJtsYAQ8WTUINJcVTqIO/wNkseMOpr9npOk
 ohXcR/ECfXCdXBEZGUA==
X-Proofpoint-GUID: oAR-OT2OZ7dCUd_Rc8Bym1fZwheqN3mm
X-Proofpoint-ORIG-GUID: oAR-OT2OZ7dCUd_Rc8Bym1fZwheqN3mm
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a59dab5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170074

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e4295dba89ecb77c6df60f6f08d15..fed88a699fc264cc49e0bda79870a8dfb0b6c7f7 100644
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
@@ -1779,6 +1783,24 @@ aggre2_noc: interconnect@1700000 {
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
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2657,6 +2679,60 @@ mdss_dp0_out: endpoint {
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

