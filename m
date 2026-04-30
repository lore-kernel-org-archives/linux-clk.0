Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E8842B736
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777563852; cv=none; b=R2OSfI4BceqaSQtPSP+eel5amIJgtJIu7MbHkMBeOqmct8oiSKZnHLsBq59Yo1OibU/hv9aY90YM+5hIQVMtZ0mBFLndrswR5JzjADIC+sj5l8BXEgshT94IlVbFzVd6T9XzIAD4j9zF9vDglOgDRYiHP9E6o6LXT9ZvQnjpmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777563852; c=relaxed/simple;
	bh=nhUUkVi9/hcYpl+bQ0fHNNneX3Eu22Xic+NtqQ3E/qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUR5ajSc9UfrmbmSpmLok37itXntbmpa+1pvYYmPPkzGjAGCmTLIhdsalH/ROIgd8UhBZ9ixl907GLlh5OmcqcI37Pt3auto29tSSB0FJ9IKIWbkzM7jF47cXcpn/vmNuok2KJxqnyOFWTl3ca1MdG1zZ5wwEJcFs2Gb+vcMwHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m1q/nkbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8U+AfEm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m1q/nkbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8U+AfEm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBkN4r1820720
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 15:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17t3T+XOa+UMBrL9L1bRnwu0sMA5ZJW1jZ+/PIyf8Fw=; b=m1q/nkbnbEl3h9ZS
	QOhSS/CwDIZqfdQq4Z/bKLWv4ePXtO69SrX/Ohi1Z+Dt/YHTCpjHRimvenu5S434
	ZlDYJACOyv10EKlPFslVr46Oypyh8QnWw7VyVcueZdPSLSGEQoS7BEl57tf8IxGS
	9aRwpFA/LSPy6+glSyxK/xjx+PeGl2mnAVHL1bP5SjkX94rD9UIBkcrYYpmOwDVi
	ts67b5eQTnbc4PjbukcrB1SGTyRRh8X3b/uMzotv1qzAmOpeRui/2pbfKeg6LWpc
	W01+r/GaIApHdBAwWKXntiZCZ/88SUxirMMpfBfrqf3OPlRCxjAK9xcz8KNmfHek
	toKWlA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6ges4m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 15:44:07 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so102471137.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777563847; x=1778168647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17t3T+XOa+UMBrL9L1bRnwu0sMA5ZJW1jZ+/PIyf8Fw=;
        b=V8U+AfEmIe5bFWNygVNsnyA0x6+tCg7LPKmcZsPBsvszzpnDs4HzjBMD45Jb75OlzT
         M2G1pyRzyUvGGtftYY2q89CyP+QbC+RkPIuBqqsoiXetaQlw8krNworxEDFnHpIDFMvG
         unZhGsLV1tArJlVInZQH84pgrGVUNdafh6dFrwdjn1nbNnaHboTtwiLFtXREuA9WGvUT
         FgI+DqtP/fVTYPs5EX7IGGnbKB7A+3RF6NLLY6mZNChQieBbWaq51jO8/dRRH8dfEB1s
         RZvmz9dN0sb9gJ2Udl1mxdIdj1dcYm2VDBb28VVELCGxww+LKAPeW/+CuHX5JZ5owmi2
         KdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777563847; x=1778168647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17t3T+XOa+UMBrL9L1bRnwu0sMA5ZJW1jZ+/PIyf8Fw=;
        b=ST9zYTirXYnLM8vHrHS4D/94YjI40+2LfOEfhIl0cc0zJfrq4Fj3TLP2+EdGS1WYMo
         GiSC5ik9YfnTqJU+d0TWy8xvk4puRMZqfbMVe1GZ5QMaCg0WK+ctcZfMlJDV2bm+p+X9
         9rlt5DLfVVGvRp5vUvTVyQZl6DbL9cL5nUsn71EBMGABjqUyqKDAE6wB/9jqPjgQkKNG
         uxw79fXNgHbzjM2Z9EUUo42kgKwCkArD3wPzj3ZNaSf+162HxGXIfveVJzy3iHJL3nYe
         bOA8XWEONTBvAlEf1OIGacgjf7Jg/K+LvbKlUMkCmk1thdWbkI4ddDPYlIPyc8tLhqFu
         E04w==
X-Forwarded-Encrypted: i=1; AFNElJ9nkvCG+YppGUwqILp+wtjSlbwPkxMqDNxVL22/qLdb57yeizbYmf/wK1jIgFLDFjnOlZjhuDnx0EA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0VsfyOh3Kxs712KezUVWr99bosJEukVbswxTxVm2bHMZib+Lf
	gu5bi0GaaC3dQM15vLK23pnn7V7ugZKugVy8NQi5RBWQjzqZIXXNSPHxOJQ+gPxAnz+pwFAf3OD
	Jn3MQrOQZJbk/HJ697wOxfOnxujsVpjEG2EPRSGqCsz4skaKMH68P+FgqMAvm6CA=
X-Gm-Gg: AeBDiettisdjm+Zii4Zv79CBK8PozgEFeRoq5OIctcWUBAQKwtXqRJpGYKAIBszDdr+
	6NOZkpviBp0V+433gZ1E6msRbU+0F66rH2FpOY2uZWu9Ms3CDhipfoN0R8Cox7o1WV1ucnLRZ7n
	DIRvFkWWb1cfHsumMWVoED9wRU0hfk76flJG5HpfbHvSVp8/EoxOKav6BgNnfNnpKtbN+guBjKi
	X0vprpP4wAjdKO9AlJl/RFE43/0ZC/iu4W1XjV2hVKzL/exwwb9nCMeXHBA3U6B5/LUi5+YIULA
	BYfn75v4v6wN8tS44aKvKj4OjhBLQNZpgD2pNkwj/GiWob1yo+bEhczEBhLisfi3vve/o+9GEHk
	LxxFYnNPGMqiaghzMyJUAHs7fFLpYuWcBKCjPGmaKg8OdOIQo2oAiHPcCXkuXidsH5y079hyOnp
	q8keZd1GII0vmKJA==
X-Received: by 2002:ac5:ce0d:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573c96f749amr640433e0c.3.1777563846750;
        Thu, 30 Apr 2026 08:44:06 -0700 (PDT)
X-Received: by 2002:ac5:ce0d:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573c96f749amr640426e0c.3.1777563846217;
        Thu, 30 Apr 2026 08:44:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d4cbsm12589166b.16.2026.04.30.08.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:44:05 -0700 (PDT)
Message-ID: <a74a19cd-2a33-404a-b074-58a8d7d53279@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:44:03 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] clk: qcom: clk-alpha-pll: Add support to skip PLL
 configuration
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <269bdec3-6340-4b27-9b38-3fc1dfc958c8@oss.qualcomm.com>
 <de7a2958-e431-4162-b0a0-d58bbebb600d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <de7a2958-e431-4162-b0a0-d58bbebb600d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f378c7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=C5MmyifQ20IcwxlzDtwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: O2XrWFKjYid-c2JIe6f4OlgNghY7BYsL
X-Proofpoint-ORIG-GUID: O2XrWFKjYid-c2JIe6f4OlgNghY7BYsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE2MiBTYWx0ZWRfXwtOtC3Wj8enC
 RtiidxoobzedBTvowwvOc5cfwIPZyp67Vi86N31KlvrPSAghfqyuygdjwWEILQKKStRfEcEciXT
 IoLFmrmJN/psA8CAkjzBYzSmdnN41+B9bwVi7WfJYRfvelzVJJQxAlKotWLHFaS4YmQyDntI92s
 4F+WZpkx2Jn92u5JqROXzLuwySDmVS3ZgdQI+ka5vD7eDeeMbfK8g/kdbS82EkoWLssEuk7KtjV
 A6Apn8YssVvyW3YN3LpP+kgh0VbJAv3nFmyRpkO+1VgcZ6V4tN8Ucd7QxFHDRoQjFgM6mW1gS0+
 JkwSv5IfQxZSgGDMhATg5c74OkjPeggBhVw493Nj0Gt3FfjDfsfLr9S64aXWnKwKI9RavQXNnXQ
 58d+AEZcnb57WFcnM0dFJjJ6Jdm+GQfcND4QhFcwZAP6zpNUV54d4O2Dii9HbPhn26QXtW9YTCI
 zvcgf/5PmYWim4EldNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300162

On 4/28/26 7:22 PM, Jagadeesh Kona wrote:
> 
> 
> On 4/23/2026 4:43 PM, Konrad Dybcio wrote:
>> On 4/22/26 8:28 PM, Dmitry Baryshkov wrote:
>>> On Mon, Apr 20, 2026 at 09:59:00PM +0530, Jagadeesh Kona wrote:
>>>> Some PLLs are already configured as part of CRM(CESTA Resource
>>>> manager) initialization. Add support to skip PLL reconfiguration
>>>> for such PLLs that are already configured.
>>>>
>>>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>>> ---
>>>>  drivers/clk/qcom/clk-alpha-pll.c | 8 +++++++-
>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>>>> index 67fc97739d0d4c26aec0bac5d43d1b87d297bc6a..2f4ebf4d3884b92c981dbe0e67245704a88881ad 100644
>>>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>>>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>>>> @@ -2332,7 +2332,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>>>>  void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>>>  				 const struct alpha_pll_config *config)
>>>>  {
>>>> -	u32 lval = config->l;
>>>> +	u32 lval = config->l, regval;
>>>>  
>>>>  	/*
>>>>  	 * If the bootloader left the PLL enabled it's likely that there are
>>>> @@ -2343,6 +2343,12 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
>>>>  		return;
>>>>  	}
>>>>  
>>>> +	/* Return early if PLL is already configured */
>>>> +	regmap_read(regmap, PLL_L_VAL(pll), &regval);
>>>> +	regval &= LUCID_EVO_PLL_L_VAL_MASK;
>>>> +	if (regval)
>>>> +		return;
>>>> +
>>>
>>> Why is it being applied only to Lucid EVO PLLs?
>>
> 
> Thanks Dmitry and Konrad for your reviews.
> 
> This is the function used to configure all Taycan PLLs, currently all the PLLs
> configured during CESTA initialization belong to Taycan type only. I will recheck
> if similar logic is required for any additional PLL types also.
> 
> 
>> These clocks already have a an .is_enabled() callback, could that be
>> treated as equivalent?
>>
> 
> We already have is_enabled check to avoid configuring PLL's that are already enabled.
> There can be case where PLL is configured from bootloader but not enabled during bootup.
> This check avoids re-configuring such PLLs that are already configured by bootloader but
> not enabled.

Okay, that was the missing piece.

Is this a micro-optimization, or something highly necessary (for e.g.
glitch-free display)?

Konrad
