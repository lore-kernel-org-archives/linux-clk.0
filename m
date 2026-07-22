Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1EF4C77AC
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 11:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718238; cv=none; b=a398GTaF6fqIulZIegmzkewFiXb5vIaVUPk3dEvYpB5XVUFV6nFcJKSRBqaQsX7G1NNL4P6aVrlHoW8SGpjg3H8sxope+wy505rBa7gBxIukzZw5jjzedEzEwt7E+tevBsjoL8wPTrUpk8iDZOfufbZeC7Wrh4kjJ6JqFPJXLgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718238; c=relaxed/simple;
	bh=Bjc2rqqiE4nHnA8E9NdWHbYx6fr/xNzrGgVruQ8wtdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6bAHa1W8JLIzY+cEg3bCHvwv9tyCkP5B6NhaB6tn5Ryg3oY0Hbj5SyL4dX2JmF6gSESxGi7g2MMYurf8aEyZLDUgrFvqqJZMdJWkgAJILieSm8ZHSmLJQgnmfF0w/9IlBOBqn+HdVTsx06ZxqOYslPysA5ScXK7zcoeHoYcsM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPfSqx//; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWFOy9rK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPfSqx//";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWFOy9rK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xbF5269751
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 11:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9HT0mVYrofYCaOfB1NxjGUviNaEbgWp98KHo4CCtcvo=; b=pPfSqx//C8zu70uu
	uei7/3fWNK69lItdnal6HJEV21tNdMHpERN8EozOKEBYe/l64BTlN+cs+SEUmTnH
	EeQX+Y1jCHQGsOpvOiqvu8vbPgIe3WlMXv95mXzkX0HLRa0eIJ7JJp41Ktzv6sEt
	gpYOLfEzUTnZJGJ761lyocjOzYPofS10/rK3aZqztlI5b+szhBhdvlDrwwlWmXCY
	3GqTGQcPtXkuHzCqYIqpObsrMx9Yy3/o9VmKZ7zkDCRp4BkhkKm8e329pRs8KkN9
	6GRM7oW5wTodZyUyD/CsTzyEGARobLWsqzA5aFafzwm1+7d+s3odTMqcUwximcXa
	HfyTJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6abn61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 11:03:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so4948071a91.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 04:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784718233; x=1785323033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9HT0mVYrofYCaOfB1NxjGUviNaEbgWp98KHo4CCtcvo=;
        b=iWFOy9rKZ0zrBMJMAaR5OVRpRguVdDzKSe4B2BX/RUbQnSGHFKly9w3BPVaFS4mgew
         GQK3UsqkyVjtcXD7P/doCXcILxZbV6jTA3qUDX8upW9Xf3DKSbOQ37Jzj/hcmrLEBYX0
         BgHpqjgw5EaaC+bSVTA/4A86CbQNj5Q9Tx6XQf/OvnRg7vQHOfvLi43+nYP10uzswtc7
         xHTwqOy07bLMX80vvwPnf7+KmLVAb6sdlmvKeWpQcXY++yDGwd6VNeWitgf4v5ep1Uwr
         dx5+hZR2KKSj0/jEAZFieKh/jra15zASxYOg6A2crAKShKfWYeHXvbw4LK31+nHAOSFp
         DL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718233; x=1785323033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HT0mVYrofYCaOfB1NxjGUviNaEbgWp98KHo4CCtcvo=;
        b=UgNBa/s3rVWOPhqBfOp60ffalGErii3373M0JKZtAmydMQaFNdp4l7yyreGVc0xYw8
         nigvgmV3iESKXxDb+14Dd+f7Tay4qyWPGk0yKFTQ7e4+jL8EJYQHGAiCjKEkAXj/e78u
         kvyPpTNB01/1DMBFX1A8f5G+6HkiL2wXhFhzahONNWax3G6asjtk0LEwi8nwbWO+nNSM
         qK+65uvtfeIG8KoMzFgAgqD6JwJ3IO2bIGsioMb4iVmKfwu/VntqyJAr9KqOa6FqLMhC
         EbJukc+3EFO93ZWwGosnfNbMQLLB48aIHZcMeCzH+dOXVrdSQAlmF7ZwX9F3+QZ33OX5
         9ymg==
X-Forwarded-Encrypted: i=1; AHgh+Rpjv6uo5nSvDD4wkggfUchybfwbmD3gxAARKm3XQZBzo8rdDuxbcjxUtC83ekenH8L7jPKyqEHMynw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE1D6okARD605ngDA1scvPSk959+FSbRW0aY4lt9gI+NV4J9sY
	4xRmXQcMXeWmiFT4ftJy04WSK2S6oM4ed2xfYCsashJzvQh1xhkZdllT0s4ojBC62LHT3S7lBtS
	2AAVMsfbFeGWOOZ3Bulc6GoLuQ2xv1JjmZgwoov7vC0WwsvneDSugAHDOYUPmwyA=
X-Gm-Gg: AR+sD10opRyxgC8QbEeV6IabzTzvmaSSzGZw8eKq5ZXEbkg3GE6RFIm+ls0/8pFQYqK
	CMkehHIIuLabZ7mjNiqVl9F2HKhKmRXGunFIZq0WPLCQKk87a9quCwtwPPdD2kaJBRUpaibJslR
	OuUULIniAxJfb9EQuL0Vb7Wr2PtXXHGC4M+WdyUYwDhK1yjq+vQCUnsYOax3KQPfz45xszs/VXX
	cQfsMr6MfM3b/niZZh/4AgRCXGeQ0ROdtRWfqEW+IyRwqy2IRgmLXxbcpXmw/PNhmUjQWKiy/yf
	k91zkV8lKtQx6dZYYA+2IprbamCFv4kHACMuzdhK9+gjmnke+ItGW1UvXHbexTMbGBb4iBP7XQs
	iqVrZUbKxnHxI+/dCDLwUu6KYTO0=
X-Received: by 2002:a17:90b:3f85:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-38e4b3dc094mr21959618a91.1.1784718232643;
        Wed, 22 Jul 2026 04:03:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-38e4b3dc094mr21959548a91.1.1784718231978;
        Wed, 22 Jul 2026 04:03:51 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38eb2eb81d4sm271176a91.14.2026.07.22.04.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 04:03:51 -0700 (PDT)
Message-ID: <7aa3a96b-d1ed-4686-b38a-85304ec61425@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:33:21 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
 <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
 <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
 <b9540345-63c5-4da2-b761-cf1aafa8286f@oss.qualcomm.com>
 <gotzbjedro6lkzpk7xfszzymg4rd36jb3qojwlm5yelvi355za@jufl7tenh26b>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <gotzbjedro6lkzpk7xfszzymg4rd36jb3qojwlm5yelvi355za@jufl7tenh26b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNyBTYWx0ZWRfX0aAn031iEAF7
 iWR+KVMqzRvCt9s6E6ZxyCr4TfKXeTBsTDT8HN02S3KrBGnoA2qlAEg0YsWAXSi4Zp5+ZP5ubwQ
 GnTCzq1vxBDagdjfwH6ZZ5I1JW0MjzhXyAFUlSZg+qmEzO6aIJPrN837CHDnM1Y3sxGZyue4XlD
 UN33C7B7UHze8ejpYv51L/1QtSjcckCBJc03Fkb1m+U2Wm74ZuTFde1ZPhCD1Ja8mhy8tl9Edzq
 XEXE2ZXhFS84XxX71aUe2uyQjLLcuZ+eaEBa31fd24+hTJvE6mYhvjzDu8+QHPLiFxlNnqEXlyw
 PG3HrvIxHWAJf3+emR+82cqxHY90krDOpy8Ait6lsvcElpBXJpGhBmcVGOjn3D9o6OUW2H13655
 oh8iE/wAYSqtjuDKzvegaN7cppYGrq/y6TjleZFqii1Jrik6naJ0rCjbMea8K8Vo69ReZMCvM5v
 gQ5kwJNuaL4Zsafpg/A==
X-Proofpoint-GUID: ATMnEPxXcFGXeGkVvgBvQ3_oeA6dt2Q3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNyBTYWx0ZWRfXyuqbIDw9xQd5
 bIwkTqHtHduVYHUcQZZVSpP2bOWMhKGHqG1/U5ySi1aPEhEn7tBsZpEPB365XrZsOHkv7i0ZJSB
 2q6bobqaXq2forLYUfCOTuIeQBL0HQI=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a60a399 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hEpXhfjFsWDJ7rCPAMoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ATMnEPxXcFGXeGkVvgBvQ3_oeA6dt2Q3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220107



On 22-07-2026 11:54 am, Dmitry Baryshkov wrote:
> On Mon, Jul 13, 2026 at 06:01:34PM +0530, Imran Shaik wrote:
>>
>>
>> On 13-07-2026 05:44 pm, Konrad Dybcio wrote:
>>> On 7/13/26 2:07 PM, Imran Shaik wrote:
>>>>
>>>>
>>>> On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
>>>>> On 7/8/26 8:25 PM, Imran Shaik wrote:
>>>>>> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
>>>>>> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
>>>>>> differs across Shikra variants based on Audio subsystem enablement as
>>>>>> follows:
>>>>>> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
>>>>>> are required to be supported on HLOS.
>>>>>> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
>>>>>> handled on Modem, so from HLOS only resets are needed.
>>>>>> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>>>>>>
>>>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> For the sake of simplification, can the resets be enabled
>>>>> globally by default?
>>>>>
>>>>
>>>> By default (PoR), those resets are under HW control. For audio use cases, software desserts/asserts for switching to SW control. Hence, these cannot be enabled globally by default.
>>>
>>> What does enabling the provider node have to do with changing the
>>> state of the resources?
>>>
>>
>> My bad, I interpreted it in wrong way.
>>
>> We have IQS variant, where we don't have the soundwire codes, and hence the
>> respective clocks/resets are not required to be supported. Due to this, I
>> have kept the status disabled, and enabling only where it is required.
> 
> Would it make sense to do it differently - disable them for the IQS?

Yeah, we can keep the audiocore_csr node enabled by default and disable
it in the IQS variant.

But Konrad suggested to keep it globally enabled and not disable in IQS 
variant for simplification since no one will consume those resets in the 
IQS variant and no functional impact.

Please suggest which approach to follow here.

> Is SoundWire not supported on the IQS at all or is it not a part of the
> EVK?
> 

As per my discussion with the Audio team, the IQS EVK board has no 
soundwire based audio codec connected. Actually, in the IQS hardware the 
AudioCoreCSR registers are present, but based on the Audio requirements 
we are not supporting it in IQS variant.

Thanks,
Imran

>>
>>> FWIW there's nothing like reset_sync_state
>>>
>>
>> Sure, I can keep the audiocore_csr node enabled by default.
>>
>>> Konrad
>>
> 

