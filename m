Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D3738C43A
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 09:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530555; cv=none; b=KFsOb42j9LOH4fmiAGgehE8SzD9/YybUIKH9y3jih28qBK0sGU9hUoEYgAs3hi9tm6EgeiNA7Wetiq7uGj68UaWZ6h2PEyFaqNPsE/8JDJf1Zpl7YvsabuE5eCOjglRt7BxmPQQP0n7oFI1ubhQEzG0ypvAaw65ZSjFy8qNLk/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530555; c=relaxed/simple;
	bh=8vsjqlI+M7EUJrSbJtNAl+t9LeIssW4qbD3UCATYSdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSp5q85h/VKRU3tHOO6giAgFM6yDKaLbhXOaKXdiCuSWKC7lm0xTY+A+l81ZPIqt8nLMhbMGs8kkETnL09SGe1Rrx79LOxLzLLO2YL6U02bwmxyPIBEansIhQ2P8ihh7/UzaXCtlGl0WBf++K8VTFct0oJ4AdQrKqce/GOJtf2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyKq62Tz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNd8rZBk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyKq62Tz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNd8rZBk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235sIIL2208139
	for <linux-clk@vger.kernel.org>; Tue, 3 Mar 2026 09:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUsyPGULo0g+sI7esZM5K99WIPpuSyqC3mxWOFAeYks=; b=FyKq62TzG64YBtpN
	eWbsCHcYMaC0YlnmRwInuzTEH92wVhS1C1wEpcEFIej06BlO/L14bauu2L+h9ocS
	1xbn6m4yLHK7pE/CydDDL/L6hw7w9IL4KE41bYZItmzuStQ9YKFzYkDVe6Qs3zBg
	88uESSCp8aINGqflhlXtirns36NsExwRuv7JwbDJnqmvzd2ha1skFDYWAo9b9HCp
	gfopZqc06YF0s/h35R3DJTAtrpB/D/5H/EtmObl/cKh/gzFU64bhpknkk4dqufBw
	RxvocLyeOmskOl6WY04m5oyRYDUlwLVrfaimI6F36hpDGyLUiW51kZkJA+DC+L6+
	kJF5ig==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe0r2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 09:35:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70e8e7fe55so3469423a12.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 01:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772530553; x=1773135353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUsyPGULo0g+sI7esZM5K99WIPpuSyqC3mxWOFAeYks=;
        b=GNd8rZBkA75scV1D9mS+lXQsiiCEVw/RrwizibHoBFDHwWKt8OvDj8guHn6Yhxvwho
         Z0UYPh7iUYKXYuYS2+bZ6wasyVVAgXCVDjxpITxuaiqbrJSgGUbll5sXhthpuswgJNjh
         i15dUfZPqd6uaZaBaU9NjMu+TxjwvLEUqiMjADZvvG8krQTXAndtEAmhRY9asrSbQ11S
         CGpMGG/NliGvSUasnLnhjFGvzmYzoSMcO7eYOWzcqIwEqGbNaVtPdq2v+HiR2Tz137TC
         lOHTAKXeAPLCXX6Oj8KDGGqbxLRKXMbBKZwDz/wcjeAZTuMduBE2HBE5qsqy9b9y3M3s
         WAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772530553; x=1773135353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pUsyPGULo0g+sI7esZM5K99WIPpuSyqC3mxWOFAeYks=;
        b=K/nFep4a2Ult8GkbfwbBJ6aj+UN4ct7uH8g87WtTQnfpVXyUJ4B0Veu7feKT+gn6tI
         OuiEYBo364Av1vTQfgEqC7myOYX9odaPHeo27gv9OOoAY6AXZcsOwF0MzSLIUAmFl82g
         P5mzyT54lrKP+2LdHpDAv/OpkrziUqLRml2h2CBBUPeGMO4Lt3gIwkV/iVpFUrV0e8jI
         LGzU8Axmu2/W/0SN8bzWy3OMGY2+z5d4VSd6E8bqUi61Gdu57uPzeTRG5uEr6WKRvCe2
         1jr6i/1nJWbrPMMxUEiwjhhZULQFOfUUIbbYeHykHuk2RBRYsWYmStRG/UXh/wKQqisN
         73qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/oqPF7qB5nABoXRN+9snUsPYHYNT2EX1b19Yl9t7a7NpRCNQ7tJkapxHZRaW7EIS9z7v3vQqoQFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIE8/2GLLDr9elzRqXffEpidQ56+sHGOZZXRhADZp9njIhDAfK
	2wZAO7Kx9Z7yb+jnAS0SwUaQVei7uQc5dvLCDmTCW33jiX1a147RcA7VytCd67RQchQWEGtPcCl
	7Npl9Scto4TmB0636oqIF+hpXoAEHAP5P6+ZNxapaBx2Uc4i57LdZgwwrCybq3qs=
X-Gm-Gg: ATEYQzwC9FaLfJULemgex1jPQ69JO5b8HHmud0eyfFGr017Hn3jiTVYc1BId6mFDZOY
	x/v/3Mk6H8l0lrvHCQL/9HhIhupTy2BQ/TsAhauBRa79q6iJUnBvd33jDH9FUCSjZDY3o4qMp5t
	ptM7MZWmZKspAoRr8kExw6AOR/Xg8FtJTnaQUjZCjlEhm+Wkz4z3s3j/HEv3E5HIkuFZhwsfhJY
	uIpRhuLso64bq6rSrx8MLQ/rY5pnYxQLIDUy3XHYrmQTM3yEfPMzkYU96cMf5DBjHy7imYy3jf8
	CX1t8fVBbS8U3iuQVYLAJCRGCNxcFpmrnYlNyxTq1G/5cfeYi9vXlr+vaZIRv1mCD5NkBixo9sM
	/uvxyVWIxuoZ8N0LGZcGS+tBmyXLgvmbZn4rgQkfMd5SxZg==
X-Received: by 2002:a05:6a00:2e98:b0:81f:44f9:7c1a with SMTP id d2e1a72fcca58-8274d974eb1mr13967538b3a.3.1772530553072;
        Tue, 03 Mar 2026 01:35:53 -0800 (PST)
X-Received: by 2002:a05:6a00:2e98:b0:81f:44f9:7c1a with SMTP id d2e1a72fcca58-8274d974eb1mr13967513b3a.3.1772530552541;
        Tue, 03 Mar 2026 01:35:52 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ba6275sm19644212b3a.0.2026.03.03.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:35:52 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 15:05:27 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-gpucc_sm8750_v2-v4-3-2f28562db7c9@oss.qualcomm.com>
References: <20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com>
In-Reply-To: <20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: muinnr2dJ4vhG5hkCkgCq6nMs8mKJQHR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3MiBTYWx0ZWRfX3N9won8gOThE
 tq0BtYHuenYn9ufwpruYjHs3GCJzB6IybN7Ab39XFDRyImHdY0s2/KfJ6zkXstuRgB+hV0kPrne
 xe4C9Hoe4yEM0uFQ/b3xYjM/GURXV413AN7acWj8XCuVzZTRcI8oFBdxj2SAwPNhbNzBf7TQApR
 DNUz48DC/NLDJLAAkeouHTM1M6ZQNjU9VGI2aiMYchv5eM1Mcre2AD8Jh/y4gHPUwM33+YtOCRR
 l+FI5Wi6FhAIKrkFYVayWj42PGDZtCSEINvELx7e7LVHkg6d3nxp78RCcBdAC8Ej601yEl/LIJZ
 IcYZ50NJNCLlYagVzHMdH9JFVhdcHuoCo8gxX8DAJHOD1BcjGL6eNywQnjCdHIZdGijzr3Mmu90
 mlG6hFH0cA96oGbPDW2K/laMYQUFqcFnzhte1e4F09YrWolTQwipI+atxkbkhCp8H38/vCRRMG3
 n/yM1q5c9smA7yeOqiA==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6ab79 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CyMIzFe51rGKrm3YhSgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: muinnr2dJ4vhG5hkCkgCq6nMs8mKJQHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030072

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
is simply a separate block housing the GX GDSC) nodes, required to
power up the graphics-related hardware.

Make use of it by enabling the associated IOMMU as well. The GPU itself
needs some more work and will be enabled later.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 68 ++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b857a28859910f5c4465c8ce3473b00..0e7a343297e3f5d7a8189f50726dc6279078c21c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4,7 +4,9 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
+#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/clock/qcom,sm8750-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -3001,6 +3003,34 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,sm8750-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&rpmhpd RPMHPD_GMXC>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,sm8750-gpucc";
+			reg = <0x0 0x03d90000 0x0 0x9800>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
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
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
@@ -4515,6 +4545,44 @@ tpdm_swao_out: endpoint {
 			};
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,sm8750-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.34.1

