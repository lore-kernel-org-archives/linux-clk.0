Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBEB31197C
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592028; cv=none; b=Wf5iljj5MSHNkrd+N/yVSvgCefbocoL8UxeOOOXRjsWgXsq9i8oPw7IC0g6leRdWYZpucllqx3HNjQgYeefVyWat07o11cPLpVGLoWI/5nn/OBVAydtpCydiVJ8IxEsuDKWkyO28WbhMIJgUjgAyR2cCBxEBf4BVG+qJ8INPOdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592028; c=relaxed/simple;
	bh=yJIGaEFZOUMiHJtzXe+axCDbhop0DwccJ+n1aWoVm3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=igyCM9R9DpdOFf6rD2o80KtKzXU24dQp9SX5yw9Z8/3EV1rjsO4Yw7Pu9wYRWgTauF5UKeeFjGKhi3xyx1/Gruzbr5/Ttb8afqLs73dQumKhMvSFS1kXWyUiQf1PwAwobgRxg1i/ULrNAfOYUv0TOGBabtpwL0CYBpMv6wYP2Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMSz7/9w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WR06KCxu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMSz7/9w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WR06KCxu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1A7cYQ435469
	for <linux-clk@vger.kernel.org>; Mon, 1 Dec 2025 12:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hHesOwSy4UlmbStnu47DBCPmCKs3dEISfe6pSDamg2o=; b=gMSz7/9wzosTWL8k
	okagcxeg/OfGxdzPJEsYGpXP77mcD2uXr2hNaslBDGf1xa/R7h9JavLr2hsseCTv
	6BC32vC5FxVbvOxfibZ0uBqrhM0k8sAcwraTZGEy1wrbCUk8cRXxGFefjWDsT2y1
	9tkFTLF7qMopYa0nGU6lqCNhHftlh4lH9giGbveTRBoPlVihcncBMTQV6E1z4Ofk
	yAtQglYDrydC1QRGkYJt+364prhy+3dQdCOZv433WdgXB4B9YS4zoxRsSHOI8urY
	5loEbpO/M62e8IJjL6ULXNve44lJTiB1OT2+07dp4WrWNmWz1D0dd2mkuUGLrsNj
	psOkCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as909rbky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 12:27:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b10c2ea0b5so144063085a.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 04:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764592023; x=1765196823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHesOwSy4UlmbStnu47DBCPmCKs3dEISfe6pSDamg2o=;
        b=WR06KCxuSacO1EEpCYtqWwbkZi6q1KnLR5m/o4l91OBdQiuV7/5JfGutsW/JMDV/Ah
         nK7WV7uA4MggYP+u8FZPLWsleViAO0cDE9940aVBvU7HzfoK8C+ZijV/54ZVADCCNIT8
         tnVIwb2fM0bx4PmzcsufcfgUw5QBzOFglBZtGFYHpEAbRonzATMVvTBR0AlsDMjFCr2F
         iF2R3YCp081y754CEx/U9N/0pux/zrthuA+LJbhxIoNgEuiXaQzGoXLGHbys0QU2HW/t
         Egrf8gE4W2ULYofwBg4osh/7BjxEEZbwN1bUB1eeqxFLujBqk9Gt8UJqrDj+0Io7r6BA
         nvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764592023; x=1765196823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHesOwSy4UlmbStnu47DBCPmCKs3dEISfe6pSDamg2o=;
        b=J3BKhsE09CusBMHDwtIIhenwEKzSJaWjq5nN/M7cTHZfVZbHNmxFkXglpyrzhvXAAS
         eF1TQHhnoNp2LPCt5tJNexy7IzruLfaVnbUyaNx1iBboS+ud9vKW23qT38WJKR0BtDSP
         Nq/2lftrFznol9flIAON8BOFPD4gy6Y98DomtfI65QRm84Wlxm8Xoi4YuoWmbox5tccD
         E8CMMSzXCi8I0oTCMeK0mIokDqmtpt0l5afrkSkg6yXCYyhsvr328v+6k2ejQwIjqR8q
         NPkhKk+NGPL/IJ1qhjxBEWVvxwtpAaLnZcLV1O7SZirMFOksu295OKXNZzKLrkrhhBG3
         a/bg==
X-Forwarded-Encrypted: i=1; AJvYcCVYFDcsmahT+er2OSbTplrKeU712RvP7vKYxtiTriA3xsPlwar2tORwEjYQ2zHIbGWAwaF0EMKVRlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFRWfmKUiJQwh4iqPpBLyUFbYfS7LCUrVClYN+rFPULL0m1L1i
	AKZaaCPiFfN9f+kLbXPHWgZERQlfLjS7cVeBGVQSjdY5gaUPJ6kWbAiASyBy/QBgEFG6RyUUs1d
	B9JtEBsB+wsSbO9CDKoW07WYzpE0V8TkpW4wjLEUAFQQq5MiFzG6gASkJNZ736K0=
X-Gm-Gg: ASbGnct2k1qlLS77/kamMxNxqWoBv6Dpv4xwc5gMrhEnsHsuXN9ajTCPBlmO7Ul175N
	GRe5mb/YSVgihLfa7MgWePT71rqj63cT8vXv0IdRKQ6eWVUd8OeH1+WDIhKxIB3CkKdnam1tWDR
	NwLvCgNPhkhI2Ov4v/xP2BkVKtd7DBfPBBBYiuqvnakwSnCqjhV0eQh/TuF/M9bE3egT/CPnmhO
	Eg92ar+xbafh9YKIxo0wjTUtA8jkVa6g4BXEf22QB2qYAiM55pUL4azG+KtdEctBGbW89btoY3o
	mPvGswyenEBxVOS6CVrzKSEBIZA0PxMLNX+x0uLJGRF1BkGKY8ASkC8GRZRqkPT8KzSUPqIvEFj
	Lt5paDvTLCIjMpg6UEHD2mazhe46vL2Ph+uMmi7x9+XYm9+YZOGpCdwyCZ7ZUBC+nAMk=
X-Received: by 2002:a05:622a:48c:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4ee5b786a91mr393681371cf.9.1764592023290;
        Mon, 01 Dec 2025 04:27:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkeN/nmadH9CHH/9Y+coj7TYMoy0iGkvmU+08GMR/mUE4lST+OGZzjQyEVPgWQoUvdkudhDA==
X-Received: by 2002:a05:622a:48c:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4ee5b786a91mr393681091cf.9.1764592022909;
        Mon, 01 Dec 2025 04:27:02 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90c93sm12242774a12.9.2025.12.01.04.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:27:02 -0800 (PST)
Message-ID: <13b44a8c-357d-4f98-8762-640179fe3ff3@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:26:59 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8940
To: barnabas.czeman@mainlining.org
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lanik <daniilt971@gmail.com>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
 <20251116-gcc-msm8940-sdm439-v1-2-7c0dc89c922c@mainlining.org>
 <793d5039-0506-4104-b4ce-64bfa3cc00eb@oss.qualcomm.com>
 <5C7A10CF-910E-448A-8BFD-F2A46782D3B9@mainlining.org>
 <8faa0c8e-6f21-4025-bbdf-d4ec18eb7628@oss.qualcomm.com>
 <869028d628bad9e1c37c3d9ea8346ba0@mainlining.org>
 <2220aea0-6139-4534-8c42-1331a642ab62@oss.qualcomm.com>
 <f0be91fdde1b542b2c18702b0c91f26f@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f0be91fdde1b542b2c18702b0c91f26f@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMSBTYWx0ZWRfX5cLVlT/hn0/6
 LZQDT8tGh6uZ/LJGZY8YX2/zM4jxIDv5CIBS+JitJiX88gx1GTn7D7QlFUCoKRAY2EPGjzaVgKb
 DM/ZN869NtP4IzyNZPnqbQqJ1kyNuWa53yaYgBvmvqMM9f7elW7Iw3hkxaKvoN6edFE1ohsXiA7
 5OW3MxqrrVmKwEeVJXIRJDHdbHOIEVesEXNrTN2Rv4138x4p2rF0ZV/l5STYG0YY1gLxmZhfmlO
 EUjRCicbu7FcHNIhN3mK1NsWDRSDuHBpiVyOH666/nTm5VJlUeErCcpvSdQ0j4qFaJeP2PO8QVG
 hQ3hGlVrlpfDGCxwm4lL0nmBddE2SpJKesN5is8nJ56vfSV1PW2Mj7Mxs5XXfJNWDLsifXf8QEv
 Jrevhu/LM9Y7fhRcZplD1nY4jASrjg==
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=692d8997 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=TocdZaKPi77q-W1Ug14A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: LbZIY4gi29UjrpA9Z2r2SZsVYZd81QCN
X-Proofpoint-GUID: LbZIY4gi29UjrpA9Z2r2SZsVYZd81QCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010101

On 11/30/25 3:50 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-11-17 15:17, Konrad Dybcio wrote:
>> On 11/17/25 3:02 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2025-11-17 13:17, Konrad Dybcio wrote:
>>>> On 11/17/25 9:51 AM, Barnabás Czémán wrote:
>>>>>
>>>>>
>>>>> On 17 November 2025 09:03:53 CET, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 11/17/2025 3:05 AM, Barnabás Czémán wrote:
>>>>>>>
>>>>>>> +static struct clk_branch gcc_ipa_tbu_clk = {
>>>>>>> +    .halt_reg = 0x120a0,
>>>>>>> +    .halt_check = BRANCH_VOTED,
>>>>>>> +    .clkr = {
>>>>>>> +        .enable_reg = 0x4500c,
>>>>>>> +        .enable_mask = BIT(16),
>>>>>>> +        .hw.init = &(struct clk_init_data){
>>>>>>> +            .name = "gcc_ipa_tbu_clk",
>>>>>>> +            .ops = &clk_branch2_ops,
>>>>>>> +        },
>>>>>>> +    },
>>>>>>> +};
>>>>>>> +
>>>>>>
>>>>>> Is the TBU clock used on 8940 by a SMMU driver?
>>>>> As far as I know no MSM8940 is using same smmu driver and bindings like MSM8937.
>>>>
>>>> On msm8939, the clock needed to be turned on for the GPU SMMU
>>> I have not got any qcom-iommu issues on 8940 but i think it could come when i try to add ipa2 driver
>>> for the SoC until i do not know where to check it.
>>
>> I can't find a definitive answer, but it's most certainly going to be
>> necessary to turn it on
>>
>> Konrad
> 
> I have enabled ipa2-lite for 8940 at downstream and it can cause gpu to crash.

Really!?

FWIW the clock on 8939 is called GCC_*GFX*_TBU_CLK so it being related
made more sense. Here, I see no connection :/

Konrad

> I have tried to add TBU clock for apps_iommu but it not fixing the issue.
> 
> Here are the iommu changes based on 8937 apps_iommu node:
> +&apps_iommu {
> +       clocks = <&gcc GCC_SMMU_CFG_CLK>,
> +                <&gcc GCC_APSS_TCU_CLK>,
> +                <&gcc MSM8940_GCC_IPA_TBU_CLK>;
> +       clock-names = "iface",
> +                     "bus",
> +                     "tbu";
> +
> +       /* IPA */
> +       iommu-ctx@18000 {
> +               compatible = "qcom,msm-iommu-v1-ns";
> +               reg = <0x18000 0x1000>;
> +               interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +};
> +
> 
