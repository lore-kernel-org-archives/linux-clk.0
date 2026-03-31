Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74D33A9D87
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952229; cv=none; b=Wi8TtQwg5laMY6PUh3X2Uee8H/hYYj9RPKZuWOqn0QnxQOTbI3F+/2DZ68jYhTPCKtEEwIzRKSzCSxYm3oy/xSMwMS0AJ0Q5m+PC2QiXLVPPK/1MnA7vvrTHg2Gh5+RylRnuuQim6MZezYHkSvLvEfY7odhNU94IY4UJGnEfXck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952229; c=relaxed/simple;
	bh=Zg4Ozx7Sg/VGDX3zwMxzagQpkXxbVKtpFM1Lw2PFmJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VMThwxOpDffaFUD4t3QJiMEG2ToI0zsz+CWjGiGqFmXadIfBGRgKVgK+9lVcuhD7o1SITeqi8P4unLt7b81QJIwKyZv6VrUDIDJmlr+6Hd9Q5ulV9cVZVOvsVG9XnuFpS4RUN4x8VgnyTf/Ubox7RtSnsAi+pXWTP7xqql1qjVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loXJfLsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGrQRP62; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loXJfLsl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGrQRP62"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V918vn2761505
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=; b=loXJfLsleyyK2lYk
	uUqEUWFp00l/vt2tn+U3wXTNfpw2JRYo4gzMgTuy6J0/uG8k+4PKq8OHAvufrzaJ
	6y4BNNrQ6nmC3zp0zQXKTurNGkkcaM/r6N/Qkhed2fa1vlRN+Geqt5d6Q9YnUCyz
	G0yn1c50zJoKaXna701oSwDAnh7NOB+GySLqiO1brg+Gi2EdLRVYl+ZigbF8qRjr
	cR61pM7/rrvBRksOMRhy0QPPlxIsJBFzSI7SNSDlfQwezPlVuf+dg9BovZhsZxwD
	60pDLZEkbp77A0gHRfkVlvAYKW6ZDkLB/3Yhke1+QkAfcEDe0M45BZrQSRkTYXmt
	N/He/w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b930asb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:17:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ed6f0c71aso12076996d6.1
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774952227; x=1775557027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=;
        b=PGrQRP620wRXEKp+W1/3g972RGd2pe4HIna0rwNULUqEQUOMYtuhNG4guqMV6/I4Wz
         tE7PwbIPAcvNcGqiBxIiyuk2Lw/tHgPowqf+597yTXWLqBkvCNpTflBu3tUkE+n+VKIO
         gCBGfI2ImkI9OAqTFzWVERJyyPffR+tIBXeHVPmY0L/sygZ+umfXYpF2NDXVaR+9XMNn
         hUG9uFHUkb+yYfEWRfqqP4G2t2VJw4SxB4i8rC3rUPNl/dSH0NHR8DGD6UUfOQygbLeN
         60qbXW9nhfeL4mKkaJ1R4sp0UID/BEXBQDci9+xmNHjC2hSqwAMAb58kE5aMh6Wf8h8o
         UZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952227; x=1775557027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=;
        b=ZZLeCPgxQar12Vd3o5rjivdTKyQZ2757VTVaYcw4YMrQQ6mmztT0q7WuigLgicVxDe
         3g6kdAKYIGK7S+IbTF6pbUUoJGeXaRz86X2jr4WKf7kOFcxZVRP5RdbU4mktV5pkY+Hs
         3STC7Wai1ZTKHpytYgcIjTk+mP/J2qn2H2xvO+GTSjljnUtDWvvDDTE3aZ6CiTOZY4IN
         9aP/TDur32N0Jn4ay9y2sHzGFM6BgbFEYJbzgNSAX2l5VXuPi9r/roCkSMOSgbWZd0hw
         QlAjvVbRJ9XygaPs4RMwwQFTBHXT1a+9BWjsl8i8tlKg1dVQvR2lal+Wa79sHj9ixdvZ
         sgtg==
X-Forwarded-Encrypted: i=1; AJvYcCV7Oz8zzgaMMWilwpXYAk6kNbhsfASKrCA9mDcXs6FcBTi7RXeuw85XREW+hE/drY93Y0n/AKAuDwM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+XTM0G0rryGaJvhwtYNsUmO4VLfLtDu3O/x4HVgRFIS+LoPhn
	msuQHibZZg7CzMFIKYg/m56S19x2kvAvsNSxXEnFCUF4mOHovn9zOA51ZHayVCRw4gQgQAUfijC
	ZE1KdwGAQU0LU6Th3jri5k57l8RWFg83yJp1GddKr8nOnEEw8zl0TSMRonsx7V3g=
X-Gm-Gg: ATEYQzyuQVzgGqh7BNfq3etpGm83Ogvxwm7piEj6l43OZUShjKFVDzzlzF702GH4khs
	xMFNjpr8vZI0xum+wwB1xumDWsDMEAz9bQZmIwewNxwwLgncbqcljroGKDk/5nnOz/XYP5oLZdo
	KkNAafXoMxOA/sQGxwrpYxVQZSZvQyyqWNr1LPGXs6pjmq5g3/ptjykYfUbjuGlrs/eRKJMKCRE
	vSXGOKUlAiv4cG3TjPPvHgzIXtSzRPGu0NJPT4DngVt+/mW58kf7HQId9ZzQHxxrrujCTs+QXIW
	CZRHA7Q9Sw9uVbjc99qW2TjYq6sE7FPbYOfpCYvK2D5Gm7+ZsyPL3YQ85gPnyTqmTIxeA+FEoMi
	zZvd8F4VEtysP8PmCjb1HPxjwNII+MwRtMQH1NHDxPGJTAIizs54RLSto+90+hBWOJebtVlC8mu
	nQSRs=
X-Received: by 2002:a05:6214:27cb:b0:89a:45d4:4e42 with SMTP id 6a1803df08f44-89ce8f96a82mr171653036d6.5.1774952226916;
        Tue, 31 Mar 2026 03:17:06 -0700 (PDT)
X-Received: by 2002:a05:6214:27cb:b0:89a:45d4:4e42 with SMTP id 6a1803df08f44-89ce8f96a82mr171652776d6.5.1774952226451;
        Tue, 31 Mar 2026 03:17:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a6744sm377853566b.30.2026.03.31.03.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:17:05 -0700 (PDT)
Message-ID: <3e3428e2-b07e-4d65-9cb4-afad1a943bb5@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:17:03 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
 <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
 <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5OCBTYWx0ZWRfXwSfF7qb35r/+
 kXdOhvHRsjcQwK93242kGdZY9ff2jbmrOMGV8FWA1yqH8/8QYlgHBg1+roQz5vdTSkkskhHH/41
 jDOXANQAZGjZ1ZW8pQMUODBwKpbiWTgWzKwS40uKRriD3WQRDveKdnyUOKoP92u+S46XtVYCqAY
 JoHPDQ7AyrjJ+F6Zm8O47rLtqMZ73ndzysuz+eC+2LQxpudSFDKPlxAGn/Q3oXu0uIItmpv1+gV
 E132i9gl4lzv5hLVm0TJauRSfEVIOMrOwsUtRhivtwHuqGAQEmvy3uSGkRUlSzg++X7WLRFtzDk
 rjyG8Izp1IHR8wPon7fCcmiyRb2ox6FPwwkSDnELr8o+I1M54O0BcExyYrClWMOOSSR7W1TX95t
 F5HuZC9l2Ejo5BLFFRSMpmPM5COtnPHTHeJPrdu8/IowUU2rmHPMIvNNrUh0xTRXzXjZ6evEWT8
 GM5WHQksjh39tFHoCIw==
X-Proofpoint-ORIG-GUID: Cq3BlBkHZWTAs-KkzjXYS_FrMjmGjlUo
X-Proofpoint-GUID: Cq3BlBkHZWTAs-KkzjXYS_FrMjmGjlUo
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cb9f23 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=y-Wd9Zd1aYVehlAUloYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310098

On 3/31/26 12:13 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 12:10, Konrad Dybcio wrote:
>> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>>> and is not modified: neither by the driver defining it nor by common.c
>>>>> code using it.
>>>>>
>>>>> Make it const for code safety and code readability.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> --- a/drivers/clk/qcom/common.h
>>>>> +++ b/drivers/clk/qcom/common.h
>>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>>  	size_t num_icc_hws;
>>>>>  	unsigned int icc_first_node_id;
>>>>>  	bool use_rpm;
>>>>> -	struct qcom_cc_driver_data *driver_data;
>>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>>
>>>> This can be a const ptr to const data, even
>>>
>>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>>> they also could. If doing this change, let's make it consistent - so
>>> shall all of them be const?
>>
>> I thought about it, but then it turns out that videocc-sm8550.c has:
>>
>> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
>>
>> So we'd have to duplicate the entire struct
> 
> No, that's not a problem. Pointer is not modified and we speak here
> about const pointer.

Right, I already had constifying the various struct members in mind

Konrad
