Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300082676C2
	for <linux-clk@vger.kernel.org>; Fri,  8 Aug 2025 09:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754644920; cv=none; b=Oj2KjLe2iJT0/NSOg1YB3H5ocVEFqMcbj4pQ2AetamzmVQEEuUBDmK2u0aSs0M8z4+nsjrVVm+m6QazdqFn5cJwiFK3RaLuax4UTuyqRo4MpxYAaFDTwexmg53h2zXazODQGQIAlLG0QhaS6vpUpUYubEk4iquIADWv3Pe5YAZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754644920; c=relaxed/simple;
	bh=+LRvJeJfjFFMg5w+plJD0jeehIK7GSgpPpZ2/CDxvLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUXLyf8zd9uQiPeSVlXxqN08gkBzLlAe45vcE64wkXWi0IUtn9ze8cv0rgoj6Rbz6FhRIxMfI/3N7c48pITA+BsCwO14UJ/TlRZ3EbW714gmtMPs5V/A7MEf+BUW1R5y1FmkMgJ/GB5g9HeycFgz/Yn9d3p71aSZXvDdWMsArWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nE1oFDjz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nE1oFDjz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5786lMOi007839
	for <linux-clk@vger.kernel.org>; Fri, 8 Aug 2025 09:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zLqDCDW47C/rBLkuL0CDYXX3PXQC6B7lLgRqBiiYRmE=; b=nE1oFDjzKsd9bkN/
	BVedQP/mKeYD+w6+XSyAWpH0OIaq+aqnQa8ok1LmdnGXCE0ttNeXC+wmapu0wLvd
	m0mPm8HtdFAndd49h/hl1Lz/UEoEnESg1QuAtW3SPXNcConYgEh5libkcNFIjdwE
	7qCjl19kI/T/sdUh1vTlpTLv3XkOP4jfcoVlFhqUG2mk/41j5elyqrSUwoCU6W2F
	/XVIEdnQf17MsFEyiWNDuS2BV9tB8dYCCIHAJ/GCSz0kWRO76XwlREniSY5K5ccL
	BkU/NP3p/mubqwaF+x/IL0i+u8pHWkYfon7075034Jgsb5JDn2Mf4eeDAB/MYgwu
	5VdJdg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy71fqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 08 Aug 2025 09:21:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31f3cfdd3d3so2195318a91.3
        for <linux-clk@vger.kernel.org>; Fri, 08 Aug 2025 02:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754644917; x=1755249717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLqDCDW47C/rBLkuL0CDYXX3PXQC6B7lLgRqBiiYRmE=;
        b=oZIdYtl7JYjuvsz3PTQnzwtZh+cZQVLB1EvZTBd8lVryXZTkRh7ffCOK0vNqjyu2L/
         7gF3diw3bpg++oMW3JSAy35VrX6MSfiWmsPd8C1V6hdgGMCnk8Gkv8J2g5vtK6wcCaYI
         rpiLKjGyAsL06Kge3+OxSdCkcHYZnYGY4l7tJWsBuzqJfMmNa9N1bGjnHhne+udkXCCX
         UFN6AAKp5s0OHH4CUtwOqBWXoOc7BiCeFNNW/qi+WdCZgKTdEdEKLVnRyS+rfhSN7Np2
         /lr2oWpVewUkix0cLnoBLe9uC8+LP74wfRt3J9RmDAfY9hRKP60glvfZ1xEkMOnZKPRc
         GAng==
X-Forwarded-Encrypted: i=1; AJvYcCVVc1bO4YgbOfH/nkOEvD2tcKrdMh1AmoGG+CeTI/sUVxWsaUj7JMWBfAky3tlP7h3TRkgTc7KZmMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQlYEgw1MaO5eLsdFL+9DPBYRKCrWVA6TGwHOiyIFY2tT0wdr8
	mv8E+42Wv/mLHKi/8ibDeJJchDKpvl0QkSm76n+cLwPP8C9RBYdQO3zEbhS4JeDXJEvYSP8FaUy
	zai8dx6h18afgCfJevIkGB5Fa5Tw7zdSh/npUZ0xLj6uozUSSB7ffH+75aHkFFSY=
X-Gm-Gg: ASbGncukTmuNuRJJtpeb6evTqZMVjQfz9Uk4wJqPdBXn/zgLT3KVJQu/SNqDWKJGx4g
	VMN1jNalkJ/hRME/P7bKcemZW8XCAmPaDKrbGKgnq/YWsGwogKuft24Mz5Fuw1YZiJcjwgwhcTF
	zsC7scH0KQVOaFqJIgEtmPsG/u+bGWUHJPxxstgCclHEDKV/ctM79sGgBARgrWDH7myBdcnZdvc
	JW2ietX0KWWpOpqvmjt4poFID0auNOCdKMkMcHOFgwy9S2cmUfcismiMrVZWBAwyckiUQAJC1BW
	VDiiev3l+m/YrQSXiZDWKKvt5m/uWqjguY24RyS/Xru62iRk+CeA6N7Qty4hyZiLMlU=
X-Received: by 2002:a17:90b:55cb:b0:31f:ca:63cd with SMTP id 98e67ed59e1d1-321839e9a33mr3492807a91.2.1754644917288;
        Fri, 08 Aug 2025 02:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4uXTfQa1MeL3UI0IGJQ6NZ1M0GNenD3TaPrzwHHNOEp7HbRnfFH/NMIAJMm8cm52lQHbQIQ==
X-Received: by 2002:a17:90b:55cb:b0:31f:ca:63cd with SMTP id 98e67ed59e1d1-321839e9a33mr3492757a91.2.1754644916703;
        Fri, 08 Aug 2025 02:21:56 -0700 (PDT)
Received: from [10.218.30.152] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da5719sm24531355a91.6.2025.08.08.02.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:21:56 -0700 (PDT)
Message-ID: <7c1bd3d6-159f-4269-a22a-34290f1be0cf@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 14:51:50 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <d0871d6d-7593-4cbc-b5dd-2ec358bda27a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d0871d6d-7593-4cbc-b5dd-2ec358bda27a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: giXAPltqpMXLJ_cI2x5gVxicygVwwyWl
X-Proofpoint-GUID: giXAPltqpMXLJ_cI2x5gVxicygVwwyWl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX7WaiIua6HWIR
 cD66s2lEydxzwVaAfdxM5S1SCOkG196vGq4/XbWCZZlX20gyvaM712EvsEkzBf/O0v1L9mzFDfr
 ZiJFt8S3rq8iOn5CPFPE/mL2qepnSUpG66bd2boSOm5Sx2dSyS4yoswVfFN7XkjZk6Uskny/zec
 OAt4cMwMEbPc74TxlJk3WjxSTreZNdSrQ+8LoqAVlVJIHTPF+y1DRvKyNQ5ydnU+hDQ/6DAMc2U
 Km2HGVZxzRxIvvv3sZIpNfW6svj7vOwv9IUVcH150puHX7x94/QbBo9oGTgVCQIbIXGBUT2B5RE
 urQxo/LqZPf3nz5HpC2Cavs+21gtVExu1RUMBNV1Rh5ntw4s+bigBbMnjfA8gMU1xFvLZnMvL9F
 jWKu3R6z
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=6895c1b6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=wbLa1xrU48ZvrQgpvw4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/7/2025 10:32 PM, Konrad Dybcio wrote:
> On 8/6/25 11:39 AM, Taniya Das wrote:
>>
>>
>> On 8/6/2025 3:00 PM, Konrad Dybcio wrote:
>>> On 8/6/25 11:27 AM, Taniya Das wrote:
>>>>
>>>>
>>>> On 8/5/2025 10:52 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Aug 04, 2025 at 11:59:21PM +0530, Taniya Das wrote:
>>>>>> gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
>>>>>> boot. This happens due to the floor_ops tries to update the rcg
>>>>>> configuration even if the clock is not enabled.
>>>>>
>>>>> This has been working for other platforms (I see Milos, SAR2130P,
>>>>> SM6375, SC8280XP, SM8550, SM8650 using shared ops, all other platforms
>>>>> seem to use non-shared ops). What's the difference? Should we switch all
>>>>> platforms? Is it related to the hypervisor?
>>>>>
>>>>
>>>> If a set rate is called on a clock before clock enable, the
>>>
>>> Is this something we should just fix up the drivers not to do?
>>>
>>
>> I do not think CCF has any such limitation where the clock should be
>> enabled and then a clock rate should be invoked. We should handle it
>> gracefully and that is what we have now when the caching capabilities
>> were added in the code. This has been already in our downstream drivers.
> 
> Should we do CFG caching on *all* RCGs to avoid having to scratch our
> heads over which ops to use with each clock individually?
> 

Yes, Konrad, that’s definitely the cleanest approach. If you're okay
with it, we can proceed with the current change first and then follow up
with a broader cleanup of the rcg2 ops. As part of that, we can also
transition the relevant SDCC clock targets to use floor_ops. This way,
we can avoid the rcg configuration failure logs in the boot sequence on
QCS615.

>>
>> We can add the fix to do a check 'clk_hw_is_enabled(hw)' in the normal
>> rcg2_ops/rcg2_floor/ceil_ops as well, then we can use them.
> 
> FWIW this is not the first time this issue has popped up..
> 
> I don't remember the details other than what I sent in the thread
> 
> https://lore.kernel.org/linux-arm-msm/20240427-topic-8450sdc2-v1-1-631cbb59e0e5@linaro.org/
> 

Yes, but as I mentioned the new ops looks much cleaner, so wanted to
take this approach.

> Konrad
>>
>> AFAIK the eMMC framework has this code and this is not limited to drivers.
>>
> 

-- 
Thanks,
Taniya Das

