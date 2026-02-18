Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE2130BB88
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771413872; cv=none; b=HCguk52ZsszLkNUArEcM4nrOSepBDdNNw57Y/+WaJjuJTvkfVZxUlmRPZzy1+BMq2nPEPU7xLF4imb5Xtqt/pD73PxW3JEbQ5q86yFARuoYFrT3d8fMQ0uRoQ8dh+sWZ3DEMAo/qC1TUV+ih9IsgvW64aXlOnaQmlPRxhPS3GPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771413872; c=relaxed/simple;
	bh=t3n84ScvnFt/PXH+NefQQz4XVZm8WFyP0DLTedCYLKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F57cyMdypvYpbKhc09Oe55gTWPLFfh/l6zJdDPrXOBokO1jrDPNiknA17I19B6zTEDWi14Prlg0pFnzG9Rk3BDSW2WazZn215+nfeuZYKXBWRQatPDUnM01bK9rvRmehPX6zwg065EJo3L0D8GD/EjDK6xjK1X9HcjIXn+a/5io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrsCQP3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlhGi0wv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrsCQP3/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BlhGi0wv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8X3H01942820
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 11:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAXKc5L07Ay1wu1nVRVtQejd6bLqqaeTZlMEgqGt6js=; b=NrsCQP3/XLjHF/eP
	s1SF9G3wPkoR6/F/lYbEzRwIN9K0V7idR3JlFq6wRFc/E96lsePfxJ0Za49Luq5o
	pieNrKuTKzfWDcr4AHAUqZb7C6YkMyx0ISc7BpPqomBNj0baG3I6xtsAbelpUpDa
	8cIaVPqE72NBHw8EnWQ6SjjYMWYzRIciz35rzpRYwuYeJN4qYChtX7hZ2cyEJv3o
	DeR2dmz4YVUR6a4H+s1yEH6Maqt7GjBW1v95gwMz8RnxXXOxueMnbV3KPMTL6LNK
	YhI1oKw7jTdlKk3FyjqtrwMAj5GSW8Kfs3KBFSQJbKfadE4l7z9gyE+wEKSAX5Kx
	8narwA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g3vgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 11:24:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8966be97747so36810146d6.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 03:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771413869; x=1772018669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAXKc5L07Ay1wu1nVRVtQejd6bLqqaeTZlMEgqGt6js=;
        b=BlhGi0wvZbv8cc6HHEGuhsQj/qIniSQ4CxL1UsIy8O8WUosQg+Fd8rpmoVUFf3saCl
         yTw8P3nPa2s04/AuKGws67vdyBOfBdwiGgXjKyiE+H7rOmPpI1R6pDwAolgxQKYdMcL7
         BCVtiTfgr+kX6l15GJ2cc3hOUmZ5nieykxnd0QLSfIwf5lx97NA/v35RKBEewRk+zORt
         KYr5Z9Rxoh0/0LCC0qZO7WS1i1Mz+SK082euEodxtfGZrxYDghESNul++AQ+NvFMaZij
         7dgS1jVl4nfaJbQTsA3kUEvKv2fAKs0Ui+04kRPiBs0Kg8oH67yExKll/b29EF4fCHx0
         WTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771413869; x=1772018669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAXKc5L07Ay1wu1nVRVtQejd6bLqqaeTZlMEgqGt6js=;
        b=oNGWyljDejHzjb/t5Jp8ZM5RkeCyBKf0YacGd9acNqWdqrSj4xSPLI1e5wn6sGEB7g
         MasT9UkPbW48kMhvvcE7CGlqFijKfaH3q9NTW51sxLAi9Hbh0yRIsBd3t1gz7Oq4AT7E
         V9G/lMqeuNZn8i53he/7zJVy8QjIIF5JnOzrnRfqiTTaaBGnCFsFZ0C2jdrDKGwqKK57
         ofo6wrVs8gKZGd7JF7avX2b9ajRDdCoHvaKYeO0STfMJJT/Z1tEaRABH0RmKhUhzplrV
         21Yt5TL9Cn6sKis1X3qugfYsoC6vFK7P1/FPccODgR6daT4RfPzxd2QpdSYsdxrA4MLX
         mM7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX26s0dg/1wqZkVaAh7Y2YDc1N9BXYmk4PCHPda/Eb2tvtqFNPPJoZ7s247ve33NCRX4L4EYCJ1SHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSisOjxedqv2cv29h6RBU3bjjlgIDc2BZbvjyCB7IkGxkBfe1Y
	kMUsJnyCAUGAioMXKDojmewn8xIFzV89MT4eNICvmUCAnlTea1qU/5MOg+XeEtX7wU6LQ11om/v
	51vck2olUXZVsryxzX+2POkkq+snIbF69xDnMhEAkk5Q/IMCdX/Ex6dowO1MZbKk=
X-Gm-Gg: AZuq6aLBEdLK4ifNDd8V3jPesKn+lXtiNlP02fHlGGerjveQ4iEvqF95/vqY+yn4/4P
	WWPbhENIsOXeVvGDXOGD5hRiVeUHbr0+/JYK3J4W0SxT5ZbaroaHsdUHxKDqvCKbVLoQZQ0mx1z
	emS0MwsYp7qQ/q/E9ee9cyJOCmSoUOyq5yLU9wcHmkpLMp/5hXEmM1FhT1U7M9wD8OVusxwbCwX
	WOdc3n/XDRYInoO+Lebjpoj8oJCJSrVi/sO1veJOledMAvyA74S5ATyS8Y4BJsmX8NyMyWrPBSm
	y9aq905XBSNh/eGpN1OJSBjZh6mmMEXoYukYrjRbRfS8rmsYACuISxEM0wdUHLgDFHM2HwjvDPi
	E++l5prv6+dZ8+FwqxAbs71y5qVuKVFRNk/QVfYyZDPPZk23sIP7We2KodjRNdYTu3X7hZN+Ypj
	apJc4=
X-Received: by 2002:ad4:55ca:0:b0:899:5565:efac with SMTP id 6a1803df08f44-8995565f010mr19929936d6.3.1771413869678;
        Wed, 18 Feb 2026 03:24:29 -0800 (PST)
X-Received: by 2002:ad4:55ca:0:b0:899:5565:efac with SMTP id 6a1803df08f44-8995565f010mr19929746d6.3.1771413869292;
        Wed, 18 Feb 2026 03:24:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7629b56sm458895166b.37.2026.02.18.03.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 03:24:28 -0800 (PST)
Message-ID: <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 12:24:26 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwMSBTYWx0ZWRfXyBSav2i8ZMxn
 K89EFKcgCbka0tQC8VJUht1yj2O9mmxScWRX5g64089+r4By0VAV4TOEqFQAD1MW/7mMiMLGPP/
 Adih45V3jmhaEVi2BUCjXcQLyvZtgLRQADmW/Fv2splk/KgFlLxZEnmbV/TxA+bvfLXHv1t0XBO
 //aQQ2bsPw1+t1lD7eEjNuo7Gk1sy7NfgzV5Cm4au3QXUL731uIkeiGgoGUCdSYimoDFRy7ae3q
 4NY35ybPMz/EeiBIrmlN8wc+eZlryVXhWhfHTtwOzBUv79Tl/8GpCLokES5mzolrbR599LpIkfb
 Fc6LgCJ1Megv237IwEAVWcaO+eYWoXHh8wrkxy1cH9VzAUsMZka9as1W/pr1OnZEI1d+NWvWK1P
 ZDJIp40qtJMvKNU0MXRb/MHEb8x+U+/gQlTl7Wivd6e1u8K7YEXcJjIg8r2QfnU5GgbvVx9ZIJC
 A44Nv2Z/7kxPcm5Qxsw==
X-Proofpoint-ORIG-GUID: WVuK1wQWaKgN2hcnvgG-rte1snsElc58
X-Proofpoint-GUID: WVuK1wQWaKgN2hcnvgG-rte1snsElc58
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=6995a16e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=SXzkmgPmAAAA:8 a=VwQbUJbxAAAA:8 a=QSeG49lCECCrRmREOcMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180101

On 2/18/26 12:18 PM, David Heidelberg wrote:
> On 18/02/2026 11:30, Konrad Dybcio wrote:
>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> If the OS does not support recovering the state left by the
>>> bootloader it needs a way to reset display hardware, so that it can
>>> start from a clean state. Add a reference to the relevant reset.
>>
>> This is not the relevant reset
>>
>> You want MDSS_CORE_BCR @ 0xaf0_2000
> 
> Thanks, I prepared the fixes [1].
> 
> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
> 
> David
> 
> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/

Please don't alter the contents of dt-bindings, it really doesn't matter
if on sdm845 it's reset0 or reset1, that's why we define them in the first
place 

Konrad
