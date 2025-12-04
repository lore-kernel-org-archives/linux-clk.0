Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F845223DD6
	for <linux-clk@vger.kernel.org>; Thu,  4 Dec 2025 13:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764856099; cv=none; b=gTQeyiXcgxcloMN/Q5TUvqmY57mqeijHbKY98IloMtuNDdTqDzQUTB+PJgTmtFBTnce3Ei/mxV3kxUNaq0MTba4dOXx1fV8RyBpLT+KloA7I9q5hn2hq3IVpeFBw5NdknoYHyYzdHCKYXtVAfGVoezwuiH+9AKir59hQlsw122U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764856099; c=relaxed/simple;
	bh=ZufCtcgX/fo+fhRW+mLXVfopYYuOEGq5PQElXR6FVSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HfrFp6tV08Fu/gSZgS0zeuNU8KlDjC4LmK8kW91O5tBcbtxlpYhkF2ujQEUQ+PSqUxtNShkE/gY/pcpbBd0wwiaU+8/I707yorBqzRU3PCRD1u9ZvrM9YAUAtUmYfRLU/J+uzwKqhIFWfLQeQpYRjggHi/FUVNQlCj8fyfJ6y2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7vHpEOh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4P1SQoM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7vHpEOh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4P1SQoM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEuSK1159677
	for <linux-clk@vger.kernel.org>; Thu, 4 Dec 2025 13:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Kfz6v4DovVmuVuVubrjJnyyd7HdrAE3tSK9e1ucook=; b=B7vHpEOhuO/uX17i
	L7qJfA7WsWY3hovKEKrsKsUPPPypN8TcJVhjMyH7A9uyQolLIFXEF5TLskmOabnt
	J7T7ixwJHVoq8dsDYW3iBUqtVitz635GdNjrXQ3nqoC/UYLlWZukaXbqLQ9drP4n
	RUGPydSgxmRdUFvpL8qi0Yu5mE9kxp6esVCxXWgso6fTGVehsN3YKIzKoNKRad17
	U5SM2BrCb0aOYeDCFREL9eWzPO6rQZAXq4iBWrx0ALrHjjbJPBdE/bECKeGpJoQe
	xar1YVLETlgJz6xs1hEOW0+C+IayoJzD/GmDuoZh+2p/vHCknD3yrsqc0Kunh4kJ
	rnbMJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atu3h2xy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Dec 2025 13:48:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b25c5dc2c3so20182685a.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Dec 2025 05:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764856096; x=1765460896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Kfz6v4DovVmuVuVubrjJnyyd7HdrAE3tSK9e1ucook=;
        b=F4P1SQoMI4UntUmegLbqO393UYuIPHageXliksb/AcLEmdIHRhzexjhBMnd740N2uD
         2RbIHPq1ONW6yPGfxvhfmLKdFlFu3B24uvRdK+3umdZM3RkGhPJtOVmcnd2lHKJhZiif
         y4XKTdDARgRhmHw4/LMgAdusT6E7UfXkSYU8wvAoZfedIwm0mmHzR6+uURpZfJKG2AZ/
         9DDLviHSppuBdNTVlGSp0pdv+QiWUWl858Pkj4WV8BXEM2niqt9a70HGT/grBOdrxRa3
         ogaMM0/0IwOHddYTJ/OQo1kfdE1iXj4U03XGkAtlZRWPCyFr8eDVYKpwKVZiStUpSi+j
         0g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764856096; x=1765460896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Kfz6v4DovVmuVuVubrjJnyyd7HdrAE3tSK9e1ucook=;
        b=W2bsfTWacygxzb+/bA4YgA2lMTsuYjuIf/Uh3JLeqXT3ispDci3Uax2/ugBInLPbwz
         35nl1jBV8Fa7U7p5Siqak3GUYuUy4nJnX7Hlc6T1WLXpVRJMDm0vgAbGE4qV4xa6cHeg
         orUyx4RHJsNH08fhiQ5KlOcZ8y6TDJOXkcP+1u9V+uEFca7q3JV10KBRzwGA4mk3FFzj
         JvyaBnE4/qNHhERgRO9OhbjKojoGiVLKrUr1So8eWGHX/BVEym4z/8gCH6xjqx/SWZ7m
         jiTDabs4yVJYJvq6dR2Q9ESNTuzDyKdfBTjF9VSsVp7YdqZdZ6Pb7xqWSA8vGxwMmrAw
         XsAA==
X-Forwarded-Encrypted: i=1; AJvYcCWqcn6tOPimSWPZjmSVL3RTEd+FV8D3H5WeRP2sy1+bFHrDeAUMzUVs3Tw99Y2DToDAGRObB6WdF4o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0BGjphqLyPjZcBXuG4SrLUg4SYle7iI3aImh8Il6d2MjoGs7/
	g8u1vNrwPDOWNhwGUCwMfDta2iICDaciXju3ayDF4vA+iMcbFqIL0AY97KVi+TojxpCJnQ+e/u6
	5FEXdvOSj+5eYpMqxvIDePLSwQuQWkUy0/BOs7oSD/0axsauCVslaYrPAFgcFQuI=
X-Gm-Gg: ASbGncvqqab4dD6BrhNEDCpox1n++Z4cvPzsZqSYbLC+mUssYr9l9v+g9CXLd9noC3k
	cSqdfcvLUPBG5YKo482jfzuc2NyYiILmJgS35BsHJLFysYj9wM7KMErNtH/T7DkdO7eTsZxHCTR
	uTjDKHN209QZQwkvL/2oR2PgmdNJvXK+mJSfdorT7D0mUvv2qKBtx8JHxwa94mhknGDSOUWSFSZ
	Zxtli+rz01jljIccCa17vRXCM8VUIzCS/JM/FYAEdrvySZRMopxlcBXX21eAz5vmsGbMhAT0KaT
	qOrj0DHuTxhr1me3GaqHHNELdIKOvzsi6DogRShbITX4ILrJ/e3ygcaXxgNsLv2Rhyqoc/opVdE
	VIfmX934Y4Nz1xdbYN+nKXcOo6z39gTvIlAq6eANBjbwcxm/SR9aMMG4bAM/XA1MOUg==
X-Received: by 2002:a05:620a:f04:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8b5e48d4966mr667014685a.2.1764856096330;
        Thu, 04 Dec 2025 05:48:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeR2kZUmDLhfH+QWFtgIgv5ITGcHpA+vqJET8rZzXBIvy8V0EVhKzdHKxr7P21AbP88CU+Ww==
X-Received: by 2002:a05:620a:f04:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8b5e48d4966mr667011785a.2.1764856095818;
        Thu, 04 Dec 2025 05:48:15 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f44597c1sm135442866b.13.2025.12.04.05.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 05:48:15 -0800 (PST)
Message-ID: <898e5a54-3a79-4fdc-bb51-f1eb6a79dc0e@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:48:12 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: cmnpll: Add IPQ5332 SoC support
To: Jie Luo <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-3-55127ba85613@oss.qualcomm.com>
 <6e12f446-7792-44da-9e06-99729c3b066d@oss.qualcomm.com>
 <a3077c95-e6c3-420a-b65e-e4e584009c6c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a3077c95-e6c3-420a-b65e-e4e584009c6c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExMiBTYWx0ZWRfX0rq+OLgvgEfd
 aq/QYJSHFUAQsaqoSO1rtn5xXHCiVpgTJWUZpWBn2WmEBhPTYhRPmAwJopufJ6WSeL+CHXd6nD4
 JlGKW09DJWHtgWOkGOVa+I3MYW9m17zCWrW/l5vpv6fpmlJ8dn+81Zqpdo5A/Arp2O7mG4SKifH
 0kXefELrRR1AkMKIDiztjioMf9ABtcu2mvkhe0SrD9SE4oicX6Kb9iYuyb2WKcjI9L42T+BLsND
 1ylycmPxDNxXLEGN9XnxH2mz08lDv4WFUPfqxpzkV1216jPV/Rb4N+cQvsqilWHavafhOZ1u0Wd
 DU+D66IiIYEMKVfaLfEA6pdYsonUkVzZV33XDS0VUwnqLq7++jcBMaF+KTCq7T7hOmkZs0fPIug
 kwa5gtZ09PYpPYUGOqsyg3tPxXKR3w==
X-Proofpoint-GUID: y0_-ZsAVqeNy0fV9iY2tGRLYPDXyyWdk
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=69319121 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=en7o4u-K8g9yutxgwuQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: y0_-ZsAVqeNy0fV9iY2tGRLYPDXyyWdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040112

On 12/4/25 9:09 AM, Jie Luo wrote:
> 
> 
> On 12/1/2025 9:52 PM, Konrad Dybcio wrote:
>> On 11/28/25 9:40 AM, Luo Jie wrote:
>>> The CMN PLL in IPQ5332 SoC produces different output clocks when compared
>>> to IPQ9574. While most clock outputs match IPQ9574, the ethernet PHY/switch
>>> (50 Mhz) and PPE clocks (200 Mhz) in IPQ5332 are different.
>>>
>>> Add IPQ5332-specific clock definitions and of_device_id entry.
>>>
>>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +static const struct cmn_pll_fixed_output_clk ipq5332_output_clks[] = {
>>> +	CLK_PLL_OUTPUT(IPQ5332_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
>>> +	CLK_PLL_OUTPUT(IPQ5332_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
>>> +	CLK_PLL_OUTPUT(IPQ5332_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
>>> +	CLK_PLL_OUTPUT(IPQ5332_NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
>>> +	CLK_PLL_OUTPUT(IPQ5332_PPE_200MHZ_CLK, "ppe-200mhz", 200000000UL),
>>> +	CLK_PLL_OUTPUT(IPQ5332_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),
>>
>> I can't really find the source for most of these, but I see that there's both
>> a 200 and a 300 MHz output to NSS
>>
>> Konrad
> 
> Both IPQ5332_XO_24MHZ_CLK and IPQ5332_SLEEP_32KHZ_CLK are intended to be
> used as the input clocks to the GCC block. IPQ5332_PCS_31P25MHZ_CLK
> provides the reference clock for the Ethernet PCS, and
> IPQ5332_ETH_50MHZ_CLK is the source clock for the PCS PLL on IPQ5332.
> On this platform the Ethernet clocking path is:
> CMN PLL ETH 50 MHz output → PCS PLL (divider + gate) → attached PHY or
> switch.

What about that 200 MHz NSS output? Is it just renamed to PPE?

Konrad
