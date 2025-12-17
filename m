Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E24348890
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965553; cv=none; b=k5FL7neuxlaJypyC8FyxWRgqyj67ilCeK6P/geqx8OwenDtzp59fLTDv+qwSVyDoi6lDZG2Az4v8/dM8GJZbkrE65PwgDK+/WHYR5GcU2lbdHe2TLpk6iduxj0/UzNE2XN8k3mxgF5w3uTPNgPfuRCy4lcMSl0kP2NqmX7R2/a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965553; c=relaxed/simple;
	bh=Ws7F3VdC5hFdmesEZsq/zppAMbIHvfUsdBK8KYV2wFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIfq/Rm8YE2xePhx3aV25YiF0YNYwXlCa9C6E07FH5cEUYUKfz2NLW5q9ZBDJNuQ/Ih8EwulyU4rQUVaU4SqtaUx/BoJVFfu2itTh0rRPoqeKd/MNXlBueVyoaA78qmFy2MlCKrAJ3rj1+evgv1dEbpB4ywyu+2yaIA3Na55Y2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m6nzmP++; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M++gqPmf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6nzmP++";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M++gqPmf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FKED1215369
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 09:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97QglHuadYLXUENRO8QzE6deEvae83by4P5obZq7TRc=; b=m6nzmP++gerfmq7N
	tRHkNm6tkF8VjpMhPvzvP1AGXSh+hTU0aTV2jXta2JB6xAJJKiHa/JYdd0qywaUX
	0jjqLGsnqJP530vthCT4k3JnBggda58MmVkj+7UIVBM1n7GJCFE/mHqJ7dxtRzx/
	iS5wEesl7oGsapagdk6e96/4OREIV73X+aeTMHKYZ+N0+DGu+1TjPQ7NEFkvZMGY
	8wu/7nEI87vvu30tjigppSZuXWgVJlj3D8RnymcqJdVyKUH8D11e1iXiIwSUd6/p
	aLCOmZJGQ9uKdJS6WhTJnTHWw1UvcMInZ1VoQYyR32dmElR/1Rjs6eXHp9YtuYbz
	H0r0JA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g2tau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 09:59:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso37855865ad.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 01:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965543; x=1766570343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97QglHuadYLXUENRO8QzE6deEvae83by4P5obZq7TRc=;
        b=M++gqPmf1krh7c/PqLuIA3S7VfKr+FNXCp622KZP+STKli1X9o9sg5nljrJLzvWQvi
         sLAqBsRSqhmoxlsWe1huEIVvBy3l/GYDiTCIV81aWW7/D86Dgx6Ds+hojpW30vMBBzr4
         pTuRWqqyoItBdIzxz7qq+DtD+SuuNKYv7y6T4ZGms1Rk3DKUp1m3pfUYyezMXvUOGzMD
         XOnK/0dOIrr7rUNdEyYjK2Ds07GTFzmPNc6xgPJt2KEdwg0+hTVxdMR4o5jJWbv9rH0F
         zWcLuMV9JGR0aM+WDj/2amxP0uqSOYFHl65blgYUMmnfLUPSbfX3IBWCd+n3BoSiL7f6
         00Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965543; x=1766570343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97QglHuadYLXUENRO8QzE6deEvae83by4P5obZq7TRc=;
        b=GaY/oM9lZCjgMM+2Yo5wZ4gHwBrVICIcR4/mCT+vnjuNmJuZaSyXo57sSqnFJ/7P6f
         N93n9YPyjlzz+HFrgR8b5srJ4OrIRLsh1Ly+V2XuHjeLTyB76PgwthGdO10sK/XV0zd0
         5c3YdW9Fng9KRIK0Sb3JRwzJPdPozrHrlwPN6XWHA2TTk3if1KnmdrgFQXMA2rD46vnV
         CLfN0xqO67W9bKgeHm2K+BCtWZ866cBG9qVrgWk5474zT4PRZjzK3T0yY9YhMsmFhwaJ
         TbRz6QOs8inu+it4ne2md/sYcGJbSv60vuCGNrGH3VsaKsAS9O7pi0FlIXs9GpLB/iU/
         XeFA==
X-Forwarded-Encrypted: i=1; AJvYcCUbBoLHVwE8J5uw7SNnNEozjOMrfEND1zxMMo3gwY11VUzn5EbUCDt5zr5uNgggEaDVCItnqNz6kkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUoM9yWQAwnijWHB2j4iwy01LCXoBhWfEddLmrvlv16JWFddEw
	Ch0YjvL1nQweV4N6Te1crsyKUZo/yqdq8HYgKGaznJTuMdns8owC7rlvGaENmcDYIuDv/Oi5Nfv
	MfVCMqp29VMKDdAxrhSsumT2Zz+k5Yg2RNyJtbDK/qZSPImJsvfEdQ0xNoG2MrUA=
X-Gm-Gg: AY/fxX7k7x//yVoCWt4KtFMPD8VM2Hfxj2l4ZCk96FecCaWQziAYdN51HWfxvAicoem
	UjOFJQ6tbHyGDvIKSMCTEpdPkfUPl9dy/rAOEswLtwS+2//xHK+IkLeAej5NQvqQPgSy+HZiCQJ
	VdpdR3h37MK18xFxrekNGsiorVFnvuXQ5+IVg/DRYmTmbVDoybRP2Wogu6/JKGmtH5sKvSZakBU
	mk+wok5Bl1etCOyhuu3w6sNAM/t5+qKSeNZo6sxTBQPYkm+8353JC04jdZ2W16DQZP/zorIk71U
	7KXai627pKhqn5/EepIua62wWCtCQlTRc2vwqzAbyGKbuxgaRzNJQI3sd6/3sHNZJLah4Lkqovb
	uqrQ9ahJq4kVlUW9PiW2+o5GOxK9GAWzHfqH5
X-Received: by 2002:a05:6a20:a128:b0:364:31e:2cb1 with SMTP id adf61e73a8af0-369addc13fbmr17004905637.17.1765965543177;
        Wed, 17 Dec 2025 01:59:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/tkTcgb67rDujlVCcVOY3DMXhMXWxse5zFgF9V/puCFZT6uXYO6k3UJG4BQrsk98xaIBo2g==
X-Received: by 2002:a05:6a20:a128:b0:364:31e:2cb1 with SMTP id adf61e73a8af0-369addc13fbmr17004875637.17.1765965542599;
        Wed, 17 Dec 2025 01:59:02 -0800 (PST)
Received: from [10.218.35.249] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2bfa0845sm17858405a12.28.2025.12.17.01.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 01:59:02 -0800 (PST)
Message-ID: <ca336f38-f831-4cb7-8f2d-66a4302e0efb@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 15:28:54 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom: Add camera clock controller
 for SM8750 SoC
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-2-b3f7ef6723f1@oss.qualcomm.com>
 <7e22e126-cb08-4bc2-bad6-a895a4e35a8d@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <7e22e126-cb08-4bc2-bad6-a895a4e35a8d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tj7nA0IZjHOIJGJ0tOA2lzs6Q5EKM37w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3OSBTYWx0ZWRfX8b9RqyIASZ/n
 pRDtnppGTr9Oa5p/tz++aVVw1loqFis++z3JGAaE9VYPZlr+XI65vLv5u6blTjNjj/eMQCAlhHQ
 6kip3F2b0brZYYpbUEwEVReqXS+ejm78IDwiCN9rJjKcEcnrw4LWnNt+wNJctLvoubS4c7bMfas
 Fi2X1BcVzTthnBJJqlEYGLV8TXSre9LbJi9JWV/wuFyZJ/rfofYj3g9Gn1ZWNBUGFdmrfS06Mtk
 kF8VX0/NU3aKXG8g8TToFD4vW/icvOa9tPHwwlFiOniV081/HYeopmn3PGdicZMD36YxtmrEmsc
 ZSt0gs66/Qio76Hpd7KICmc8W0p6bxsQ9aM4MRXSr5Jk/oPZr1DJj+QfdXpFENw1bOTdXZUf0rb
 siwsNAltzUdSrY2opSyDCPd+HJQKhA==
X-Proofpoint-GUID: tj7nA0IZjHOIJGJ0tOA2lzs6Q5EKM37w
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=69427ee8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=Yq-s0apn9tPP35qU-lUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170079



On 12/3/2025 7:39 PM, Vladimir Zapolskiy wrote:
> Hi Taniya.
> 
> On 12/2/25 12:26, Taniya Das wrote:
>> Add device tree bindings for the camera clock controller on
>> Qualcomm SM8750 platform. The camera clock controller is split between
>> camcc and cambist. The cambist controls the mclks of the camera clock
>> controller.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,sm8450-camcc.yaml          |   5 +
>>   .../dt-bindings/clock/qcom,sm8750-cambistmclkcc.h  |  30 ++++
>>   include/dt-bindings/clock/qcom,sm8750-camcc.h      | 151 +++++++++++
>> ++++++++++
>>   3 files changed, 186 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-
>> camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-
>> camcc.yaml
>> index
>> c1e06f39431e68a3cd2f6c2dba84be2a3c143bb1..8e3baba5270b384eb03a68b4e47785e6c91ec6f7 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> @@ -9,6 +9,7 @@ title: Qualcomm Camera Clock & Reset Controller on SM8450
>>   maintainers:
>>     - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>     - Jagadeesh Kona <quic_jkona@quicinc.com>
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>>     description: |
>>     Qualcomm camera clock control module provides the clocks, resets
>> and power
>> @@ -18,6 +19,8 @@ description: |
>>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>>       include/dt-bindings/clock/qcom,sm8650-camcc.h
>> +    include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
>> +    include/dt-bindings/clock/qcom,sm8750-camcc.h
>>     properties:
>>     compatible:
>> @@ -26,6 +29,8 @@ properties:
>>         - qcom,sm8475-camcc
>>         - qcom,sm8550-camcc
>>         - qcom,sm8650-camcc
>> +      - qcom,sm8750-cambistmclkcc
> 
> Due to the very distinct nature of this new clock controller, I suppose
> it does not inherit most of the properties of other CAMCC clocks, and
> therefore it should be described in a separate dt binding documentation
> file.
> 

Vladimir, from a clock controller design PoV, CAMBISTMCLK CC does
support resets/_ares at hardware level and thus documenting the same.
But currently SW is not using them, thus I have not modelled the resets
in the macro definition.

> Looking at the list of macro definitions from a new header file, a
> noticeable
> remark is that this new clock controller is neither a reset controller nor
> a power domain controller.
> 
>> +      - qcom,sm8750-camcc
>>       clocks:
>>       items:
>> diff --git a/include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h b/
>> include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
>> new file mode 100644
>> index
>> 0000000000000000000000000000000000000000..51615bee307fd9e7f81f7e5c1662535093dd8b55
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
>> @@ -0,0 +1,30 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_SM8750_H
>> +#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_SM8750_H
>> +
>> +/* CAM_BIST_MCLK_CC clocks */
>> +#define CAM_BIST_MCLK_CC_MCLK0_CLK                0
>> +#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC                1
>> +#define CAM_BIST_MCLK_CC_MCLK1_CLK                2
>> +#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC                3
>> +#define CAM_BIST_MCLK_CC_MCLK2_CLK                4
>> +#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC                5
>> +#define CAM_BIST_MCLK_CC_MCLK3_CLK                6
>> +#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC                7
>> +#define CAM_BIST_MCLK_CC_MCLK4_CLK                8
>> +#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC                9
>> +#define CAM_BIST_MCLK_CC_MCLK5_CLK                10
>> +#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC                11
>> +#define CAM_BIST_MCLK_CC_MCLK6_CLK                12
>> +#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC                13
>> +#define CAM_BIST_MCLK_CC_MCLK7_CLK                14
>> +#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC                15
>> +#define CAM_BIST_MCLK_CC_PLL0                    16
>> +#define CAM_BIST_MCLK_CC_SLEEP_CLK                17
>> +#define CAM_BIST_MCLK_CC_SLEEP_CLK_SRC                18
>> +
>> +#endif
>> diff --git a/include/dt-bindings/clock/qcom,sm8750-camcc.h b/include/
>> dt-bindings/clock/qcom,sm8750-camcc.h
>> new file mode 100644
>> index
>> 0000000000000000000000000000000000000000..dae788247afe896ef812bef716897c6cf80df2bb
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,sm8750-camcc.h
>> @@ -0,0 +1,151 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8750_H
>> +#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8750_H
>> +
>> +/* CAM_CC clocks */
>> +#define CAM_CC_CAM_TOP_AHB_CLK                    0
>> +#define CAM_CC_CAM_TOP_FAST_AHB_CLK                1
>> +#define CAM_CC_CAMNOC_DCD_XO_CLK                2
>> +#define CAM_CC_CAMNOC_NRT_AXI_CLK                3
>> +#define CAM_CC_CAMNOC_NRT_CRE_CLK                4
>> +#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK                5
>> +#define CAM_CC_CAMNOC_NRT_OFE_ANCHOR_CLK            6
>> +#define CAM_CC_CAMNOC_NRT_OFE_HDR_CLK                7
>> +#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK                8
>> +#define CAM_CC_CAMNOC_RT_AXI_CLK                9
>> +#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC                10
>> +#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK                11
>> +#define CAM_CC_CAMNOC_RT_TFE_0_BAYER_CLK            12
>> +#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK                13
>> +#define CAM_CC_CAMNOC_RT_TFE_1_BAYER_CLK            14
>> +#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK                15
>> +#define CAM_CC_CAMNOC_RT_TFE_2_BAYER_CLK            16
>> +#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK                17
>> +#define CAM_CC_CAMNOC_XO_CLK                    18
>> +#define CAM_CC_CCI_0_CLK                    19
>> +#define CAM_CC_CCI_0_CLK_SRC                    20
>> +#define CAM_CC_CCI_1_CLK                    21
>> +#define CAM_CC_CCI_1_CLK_SRC                    22
>> +#define CAM_CC_CCI_2_CLK                    23
>> +#define CAM_CC_CCI_2_CLK_SRC                    24
>> +#define CAM_CC_CORE_AHB_CLK                    25
>> +#define CAM_CC_CPHY_RX_CLK_SRC                    26
>> +#define CAM_CC_CRE_AHB_CLK                    27
>> +#define CAM_CC_CRE_CLK                        28
>> +#define CAM_CC_CRE_CLK_SRC                    29
>> +#define CAM_CC_CSI0PHYTIMER_CLK                    30
>> +#define CAM_CC_CSI0PHYTIMER_CLK_SRC                31
>> +#define CAM_CC_CSI1PHYTIMER_CLK                    32
>> +#define CAM_CC_CSI1PHYTIMER_CLK_SRC                33
>> +#define CAM_CC_CSI2PHYTIMER_CLK                    34
>> +#define CAM_CC_CSI2PHYTIMER_CLK_SRC                35
>> +#define CAM_CC_CSI3PHYTIMER_CLK                    36
>> +#define CAM_CC_CSI3PHYTIMER_CLK_SRC                37
>> +#define CAM_CC_CSI4PHYTIMER_CLK                    38
>> +#define CAM_CC_CSI4PHYTIMER_CLK_SRC                39
>> +#define CAM_CC_CSI5PHYTIMER_CLK                    40
>> +#define CAM_CC_CSI5PHYTIMER_CLK_SRC                41
>> +#define CAM_CC_CSID_CLK                        42
>> +#define CAM_CC_CSID_CLK_SRC                    43
>> +#define CAM_CC_CSID_CSIPHY_RX_CLK                44
>> +#define CAM_CC_CSIPHY0_CLK                    45
>> +#define CAM_CC_CSIPHY1_CLK                    46
>> +#define CAM_CC_CSIPHY2_CLK                    47
>> +#define CAM_CC_CSIPHY3_CLK                    48
>> +#define CAM_CC_CSIPHY4_CLK                    49
>> +#define CAM_CC_CSIPHY5_CLK                    50
>> +#define CAM_CC_DRV_AHB_CLK                    51
>> +#define CAM_CC_DRV_XO_CLK                    52
>> +#define CAM_CC_FAST_AHB_CLK_SRC                    53
>> +#define CAM_CC_GDSC_CLK                        54
>> +#define CAM_CC_ICP_0_AHB_CLK                    55
>> +#define CAM_CC_ICP_0_CLK                    56
>> +#define CAM_CC_ICP_0_CLK_SRC                    57
>> +#define CAM_CC_ICP_1_AHB_CLK                    58
>> +#define CAM_CC_ICP_1_CLK                    59
>> +#define CAM_CC_ICP_1_CLK_SRC                    60
>> +#define CAM_CC_IFE_LITE_AHB_CLK                    61
>> +#define CAM_CC_IFE_LITE_CLK                    62
>> +#define CAM_CC_IFE_LITE_CLK_SRC                    63
>> +#define CAM_CC_IFE_LITE_CPHY_RX_CLK                64
>> +#define CAM_CC_IFE_LITE_CSID_CLK                65
>> +#define CAM_CC_IFE_LITE_CSID_CLK_SRC                66
>> +#define CAM_CC_IPE_NPS_AHB_CLK                    67
>> +#define CAM_CC_IPE_NPS_CLK                    68
>> +#define CAM_CC_IPE_NPS_CLK_SRC                    69
>> +#define CAM_CC_IPE_NPS_FAST_AHB_CLK                70
>> +#define CAM_CC_IPE_PPS_CLK                    71
>> +#define CAM_CC_IPE_PPS_FAST_AHB_CLK                72
>> +#define CAM_CC_JPEG_0_CLK                    73
>> +#define CAM_CC_JPEG_1_CLK                    74
>> +#define CAM_CC_JPEG_CLK_SRC                    75
>> +#define CAM_CC_OFE_AHB_CLK                    76
>> +#define CAM_CC_OFE_ANCHOR_CLK                    77
>> +#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK                78
>> +#define CAM_CC_OFE_CLK_SRC                    79
>> +#define CAM_CC_OFE_HDR_CLK                    80
>> +#define CAM_CC_OFE_HDR_FAST_AHB_CLK                81
>> +#define CAM_CC_OFE_MAIN_CLK                    82
>> +#define CAM_CC_OFE_MAIN_FAST_AHB_CLK                83
>> +#define CAM_CC_PLL0                        84
>> +#define CAM_CC_PLL0_OUT_EVEN                    85
>> +#define CAM_CC_PLL0_OUT_ODD                    86
>> +#define CAM_CC_PLL1                        87
>> +#define CAM_CC_PLL1_OUT_EVEN                    88
>> +#define CAM_CC_PLL2                        89
>> +#define CAM_CC_PLL2_OUT_EVEN                    90
>> +#define CAM_CC_PLL3                        91
>> +#define CAM_CC_PLL3_OUT_EVEN                    92
>> +#define CAM_CC_PLL4                        93
>> +#define CAM_CC_PLL4_OUT_EVEN                    94
>> +#define CAM_CC_PLL5                        95
>> +#define CAM_CC_PLL5_OUT_EVEN                    96
>> +#define CAM_CC_PLL6                        97
>> +#define CAM_CC_PLL6_OUT_EVEN                    98
>> +#define CAM_CC_PLL6_OUT_ODD                    99
>> +#define CAM_CC_QDSS_DEBUG_CLK                    100
>> +#define CAM_CC_QDSS_DEBUG_CLK_SRC                101
>> +#define CAM_CC_QDSS_DEBUG_XO_CLK                102
>> +#define CAM_CC_SLEEP_CLK                    103
>> +#define CAM_CC_SLEEP_CLK_SRC                    104
>> +#define CAM_CC_SLOW_AHB_CLK_SRC                    105
>> +#define CAM_CC_TFE_0_BAYER_CLK                    106
>> +#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK                107
>> +#define CAM_CC_TFE_0_CLK_SRC                    108
>> +#define CAM_CC_TFE_0_MAIN_CLK                    109
>> +#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK                110
>> +#define CAM_CC_TFE_1_BAYER_CLK                    111
>> +#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK                112
>> +#define CAM_CC_TFE_1_CLK_SRC                    113
>> +#define CAM_CC_TFE_1_MAIN_CLK                    114
>> +#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK                115
>> +#define CAM_CC_TFE_2_BAYER_CLK                    116
>> +#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK                117
>> +#define CAM_CC_TFE_2_CLK_SRC                    118
>> +#define CAM_CC_TFE_2_MAIN_CLK                    119
>> +#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK                120
>> +#define CAM_CC_XO_CLK_SRC                    121
>> +
>> +/* CAM_CC power domains */
>> +#define CAM_CC_TITAN_TOP_GDSC                    0
>> +#define CAM_CC_IPE_0_GDSC                    1
>> +#define CAM_CC_OFE_GDSC                        2
>> +#define CAM_CC_TFE_0_GDSC                    3
>> +#define CAM_CC_TFE_1_GDSC                    4
>> +#define CAM_CC_TFE_2_GDSC                    5
>> +
>> +/* CAM_CC resets */
>> +#define CAM_CC_DRV_BCR                        0
>> +#define CAM_CC_ICP_BCR                        1
>> +#define CAM_CC_IPE_0_BCR                    2
>> +#define CAM_CC_OFE_BCR                        3
>> +#define CAM_CC_QDSS_DEBUG_BCR                    4
>> +#define CAM_CC_TFE_0_BCR                    5
>> +#define CAM_CC_TFE_1_BCR                    6
>> +#define CAM_CC_TFE_2_BCR                    7
>> +
>> +#endif
>>
> 

-- 
Thanks,
Taniya Das

