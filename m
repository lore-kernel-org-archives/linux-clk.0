Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5E388E4D
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944764; cv=none; b=f33CGYtJyT0nWIsymfrggIbkBSfk47PWgTeJxxDVvi2vjKpjOA0fmfOJgEF0J2NjzxkzNKHP57YkG4H4GhLHHmI/OoKLSFx1QZFeqTq/maL0J/9Q71/19hIrPlaoPshmzvaaZKnuj4BMfzDOgqThjJNPc9AquKEntKH8wnaO8Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944764; c=relaxed/simple;
	bh=ybDLYdUPMbEn1xsPz/d92AYDTgsy7VuvGcjIKAzxt9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLH0UCmZJo1JMUs+eeSWUJBxPHjJCN1rhMolVt1mPf2M+EbISjvbtNf7PSTvA7z4t2pz9FpLDv8xryuILrT0rCVssz2UtbMzBBaI0xSI0Y9MvJlJ/MFj38FcZMdKfDKNyPaRxOqscFBC6VV1VSf/QUsZMf82qI839nws88MunrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbmv5xIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZEEbSLU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbmv5xIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZEEbSLU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7YlGA794236
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVltYfMT8TEkshamGLWBM3q5K1GZcVnd0fJhRwy1ipM=; b=gbmv5xIBX/Njq++R
	iRXPlMlOYA7d3/Pai3cLOziDd+nsEvK2+SmfltOqiDPRcAEd0OrrWfD0qPBom4Hq
	kzKQ56zWAZ6Big6THOp6+jYpH3BjyyT7peT53at8rLIKeowOqONFoC+asZhGWp9m
	x5rfSAxsUorpjbW2T6L5hKaSvd0O3ItBtsDEHiOXh9F4EyptTn2uNvSCYkrtqzr2
	vofZohLU8DbcqPnWhgZBC8Yn8n0o2GUgHcP4AM5otxNFgNhpMqrdZvq91tIcAuTz
	uJq1V+7p88qbWxqA3CUovuUqDR+QssWjeJ3GKFDIHulfOkZHZb3C/KBLEDOkwuPv
	wW9S2Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn102r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:12:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38c7de7baf1so3682030a91.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 05:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944761; x=1784549561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVltYfMT8TEkshamGLWBM3q5K1GZcVnd0fJhRwy1ipM=;
        b=KZEEbSLUCL7GeXLFUmIxySnlqHg3jbVjUsSDEgxd+0PuFOMmv3uL4Zh2b9UWFbqTZQ
         U3sVfSTsQXWFzMaddH9BB9tzDAsJm8P/2ZueqB+D65IsbJBibGYZMau7Wq/6cLyMQ4sv
         P4ieC7qRw9MoA3RHSVkxbD0cwh9e2dLbxebpH/7OtCl/8znYS2BunFQ9ROol8Y5SmIeo
         RuayoT9PjgbET3cU8sIlnahyitBKgBBpO+PUMDA5vx9ud4tKoaq1IprSJMN4ubnQHt8m
         RRuoypRnv3cuE8XYd2XrAQck5XcluWNoTc/Hf6q9zsejEk28IVGw/2b1JODMtRYYC+to
         j6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944761; x=1784549561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVltYfMT8TEkshamGLWBM3q5K1GZcVnd0fJhRwy1ipM=;
        b=kI+N4m+V1RAtaDjX97hUsUpvdOn/wkkP9f0G2/unpqi+/xVSp7AJulja9qi2wMqqQX
         ZVj5hcCTfafsqffofZUXF6/p/yKURb5TE164VY8iJxW0EJU5BwZJD7encSKMTkBuHS08
         Of8KvkNYuUM0CcHa+WAgFaZA2FPvUd4dt5ZRKBjX568fCKxGafVSMCt4GypjfEephGv5
         S0WGFErZldbU6DGQNYt2m1sN4b+F0Hy0CpfKk716Gac3wkyqPHml5scp3Kqz/9wUVMHG
         Yed2FVEYtv3XJfMxb2unDzT5bte26MwANSrZNLvrYglQPp43/KOZi9kQCBtnHw4TJsoh
         pLmA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2dty+xsNjbGZNn5CFycu1BfJa9gA3izji2lG8jyiWmqJiUizqpucAGHfk3enWFFyHLZAa4T5N+5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFTUbbSkdfwVRVdNY9a63saLkkRELWppJV38YhEPNqc7QX+tz/
	7WdbDbXOeYmHinO70rssHixhuq4SyK5HI70tvVisskuXBZ2suH613xZoqdPMxe5RG8jXBguFbmN
	YdsBOPD4sQXCoPxILBV15z/nvxtF/snxGQ8Yc2hAmaV2xwRgJjuYQzP3vmxjHW1Y=
X-Gm-Gg: AfdE7cmTGf+kH2yHIHILJ170WOA/ic27Dbz01JcCnPeANtLkjRDdW6P7Qpkh3D+kvv7
	rOc3yVzNuFGfWeyT6FjaTI3tiQAQ3H9vXzmhStHsezpQR13wX3DfQkoCfG+psBW9iPfs6x8uD7v
	JdWmehHuRQF9JQGE2u2YGogJtL9jXToqb3vNVReo1K5pOQaXEfkJpRyjldPfQ/ka7si2sas2fZS
	u3xWmKjgYNCRQE0xvetJiT+zLsbQ1gQ1U2Y45NLLXzBIvOqtW7VNsIzLR6KBNI/3J4RehFDQpqs
	hN9omtHxzlSVwVL5BY34pzQVVi0GP5+ELi9osDSvEVrjwDydi5s3FzbPO1yDAJ+P3AhaF1+qOea
	3bgZNxjWZzD7rXn6mgTbxYsVep34GoEgzC55e/g==
X-Received: by 2002:a17:90a:d408:b0:387:e0bb:57fc with SMTP id 98e67ed59e1d1-38dc7b9e71bmr7911263a91.35.1783944761523;
        Mon, 13 Jul 2026 05:12:41 -0700 (PDT)
X-Received: by 2002:a17:90a:d408:b0:387:e0bb:57fc with SMTP id 98e67ed59e1d1-38dc7b9e71bmr7911225a91.35.1783944761083;
        Mon, 13 Jul 2026 05:12:41 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm53089321eec.22.2026.07.13.05.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:12:40 -0700 (PDT)
Message-ID: <0e1a286e-3429-4bcd-9dbd-4aecae52171a@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:42:34 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <47e3cd69-9800-462e-94c0-f2987066cf68@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <47e3cd69-9800-462e-94c0-f2987066cf68@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pYRJ9CSjQXBwQYdYHG9qJVDxUUhMWLNq
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54d63a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=e2pIEHJfEIpJw0LIUh0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX1COTcRoun78V
 NOEa15Usc6w8I26akAnL3aft2XCkdC3BCtc8cR5BnSMyTJpqip0ir97Fq7OJH1Pt4Lns21GoKlw
 t4jMd5oxD5Bnhh+vMW7CeDrOfW7f2ig=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX0LSfrRZ3CIrz
 j59T4EsqEoV7jqwcV3onHRQZPEfv8cDDSXSyJfWYw/S8pH8en7R09TCWNZJ2a8bbkHzJIynFHEm
 GS/0DDwpRWZRAP8Z6MT6TEijMT0jt0D5uU+5Q/WJc4CA4lz6seTbk1JqsfV/CaSfoF30pZq5As/
 gqrQyfbWgUIUQryAD7Aphj9bmS0ekWc3pU6Lk7kRaLZwPycaZnGHGbxn82RoK4+OGEzZzaME/Og
 Bf1NdfLzWawlA9yfHrnVevUP26kk09R6C6ylJC/8NnzcnoxOD0st/+nB3MU0CavyGHg/tfUMUlO
 VBGKPQok+1D1B/yliGNodTAi/lkIcNkbEy/EAfkGhRLHGak3JVwayhrZm46t4aToH4e3LCIAMNn
 dsk6v7+BuYCPYvhzFbH9HT/YyzADEE+mo0N8FzWKwOXbvIbkSaOPdt+GDatV2e48/SCHsnxzgqC
 R7rgerm20xWLcY9+o2w==
X-Proofpoint-GUID: pYRJ9CSjQXBwQYdYHG9qJVDxUUhMWLNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130127



On 09-07-2026 05:31 pm, Konrad Dybcio wrote:
> On 7/8/26 8:25 PM, Imran Shaik wrote:
>> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
>> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
>> differs across Shikra variants based on Audio subsystem enablement as
>> follows:
>> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
>> are required to be supported on HLOS.
>> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
>> handled on Modem, so from HLOS only resets are needed.
>> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> 
>> +		audiocorecc: clock-controller@a0a0000 {
>> +			compatible = "qcom,shikra-audiocorecc";
>> +			reg = <0x0 0x0a0a0000 0x0 0x10000>;
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +				 <&sleep_clk>,
>> +				 <0>;
>> +			#clock-cells = <1>;
>> +			status = "disabled";
> 
> /* Owned by [name of the DSP] firmware */
> status = "reserved";
> 

Sure, will update as below.

status = "reserved"; /* Owned by Modem firmware */

Thanks,
Imran
