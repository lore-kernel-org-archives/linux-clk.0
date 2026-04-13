Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE013A9603
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080320; cv=none; b=HsipmC6C1jaoPoEV2vGoj1O9WXdUm4yy6+qNU0tooafr5MBpEYyIQu+eDJV1Zu3lAtbg/73ZdiZ+w0G1mFKcmKq3CXcIdCbdgmXad3aBvnU0DsHkKXCPupqHrZBIOZFtc7hKEfRRWzWBEuzhrapSfkQFwKw6wmzQsLb42N+z7mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080320; c=relaxed/simple;
	bh=7W6MSgWhGfD8fh2T7+UUk80DgPmihpwqFYTbo/YqoB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCaQWf4Hihf18qxLgmZNRnwm5TLPaPrHHNdKA2oBdxslRBjCgK45ukI9Or5qrdW1bHlkWCogh1Qbpco20Awqlroc9pNt+0IPybuld+cMXaFCCm3nVXZ3h5BqwutOOx6h3Db36y+4oNKMJ2Q3luSs5dZI73gvAQu5a+1QNxuPsas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPsh2Mik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMbJOIEB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPsh2Mik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMbJOIEB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D602kJ543317
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 11:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FLUwNxPPV1WHcjiM2D0JqM0+q0C6n1u4Eg1Oz3/FUg=; b=hPsh2MikAnB728Nz
	1ldogOOgLuJaSLmLGUguMyn209PVBPXYIkB2HQK2WCMJuswDSCNEgw3+sc0ifdb+
	g/jzhZlqqvYLAMZRNFAi1tt9/SM8dDvCWp9dUipod3eppm9rFDLhgBVLkRaVUO5h
	u3I3YdUDf8SdY41uKNioEuVLMaIKlIPEitfw3i2ZL07rUFwpKlA262zZsdlV5BjJ
	j6qd9puv/C0zvXcdx2zK5vO4lAbgitxhw4ms4W8FtVwnp/bp7EvAHFvZ9HZB1OED
	4oZE7sMzky2eNPZCav7PMwxGvPUqUCiBZwNweRnTALMSNJlSYN4geeEidIUDjiG8
	uZKoKA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfw3vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 11:38:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso40744531cf.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 04:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776080317; x=1776685117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3FLUwNxPPV1WHcjiM2D0JqM0+q0C6n1u4Eg1Oz3/FUg=;
        b=HMbJOIEBfurULvrPdliDhjGy/Z1oYkXKVzdaccH4dTt/ZNQTKzEfEpKdcPpA9zi8Fz
         Ni93Gc5BnTJ8NP/NP1gnJmOS8RRPyo900lXowQuC4T/S3vuDr3TXTn12MKf8Z23NYJHW
         IHvgkJ3ibv95dn616rT9E+wXS6NB2gihcrzKHojYsmDUJDEDoyToHE7bO+9JtJhBdlif
         NIWhYz4i+9exfjk6swtJ6J3fk0P4eBdM4xKeTE++uSGVUFvrYmfnwpbvy5F3EBJDCnvP
         t/RpJJBUIrxMsEVkUkLnERpUCS886VVFjteOK74YEnP+jg7ctQOUoeeRXQKd58I3yFJH
         cGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080317; x=1776685117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FLUwNxPPV1WHcjiM2D0JqM0+q0C6n1u4Eg1Oz3/FUg=;
        b=Y25Ux0rhpHltHHuxaEHvceumIYeEggJ1h5iy+GjnhGFPYnPpOcWr1a1axshp/KIL0/
         Z5wob0yfXryx79NsoFMWN/9tYZImJl6G/vnmPIRmbT6RPsoxVqBglunTnVWdxx/9p9d+
         mNubYoZzHY+GR58SfM2WL04nOw0x5O6FEvQukaIJE/xCZ1tlklKG7sKAK/Vz1nqu1CJi
         ozxHGNBF1rp077wx0+4C2TbmfQDlzjZMkHj8SNxB6T9xtp0NnrNhZ66EidpLwq03HDQ7
         atri6m6H6CZShUnTS7IpS5ytiTUQWKviyVhF+Q7d6s+qgzvAoboO0xch5E/OF0u9m59W
         z/zw==
X-Forwarded-Encrypted: i=1; AFNElJ9bE2GWOrOcU3lb28+rl+MFIfRuMCVxd2NiCTUfFfvIFEoGAoh7t+TqvQ1VLjdjlO9ayB1qrxpwHrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhwLcyuCnEq4uQyt64LR6sAJrbUO3GJcniXCu2o2Ld7POlskLz
	yDBPndchZOdftn+2C+HtlTeGNNqvjTWDybmnK67ada3PDn2oXjj1KGUKnlfz/syPicJx1/ynqYs
	l4hJIDHFJNh/d2Oa0djnYgtna32/2osOiluGyFjQpq8XJr8a4t16n2P5XQVe3Zgg=
X-Gm-Gg: AeBDiev4KNsxFRiE+51ne1lZ3g/akMiRpGVaQCknlDif2fH5E+QWL0m+rHB7CsL9xtE
	4lR8YQBWywu5xewwurjVbwqqz4L/iDSY1CNIvoUNn6+RQnWdwost1P3PTv7RMO6hp8EH910qmfg
	r0wTB61r8nZMZ3KeHcUhepTaB/t4kRRFcH9C2AgiVTa4TM5B3suBCuaXCgS/0wHDeIQnfl9n/v8
	GF7AC8ri2NaHFRlYiMHR0K5H0s/13qGHXYRv3QBRX6FemS1f6K3cnQFWuI7QtlVGl8WJAd7cRND
	+xLZ5lmsjNMzK8G+SAYTHjLrOe5Rm1Djfo9FdY1jyAVFsdYeSiCSs06s+sJrpf5Z9SrijU+bxdO
	oWXODjykYjcrEbJgJcHvyJf/5Cno9D/ZNQxwWgCGbRdxaKxxZeSeM71+MCK5w5T2252UvdPRmkD
	+zNDQ=
X-Received: by 2002:a05:622a:1393:b0:509:2b5a:808 with SMTP id d75a77b69052e-50dd5a9128bmr144385231cf.2.1776080317452;
        Mon, 13 Apr 2026 04:38:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1393:b0:509:2b5a:808 with SMTP id d75a77b69052e-50dd5a9128bmr144384911cf.2.1776080316816;
        Mon, 13 Apr 2026 04:38:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de9b414sm313460166b.6.2026.04.13.04.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 04:38:36 -0700 (PDT)
Message-ID: <3f084f3b-861f-4444-805c-ca8b431f6cca@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 13:38:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
 <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
 <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
 <8cd9693d-9ec0-4173-bcca-786915b5c4cc@ixit.cz>
 <xbbaffnmi6z5ohzw3p4m6ox75gasgc3nw5cf6yo7h3td2bmsrb@px2mntm74rhb>
 <5b45a40d-54a6-40b5-b4b6-eac344827dc9@oss.qualcomm.com>
 <cm7cowdic42qziuwpe22b2yuakg2k5lqcdnfs3mspvbvprnbto@6kxucxrbnsc6>
 <e321f7dc-4053-4a4d-a0e3-40c3a8fc0fd8@oss.qualcomm.com>
 <3498c03b-beb4-4235-91c1-c2867ad8c956@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3498c03b-beb4-4235-91c1-c2867ad8c956@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: spe2tGl2u8uYd-IkytA9IgPYxuJ6famH
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dcd5be cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=SXzkmgPmAAAA:8 a=VwQbUJbxAAAA:8 a=Ng2_SAvxuEZwIUAnxNUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-ORIG-GUID: spe2tGl2u8uYd-IkytA9IgPYxuJ6famH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExNCBTYWx0ZWRfX/bGOhbqhLoBX
 VEP5iFgaGy72H+Bmi4u38HJgTSBBQSPwILwoz83MGTs934iJigi/Wm6ZQylECiuAL43HJ/nXAUM
 jMzZv5xQeEGdsrYBW5vM6ItV1b3kxYZB/+B2zFEcGhV9X7VvcsdMtlanWEC6d3s4OP2KdgJYvtV
 U3+8FEh23ppmLkM2yRLdN1QfBY3CiXTuvBhFGKgFRVdk25QNWOVqDfnuBAvpCVbGdFHrj0P/guL
 018Hhm2fEOfpSAbUNr8anp0uKowSLL//cR03f8dNhQ6rtSTicNRyi2wDU/9hCry3x0tBaRsdl/z
 4AipQNquTonywRS9pNiXOu/K/MgMFsWZWIOS8cQE8WbWecPyadO8EnVtNREBVfEAU83jaCzNVCz
 LMWV3hFd4ESlvqmsY1ufJSXRj58SuGiDxbIjwCgRhaoH2Tc3R+wf95sQhDnS3JJpDGfEL2t6rCp
 192PATSBp5ACb4V517Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130114

On 4/13/26 12:50 PM, David Heidelberg wrote:
> On 13/04/2026 12:28, Konrad Dybcio wrote:
>> On 4/12/26 2:41 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 10:55:53AM +0200, Konrad Dybcio wrote:
>>>> On 4/9/26 11:24 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Apr 09, 2026 at 10:38:15PM +0200, David Heidelberg wrote:
>>>>>> On 18/02/2026 16:59, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Feb 18, 2026 at 03:28:01PM +0100, Konrad Dybcio wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
>>>>>>>>> On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
>>>>>>>>>> On 2/18/26 12:18 PM, David Heidelberg wrote:
>>>>>>>>>>> On 18/02/2026 11:30, Konrad Dybcio wrote:
>>>>>>>>>>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>>>>>>>>>
>>>>>>>>>>>>> If the OS does not support recovering the state left by the
>>>>>>>>>>>>> bootloader it needs a way to reset display hardware, so that it can
>>>>>>>>>>>>> start from a clean state. Add a reference to the relevant reset.
>>>>>>>>>>>>
>>>>>>>>>>>> This is not the relevant reset
>>>>>>>>>>>>
>>>>>>>>>>>> You want MDSS_CORE_BCR @ 0xaf0_2000
>>>>>>>>>>>
>>>>>>>>>>> Thanks, I prepared the fixes [1].
>>>>>>>>>>>
>>>>>>>>>>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
>>>>>>>>>>>
>>>>>>>>>>> David
>>>>>>>>>>>
>>>>>>>>>>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
>>>>>>>>>>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
>>>>>>>>>>
>>>>>>>>>> Please don't alter the contents of dt-bindings, it really doesn't matter
>>>>>>>>>> if on sdm845 it's reset0 or reset1, that's why we define them in the first
>>>>>>>>>> place
>>>>>>>>>
>>>>>>>>> I dpn't think that will pass. Current reset is defined as RSCC, we can't
>>>>>>>>> change that to CORE behind the scene. I'd prefer David's approach.
>>>>>>>>
>>>>>>>> Back when I replied, David had a patch that removed the current RSCC
>>>>>>>> reset definition in dt-bindings (at index 0) and re-used that index
>>>>>>>> for CORE, putting RSCC at index 1. Perhaps it's better to link to
>>>>>>>> specific commits when making comments, note to self :P
>>>>>>>
>>>>>>> Yes, I saw the commit having two resets. Anyway, as we saw, it doesn't
>>>>>>> work.
>>>>>>
>>>>>> So, finally I spent "so much effort" (read throwing it at LLM) looking at:
>>>>>>
>>>>>> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
>>>>>> iova=0x9d4bb500, fsynr=0x170021, cbfrsynra=0xc88, cb=11
>>>>>> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
>>>>>> arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
>>>>>
>>>>> [...]
>>>>>
>>>>>>
>>>>>> These (or very similar warnings) are around sdm845 definitely 6.19+ /
>>>>>> linux-next kernels for some time, but pretty harmless.
>>>>>>
>>>>>> LLM suggested multiple fixes, but when presenting possibility of
>>>>>> implementing mdss reset it found it as most preferable [1].
>>>>>>
>>>>>> Adding MDSS reset would most likely solve it. It's not critical, but not
>>>>>> nice to see many red lines in the dmesg.
>>>>>>
>>>>>> Is there something I could experiment with to get closer to have proper MDSS reset?
>>>>>
>>>>> I don't have a sensible solution at this point. We tried using the MDSS
>>>>> reset on several SDM845 devices, but they just reset. So... I don't have
>>>>> any possible solution.
>>>>
>>>> The older context talks about altering the existing dt-bindings values
>>>> and now we're at hardware (mis)behaving? What is the issue here?
>>>
>>> The HDK and DB845c reset if I try touching MDSS core reset.
>>
>> And David, does that also happen on your other boards?
> 
> yes, I recall OnePlus 6 or 6T going to crashdump and Pixel 3 crashing too.

I found some older version of the docs for 845.

It says that to pull the BCR, all clocks to MDSS must be off while
the reset is in progress. Maybe that could be a hint (or maybe it's
just broken on 845).

If either of you would be able to catch an actual crashdump and get the
data out of it (via qdl(rs) ramdump tools), we could see what the TZ
says the crash reason is

Konrad
