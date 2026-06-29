Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358F439D6E5
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 06:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715427; cv=none; b=aw9UYY9RO7+Umlec9MYtXOEkIuRekMwJa6+8Cgos2gyCh92dCsEane2hSmlYPDkKDN2r+0uHSy/b6C0ODiFVs3cNhrzvQvSDb/u6gNr1zhjARnbj4wXbhtb6FR3ZDCwnp0lpkx0TndD5/qzYT5LVxsH5C2jHWWs2/xDFwCI72Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715427; c=relaxed/simple;
	bh=YtI/a8V3VWHkMUyvr7qqdakggCFkROYEKEL0ogcwEec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6+qcK932rtzo5rsdHu8zNRbk5rHddUQnedczI+TyKKObXyvNhQl9rC2QLVjYvKbwNELHl2bMfcd95MJQ07AbNv6RK/Jfm2N5sGfv4rJTm/YU/nY1m3jYdf9C0TOIeaA/nXM2Mhb/zDLOqsx3PoNxfVD5LsqadOZkulxvvRMt+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5SVKwOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEA/RPqm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5SVKwOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YEA/RPqm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6gmtH2051438
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 06:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oeev35a+fYiBHIAn2kEt/OV9882jmuAqnxY7YgH70c8=; b=V5SVKwOHM6OdgErS
	QpJ2G2DxgHm6YgItSmHOkHYZPI1pdLRFDwISAoZHWwHBR37rPuGhe9bJhgMmuiRf
	925Qmp5b0HW++API94cQ6wjg70SI7iihaN1FxCzFXYKwFrrv5d4VWfQGaUf8NxOT
	TAx0aoMYu/+CvkUHHB233YNR82wmnDgV9sBQvTNzTY4/oK8pd3EeWNzbmGy6tnXJ
	tHgaUOeJV1zvMC37jusZ7sDOLjUefXftty9H/nJi70Riv6GuFAc6fM9/WKzVkyD0
	p17CQictIJh6dXtLaDHUxBDDnjHx94NKqnqrJwZCy0MDi0b4gj6TGsm7DnVO1oNd
	6Vq0OA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7g030-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 06:43:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6a20348ceso26698785ad.1
        for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 23:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715424; x=1783320224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oeev35a+fYiBHIAn2kEt/OV9882jmuAqnxY7YgH70c8=;
        b=YEA/RPqmU3xBkD/WiOWbDspZ7XPSiSOW294hZE8O6IN7EvU+5n4DqttkQU7PIf5vgu
         fQNxI7jeX+TsSZs4ZfBy/WZMIglcKXZ5FdQXubG7Iduw2pENt5l3HC2rmnNqR9QtesGE
         M04b+th9MAnCBUHb/oY9r0bszz04+ykBDF/+cQrfuwQkm5FtdkEA6Nb6GyxOuTQhzoh3
         IVfoj134nzQvCGxLrUJ03Qu3/+2HmpFvgrMhbl9dKPLcpUsDwgPq4+x+YfZHtQTdg25S
         gVHo9A/gFzTBf2Z3Lg5ThO61rno2WEHk8HIo1XAACww3ujJavEBZM3XsizLK6jGI9SHC
         spEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715424; x=1783320224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oeev35a+fYiBHIAn2kEt/OV9882jmuAqnxY7YgH70c8=;
        b=iel6AVjR7yOgr0B3rmGJp6k/enm8vqBK8OCb+GiWP+RhINmmPmqJZqBhr0q5ZO5aAk
         x+TIFY7G4l5Nc+/f1KGEpEzsDpBr0mlrYEXlAg9uU/JppT9acVuAwsfuEK8p7FbLAuLH
         IWzU3ux5fXX4p23mbgIUMEomdH2apE5GDQTX7EPc5quA4sfkjQ4JeymBiQYcojF+9/H/
         PQnMAD3qZE6i2sJjDGW82Zw3eLC40ACIUIOnJHYm/VDQWrL529biOv0Nc1/VAl1vXWKn
         T45sFjcJK3kwtovz6QdqRxaTz9dioDtkL2acS8tyuMu2ODm5rPlKunUKnfHTq3uOFaod
         mKAw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6cNGQWW7+hJhsdYFeM3shvKBsaKVDlzswQhRX5CJbhCiGg59JzNRrV/hWEY5l5QkRU8Wxf7RcF0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+hTP/gJIG1MgV2Zn73x5qgPW1Jlt7fDYhTLu/DVT34nWwu/hb
	q/YhFlFQUJxadmVcq1CUBvHQpULOQjCes4DNIfDxRAlwWc5mmX62VgtBMSrF3vkVop0RfeUQRa+
	xgXgvxRTUhf5mznzpCc/4Dz8xab4huV1V1rRqY0mLPwLemLmS5B+qLZVziq/JVmHss1lroQk=
X-Gm-Gg: AfdE7ckzCe7MYoQKDg1LxOITv9Pa0lMqpypoJO2uQRytXjuC91DXCzZINymawsCXbFI
	l2ioOQkZZc8b/Z2iYCxGMx/BpqIe1jhomGEvoGUntiKY/fe+GTHhSa93PC1XfQ3RuSaBMDHC88Q
	GiKq9kgWfPiq7U2MSamB2ufF4SPgOeZ2ysOZKg5BcqYTIRiVg6b4fxp/8TsMpeTOOl8UoC8HxAR
	HSWAO4kZg5OjPGJpT/jsFzw/TCpwMZUUZBCNmdNNVqIBVblLc8xmDNlyWyE4X4slOZAWHH3P9pz
	SvAL/yKUa+dQyL4U9EetVRxBbBAik/PYmY3vE1rubPOPk4iQ+4AxUnX7PWmFM/jvO5sL9dNln48
	Ufn0xbqUW5Cvd6CjSMiTXcG08mSSdj4o+4debvA==
X-Received: by 2002:a17:902:d585:b0:2c9:afad:c5f2 with SMTP id d9443c01a7336-2c9afadc67fmr70320475ad.45.1782715423746;
        Sun, 28 Jun 2026 23:43:43 -0700 (PDT)
X-Received: by 2002:a17:902:d585:b0:2c9:afad:c5f2 with SMTP id d9443c01a7336-2c9afadc67fmr70320155ad.45.1782715423304;
        Sun, 28 Jun 2026 23:43:43 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c8c940b55asm50724605ad.76.2026.06.28.23.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 23:43:42 -0700 (PDT)
Message-ID: <3f8d117c-2ced-480e-bec6-0bd38a60b7c0@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:13:36 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
 <77a5213d-6be7-4a86-81ad-3509a499ad12@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <77a5213d-6be7-4a86-81ad-3509a499ad12@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX76SUEaU2CofN
 AknVyn9t6w1i0LX6T3rq5gBCuky1tYHgawF0Uavv3OLZlpS/iPvYkeLNd+nFBs61d+q+FhlOcaJ
 S25GxWooeBQD/HbxoDmqvMgC+6ZcviE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX3lLuYBP+IPVW
 FmiCNVO95HlnYExd3cqjfTw7VUsnaqGUhaftAPhveFerWmkkVx9aWW3+k/NnO6IuWvCRO39s7jT
 /zwmTCac5xvpNFBPHHYzIONT/8LmYRHINNHGhcrGgfH7wWSs61/4u9JlpWAwCkUbD2eFRCc+/rI
 kRYNBXZNuSshgOiQbtyCDhy02MmCFXrSkG6E1XJsIvkSeGqtGVYxYYvZkB1blRlh2qJOPokhGVE
 LDWBY7AXS5vqhaepr2xp8ebUFIh9VBKCO3UCVXvXp4bX4Xqd7c0i9nhstQTA59YOv2TyKz+AzVn
 F+B4c+MAOlFGH6tNNrSWaFXibiGfYka4xYy159iADNUtx66JmeaL6WR/trNPwNSxtz8+TJU07D7
 GV7EEUEejIbG0NJw04zCFrGYtvLFa1hXwR09wK6mvFPU/hpvdqeRbNY2D7Hs+5IV5BDrxrFt/sB
 HEOu74+xXeVOeCQSPDA==
X-Proofpoint-ORIG-GUID: tmjkKsGgpwVjB9FoqaxEwj5dyCllMgWo
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a421420 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LPMG5iTiuM7aS0oOI1MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: tmjkKsGgpwVjB9FoqaxEwj5dyCllMgWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055



On 25-06-2026 02:14 pm, Konrad Dybcio wrote:
> On 6/4/26 7:26 AM, Imran Shaik wrote:
>> Add support for Display clock controller and GPU clock controller nodes
>> on Qualcomm Shikra SoCs.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..1ccb0f1419aaa34d32f3c3eaabdb8727a497b501 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -3,6 +3,8 @@
>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>>   
>> +#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
>> +#include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
>>   #include <dt-bindings/clock/qcom,rpmcc.h>
>>   #include <dt-bindings/clock/qcom,shikra-gcc.h>
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>> @@ -640,6 +642,45 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>>   			};
>>   		};
>>   
>> +		gpucc: clock-controller@5990000 {
>> +			compatible = "qcom,shikra-gpucc";
>> +			reg = <0x0 0x05990000 0x0 0x9000>;
>> +			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
>> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
>> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
>> +			power-domains = <&rpmpd RPMPD_VDDCX>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		dispcc: clock-controller@5f00000 {
>> +			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
>> +			reg = <0x0 0x05f00000 0x0 0x20000>;
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
>> +				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <&sleep_clk>;
>> +			clock-names = "bi_tcxo",
>> +				      "bi_tcxo_ao",
> 
> Is the AO clock going to be any useful? Taniya recently dropped it
> from some other submission after assessing it wasn't
> 

The Agatti DISPCC driver is consuming the AO clock for the MDSS AHB 
clocks. As we are re-using the Agatti driver for Shikra, kept the AO 
clock as is.

>> +				      "gcc_disp_gpll0_clk_src",
>> +				      "gcc_disp_gpll0_div_clk_src",
>> +				      "dsi0_phy_pll_out_byteclk",
>> +				      "dsi0_phy_pll_out_dsiclk",
>> +				      "dsi1_phy_pll_out_byteclk",
>> +				      "dsi1_phy_pll_out_dsiclk",
>> +				      "sleep_clk";
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
> 
> DISP_CC also needs to source power from somewhere!
> 

The Shikra bindings aligns with the existing Agatti bindings, as it is a 
re-use. And the Shikra/Agatti DISPCC is on CX rail, and it will be 
always ON when APPS is active.

Thanks,
Imran
