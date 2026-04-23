Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AB03E6DFB
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942792; cv=none; b=HVkozpnZh1BXWJB5oCjCTCczZSnrWvK/lctxKqowfULyMjNBJAg7/KdAHtmkaOftxTh4kt6d5tTdF0D0bTDuuoQ5TVpbH4A2nx+qNB0v8NqJvcKA0de7mWowRWNn7LumJ/ZyimFtKLLh1NBaIOGNnwKbSUDQV/N4imMeKrJWXNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942792; c=relaxed/simple;
	bh=gw6X5v14HsR1yPEPi8cmZoNjyQt53JZZt7VmNyKfMDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m12S3me2geGmj+D7fVxZgxdFCjx59aSEvcu4yPrtMgEcgLbfc1KXPFxYE8B4CHpo2hzuEO4oI/UWMj6YzWNRWRSI1gmKuJqHJkigQjeiEgsBAeTz0h99ostaYjbK9PrAyuiimGzDm9C6mBdyAES7N2HDMmSV8O+kGzE2n/6ekKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqbmyKzQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GfpuyOa9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqbmyKzQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GfpuyOa9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uLaY987833
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 11:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pPX1s4ZBBC0Y0Zs94AvDgZwI1JUIyluWWR+MfmZt+SA=; b=mqbmyKzQgrYyk07r
	YzsfVOBB38KJ3ntF+YjZDp9KB/iPWV9uldFZeG8vdJNDyh5Pj3Xav1r4hpCdByHH
	FbNS8rzHjlJ9XQJeurumT9qt6ORMW0jKd++OUrS1SyW+1hu6R6/a+NBCghaFEQtV
	vjV+4VN1m+Wz7PkeLi0qAAr/Wo7OZP9erlQd802W17dY1ZvxDT8zI1gsBJUxxi3g
	FfgmGYCa3ulE1kFLmWFFfKcFvmBfCnekKk3ry/JSPb2BlJIJdQlfBcxi7hlLTF3V
	uFTor6a/xhCZzBwIrVrfeqcUF1FNl3onLO1JRCMnYnWh0xyfzoxye/7rpOKPiyvd
	f2U6jw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q3m7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 11:13:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb0b93e90so11083671cf.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776942789; x=1777547589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPX1s4ZBBC0Y0Zs94AvDgZwI1JUIyluWWR+MfmZt+SA=;
        b=GfpuyOa9SSXic+EINya77p/Th3N+lZv/tI4r+melpPyd9FNcHP5P2lBVRhGcZDYEHP
         oD4m8rX9W8JTtpJdR4jqbwx4GZ4E7NcV6RpYyVu11XltDv1NlmHzXJw8VUYduWkelpDa
         T6i5ldgPUFlqBMr1mld93jSsJ+WutsIe9s6t5TSBXKOeGj7v0nn5/FO1T2LkL4VXfFZU
         cpxUugUmIOkiYYImAB8V3gFoAoIN+DviApR+0qVy21nL7YK9VF2Qf4edcLEPwWVwd1IA
         KGVhlnRpEaMakslGJoYEF0EybLng42xOo7SfKAZ0svmxoaZ6Em0HXQk86GEsvdHyxYyk
         cI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776942789; x=1777547589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPX1s4ZBBC0Y0Zs94AvDgZwI1JUIyluWWR+MfmZt+SA=;
        b=hk/RBTVxDCVleAEv+NC8HZX8P48cqP7YQxR64TFXb8r6YAJVg90g4BrBsFKQZTmndj
         iCTVKFPY6qG2ZTML5MnoedyhRpy7KtNXdpqosdsyOCCdQOGxcW/X7SUd6sFnCJ/X1TN1
         3kByxZ3ViZ6Itnd3Tl4/Uj/Xu8n1FrMWCvhnpcUwq0oSWtDTIA2IqG8CAvHLW4IuX9P2
         KUO980J8RAaSObpAioYkEtvp24eJcZ/4SCboLOjKO5CQt44DgKzlxCGazWSwYAT2KoB7
         5OaBlfquLV/lBzkHl9s5c6fUqXEoTyYs2TfGqprXU4GnmbiO/O3t8PUqHjNlmT9jiFRj
         Sqhw==
X-Forwarded-Encrypted: i=1; AFNElJ+aupy4S8S7J0grbSy9j2yR7NDOPOMoxWQrYRGfEgOHmwgI3Tnvki80F6rjAvuYOMoSv2fww9sbfuo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz482tno2MUZnh3RYIfh8+K0G4pC6nf0ANcCz58WxxD4om/04mK
	S3MmHBypRopISBy8Vl6uXqcthqfAn0R4LrB0fAUsAzZxgTzI5PUwPXsu0L6NUDpywQMaHJKG0uN
	zikhGyzw01iOgrOXNKll43BVsj3LOKGn1mSJ5TBPZPEs7KyERDzhZuOarLYFXbtU=
X-Gm-Gg: AeBDietyXv1GPfk2nn+RsjeGcvSRwonTYLVDykD+l23cdXY3fxjLdzuXZn96+3TfhR3
	oCPIH6L23GhWI0+MxMSXt479TJMzcOAi9B1unzwuT/jvXjBs+psbTDRKf2jBVcs45T6j5pM0RPN
	39GvevVWm8NE2AD2JAMh2pl50RtfEQKljAiDCBggHG21zG3jwpbrgAn7Gln2VrXHGcnBmRpekGF
	FO6bFKZ0uvSNwJw9LyxcSgJw3pKsebwty24OBrDtHbBUF8QBbcX6O+oNLsnpQ5D6jHIMTkoaT2y
	wdXh+Iajiqwn/dmRlvQPLI/93gE5M0ysrQudZeOpr/Ctb6HVCmjLdIRVGqb3woLdc4YDbebmxoL
	r+2SPtqUv7emlPr7KTLiWBLlPvqyN3xmOGBuiCWGgLF4jKUCWri+cymJK+tpavw4xNrBc1BImI3
	DL8FR/0EDpM4a1xw==
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr267073491cf.0.1776942788740;
        Thu, 23 Apr 2026 04:13:08 -0700 (PDT)
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr267073131cf.0.1776942788285;
        Thu, 23 Apr 2026 04:13:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451be2c9bsm661013166b.23.2026.04.23.04.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:13:07 -0700 (PDT)
Message-ID: <269bdec3-6340-4b27-9b38-3fc1dfc958c8@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:13:04 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] clk: qcom: clk-alpha-pll: Add support to skip PLL
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
 <5vkpjjuq6vh2mr4lcq5cwqd4h5cbserf3n756d465kheuwl5fk@tu3amjwe5k57>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5vkpjjuq6vh2mr4lcq5cwqd4h5cbserf3n756d465kheuwl5fk@tu3amjwe5k57>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e9fec5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ejO83hDQy6DSrCu7mY0A:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: U5NIDzakVJtBww07Poh0DEZc9s73hRe7
X-Proofpoint-ORIG-GUID: U5NIDzakVJtBww07Poh0DEZc9s73hRe7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMSBTYWx0ZWRfX82Bf7al8J6qe
 AR5ytRczV3shsTi8BhjtLP1C2cC3PFMpGAP40MOFhGf85//ENx3RMPuVmHMtEUjx8V2n2rgx3ve
 7U3ZCNkmQ7HhDnKVhjxrUr0z2HAHAf0CA/l/sP9WbjZ2mQ5U+VR4mPqvT9ELaZ+N6OM1WfAeBFp
 R11c2OTEFFZBN8Fug1CEVC/uWO1uyXEDXUCNPA9/V/44bb35UN+FcD17JzTEvbyVMujQodBSCR/
 lc2uJxbEHSbrwOMZmK3PtxHR93VUQ1ORiqq08kXfJJTiT776Ce9+kqPBwu1qj4kOcAOPJtBdMvG
 EkFZ8PUtsAJrtwv4RMxm6GbtukYEWzKJrXt+gOK6Gx429ZCnM4fJr4I8BR3ZtihMfeET5bp8y0O
 6Q0zxyCo2lTa3ltZqdXXnxi5nI82BH7YMafgAD1+/8w3HONX5PgaUcjFndmi3m+EPEftR5nEhGV
 BCQn7r18gYSrUT29FVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230111

On 4/22/26 8:28 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 09:59:00PM +0530, Jagadeesh Kona wrote:
>> Some PLLs are already configured as part of CRM(CESTA Resource
>> manager) initialization. Add support to skip PLL reconfiguration
>> for such PLLs that are already configured.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-alpha-pll.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 67fc97739d0d4c26aec0bac5d43d1b87d297bc6a..2f4ebf4d3884b92c981dbe0e67245704a88881ad 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -2332,7 +2332,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>>  void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>  				 const struct alpha_pll_config *config)
>>  {
>> -	u32 lval = config->l;
>> +	u32 lval = config->l, regval;
>>  
>>  	/*
>>  	 * If the bootloader left the PLL enabled it's likely that there are
>> @@ -2343,6 +2343,12 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
>>  		return;
>>  	}
>>  
>> +	/* Return early if PLL is already configured */
>> +	regmap_read(regmap, PLL_L_VAL(pll), &regval);
>> +	regval &= LUCID_EVO_PLL_L_VAL_MASK;
>> +	if (regval)
>> +		return;
>> +
> 
> Why is it being applied only to Lucid EVO PLLs?

These clocks already have a an .is_enabled() callback, could that be
treated as equivalent?

Konrad
