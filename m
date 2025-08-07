Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D570526D4C2
	for <linux-clk@vger.kernel.org>; Thu,  7 Aug 2025 17:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754586185; cv=none; b=b4ubEyqszM9iu1n90myX0fIkMxNTPnDF4RYDBHLToJtl4Cu0UuXuqyL2cuYjHaQxGx2+NDuqMIe/5xXe26BMaY7dTfl7FnqJXiY5/nqXDbnmSF2stHVqjueWEFdJJuDMAc27lFp6NBvfmQmXxKm5TKnPXO8RW/iIiWH6jVpaB9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754586185; c=relaxed/simple;
	bh=MRqFzhSuWwMpaPKOkiqO3zfdABs1SDMuFlkVK8Hi3u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNRaraOGn9JFUF8k7hM6GhRRZ7g63o2i6ptp9j1YR53q7O5UozTRBHGaEzwl509BwNthKWGDe/ah+qMH4KtCo05PfsDv7cpD2h9OSnQm7ar//KTnjXoIG+4rjQYVK9Oj+cas6ofShTXXrFzBrxXmYQwEBZwU5T7r8lLrOtzLh4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9zy3vnp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9zy3vnp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779D3Kd003563
	for <linux-clk@vger.kernel.org>; Thu, 7 Aug 2025 17:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kT9b3uyCnzcpZ8XsWUfgQTVB6SbH1uKhJl+tlG2vK5E=; b=H9zy3vnpq6MgjC04
	VmGfddc2j/iB+dB+g3TFzNJOnF/pDKU4u6vMZ8DeeC/nPcs5e7O6HRDTnxk23IA4
	ENZmQFyo81AZje4Uxy7qzcALQmLDvAd383lzSUSxsxFIW6p/eOPUvzTjWbysQWJ5
	wRO7vxVTrn2A7QSNjVwgfxviPEUt03OU+IQuUZO/M90jozjQ1F7pihr6X/yHjNsE
	6JLcLYxhLU2PYFbf6EG+ZO5VoRalT0thvBqEFbOYSOtdPVAKmPA4BAmQI41WI9zU
	sfjVVny+O/0uI1J7yR7o20dYs0CnkdQM03n8HO28FV+OvmVs6cfezW/KNS3WRPxJ
	0I6lGQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvyy6h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 Aug 2025 17:03:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b06c7cf38eso673761cf.1
        for <linux-clk@vger.kernel.org>; Thu, 07 Aug 2025 10:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754586182; x=1755190982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kT9b3uyCnzcpZ8XsWUfgQTVB6SbH1uKhJl+tlG2vK5E=;
        b=lm8lqyv1/wJ6twx2DIJyU/FbGVv6HxGF1sF5LHvO/OfvkNmy8qcbkb1t3Qeuzb9/R1
         LCKxvgUW0Xe7LQDmjPIC8MQPYOBe3f1+V1K/lICxV16ehWBvfjIv+5bYJa62swBa0cu3
         LZyosi+hpBHAk/pBoj4IktqynTJ6SVgLpaKuau9fji2Af7fItyiYRkmNfqycEYzqeyvl
         3x2FnBj8QN2aKWiO3iuPZklGi/omciR/GjgGWaMFHnxqVmjH2CCngK62ERouEuSpa8Xn
         nBqj+cF7jev0c3D4Cwqd2Q+MyByKYZivSnV32Be7pFGu3otNZQjvIv22pJ7unSRIEffI
         C3WA==
X-Forwarded-Encrypted: i=1; AJvYcCW3PCU/hJOBJOaR/RUqnLGQFNAdCJe5ML8x64V+SVPv8dvKF4wPP3HKE/QYg16R8LknzqurTgFRHo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEYAfK8Grenwi0CvtDlqDlmRwn+BPuF5CAqEZqzcTq7o11FT2n
	BAT+wcvUikklu0ZcP5DaXpjWRy58eLHp4HcfKtMzga2COG+u6gaNOMemz05oDsV7pC+MQ9YaAUu
	KMdCtuPx81ALJe3qtUsc5Yyp84gmeIszWnqLDj/Soc9FsT3ZQp7vvJrHuY06LXtcx7Ni4nUI=
X-Gm-Gg: ASbGncu/z5jJ44PLUCfrnQ+BLS1HiBrNUYf2cL2eZkULq+ZNxjNnnQfJwifA6ZPXUdL
	oUkJaq2vm403WCdqehg+5FSWchihR+l5Ci1lSSCDd7Ol9kLf0bqENEv3Uyk5ps+nbUrXWjUbRy7
	rYXTvpzyZ6C5rIn7URv19aPIr9bA8+DddpJ11UrexvtcMe9wUS1mlOLUdoWWK6imVCWXf9zg5Wp
	0RtmSjC7mivB/gfPAwJOq4bCTX+VdZTzNpX0ogxcNk79zPgRQF4prCYOFffLLK9Sae4J923gZfX
	gbO0Eess7bMVtvXSTOZCGcs4ymE1PcDGhovpFCl3JPCRLI263ko2ZPdC29VX2sOJmUbPI+nGOxu
	RMBvlRr56GGMkZk9Pqg==
X-Received: by 2002:ac8:5f50:0:b0:4a9:7fc9:d20d with SMTP id d75a77b69052e-4b0913be649mr53722621cf.5.1754586181563;
        Thu, 07 Aug 2025 10:03:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHodntMZuoTRllm//xlI3139nJlzflRuOhQf5+gUbl8UpYksDbejgbdK/rIApVL2XVDtz6+aA==
X-Received: by 2002:ac8:5f50:0:b0:4a9:7fc9:d20d with SMTP id d75a77b69052e-4b0913be649mr53722101cf.5.1754586180920;
        Thu, 07 Aug 2025 10:03:00 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2c265sm12028589a12.26.2025.08.07.10.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 10:03:00 -0700 (PDT)
Message-ID: <d0871d6d-7593-4cbc-b5dd-2ec358bda27a@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 19:02:58 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com>
 <bnlnz6nz3eotle2mlhhhk7pmnpw5mjxl4efyvcmgzfwl4vzgg3@4x4og6dlg43n>
 <c54e8ac4-9753-47bf-af57-47410cee8ed7@oss.qualcomm.com>
 <d6a2937f-7d63-4f17-a6fb-8632ec4d60c8@oss.qualcomm.com>
 <db8241b0-1ef3-439e-8d74-a3cb86b610ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <db8241b0-1ef3-439e-8d74-a3cb86b610ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b09v7Kw3Nxuz9R6qA71e55JA-zXRIGgL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX16O22JUX9BK1
 iE80/JqpqVs/qaFuDMPIL2efxZPvz4N6fnrazLPdECCKmPfuRIINCQI8Xom5E3Yf/fPsOxivUYo
 seBUZd+m85XgJXWbc6ikpHsB5uJOyQN98g0LB02F+vW2+gWKkBuxoL7pfJstOfge2jH4zNWEF7d
 ssAm1Q4QABxcklP5NFfcQn2MKTmh89ucS7oOU2quzfy/95lK2OorMa3rUnzQ2tXYTa3DymbNIBW
 tbLDLEbXxLzAsdGSQgX4l6ZxDP57exJM7WjW7XwFbwNKtpo/tDVkr2wVJqSqCaLLgRnwppU41xs
 llO/ZiFTVXDsNWobY3hhZPc8GXkFUhLiwEbuOGVA5T4IVrIXXt9IycDSaJFt4c1IQwNpp6o1G9X
 6KF5LUru
X-Proofpoint-ORIG-GUID: b09v7Kw3Nxuz9R6qA71e55JA-zXRIGgL
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=6894dc46 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=F93HE1ha22ImTei5Bi4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/6/25 11:39 AM, Taniya Das wrote:
> 
> 
> On 8/6/2025 3:00 PM, Konrad Dybcio wrote:
>> On 8/6/25 11:27 AM, Taniya Das wrote:
>>>
>>>
>>> On 8/5/2025 10:52 AM, Dmitry Baryshkov wrote:
>>>> On Mon, Aug 04, 2025 at 11:59:21PM +0530, Taniya Das wrote:
>>>>> gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
>>>>> boot. This happens due to the floor_ops tries to update the rcg
>>>>> configuration even if the clock is not enabled.
>>>>
>>>> This has been working for other platforms (I see Milos, SAR2130P,
>>>> SM6375, SC8280XP, SM8550, SM8650 using shared ops, all other platforms
>>>> seem to use non-shared ops). What's the difference? Should we switch all
>>>> platforms? Is it related to the hypervisor?
>>>>
>>>
>>> If a set rate is called on a clock before clock enable, the
>>
>> Is this something we should just fix up the drivers not to do?
>>
> 
> I do not think CCF has any such limitation where the clock should be
> enabled and then a clock rate should be invoked. We should handle it
> gracefully and that is what we have now when the caching capabilities
> were added in the code. This has been already in our downstream drivers.

Should we do CFG caching on *all* RCGs to avoid having to scratch our
heads over which ops to use with each clock individually?

> 
> We can add the fix to do a check 'clk_hw_is_enabled(hw)' in the normal
> rcg2_ops/rcg2_floor/ceil_ops as well, then we can use them.

FWIW this is not the first time this issue has popped up..

I don't remember the details other than what I sent in the thread

https://lore.kernel.org/linux-arm-msm/20240427-topic-8450sdc2-v1-1-631cbb59e0e5@linaro.org/

Konrad
> 
> AFAIK the eMMC framework has this code and this is not limited to drivers.
> 
