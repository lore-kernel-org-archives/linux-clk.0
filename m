Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4011026A0DD
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753354406; cv=none; b=baVpknIUzbFH2vP5AjQOu/rsdI+K3MWVrdrniIbTqcTDMmNKD+MdYv9By1aiscDxUDzkQCtRqRE4X2cnuw1TO2vCwRwtnK955Q8zwsCT9QsSNyubv9lBkqy0K2r2+vdzWqGmc4ei7N4+enKghOd0AbVNjKHzbWNwv910rYvqnsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753354406; c=relaxed/simple;
	bh=1wZs7rxeWc3sgu57R3Lf1DTsgdty7IOeDXASPHpx6s0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXGsHBb7ULx/1rfG+R0WjbSLISoubMV36sPY1m2kccNy2DkMU9y4+HPecknfu3V/TFsQXQp9jtiFLwS2kOV/RfOfdZETLgABK666laHObk/bPRcrgpf0n9QrtLkdVI29LyAQ5UN2nogNjzf1OR6p7jMAxOUBrCLLGktiiF7cRO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Blb8Kj50; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Blb8Kj50"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9eQED015089
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 10:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tfq20BQzBqBOKeqnOoxB+tXfk+WnuVGMzxjMCsnx1/E=; b=Blb8Kj50nMFFi/or
	puTBWO8MOJR6G3bdE47snTXnn/O1LTwcVDZTK9AQ3uFuzsQzGb/hGYUGmK7wT5+Y
	5QpTmltsM3kWBwxdhaR9XmuD8xtL6xRazqRS0ylKQr34ariD6Q+faSWxnZSIucqv
	ekUFP8DF+OsvV97kxlA+mq/4tXwudHTUFMoRGp8NhHKzU0Wvn9UrYjfLdOdllrt8
	sDZz173i2hlkke5iOZl66nb29cp/DYrKuew05kCIujkfJYO9O3ZGUzUjxvYZBZkg
	XkVKTeBKvTuH8tV/wp6P5eR/qWjsQdD3aAhWLg9ljHDyliBF9n9paeeCEqbhQqv2
	UAtOLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379tjuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 10:53:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e33990ba42so13740785a.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 03:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753354401; x=1753959201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tfq20BQzBqBOKeqnOoxB+tXfk+WnuVGMzxjMCsnx1/E=;
        b=q1+m7TR2QbclpN5xrPFeUJcOFYlpGOrI+MA/Jpv6JE4PsZ2GnJmQfMLNibVXaSWjt2
         JCaLz7FUyCi/x7S171+oiop0S3Uek20DsGlSaLvj8AoJR/gXOlO760vBnmLg8mG2ZfaG
         YbM/ViBCg6V/W7ZCz09BP+E4KI5g2CZQWpDBYtUZdXV/uuy4k5SQ5wKTMbJ3fwbW//tl
         UiZ9w9vHc90W1rac9tPDrOUmsqyRS5K4gw3ECB5V5MOnSRawNS6c4jtGAvVO7BmhJH3o
         XoTuT6UO7oYZqxIV130syy2dB7qSKQVPPhkaYlMglPTjXzRS48wxzkwhNZUwwEfJQIdS
         A7bw==
X-Forwarded-Encrypted: i=1; AJvYcCVDstVGKFCL7qpW9NMN4g0sWqSHuQa7IZcIw8mz0KwzuC/nv0NV1B5mngMInYF801feVPkT5UhJRvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyO3tts/bxOp1BiEj17F86+z1kTOOnbGmatMDk9+nuxqV05dv8
	aJuZholTVRKeWBoRvmUpfvW8ELbuOkET801be36lDp60Jl3dxHtgLRx4v1AEh+VBW8jKz/pwhty
	7A88gHvf02zYPZNBS4ZQTDpgyXIgOMVJe5WUvKP+SAc4PZlxxXOFGS8zr0rnXhwM5rZ28fqI=
X-Gm-Gg: ASbGnctvRSwU7OcbDRYcFsPgO28JVJBkMjQ9uL5AO6FHGspW0D7cGjwz+klIin8APwH
	9yhOv0SEesUeGUiLfSFSSwNUZK2LX1evcpBWrxxTHtU6SvMpdLqoyjThQXzyRQ9st79F1HZn0KO
	o6lPfND78BiAnGKYubRPdDvFTUOMkxASwAgqv4nzc1ZCKThzekizvrwscdIddvfF8Tbf+hZ5but
	i1VEP9Ddq3B4tcXxw7FLkxu4bi1YtC01DsDOEiXX4XITSg1/3MzBm1COZTLVndmDFhmy8PgfFH6
	0oms7ks2t+iRoUGGFn1DHDrcab+QvNRXptzkTUc5RIjI+jp2ibCwScSXun9OLuPVj24g6Ork6oG
	yfItyrNeoQTAAcozJsg==
X-Received: by 2002:a05:620a:9605:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e62a1cdfebmr291059785a.10.1753354401379;
        Thu, 24 Jul 2025 03:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7qKOYrLpCIrlnTO2mUs/Rb0oINk/80uFDk0zZCUvwLLte3sCMwPuLusZ+uDK6mZO6rgCmgA==
X-Received: by 2002:a05:620a:9605:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e62a1cdfebmr291058385a.10.1753354400954;
        Thu, 24 Jul 2025 03:53:20 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47ff43385sm95492466b.144.2025.07.24.03.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 03:53:17 -0700 (PDT)
Message-ID: <7d444f4c-fa1f-4436-b93a-f2d2b6d49de2@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 12:53:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
 <20250723-topic-8750_gpucc-v2-1-56c93b84c390@oss.qualcomm.com>
 <20250724-blazing-therapeutic-python-1e96ca@kuoka>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724-blazing-therapeutic-python-1e96ca@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YXRl4pmKR1Sk-VroExXUeoUAFuyU6xcg
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688210a3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=y9Hb3FDJ_D53AYP2N1gA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4MSBTYWx0ZWRfX35TZUFWeEBtU
 k/UUzIy2NBJKB2scmChjBacXsR0Hpr/eB9tYmlJmx0O8z3KB3wtRSqMtF30ieaGHKD+gXlkKkgT
 APv3xqCyNCNy97r81FcbWO/wOkVAkdIrSzQrk4gHqXKUTK6tIjFsRmB8/m3ErjA8TuOXeQRN14H
 75VILd66BCSr6QNmeNT6fXVUrBq6ykwuIWWZJMr8fInphCp/hTotVKJETICtdbGFBCHUI9ue5IG
 8jV5lqFZZLBIuYKWn435L+1CljDBROqXCZh2H5ihhRD/kvVBd6D6t5J70kfbIl+a1LfY9lDuXIz
 M2VjhRRv7ZF/tJa4r8CefQVpsii2Esurhf9TmOS3WdbiiWcmepBVEnmtufbTRVGV8gvWnPyW7by
 vjOj6HgfXhT9AqF8WUzJKt2HRwGqF2g4YaCjqg7qynPiR3NbksVsJJSFk9ZDyAtK+MNN3B+c
X-Proofpoint-ORIG-GUID: YXRl4pmKR1Sk-VroExXUeoUAFuyU6xcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240081

On 7/24/25 10:18 AM, Krzysztof Kozlowski wrote:
> On Wed, Jul 23, 2025 at 10:38:48PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The SM8750 features a "traditional" GPU_CC block, much of which is
>> controlled through the GMU microcontroller. Additionally, there's
>> an separate GX_CC block, where the GX GDSC is moved.
>>
>> Add bindings to accommodate for that.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> +title: Qualcomm Graphics Clock & Reset Controller on SM8750
> 
> There is no clocks nor resets here. Only power domains.

There are clocks and resets in this IP block (inside the register
space mentioned in the dt patch/example), but the OS is not supposed
to poke at them (it can in theory, but we have a uC - the GMU -
doing the same thing so it would be stepping on one another's toes..).
Not sure how to express that.

I could for example add #define indices in include/dt-bindings, listing
out the clocks and never consume them. Does that sound fair?

> 
>> +
>> +maintainers:
>> +  - Konrad Dybcio <konradybcio@kernel.org>
>> +
>> +description: |
>> +  Qualcomm graphics clock control module provides the clocks, resets and power
> 
> Also confusing.
> 
>> +  domains on Qualcomm SoCs.
>> +
>> +  See also:
>> +    include/dt-bindings/reset/qcom,sm8750-gpucc.h
> 
> reset or clock path?

Ugh, clock

> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sm8750-gxcc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    items:
>> +      - description: GFX voltage rail
>> +      - description: MX_COLLAPSIBLE voltage rail
>> +      - description: GPU_CC_CX GDSC
>> +
>> +  '#power-domain-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - power-domains
>> +  - '#power-domain-cells'
>> +
> 
> You miss ref... or this is a bit confusing.
ref to what? qcom,gcc? I specifically omitted it, as that adds
requirements which you stated above.

Konrad

> 
>> +unevaluatedProperties: false
> 
> additionalProperties instead
> 
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,sm8750-gpucc.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clock-controller@3d64000 {
> 
> No, clock controllers have clock-cells. This cannot be a clock
> controller if it does not have any clocks for anyone to use.
> 
> Best regards,
> Krzysztof
> 
