Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910C333373E
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771424887; cv=none; b=j4WZ7IjhlvZgig8l7VWAS8ti/FJHNsJ8/ITBciav2PpB5ISacQio46Wn5cfDWw786hI64883UfUT7CC+78W0mv6vSTtwZwhTfXp6DvL6JUbk9PJLbejv8Jw4l5jKvmCvFzR9ef2ZKhG6k4knZiD8VBjtqnKvrhXUhBVmz+x/NXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771424887; c=relaxed/simple;
	bh=VBYSlHiXBQigpKuLOqCJSpXI17jitSCXW/MRiwTGM04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7+lOIJg7BXn0mA1SArlSszCE1XiBL01j0Cn6NKZiVKzhgNVXXey+gcqraJ6YaKfEPXIFXhOJcYyJ79G87ChdyCq7Xh3WnbnMKmlipyGOp/vfLo/o4TtgqbVs0pdFGjlZN2u/LPEiuEk6IzOore9a07zinPWDrN1qcoQYVAqpS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=To3kgjac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7lJYz+N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="To3kgjac";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7lJYz+N"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IB4XxK1624211
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 14:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nco15/hvpEVWF5GJyB1vsnLM+4t9gKYSHEF1NRxSzD0=; b=To3kgjacscBHjbCy
	JpC5NNI8ukp1EU9gZcwTiRJsc+Eb59a6VDyI+4yV7tKGg6msisx5MOrzyOgoWDB3
	mEPMRt4CYXJVmPi71Z8KpjadnksqE0yBiDQarPrQkORiw6AcXZLEbLyt8vIA2h10
	75Yh1aap3MZHczI4rAhQyGv1ALU9sBcYJF+gF1FfgfXZW2YpWNVGMmNH6LyAFDUO
	9Z1pnnJ65YOX8LxslRVZOL4qsE6OAPi7drDrCJdM8oKaEjjOeHeDihGKzKvf4ICl
	HW5LU2wye3Cfc0PVu1z+4Hcw/5KPucFur2ird4HlKmdVfmhrmWmvaLKGGr/0vNGg
	uK98Mw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdc7u8f1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 14:28:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c710279d57so402644685a.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 06:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771424885; x=1772029685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nco15/hvpEVWF5GJyB1vsnLM+4t9gKYSHEF1NRxSzD0=;
        b=J7lJYz+NlebHIVhVqv2O4ncI+iorDDm/+44D4cRuWyKoZhbansqF/NQ1e8CmaRuq9o
         US/IV+QwSmNN56jIkuwGbH2H0y3e29/gaz78K5ts4+VxvgNICeTHmdT6/rj3cYhNL6Rn
         zWsf4TGEWDbObs+0NJC0YNnbgWZDC2DFJLTvVmpfBl4CT/gHU+KHs8LAA4cne8BGqZpt
         9UySN1rA1CJPuzXp7ChVkSrki8xJqWUZlMfr7Dy4Jtm0wBCoAW7+UD9yyqONqV218DKZ
         TUFywd80qwpH0VdGKBULaoNFzJAeaek9E5aV1wipipefWRS32z5gL2alYa/yusO87e2Z
         22vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771424885; x=1772029685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nco15/hvpEVWF5GJyB1vsnLM+4t9gKYSHEF1NRxSzD0=;
        b=VxybHqPCbbSpUUv68OhPug+5VzC/mN6jg+9My+4nuTloqnyzEeuni6gz+TFev30x+X
         idGJfx29hkVInCns8dwmsKx/KgLlp4X1uXkwLL6cR8QpAfkavXu57eDEJ2OMp4X0A2Yy
         1embXme0rVYZNjNIMavOP9q9J8L1UniZZu/SVnw1AP8dXULNId1jnqfksT2Gewd3gFpS
         wn00zAave4Okq1963x2PK3KI/s7lq/fQJ9P55vnzpbaDWjfpFQhJ+bW1Sh9hJ2KY0KxE
         KKzaOqfRjjMhmHxqXlHs79Pf5JqJefE8b74WyGIdg3GogEMx4eBcCCLLxxyYk1mzG/wU
         k6PA==
X-Forwarded-Encrypted: i=1; AJvYcCX8+FskRVMBdfM5E0VYjqeFMquCozN0xZsb+Q10SDCFVYAwY8DpLN9hQ8Yt6mpRih3SvA0aHM+XUyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMidWJghrWEkbNM5SfzpI6rPdKFa1D9vU/SdG92g6yMVs7ZP9j
	ZN/6TTDssmazwqKaUQBHqtI6Ksuwv5vqsl7ldgaI1OJ9kt1FuDgfp7Ss0zYNTLY66jpKQxJo5ry
	dQxs0b0sngOvCuxHHLALikpX0CQ8qUjqSJ3y4b6QzxGFkXD97xwWXxeffyRNQR1Y=
X-Gm-Gg: AZuq6aIwIT+8uaN3m46eKTh6LHBZIuBumSMDcsGk9GhRsSR4d5H0sKmYr/XTsv0Rs0l
	Rv0vVgUGCCZ0C0nWWvM8aZbMzMn3oiQTRtJECd4MSidqFevWhs28fUUqLuqnLdYGPvib4ffcSQ4
	/6WCkIVMytcuM/WHlbfZk70cTaNlRM0CYDZlkX6bs9JdbI6bkwU55s8UEWFhcevx2gdHsK9Y4Pa
	qt8NE9xBlMlIbMUWwcbairWdikqiGCgWIE/8x9ak5XDKnGKFgCkGJHBiZFtplPukHyAlMZYNfIJ
	SefI+PGOyiXBPUG1hABEffwQx72fAeMjv1aNYpcMB7US5hGaymXFpvlifYdICKhxZPcA9ojYps0
	w4m6WDKCXB62EcFjZtQKMAoG/pAEL/XfvTHlQqMzdagrPWQAff84lwiuIEHgH6RVEY6mwoCe5yW
	n8r4V6RbkfOrZ6Cg==
X-Received: by 2002:a05:620a:1a19:b0:8b2:df32:b900 with SMTP id af79cd13be357-8cb408303c9mr1726990885a.4.1771424884757;
        Wed, 18 Feb 2026 06:28:04 -0800 (PST)
X-Received: by 2002:a05:620a:1a19:b0:8b2:df32:b900 with SMTP id af79cd13be357-8cb408303c9mr1726986385a.4.1771424884282;
        Wed, 18 Feb 2026 06:28:04 -0800 (PST)
Received: from [192.168.0.242] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766531asm458063166b.50.2026.02.18.06.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 06:28:03 -0800 (PST)
Message-ID: <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 15:28:01 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mFaR7Wgpg0UTaE-8zA4hsGi-smG7ncb6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDExOSBTYWx0ZWRfX0PZGQycqG6t2
 fc5l0T6BknXyBJOrgYuSO9YRKB7D1awIPUadEqTCHplJgjYY3H1AGyn1ZR7BGNrtr6e3ON0COOJ
 zzYamKXQEA3gd/SZr2o4vqbmNGCQSVVAw42DhaQJ3Df+OI7wgfXiwsMcrirt9KFwqfvaBsgKgjD
 KAnHVsso5Z5A7eTr8KR0HGpFDlH/qQe2hs8nr7JEORkz9S4ukuX1kGl2fDMo1GACwbbbKRTKvPR
 qtdoKTihD8RAvj9v8nyU6+Zlf5fspafE9BktSxY77zpFY7s9sqG2HnT79ev6/hDUwrpNsRm1Dj5
 18uxNPQyVHcskpXlQLIMJcjig5mixO4W8jGWtWjO+GIbpzYf4qkMKN5r5vOhfd+pIDgRdgxXpxA
 syQ334cMcwNCNnkSfGocGUD8goPL2nWMtO39X2doRXuHrg7oEspI4srvYCVtmfiIzlHCIcVyGsr
 NVZ0FwUs86ss4aFvCkA==
X-Proofpoint-GUID: mFaR7Wgpg0UTaE-8zA4hsGi-smG7ncb6
X-Authority-Analysis: v=2.4 cv=daCNHHXe c=1 sm=1 tr=0 ts=6995cc75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=SXzkmgPmAAAA:8 a=VwQbUJbxAAAA:8 a=08J7RLiMzDJDz8dl29cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180119



On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
> On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
>> On 2/18/26 12:18 PM, David Heidelberg wrote:
>>> On 18/02/2026 11:30, Konrad Dybcio wrote:
>>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>
>>>>> If the OS does not support recovering the state left by the
>>>>> bootloader it needs a way to reset display hardware, so that it can
>>>>> start from a clean state. Add a reference to the relevant reset.
>>>>
>>>> This is not the relevant reset
>>>>
>>>> You want MDSS_CORE_BCR @ 0xaf0_2000
>>>
>>> Thanks, I prepared the fixes [1].
>>>
>>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
>>>
>>> David
>>>
>>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
>>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
>>
>> Please don't alter the contents of dt-bindings, it really doesn't matter
>> if on sdm845 it's reset0 or reset1, that's why we define them in the first
>> place 
> 
> I dpn't think that will pass. Current reset is defined as RSCC, we can't
> change that to CORE behind the scene. I'd prefer David's approach.

Back when I replied, David had a patch that removed the current RSCC
reset definition in dt-bindings (at index 0) and re-used that index
for CORE, putting RSCC at index 1. Perhaps it's better to link to
specific commits when making comments, note to self :P

Konrad
