Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC0537D126
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707236; cv=none; b=ot4Cj8hCNfDYK7yzXKqcvMRH+QusjM0wQ7JOCFjlXPRNoPH8Emgo+lSoBmDTHRXxuHJXRGpFxfPWul0K4VUZv71pPeYQ1KIubN8XslquDzJm26uvHNLZIy+14bYTCZUMOp71OnX6sp068VyLCa8z8lqIrA7vIBXEDg+uvQuX3W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707236; c=relaxed/simple;
	bh=mZK39g9gjW9EHbVEu2dfWnHrL2lydmkpD07vprS1plo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPCNuumuEfmkNj9+vBYbTiUa6xPJd2OJs0KgZVL70j6opTfCOUGBts4WWEo63EVSiQrdfSEwR/sl57rj9HzJ6Iv74ly8yGpMxBRJKBUs9CtUX7rUo7HAkc+IXozDAQdCAIFWdsIPEhurPi/P0EmopUMVNWE8picsS4CHpHIOlO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kb0Zo0oG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BiJeOQn1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kb0Zo0oG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BiJeOQn1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFf8U916979
	for <linux-clk@vger.kernel.org>; Thu, 5 Mar 2026 10:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxEuAKUU1/RLa4q/g6rvek8enXSBSN3O3+sCkdClNRY=; b=kb0Zo0oGuLbsYFt6
	OG/5CP2Ljx2J7XX99du6rgKdt22I2tGEBg8+/74sMEHkmHrSA5b5uRys5Cy9wD7H
	31Bc4lx/Kun3g+ROhgkkvyI/Fz6j1Gv/xjzly8CuTvNyzffNeyG3gMGDxvuX6OyA
	fAdcRAoznSXQaZQZr2/WyHUblBBs8qHp602zlplSJxCbHBPns7d7tY5THQ45Pcjc
	jn8S2LxRZ3k3sEvk9G9o3NbkOMXXfIaZybGfpp776aKgEH4ApM2+06a3X4wiFhc1
	nDLbNXgBhyfGy1JwkAs6Ka/dRpk9IxESfkfJm3mBlzmvZO8AjI1ZU25NdAONhapK
	HmCJdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380s4kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 10:40:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4e20a414so222331835ad.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 02:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772707232; x=1773312032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxEuAKUU1/RLa4q/g6rvek8enXSBSN3O3+sCkdClNRY=;
        b=BiJeOQn1Y88kPqzvkKm2CzVwKBTPBB8tNZi3A90bxHg3JX61JxdnC5pZI/bEHfxeSP
         ATobq0cgfaDzDsbOWVKUQM65/tPshP2VLlqGBIG0KH8fmaZUp/GKGIq7WLKLpN/nyJeo
         /JItCAuHQIBN3ooHQ+qdjOrZ6zhGS/knAI+0uM9wiUTVkoE7YYPNXYWcgLHXp0DZuZ5X
         ER02awhW9/buI9n2saB6h1GOhQHbJ1T7ewYX9T9Vh/HTd53pVPzB34TVdKCOtwJm5+s1
         KkteGDLV8yA9DQ8v7ejqDXJ7h0RSLOWt+sXJdGfZJ8Z7o9RharJ9qGnaiMz2tFY5VsA2
         mQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772707232; x=1773312032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MxEuAKUU1/RLa4q/g6rvek8enXSBSN3O3+sCkdClNRY=;
        b=bsTgWf2MVQgKiybb+HgkVCxdWeOhDf8aUOAdifITfZsmw7YmRa1SlS8/n08DFEh8FM
         z5QIwOt0EXmhNY1XPPoHRvZE5M9cgHEk8kFxLy/JeQhsoxzcM3JOqQbOBCPnaCg4iEcH
         YltylGyEA/cwbVnWURqdl9Fnr+QzHrovTLtnLFQrm8Xuy4hIEv7CrsfuG8T7gssRs2ZK
         oD9Q/FUegiKtU3FHUO/exyjfZsHrCBq0E6HJnw5j05qIpj5erxHzt7BhRRh+nOlLtA/w
         IlauaExXp77FU8ZEJIgcE2NBKN+NCSSBZ9oqmgY/X7UkjQhweefBLbU9gX5emXFxZ5pz
         a/SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLKDGilHv9ktcNfUfEUczvf9xtl6/HTTjY2rdTTPJQCOiivl6eq/SZkyTT56banKe5MhBROO4pHRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YydfGP6rJTRd59nEO5QLHR02fxPA+gTzI5HT5Rhu5ziE6sQGzj0
	llOZSX86KSlKn2rqnazUg+zu+jbPKC314mA2ljWqfl0MDzcpi6ttiBIlsu8IlVnh3cqQAqmi4VJ
	ByNGomzo6Ny2LJ8Udz8AVLe97VFnc6xIoFpk0CH9DfvHGcIMgAKoV3OigjKMNCuY=
X-Gm-Gg: ATEYQzw+QQxl2XkbRTcLOGQ8gSo3ulsBuvF4OWRJkPw7c5FPgugVeofjNrDWeHoGvHF
	GunOf2tDfSCQ7xLvt6q+7PvyeYfwjHzoqhFFfyOAfO4G0BlOnqoBW5+lb3DDekftZ3Alg0u099I
	87CFDdi+0J+DSxA8zJjNAh/7UDrmI6XYlleJxMAIG2BPttKI2XykdaZgEgu17BoL2Qt1zgWx8G4
	lxTBlmgfTYvj/ch/4hb3SrOCCX53wTyQGJ+x3Ym8nN5BZdueBzW1wzEE5PJtaFNkPJp8Cbcma2v
	n57rtbcwMoxp8AzQ2TYIDBH1TD6o4DKQy/EaEOQKiIUynw9Re5Rym50jbQ7aMpnapIbi9qUaIvT
	booUzGXiEb1/sLy2KQEcJDfE2FdZ+p2Pyc9pySm5/FluopA==
X-Received: by 2002:a17:902:db0f:b0:2ae:5745:f0e4 with SMTP id d9443c01a7336-2ae6aa0207bmr55854555ad.2.1772707232462;
        Thu, 05 Mar 2026 02:40:32 -0800 (PST)
X-Received: by 2002:a17:902:db0f:b0:2ae:5745:f0e4 with SMTP id d9443c01a7336-2ae6aa0207bmr55854145ad.2.1772707231966;
        Thu, 05 Mar 2026 02:40:31 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4650000dsm134429325ad.54.2026.03.05.02.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:40:31 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:10:10 +0530
Subject: [PATCH v5 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gpucc_sm8750_v2-v5-3-78292b40b053@oss.qualcomm.com>
References: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
In-Reply-To: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a95da1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CyMIzFe51rGKrm3YhSgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: VKdYdTBv4qVYbhlPKrFOeT6o044ZQppw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4NiBTYWx0ZWRfX1Mg/R/dpqyh4
 BAJi3//kapyHjcia8GHqx3lmXGBsBkMU3f4FXOZ8Mju/0YcAAwbQCW+qZOm6sLYk/dSgJW8kpHF
 3xO2B3CD8bHWFYtkMtfvwqOFaJk0qA5l7+pJrgiupynZctSu8w51fk2GJblfnru9EA8ussXBiey
 hYmPF4JvYuFkgIABMPjfNbu698mqrOR8vC5z/nIpc8ZjzMWVWNijSXPm9zHUKesLQoLevaxS9iE
 LrY9YVZvihl8PuQqKO4K5eC234vxeQKhErLTeGQIehQhGQmew7I7sfyKn9p9+oft1A/C5T9cMWJ
 De5iuOvIAqvFPACwBDTsgLY722P4A1+ImE5QHQyzXArira6F2MH6RhfYb1U/L+ueceTS2g1OBGx
 r3cpFGoeGhLLHCsPrWF8psIIzDFvT9IEBieRguA+z8AgFHFeEdPpgWuR+QQ2MzSUfXuoKMq0G9Z
 Xu7Bl6Dr6hZC+WlcFyw==
X-Proofpoint-GUID: VKdYdTBv4qVYbhlPKrFOeT6o044ZQppw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050086

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
is simply a separate block housing the GX GDSC) nodes, required to
power up the graphics-related hardware.

Make use of it by enabling the associated IOMMU as well. The GPU itself
needs some more work and will be enabled later.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

