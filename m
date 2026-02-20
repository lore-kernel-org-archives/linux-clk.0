Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4CC2DECDE
	for <linux-clk@vger.kernel.org>; Fri, 20 Feb 2026 05:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566887; cv=none; b=qPKdfj8eBpYSIJjHdfKV4wqmC6UbhGDNXFzyzTwN3IvT3y6NHPRnt1y8YcoCXAEh/N9eDs0wruGDaFXusBXMwCwPHOne64zdIqnI9GaeJNi1FwgSnPk7l6cxB/186hq4FEl7FumRjzZID0Tiqyi/sxuNXM+3z7Y4YFM3OrP//c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566887; c=relaxed/simple;
	bh=YJTFGMEepF3OlAHZP8f2rwHLxWqlT+Xu+VLIoE2sCe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aqzyjn1m7Re5jRla7cmnpjl1n0oo0GLbtc30zpkX7OTdgFCnHWJCqvM6xMY+luc7RORE9Zda95WTJqEh7INvbMqi1MhqemYPx72EfHGhVUaM60hmCiofRYeFGr5YbNftlLBSzlpBzjP5dv/LAnw7MQGSPtoJRTIHxlwViadYk7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4Jdk/Rs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7aqkyAm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4Jdk/Rs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7aqkyAm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rm4d3697692
	for <linux-clk@vger.kernel.org>; Fri, 20 Feb 2026 05:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AjonDUMUOPD0sBh3EsKMWNmFtBDTuVGTl0/oR15Yd1s=; b=p4Jdk/Rs7dUJlMhZ
	oV5+XMPM9WavYwL7edqsuIxFb9511c5RVXbx9WjEi0pyJRcRMGwNwF2GXT0TcqJl
	RFeJF2Mk/gW5QQfYAGhmjdSt2Sr6xBJfV2If3lVdeU1cw/nrJNR3leUC1YHmfGyG
	9mEVyC1DbgDdEuDGg0a8Z3OO85vY4NS6JGTCetinq2rGKTQuhBnwcEzHVNOz8mcG
	glVXDv6ksEAQ4v+uzaUipeDaE/c/I80wM4Y3BIPeCMVB3Ou7j7w+4K2Q4gUvaU1W
	YcGLri+C8FxpHNspmMEHyB9vokJ0IcdF/MgaSORM1GguWWgxMsbnZ047WEA5Usy0
	B0F7iA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh5jg3ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Feb 2026 05:54:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ab0b2e804cso20997435ad.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 21:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771566884; x=1772171684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjonDUMUOPD0sBh3EsKMWNmFtBDTuVGTl0/oR15Yd1s=;
        b=C7aqkyAmqCIbRZQOXsqanssBa1DEZYNiTfHbMumVWNGgKraTI/OsC2D1JT4CHMjfXG
         Qb7PA+2nFGAia9dE2YFMy7DK9Ew1ufprMreOPmH/wtfkKf9JGerF3nY5z1tWlBV0Obju
         WhDjP1kAmVIZfwgT4CXGdJeEtd010Td5yMgMsKdZUzVSJpIppl2TXXdRojc3kbPg42P+
         tMVbGwUSqri3HQcaLOaW+AtEUjn1spnDGpRjldw+9j80jO5JdcYfy/DFd0IX33ZKuP6g
         ngnR4oljAjdtIkpMh2Xl8udv1vamfVRdsICMZjk4VNGgGDw8vLnVn/eFC/Q23Nt29MRa
         DhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771566884; x=1772171684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AjonDUMUOPD0sBh3EsKMWNmFtBDTuVGTl0/oR15Yd1s=;
        b=xVWGLxdDJT6iMALHn0gYuXvvGF9PVD7YGqrBab80TF/O1FhDWq2VSf+pvYx6LPiiKr
         rv6TNqK2Uw3wYmSGUXmUe5iTr754kUNghI8bDHewuWDwUO8Th+KX0HthNACgzRwpzjoL
         1PSUn1G5pnGkdC2GsEzVgEasWA6oMLC1KZlZc9ilvc4D5upw3hXAwSLGLY+L/x94Y9Ri
         6Xrsur+5l0WcNwKx/8vU8gnZFn+RO2qljsRmWe+vj39tk2v+SnIO8InYLjhHfwjzrS6C
         U04bFlp4waHpsW2qTLG+TMoPK7+Gl0YeMFHec7bT6w+C6ogPvIGRRVnYiC7ZyLKgRV9A
         /S5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1hEELPJLQYZmWW53DQ2QexVX8tytW/8cqYV8E0Zeu1j/dLDZ1BYbpmcZrmdrwWkrtP03G5uOdaSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsXwkfZj1aNzW3511Yysw3ryaPEj96qaKQVDaynoOHwCaSAiVb
	DhD7HsdozY+IOI04MB7dKQ5qhzqbRnkplykr0wWBgXoNv0SeiXfjBBG2niEuLBQE1IiiAcoPYs2
	mtPymg8984yWqXDMTh87fP4041d73mi3ZIv24RSrkFLhB3rG6AuGLs1ReHXW2np0=
X-Gm-Gg: AZuq6aImUDhvExoEgsqf+4/xjSYgh1q+0JM2rW5sKh2gW6U9ueptO3cv7Ri1fRKpLQE
	q+XJYsTbCCCj3ZRmALCzjhlBGF/BOERpphQDao7M649OO82VN29jaSTg/UrB4Bp/QmgfcEK81pJ
	IUWtAB2+oA+HehktHcSCcP+j+3j+Of5SFtcP5dtEJmYMenTTldcKCQHdFwjMw6tN9awONRysp1K
	waNmqOz0bLbO3J2tHsXdh1zR9VKcVQgoKke12z1Af8SEnviKTgww9wA48nJN9NCFx7PbcMJ7f0V
	0GlrMEUvm1M6BLHMgRwUQuJzEar2Ejmeo/MQxYx5J7Xmf17DKXkca51+JzipxHgV2xzEf05PCab
	SXMJ9VWIsez8y1/m5MwR7TXWMnjWxFqukQeZaNjR7jr1AdA==
X-Received: by 2002:a17:902:ef52:b0:2aa:e6fa:2f67 with SMTP id d9443c01a7336-2ad5b0e1346mr58078525ad.29.1771566883776;
        Thu, 19 Feb 2026 21:54:43 -0800 (PST)
X-Received: by 2002:a17:902:ef52:b0:2aa:e6fa:2f67 with SMTP id d9443c01a7336-2ad5b0e1346mr58078275ad.29.1771566883313;
        Thu, 19 Feb 2026 21:54:43 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa326sm197949665ad.1.2026.02.19.21.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 21:54:43 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:24:22 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-gpucc_sm8750_v2-v3-3-6c5408564c3c@oss.qualcomm.com>
References: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
In-Reply-To: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Raedyltv c=1 sm=1 tr=0 ts=6997f724 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=-JMICv5YTLeUKPlIpiEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA0OCBTYWx0ZWRfX8C6W/Zcl8FGw
 mql5oDXT11PTTGBfzGi/2ZnMmGuFlptn+IqeL2m6FqMoMgA1wDCnVqh1P55ZrMPjiynNKRUhjeQ
 WqXiPj1ZDcdQb1eHo1itNZhm4gbR39MOQt31oNwRLXtBgT+K7S+hYBlgeoqVXtN4YNm4jR0u/sB
 xTKV+02J8ufb3ScH5w4CsWP7DZHV6fRZHaUROe5j/iEoriq4gXqQCQDUScTwp719FLjhXG0+Pnh
 s2LXEjASw738aIXmulVBGkkX/tS7mVOHQ5J4izp2oXWVEpzBkQcW0B77W+1P7/Xl+kvJdoDzyF6
 dzbj1ouoVxfxTf25Ccc5G+2NvjUpSkt/Bms2fqkjiiqje3z7rd9kClvpFZYOyfWdEQU/9M60WZo
 M2qS6C/e5P+VjmT7rNzdmXf1kSN6boUzxFv7kuE7c3NSc3Gk2nc3X/2oszbPgEHDZrH6l3FT8AJ
 t7h3T2mOYwJx11kgU2Q==
X-Proofpoint-GUID: lLQ6T50e5TrGqhNcPrt5E348GjkcWhzR
X-Proofpoint-ORIG-GUID: lLQ6T50e5TrGqhNcPrt5E348GjkcWhzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200048

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
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 64 ++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b857a28859910f5c4465c8ce3473b00..0cc931d0bc96e9563ce4e7989ecd4ba50bd424f8 100644
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
@@ -3001,6 +3003,30 @@ videocc: clock-controller@aaf0000 {
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
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
@@ -4515,6 +4541,44 @@ tpdm_swao_out: endpoint {
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

