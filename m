Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D4AA93D
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 11:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753700534; cv=none; b=FGJ36lCIm7iUEX6tcFNjhqoZwV5eNqSzJenyQafwTi6e2BAIJ4JXPb7vXBEgM6qpDs8E3DCXpEOqPv5Ro841DqBaCalbpTFoLun5jFqbj84S2uzh4mjeiIgGTrmCjSmZJpYZDR4BuHpgM3lw4Gfa+LX7jCav9lEzZhEgCVvEduU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753700534; c=relaxed/simple;
	bh=QTMRuquNtkVF7801cvDRB8V3A6EINsz1F+qf1uDU7N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCRSyTyOcFPf2gvHQUw6Ovrul2eyo75bFnOOapYYootJxjwTWk/6dCkJUdGNiC94aMuDfoK60QxHdki9GnU1LcSzIyAFhDyxabz8OSA1g4ZsERwvLRWQydIswfFL1XxDWlujQfqKDkmnH/pNmbPvftmVatwBqin8YBkOcDk6tRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frPYx53x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frPYx53x"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlQ0f028312
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 11:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tkOmERj2A/upJpeVadcUk/yz4v7zZx5u22OaAAkVIQ0=; b=frPYx53xW8xjyAwY
	iu3awnkfSND/Krjea0qeDHUldMRhw9jEwAazzOcP4RE6Ovbw45RrY6VDy/EdHhOU
	M09zEmmP+Xm3EjpePYMbRGqFtwM+K0SPQHot7TqHA6gcPDvb+jIOO5ue1fovYMom
	+XXbJ0W/njAJmmwTorqKzmtnVjYIJ+ZkNxItWA/Jx+MuOyuthG7OqvRXqhzZd63M
	RCAb+DFFF0g7oLWgAd+a3IaL2UmhvJztSVvOqkyQiCXmzM6WTJQkm/MrwAupvnNX
	H6Z0ZFbkMm6MeLsg1bvI1g3tif6JSivamMaJFP43mbLnOcSFyoHxJgJvDAdu00zQ
	0EveqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2c9c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 11:02:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e48325048aso8071485a.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 04:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753700531; x=1754305331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tkOmERj2A/upJpeVadcUk/yz4v7zZx5u22OaAAkVIQ0=;
        b=JZDxxBq/HVKdW1veVV/BAXe7i4qtOQWy7kv+UbJRDe0R00jkAtt2vNEo9ULdcOjfyP
         sTPHZ7T0jNG7y4xwY6cT6Ie7AToC5+CGovMPD197w1/28X1Qq2Af2HjytqlQ/bJr6ONv
         8erbukah0DTKN251IqGF3IVMRhntwH0/6TwCFqbAh7s0oxls+Jarg+jAZ2nSPvVA9ZuO
         zJho+QI9daDUJFd91ezOfHtDAFmjS8WxrqaWFsdZIvQ5F9poT1U2YxGM5ALEX8gfdW3m
         7dGmPpHqUSrrai/X+MslBZmO9AKxwWHVBmqUs3U2WeeyMvGHqYpZQAjD8rTJUybfqcvb
         zy8g==
X-Forwarded-Encrypted: i=1; AJvYcCU172/Ny6BnYDYQlVsiQnNpXaqd0Gm3nLcQcykNcJDKK8Mwf+kbbqYkct1QXVXyEkdJ27NoljpUJEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvpSmDGkXY0HgDFnqFse8HTPEQiKghQL55RXnRt3az4DIiIdF8
	yIahd9z615yvXUxdFu3QxE7xbBk2cng1G4mmZwvGI/4HnNP/kmh+dPdVt+HrVaQ+A+BoUz4Loqt
	FK+/iLzfHSb/iLkU5sGw/CfBji8CQom9vgs2bM2tH4e0VbfEVYf2IG4GJMA8JIJU=
X-Gm-Gg: ASbGncvNjc7ipKgkB6B7TC7VNIp/NMKVOD9e38pc3mfcHPTT28hAn3gUoAHdaGqIu+v
	Br4lvRxMVWZI6ZhkL9w+5091jxv+x7c4ucZdSihUXRB8iz8MjgNZz7MFTeHNFQEDeDMXZm9X9Bx
	XqpRNrXyE9uEiDmmOXidqwi2zgGa29jt8E868ji8Uv/yNKVNF6Yr/LtiuaqSIZ6EcgEwpV2T1El
	pf5UkMLgsdKrvzYwnukgfdvM+ezol24l6YSN0cSx8VeNEnwxI7EdRYd4JWTbSjrWE3fIdb29zIx
	WxQ7WS0YV/01wRevZMyOs7eFqgNt7oGSE8WvUV3BkTOcT1ARIjw1gDsk0cyoxt181eVlMcKolR7
	s6mtDv2pMwJrgPbrDaw==
X-Received: by 2002:a05:620a:a00b:b0:7e6:3c4f:6e44 with SMTP id af79cd13be357-7e63c4f6e8cmr594470885a.7.1753700531148;
        Mon, 28 Jul 2025 04:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUIgDqBhwTM69wrpR7rB+q9FoIvwjatH6qNVoaRQs0g4MWIANkOEW6KBTVIFmEb1l0QgxQIg==
X-Received: by 2002:a05:620a:a00b:b0:7e6:3c4f:6e44 with SMTP id af79cd13be357-7e63c4f6e8cmr594467285a.7.1753700530518;
        Mon, 28 Jul 2025 04:02:10 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635af3c15sm406076066b.127.2025.07.28.04.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 04:02:09 -0700 (PDT)
Message-ID: <dda5b873-4721-4734-89f4-a0d9aeb5bdab@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 13:02:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
 <20250723-topic-8750_gpucc-v2-1-56c93b84c390@oss.qualcomm.com>
 <20250724-blazing-therapeutic-python-1e96ca@kuoka>
 <54b617c1-bd1b-4244-b75d-57eaaa2c083d@oss.qualcomm.com>
 <5b8d42d5-d034-4495-9d28-27478a606d62@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b8d42d5-d034-4495-9d28-27478a606d62@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T8vR4gIgz-xJvjqXJzXMXw9f3FUv1ZsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA4MSBTYWx0ZWRfX/+WcDNE/1Dk3
 Lgrgj27I4pJIMcuDxtdIvyFnhKuI2KwkiInCk4YgsDdDUSeh4JNc++82cXT8lKZK9wGZl3sN1Bt
 WMEVIL2jJc2mbKB2ojoeMX91qYzbLbVkWMsChhAq5xN/Iv9N29Qnc3GX2P665PoJi2ZnpLNQlDC
 n7a0v7vmQONWZ/Fsz9I+K04VFJ2MkthnM8w8CER390ArRGmzbYdtKCb644WgDgYkYmd75XCTyeE
 WqBnUMBNWY8uj6U4KG5F78/G/J9B2Mg44tu6lF2qD+d7joEesB3G3X1lKGGRgHifUOkpjKPub/D
 wsmULPQac/fahNaIK3zpv6cm//pQ4QcQxPqQ2nvltcTI1tuYPg5pJ8miILzfU85tdy4azGXWa+h
 plKdKF2XyZI88q6PQjMIOjAe0fs3shu5SDqEVtmOJVYkphK29ep0c5nSj1TqeUdUOibRp2oU
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688758b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=N0DHfeS2NgGftJ_ZqQEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: T8vR4gIgz-xJvjqXJzXMXw9f3FUv1ZsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280081

On 7/28/25 7:01 AM, Krzysztof Kozlowski wrote:
> On 25/07/2025 11:30, Konrad Dybcio wrote:
>>>>  
>>>> @@ -40,6 +42,9 @@ properties:
>>>>        - description: GPLL0 main branch source
>>>>        - description: GPLL0 div branch source
>>>>  
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>
>>> This should be a different binding or you need to restrict other
>>> variants here.
>>
>> Actually looks like this is the same case as the recent videocc changes
>> (15 year old technical debt catching up to us..)
>>
>> I'll send a mass-fixup for this.
>>
>> Some platforms require 2 and some require 3 entries here. Do I have to
>> restrict them very specifically, or can I do:
>>
>> power-domains:
>>   description:
>>     Power domains required for the clock controller to operate
>>   minItems: 2
>>   items:
>>     - description: CX power domain
>>     - description: MX power domain
>>     - description: MXC power domain
>>
>> ?
> 
> This is correct and should be in top level, but you still need to
> restrict them per each variant (minItems: 3 or maxItems: 2).

So I was happy about how simple it was, until I realized we also need
to poke the VDD_GFX domain. It does however not necessarily exist on
all platforms and I don't want the binding to become a spaghetti of ifs..

CX & MX is present on all(?) platforms
GFX & MXC's (any combination of those, unfortunately) presence varies

Is there anything better I can do than creating a separate case for:

* CX_MX
* CX_MX_GFX
* CX_MX_MXC
* CX_MX_GFX_MXC

?

Konrad
