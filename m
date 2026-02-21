Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6B82DB79F
	for <linux-clk@vger.kernel.org>; Sat, 21 Feb 2026 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771698176; cv=none; b=Ghpn5V5v/Q/z9/ce5qtoB82YKEqZny2j3/XgElRpKfZEObBOusC6L06GBKYI9QCmxNHhLJsykRxIJXJnyXoxMukFC3L4ZxuQFN5nbSVNmrXo8QrB9ah5kwDyym7M0ekqjnWuNEvNFF8g3ZZ/Nv4iHhByDjZs0BCkSb3i7Ol0Mpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771698176; c=relaxed/simple;
	bh=j8YzehGleE4Bcxai9TU+Rb7l+5Rkd2EJJJhmu0Oe5hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVVZHfgXO783ki3gKWFoMaE6ADDJcWE6+OVmqYTq/j2O4qPyf6BERsTP9FPRpwG1JkDIeXIu8CSrrU0gNpsPMuG1ohv8FaFu2UCpe1LFAiHGJrcyO0J0vSvPIydP0PUqcVp5EH9ZnPkH21/ASbn9szUuueZ3QCHHVuSWArG2IZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhAnhOdt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WL2g0Ao8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhAnhOdt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WL2g0Ao8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61LG1C082569828
	for <linux-clk@vger.kernel.org>; Sat, 21 Feb 2026 18:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBC96Crr9eVFMb2/ro/RokIXk1UZeAJM2LYx/7JosQ4=; b=OhAnhOdtcg9OVMuN
	10Z6cQnhJohMbDoeia2T/TtOZDQhLsJDCs1zILzZ1EOnfPTQtisE72uF/DpXcqB6
	CUmR0qn/JATZUu44oDvGtGM1n864CF7yx+uvCG9apaMAVQu68ExQDh3p0BjociKO
	kTpTjfLyEth9nFqzvO07a97+m7xTcVVp9fEbzkHUUxAmRZkkgtZMoQSb64nqmfjO
	GyCPWRUF+h/7rn73+i+GmBrbqVm/sKcZ5mJVTeiALbi3EmF26aMTEAF5+WTR5g2X
	+6EjdG1AuyXMQiYYQbmwv7TsHst3fdfJwsMNWPxadjYDiNhPp7f41WnydTPJs2yw
	jNNiMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5was4y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 21 Feb 2026 18:22:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a75ed2f89dso29848465ad.1
        for <linux-clk@vger.kernel.org>; Sat, 21 Feb 2026 10:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771698167; x=1772302967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBC96Crr9eVFMb2/ro/RokIXk1UZeAJM2LYx/7JosQ4=;
        b=WL2g0Ao8bPp7OA/KhjJ6EjahujaCk+jQkWTzSe4hWPUUGXJFOWf0yCqhlC7v1JqVnt
         ZyHA7+21BEWPZbHqFUT7tbhVkPNgdDr13mYbU4iUVGSdN7HCsIMKppJDDZzdhQkqPu2g
         HujEgSfMaTyd5LnFBtG1wm7xuRDdbW2h4JSaiad/KZZjnXZWR7Srl5lRzDYW9+My7cDh
         pGX8dT1hMQZAgfBZXjaaGXIDnqLBz0pFt/lzV8H5ybK2lsmEEh1Y0oVbvw3kxdR8ybfA
         Wshht5V0ly9DUKQetIgNBaRqZinaDT7t+5O6qYES98Z7wADTdaAvyZJDRgiyj7GSnfr5
         aEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771698167; x=1772302967;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBC96Crr9eVFMb2/ro/RokIXk1UZeAJM2LYx/7JosQ4=;
        b=TKNq0cUf//zlnSTcpEsYe2ZWyQ8DZDOo3fiwaMt6cnZHEi0wq04MFD1s38JKXtg4VU
         RKMEhDD8pBDg3Nda8nfZI7DTdz+Fj6Zu1MfT4oCor6OqxOtfV+n66GUZQUjOKEObOhnD
         HyltJNNDgZURZJIsLZB/cWx8Ru8nl3OPc86ClHnSVtTx86UZM7lkDMu+yhTLd879mBpX
         brNEjHW/qyMh8CQehxraCzyH3nqp8SVib72qoazkLlEMKQnLeQV16/alf9Le06COpO21
         XlAV1t0f3Vv7nWZv46iLvzmpgq5haPs20eJ8aUCtOgYvPs5BnQzG/4rsLA0h2AdwMPhC
         ak1g==
X-Forwarded-Encrypted: i=1; AJvYcCU8TrdL67vy7vq/Pb3BvmwhA5OZlqZIpqAO6tMBUsCsZNZohgo1tHH4EH4qw8qPg59VapVs4tn+inA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyas41tWGy03abPGCWDLq5tuBQ0Atb5P2DbcXipQZ1w/yKnXOJE
	XOgg6G5xw83rRw8JohDfQrS185xG2IJ8iSLiIrSIEWjVfhl2XlqkwD6aO2YIpko3wOHaVXJSnrg
	Q14GryqqeEbVXh4PQx4x+6gOL452chD2ttcV/q22kysFUbzUfblqlBdbDn5oZdt4=
X-Gm-Gg: AZuq6aL8fOhCGTeR0a4zf1J8HZ5b0jpYnlCcwGrPruobp03PzvEoMjHGNV1jfyF6aff
	BzXb/oBllnaR2sn9h74EHEf2dDOG2KRhhOw9N3L4UzdQ2aBlzv0PeMDoALdXi7ilZCIjw+LMgkt
	lVrHJRKuN5NAS5K85idbXt2LiGdLqu8Pdqh8tg0PIWOBv5c37JuEZWZMEyasuli5+T08n9Jm3Ge
	6CPyWy+RAEQEVEgNPDXAjhZWzuasqEN2UP43PtVKt8NffkvE1sNK12WvhhHbpKq3U3X/Mg6mjzb
	zBSV44VssJq21IjjGeZ90e5VS59OSWmpiDbJyAbLysPFG1wJHmWvwLkiXrTAsJQ1ql17jm/l/NN
	PEHyCaLNBxNyx1IQsgYsL8O5sm6s0pU+t/beFuCZtHtyV71A=
X-Received: by 2002:a17:902:e542:b0:2aa:ecec:a43d with SMTP id d9443c01a7336-2ad744a0062mr42498755ad.21.1771698167457;
        Sat, 21 Feb 2026 10:22:47 -0800 (PST)
X-Received: by 2002:a17:902:e542:b0:2aa:ecec:a43d with SMTP id d9443c01a7336-2ad744a0062mr42498465ad.21.1771698166964;
        Sat, 21 Feb 2026 10:22:46 -0800 (PST)
Received: from [192.168.1.11] ([106.222.231.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7504379csm25510135ad.83.2026.02.21.10.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 10:22:46 -0800 (PST)
Message-ID: <7dbc0e99-cffb-403a-be7a-27d1b47712fd@oss.qualcomm.com>
Date: Sat, 21 Feb 2026 23:52:40 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
 <20260220-gpucc_sm8750_v2-v3-3-6c5408564c3c@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260220-gpucc_sm8750_v2-v3-3-6c5408564c3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=6999f7f8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nGub0OD3bIp9TpioTFTxbA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_nDl3K6yXJEX041QHmYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDE3NSBTYWx0ZWRfX7fqPSkdUY+yo
 qYd+LLMRHQPmmJxkbVj+JtAakw9bUn4Fgt/WNqrOKIPvQ37zR1epL39SUbjFIHMGHN4DlOPSP/A
 h6bQVU/ZRQkQpntyUD3ZbUREtHcczlksn4ckOKedXCuDmlWBjPdg6Da5ftGNdgPO9bxCYe1CiZT
 peLgxtH4o9M+62X/FB++bUfMcWHZPn9W1BWC6xuTmrkz2Xb9hMSa3hexkCJa0EDM4YQ7fE/1n75
 1Di4gJ4BVrITVrAXJMleJ+BoT3OOrmUZn9bfDZM8C6E0za8pEdeCRRaPR1WyyTFYkF1wb8xT332
 aOWDaAl8i+iJsPs4SA4Co7nwJ1puUjC6W1LKY9zZC7skFjHQh9d90F7AKqh/H7FaAf/vAszJv+r
 fH2GpsaWF9LN6ca9O4rJstTbA4TskRqeOUZ2EfShOuezXW+b/oRKrL3xqZh7Wwr9DxjEB+BKdcF
 ZYekhonvuzBYwCGwcQA==
X-Proofpoint-ORIG-GUID: DSD6yVPBUhe_lmByckqkz_gFFYPatYXI
X-Proofpoint-GUID: DSD6yVPBUhe_lmByckqkz_gFFYPatYXI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_05,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602210175

On 2/20/2026 11:24 AM, Taniya Das wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
> is simply a separate block housing the GX GDSC) nodes, required to
> power up the graphics-related hardware.
> 
> Make use of it by enabling the associated IOMMU as well. The GPU itself
> needs some more work and will be enabled later.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 64 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index f56b1f889b857a28859910f5c4465c8ce3473b00..0cc931d0bc96e9563ce4e7989ecd4ba50bd424f8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -4,7 +4,9 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> +#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>  #include <dt-bindings/clock/qcom,sm8750-videocc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -3001,6 +3003,30 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		gxclkctl: clock-controller@3d64000 {
> +			compatible = "qcom,sm8750-gxclkctl";
> +			reg = <0x0 0x03d64000 0x0 0x6000>;
> +
> +			power-domains = <&rpmhpd RPMHPD_GFX>,
> +					<&rpmhpd RPMHPD_GMXC>,
> +					<&gpucc GPU_CC_CX_GDSC>;
> +
> +			#power-domain-cells = <1>;
> +		};
> +
> +		gpucc: clock-controller@3d90000 {
> +			compatible = "qcom,sm8750-gpucc";
> +			reg = <0x0 0x03d90000 0x0 0x9800>;
> +
> +			clocks = <&bi_tcxo_div2>,
> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;

On Pakala and newer GPUs, we need to scale GMU (which is connected to
the CX GDSC) freq. Is this DT description sufficient to allow scaling of
GMU OPP?

-Akhil.

> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sm8750-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
> @@ -4515,6 +4541,44 @@ tpdm_swao_out: endpoint {
>  			};
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,sm8750-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x03da0000 0x0 0x40000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> +			clock-names = "hlos";
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +			dma-coherent;
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0 0x15000000 0x0 0x100000>;
> 

