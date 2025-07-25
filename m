Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770F7253B5C
	for <linux-clk@vger.kernel.org>; Fri, 25 Jul 2025 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753435439; cv=none; b=tpWlSZzTo91bRr69SediBpnbzE9aryFKB7iMlvHbnWNhin5pe0C/wuhkYLQgzd0f2iCkF0lsawx7A02JooEK5ekunXC9kNtSSjidwgtvBf1I9Q0qkfpO9Dm4Pysw12SGLBvAElaTNNgK5ydlUpQ7GGJzGVK9y5x2nQJ9WNalaMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753435439; c=relaxed/simple;
	bh=Dloj46RLVL4mRBXYmPz0/KvEtFoPFJB/naJFsvdgGkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJkYBenNDSRtkHNAUzrwK4MNrGKBa1gHSA9SVlvjWx9IwLxYD0RgR+dFtmunmJzxtvhfgWERQX9eihM4tVNb5QFmJT/FeTxbGxF0ga4ysycDF6fjX2DRQdLwfR+fEtkYPVjdPWGENB6/fMvcGRGmc7Q20FzG3nLZvY2z7J5BQX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgBC+3be; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgBC+3be"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P97kEC004564
	for <linux-clk@vger.kernel.org>; Fri, 25 Jul 2025 09:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dloj46RLVL4mRBXYmPz0/KvEtFoPFJB/naJFsvdgGkk=; b=jgBC+3be9f55Wejc
	gks88R3qugek5GEqHZ62QR539xCGy8pI/WecpsTt7WnvT9lHDhuSp2ffynAi5yll
	yTfff2L1rFUllvMA3nMfWgQozkCo/gy7P/LVsf3q3Brk/Sf06mh5hpPznZHnMX9s
	KYyqfhplTDXZSYhdIjN2j2NN0FQYEB6gElCLHc0i8lk6B4xxowevnBqYJMh3Y2YA
	vrBR45+vjuySZriyyc+xbvjZcuYoRPbml3iQ7rTZ1QRBEdQN7P7PycANS+nM8Hqy
	AnenL6Y5N6yZkjP2v/DjhiuePP8B9Xy7fI2AaIMSzf2cDgvbYKm2iYOsUwl+JS2l
	fI2SQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w539hdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Jul 2025 09:23:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab60b83e11so1467271cf.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Jul 2025 02:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753435434; x=1754040234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dloj46RLVL4mRBXYmPz0/KvEtFoPFJB/naJFsvdgGkk=;
        b=TaEW8FhdA2Vv64+wcS1gqZLYfUTKEK8eMEJqvilDzxwGfgRbK26U5davvSSfCltnIg
         kbJny+qFja5MlmY9ZwRQx/+KO1hrMCiBW9J9mpo6ihNtg92l9Ws6kK8rgcix8XPYP1/B
         bLgIT4gLDUPHEcaBfDhUIbI2jPeNY5gQEx6spJ2r5LliY0+nMCIroBY3M6kBE2xdyqMo
         fyOHgbr5gTvFvHjhgMNlMQDk5hD7uSpf2/DhkIDtv2LRuwIZx4d3UgKxTjc96v6yJEcy
         njYrfH9PhzlNX03NmttWU9w5tydMXozBf7ovQzP6C5wixcLur9WCZ3JW1PXhHc34phA4
         tqsw==
X-Forwarded-Encrypted: i=1; AJvYcCWCNiXGUKnGd8pq5dQsX8E8TAjxeDPVQ8ZLwWX7iX4g8TLLX05euJqMp1Q4nV4OlP4deThweJXIGPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk9cV05Dyi4kphup+nFoCnUv7nOWNVcUcS6vqO9eaYPAmbsnyQ
	MZkeIBCAS+A3AuDyxxAiOzg7tB2dLX3UQVXMuKpWOhiDpmUrAeSIgjU++hrIZ4wcg3Dq58mkUKa
	vh2FwMXWlJHnjiRJsmm7wxoBWWRzD8VMfVrYkMcWWqBgHlkdBcltg3fgTzLfCmtU=
X-Gm-Gg: ASbGncujdbZBEsUb9A2kEo2QxcLmwH4UihARd+pVV0FcHzmFMi+aC1/BVVM0yjbFvJs
	K6pSANyDtNaQH+gJqal8cQ8Rxq3F3AhC7xcuIL+DLJkcoY6I8hGOGHlbRFIwkhQBNie3tfGKddU
	E4Yd8AV4qeNF0bxbiCu94G0/uUX0R7TrHJ4OLqW8bo73NySAgvP225XWUs6xNHOmohQv3DjSZjZ
	tTHPyJzbO0aZDESejs1t/k+E5xdbziooAfjBT8TkDi611Nyn/tDPQS7gp7Ni28YtbiE0AQK50i1
	nS2pDiwqDmk6TRoBpNDVht1Cj40u13FDboKB7Ny6tqDAM9+oc4NX6z75unFkPGqOcGaiOgXJP6k
	FjNv+dQ2tRg/ddhefzw==
X-Received: by 2002:a05:622a:11d3:b0:4a5:aaeb:dce2 with SMTP id d75a77b69052e-4ae8f015169mr5405631cf.10.1753435434588;
        Fri, 25 Jul 2025 02:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgulUkKqOz4bY42aroheUkGoGh4nZBDDpLlQeXSeqH6w6hf4y0ytwWggsRf8Lzc3sqtruYOg==
X-Received: by 2002:a05:622a:11d3:b0:4a5:aaeb:dce2 with SMTP id d75a77b69052e-4ae8f015169mr5405431cf.10.1753435434080;
        Fri, 25 Jul 2025 02:23:54 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cd650basm239257966b.58.2025.07.25.02.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:23:52 -0700 (PDT)
Message-ID: <adffdc2f-7dbc-41ea-ac9a-015af251b43b@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 11:23:50 +0200
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
 <7d444f4c-fa1f-4436-b93a-f2d2b6d49de2@oss.qualcomm.com>
 <a3846433-f1f8-4b83-a965-baec24ee5159@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a3846433-f1f8-4b83-a965-baec24ee5159@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AfKxH2XG c=1 sm=1 tr=0 ts=68834d2b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=S94FfrcSPokYo2a8pT4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3OSBTYWx0ZWRfX9ctNcvpFGyuU
 JRM8CX4JajK5/NIEiHZCtlxI4lQrGVs+ZZZVNAwQy0gqRbFmFxdYvmY3lG8hFoDybtktqb12LOr
 fzcwipz8w9CzopN8bduFSl/UglONXNwUnq8bBno2gSlUMhKk7RMylK172w6IQIMbJg8GmXwBuUm
 Y6HIAaUMdtrt4yYkCOkMz7p2iaw48AdUwNrB6Lqb/bZvK4ha2LQY9WNm0Gax4yQqt/fGbPFZwFq
 aAFv+QDlsOrN9TUwJVS32Y/VwoIx8wlcEW2UPSulzLcej8karSe8SG6ZP0ZPSy6vvao1VeTtCKF
 hPtSLF46yFDpuKw29l8JAAwli5+VHR1M/Ixa6GrooK9/gkmDznX4nGrTq0oYsaYZODgOMc5yZjT
 ryd77Cd/fR88FfDBXCqtRIumuyDhMhcSI/gWzEEV4pEzhaQMqSVcWWlgKLZkHBIviXGtG7Wr
X-Proofpoint-GUID: DYXNe-NN-dNFZA3O88pR1A3B-vVlJ82b
X-Proofpoint-ORIG-GUID: DYXNe-NN-dNFZA3O88pR1A3B-vVlJ82b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250079

On 7/24/25 4:42 PM, Krzysztof Kozlowski wrote:
> On 24/07/2025 12:53, Konrad Dybcio wrote:
>> On 7/24/25 10:18 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Jul 23, 2025 at 10:38:48PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> The SM8750 features a "traditional" GPU_CC block, much of which is
>>>> controlled through the GMU microcontroller. Additionally, there's
>>>> an separate GX_CC block, where the GX GDSC is moved.
>>>>
>>>> Add bindings to accommodate for that.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---

[...]

> Yes, qcom,gcc. If that was missing intentionally, it is fine assuming
> you implement the rest of comments.

With the description addition that you suggested above, should I keep
this file in clocks/ after all?

Konrad
