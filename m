Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FB8325705
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 14:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763389031; cv=none; b=roS1jo63wTPDSvr/P7ET35fvz9Q6oezK8RXj2kj52vSRxjrsyiK6O104YQ6rJI9FwZ/2k3qZyYFACZXBNVGYErpWhmiNcAknNOEnZnRrCjS689Dm3kpF3EBjfQ8KLKUNQOhbV/JTyhy6KO2aHXd00eqYa7egm1XKsGONwSYvEvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763389031; c=relaxed/simple;
	bh=LVZusJLdrZ552ACuRCrV4kkE+GCDGhsWXPBDhH/Ag9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dettzBBX2ui+Mhhf46vZRH57Fexv/l9aLg0Oa/2u3pl0IeQhRlEF4Qv7Kmq+GEh31cClJUhMTzXEkD1bgE2MkDwMeFIR2X8Vik67SjRdxzz8/ln4fPtonBpnNh5J7fUtVFQw7YhTzTjXvWsR4a2504J32NuvAX9QKBtsL04/9Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Df9AxnG6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1VgBz/s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Df9AxnG6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1VgBz/s"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAKSUF3932730
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 14:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVZusJLdrZ552ACuRCrV4kkE+GCDGhsWXPBDhH/Ag9Q=; b=Df9AxnG6p6gKQ2cS
	3KebPaAxXVph3KakdELHfHWZn5bLh6LKYTu/lpxz8HDPIPNe3sUSzUkQX3HRqiUw
	zVn0hrSMV3a4tLPikSzsps5IjC24d+GzZdM6gyoWPUpFK5bJG5Yj8Fxw+j+YcukX
	sOC4leGXCe3lA9mMZiQW0qyFcp+2B47fzagtFmVRZ3+YfcJElcnufgJsbPrpQzfl
	zvksFd3muRogOCZO7xmRNHOIbDP/bpmzcLLYYBqwddV8iHpquV+al8LPHnZRejL/
	8mIMcIiO6dHlDU6ws33N1iVMByhIX45lVqDn7v85dC6MMXOWYHyepwKb3riOtElI
	v5zTjg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1v90mw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 14:17:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5dbd3b72401so774078137.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 06:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763389028; x=1763993828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVZusJLdrZ552ACuRCrV4kkE+GCDGhsWXPBDhH/Ag9Q=;
        b=K1VgBz/sOp8BHlfenV/UzZmzuIWgMwgjjvk7pRt+XorpVMbq3kQ4+fb1qPLjbMZ6go
         9KcjRLRCeGpSD8DoQQUCC0443KkaB3HXqtHGh27H6nqXDxLAVa9dZmX0rFyZTtn71HtZ
         8/ZBcoWPwAiw0hbrOhvq+IVsTyCSRltKoiwtlxG1WjiQfBvN2ahivzfWqAEYa82RvWgS
         +kvQYf1Ub9m+dYwbtaU1ZinIRVgUveVmYu3Q49hccekM5aLUcDyx6giW3zXI9s9aZz/C
         MGwopZaZKwYsKK8iVBfcM/+cukabO3MX0V3dpULmAakoeBCWF++sVRaBBFPeaCaazkX6
         KQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763389028; x=1763993828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVZusJLdrZ552ACuRCrV4kkE+GCDGhsWXPBDhH/Ag9Q=;
        b=chXyfnVdZhQbloyZEK5SkNVKg+IzYnt5o0djyF3ygdHs97FsJUu+sxyKBrIwRwbNKf
         g9mGB14Rq47uJwZZGapd1vBLyQEw/I1J7PDIl5jghqkexYheixS3bpHuFPgu0sgVxOXE
         wH/OgRwERcjD7SahsNUXM5e64c4XmLXpFKodrktpNl5/BXr8azaa6pG/NBv3PcGvQ1DL
         8uDrGM8vufJ308Mf6aJLzP3hYdB0Nws9TrsrTMj2632pF87YYWUkM6Gm7+3bB1XBdsys
         0lkRGMqFot7NaUXzEJIFrmc0GrBvi/yB/3jsAs5INM9Wn65qB5xPCKkHQlF/wWFDPPyN
         7++A==
X-Forwarded-Encrypted: i=1; AJvYcCXansbK7i4RUS9ixH+r/OW3e+KTlSeKrYawSOdb7LKx4NcLVjKyYxqDDCZ5AycpqgL7Jjx//ZpElWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfCSxLCpUyhxFJ52iDZ3y3rip6eXT4BrGVcY/OPAQHKO2/LVG4
	/9hpjnHM2v8y4IKElflTqF/Snzs8ZNTUWYB9BATGCMJuhLkCFxB2F7RI1yo87ECvPlB3x/+uJhY
	C79DG+q6FrOOZUaVOWTNg1IUWvRXXxgncVIZJ9EATEmPdscacKPtFxzAErCDQ7Q8=
X-Gm-Gg: ASbGncsI9fsl5nX4irlfQTS2UfYlJbWGekqJYDM0xI9tihBuBxUr3fBT5AW0zZkvVv1
	yHyJQxZl8NsgMNTDNqgPcfI9vjToBOKXrhH1nqJw7V9bV+KLhL47U78mH701qWuAmUPeMRHA1Qi
	eT58CitJutMvDQJEHwoDUFN8x7DLb2MsEwqJgK0NgW3VRNV7z0ovVCPgzJbqLxrzkQeM5uqVAKb
	gS8Jn296imzihXs3TQnrYHiCSAC6krUiOhxkG1FUVG0eWOisnOeFaF+gc6bephCHAT93++mdFAL
	uJCWe7Ci8So4SdIaV08srZxvOiIbw+7McPt/nuPJP9lCgMwKi84+6D1oMi1lBiePVz7nb7JMO8a
	+Wg+QLRzAgy46YjKEfqc/bj5fum6/c+mM7qyo1i9fPH/eqgxYqEUCqBuY
X-Received: by 2002:a05:6102:509f:b0:5db:d7a5:ba2e with SMTP id ada2fe7eead31-5dfc5b95e2dmr2146702137.8.1763389027954;
        Mon, 17 Nov 2025 06:17:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnHQ2pTUpIqXgwhIDGJLeBfApSQspfnNAKAssZ9B4ZXxU2WBgY34QQwbBf2kb+Hir5x8goLw==
X-Received: by 2002:a05:6102:509f:b0:5db:d7a5:ba2e with SMTP id ada2fe7eead31-5dfc5b95e2dmr2146667137.8.1763389027473;
        Mon, 17 Nov 2025 06:17:07 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80841sm1098302866b.41.2025.11.17.06.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:17:06 -0800 (PST)
Message-ID: <2220aea0-6139-4534-8c42-1331a642ab62@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:17:05 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <869028d628bad9e1c37c3d9ea8346ba0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SXxo6jBvVi9WyqiPEIs0KsdDTYN-zBRR
X-Proofpoint-GUID: SXxo6jBvVi9WyqiPEIs0KsdDTYN-zBRR
X-Authority-Analysis: v=2.4 cv=acVsXBot c=1 sm=1 tr=0 ts=691b2e64 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=aXj3mySSvwvPpzEV93AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMSBTYWx0ZWRfX3WKPMdDrI1Hj
 Ca0rkKOItRdH7i3yixvWD3V29uHGOwK4iEzyI0GNYODXpu3+U9LUmhialVeAlbKHl0F5X9YQTu+
 UB5MaCbtgnTRWB2iAOEis3Bxv6aUe28cNGzJbiUsaNgl1UlzfywxsBod/lpbGxysBYy3cs7OTO1
 sMoVHqrr49I8kMgSb9RinJD03kmnEi2a1YPGPwM3roXSoOd+ElA+RngM/GsI0X6qhivtPQen7/7
 b6mYEDdXfaK+3wgJMDVcKNHHyEaqM84l4hHUnCENE/o562gTeXLrQh6yZSY0D3isYhcgJcXdArY
 74dQGAtZ3yqTeqc+o9qDUZreCBi2IS85MQGpF1cz5HUUSyjvu1PsaUhxo+aNCO55Xir//D5YRc5
 y3u3BtdGG80Vo8UkWsEiaCYZzVbNcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170121

On 11/17/25 3:02 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-11-17 13:17, Konrad Dybcio wrote:
>> On 11/17/25 9:51 AM, Barnabás Czémán wrote:
>>>
>>>
>>> On 17 November 2025 09:03:53 CET, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
>>>>
>>>>
>>>> On 11/17/2025 3:05 AM, Barnabás Czémán wrote:
>>>>>
>>>>> +static struct clk_branch gcc_ipa_tbu_clk = {
>>>>> +    .halt_reg = 0x120a0,
>>>>> +    .halt_check = BRANCH_VOTED,
>>>>> +    .clkr = {
>>>>> +        .enable_reg = 0x4500c,
>>>>> +        .enable_mask = BIT(16),
>>>>> +        .hw.init = &(struct clk_init_data){
>>>>> +            .name = "gcc_ipa_tbu_clk",
>>>>> +            .ops = &clk_branch2_ops,
>>>>> +        },
>>>>> +    },
>>>>> +};
>>>>> +
>>>>
>>>> Is the TBU clock used on 8940 by a SMMU driver?
>>> As far as I know no MSM8940 is using same smmu driver and bindings like MSM8937.
>>
>> On msm8939, the clock needed to be turned on for the GPU SMMU
> I have not got any qcom-iommu issues on 8940 but i think it could come when i try to add ipa2 driver
> for the SoC until i do not know where to check it.

I can't find a definitive answer, but it's most certainly going to be
necessary to turn it on

Konrad
