Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80E94C9019
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865908; cv=none; b=eBf2/OWw094jyREnGQv/9Hd7JwOutI9KceCmZrIkGavGN3obr/nWtu4BpOIxgFQ5js8zUO15YUbjATcMaUH1nUfGBrKx9ZNEyM4CavCAH7L0BCaMxo/r+6DbQr9H+VuTqsTKrgMDnn7QkQ2LeJrxsMmJWaikVYd1cN/331JBB0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865908; c=relaxed/simple;
	bh=s/tzFANLq92I/GWvtIBsPnHI/dgKrIdY84Xt2S+xBUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OoEJYYyJSiVOT0b7by2SLWfEtjVSSOTgARHUDSXEHm8Xm2UTktBtcqiFgjc+ZbjNatPY0axJZ24k156I5+doFRFSIeOhvKwLDq1FPj0SL3n95WrSWnIrxXgc6hr28tiBdsZKTIxmcEuijzWiEEQQeTALOxAVIR/59vWdiI2diXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDICPmfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPx2gED9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDICPmfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPx2gED9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674Ffgm03643817
	for <linux-clk@vger.kernel.org>; Tue, 4 Aug 2026 17:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZY/BPGUq3Ubcc1EeSRezLJsNPAz2hAnhtWpk8PGcHQc=; b=hDICPmfb85OQAWxJ
	HMas3ybpGQiq8vfHcD/9A9Zae+K3CRJhUqIzU6pCD4QIIJztFj9CHzS2htlCsjGC
	XBa0Zhf+BQW1I86xV1dFHvRJQ4tZDg1FrKre/0fRzdWvUvbEJ+FNihXD7USxLSJR
	idfkMFZJAJPZL83aPFPP/KcDrWVxD7oOsNQF4AoeafWisW02GSgWOCzMnNV63T/1
	DhjK6aYAEkDhHeGswc0yOq/uZrlw7zNV9/CIcaGwqSDMPB3qXUmtLdtznWqIezN/
	+EH9NntWAQ5XIa15JvuqUity6Tq1BLPLvAw237x+DQ8EgsFDUd82nrdTw6RdfrJ/
	GaevEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud23jbtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 17:51:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca3673560so2168675ad.1
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 10:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865905; x=1786470705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZY/BPGUq3Ubcc1EeSRezLJsNPAz2hAnhtWpk8PGcHQc=;
        b=cPx2gED9gd4YIgluclPSuTuvxXSzRBn+e/TtlYUjC/aUvIVW/3fqwTAWlOS+6lLmqd
         vqE6i4oLLgzNPXo+L7lN3d3/qAgsFeX5DXgqO1cHWYWIwLwR5i+LrwOiNWtPwuN3zMzi
         R+zcoQ9C68z5CxjY2FigNU6JOp2ArAk3qcgqR6K4w7VwvQSFuZ07LddVQ23mky5ZRCmW
         X9binY4G3hn8K/CRiExUlHog97ph21y6nEYFdz7Slw3wWFolvpTPqILqKsHEJ0JdaHOW
         7Er04AvaXx5gXzdg5nwIzr3HlMR15ro0jxVgqjOCOgdM1qZ1/diOSQV6ePBWTySCE0G1
         CJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865905; x=1786470705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZY/BPGUq3Ubcc1EeSRezLJsNPAz2hAnhtWpk8PGcHQc=;
        b=StdEQiKJR9Fm4OsnkO2EzD33nlJlJB8pqnD5CDi/xc9DZeuNAdNdG15eIYZxxyGw8y
         ZTIU9QlOV5SvcgUwoQgU7w41EVySrx1HygDOyeY2FRLWjlkB5eW/HeptPPYN20qvSdVO
         NYx5cJXvcqUBu6upZKpzR1XtNrGbmRIanUNSCkVcWD8prFVGny3Zbzq29pl4jBz1l9yQ
         dmNdxtkYo77uiYAh4mhAZCYTDF9eu7lcg975cCU2VCNxHT5NLCbDkatpfFIK2fkKC6bu
         +5P+eif8GN9bEoyS+CloVH/u8/f3tqOLJyF9gRrKZnsNTwkfFxfcgCEXpdRRBqYCUsIB
         n+vw==
X-Forwarded-Encrypted: i=1; AHgh+Rpb7d2NvGFQgPmF17bbUgXXK+W+Wissk5I3xkC9xEbyAdam+dZaT/UN4pkvWsK9PdelhWZFOwtStG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgMkJDHRx7ETJYNiL0zRcQcRX8MtzP2sREhTnUJ1FNEN8ckyJ0
	f/CKJ5xWoqP6Ld3NHlGOa8z369CkxUyqHgu5cibTq0S/iJ7vmboLjSKXO6cc7mYfZF2rcW7wC3D
	s3bGxiepuabv7L7tYsXyi6HrqSybEB/bQ34MePl94Rv9ETh0xmapK0dti4in9wBs=
X-Gm-Gg: AR+sD10lS0ueIcbxs84yNWymAOmeWMXyAlIKE17AZEXCMol3jc7Cry1F1U+zFm7V8TR
	ay3LVPesAtqxQMw3IJyp/62V6SZb+I4ocpuhhDXvHTwc1MUSRtoo0//lMjYEzm4lO2dE4pdHFg+
	QPmF6oG7kZpUEvu111ZOaJP+JP65NW/Xz8+KOQg7THtRu8qZkwB/WWjnvMsS+GQWVbfiV39itpl
	NKFx/SxNErtOfjdQjK+a8FHB55oYphTk6JcKKyDRDOAjcJ0D2G7dm9ZqtsVXjNDs2r3JGmLr0yt
	YfvMdLyDJYtzlvRDEBaHfZPsZAAdj5gcSJ3tnJb+ZLm1fOKt7zOn13nDp5u1hwdDdzWmLdGVdHl
	cSF7ETxobU5jn9wECCRI5HBka
X-Received: by 2002:a17:903:17c3:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2d0ca165189mr6792565ad.0.1785865905233;
        Tue, 04 Aug 2026 10:51:45 -0700 (PDT)
X-Received: by 2002:a17:903:17c3:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2d0ca165189mr6792025ad.0.1785865904794;
        Tue, 04 Aug 2026 10:51:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:51:44 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:23 +0530
Subject: [PATCH v9 10/10] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-10-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: sGRcHUBYak1IRm_DMZkrkoCb9Qrgr6hM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfXwSg2mhni8SGA
 bcCFUtXsbkcn70NJwENFCvhlXnPNdhrLFIIFwiWbPbqyDF4aAjW0bOdvg7ce62emX0at1tKyZTl
 5lpZVs4tgnR1aPMFSQ5bDrw8h4PXLLs=
X-Authority-Analysis: v=2.4 cv=XIkAjwhE c=1 sm=1 tr=0 ts=6a7226b1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: sGRcHUBYak1IRm_DMZkrkoCb9Qrgr6hM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX9ujajQtMKJYR
 +y1MMWi/Yhlvxi8ydDI1bgWWv6F+a06XFXgSyJSJdEZbJ0gvui+FwILgN34iyC0xB+kZZqpM1wW
 36ZgaJ1tuoiXhW7fGtjsTg9hgM9A0NszxOsGwsKOz9DNiC/wao4GZFQtkiFGLu6H+bNZrHTwt9k
 FNcJxnUxnphlYZXBjKkHcE9opNSj5Ur0IWrZlTKwnSTaE7ba5qqgYfmgP5IDf5v4jBqACuQQr8N
 WMKCL1SQMsqIk1EbIU4R5sjmwqedTRwtx5yPzx+lm8jWuufggiQCbPsAeRZG+z2524lFAVOOFfv
 XjSK74jZScNPaVrAhgeFm0Awn7AzaJQAvNiguH+Tg1CS8bDetTd5Nt7xRAVUXrl6WbavIctO75S
 IYs4qy/uaaFubeYZUHmH2RbI6IrcoJ8b3yE+PKopIfbg2qcV6P/lxDhNnd2Hqxhw3M93CQCheKT
 Ap7Yg/yvTtxG5iVHk0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73a37303c1875361b7c03f09d58432..e8ff212c295e89bc7d418519d142f1950fbe126d 100644
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
@@ -1787,6 +1791,24 @@ aggre2_noc: interconnect@1700000 {
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
@@ -2893,6 +2915,60 @@ mdss_dp0_out: endpoint {
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

