Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB6A3DBD7F
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844444; cv=none; b=Zqm70omy420rZciVURqm2eJ1xya56EZMcasxW2XLrpMZ83cGuWkCRsjotm92TLDq/m3TSHFeU9a2YcsErsHHeq9vrSs0Oyq51DtHAzjx4WggPIP16aKkl8hvRAHwxdXyoWQ7ChhxosY2qNoJlMWksae5d/7A9S09jzadPs0KtsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844444; c=relaxed/simple;
	bh=9p6tQs+mLyee3FtMZwaNEygInWPuLE++rtiwf4wLoCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6RcHxxPDdnUHowIF3uCtDezlmhwmOEzNvVH9nylpFwfM2YV/rXO6hdpBK8ah6ASLC4XeiVYkxDZVClY9C/Y3wWCFYbGF4Ipopds1MutFZq41mpfUDZtz/rPJgvp5E/XOnk8rfx80ZUlGzI55AFLtIUA7j4myOE1ULHQzGKG6+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQZ3a4lA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MaehRU4Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQZ3a4lA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MaehRU4Z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IC8j651458968
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 14:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvDkX8RsG9Lo1c/o4mDsdW9Ws2mDXEVxPEhrsdpPYsU=; b=nQZ3a4lAY2DD+UgK
	q5/LLvnUTzUgpKDPMOQ2OLyoMh7x0nqgwWxqx5m7U1ubuFJ+vE8DX4RKPq1kKD7V
	rdkK682e0vbRC0sDTJRFrBzpyKgsbBV3cNZUspIMM/RDFeYJ5K2J346FstTNbmrH
	ICyTaSdwJtEcsTYtwBiV96Qqm5pRXcLamRhHEimciMixnyhsIRYDckhCXrdo3926
	H7A4k9BM8yyfxDzquupt+TLH59k4kr9y8sj7D2P4FaDGa4Z52eBbQEoxYMvQXjV7
	K04wSiq2FYo1h96z9a51ADRDhsSYRIpW+gpe2RlVsTr5tLZdQ51BzFEL5xKC9PeC
	ZukWcA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut18hjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 14:34:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509007aea22so319951961cf.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 07:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773844440; x=1774449240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KvDkX8RsG9Lo1c/o4mDsdW9Ws2mDXEVxPEhrsdpPYsU=;
        b=MaehRU4ZeIcXysnwHDk4oPeqQNuZhKx4M/1JElj0SZSUyuxnIUFnYSQfx8jeKU9yt7
         70CQu+rvUuOgE11RCJ2P+/OUZwiX1/8J1ntBOxeqCIWU7c3a+sQdKLxb6opAEdqsEPDr
         G5pxfrSQn68dIa2BzGdESXITAklZWQ4VcEGYFLvdAKWGmxq4EWSiZHXL/v98xWbEpxYZ
         cniCGscXNgasSJqHqq3eCN92kNRgDvdVcUJPJp1znaUgxrv58Merjf8H2INiD326z87q
         MoVQ5YlUP2WFdOJ9Y++IXue/gKnIGDDAQwnWonaNNHPDwFmQd5X832p5VMU7x/hXtSqe
         LRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844440; x=1774449240;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvDkX8RsG9Lo1c/o4mDsdW9Ws2mDXEVxPEhrsdpPYsU=;
        b=JnJfExMHON1l7xoBcBqmgMe+pGDOF7GqQ4gY64HTVLMkVPXn5e2Lcb0kaNn0xaw2cT
         +m6yJPYtTl+ZvcOJuUnOh4k/5Q5rG6TR6dNyKGV1EtmFBqdNf9qF9XzFO6eUReng3lGZ
         GLWN3rIAeXGUf/AtT9TtFKHd+01N6G0SdXNWnnzfNdHVzgtSHlK9BoPV/9tqW7fS3mH9
         /A2a6fXklGBsWK6hQ9OVRpM3jgw2+idLFXylnM90pwhBmowcug0zyS9heniGoOYAxW1K
         SiMGHirVfnjMMcBw5TJYIuueL4flnu5ConxY/B8KQJe5AqgAOdBPZeqLYgMjnNYenAsx
         IMhw==
X-Forwarded-Encrypted: i=1; AJvYcCUPeEeX0gEC+Q9IANLNE26rXO5KyztUQqCbKxYalxgai4DRXWlwz3Nsu6ovB4SfDYJ0cPRBg0EpSuA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7zmb6TfW7O1H65yBSlBzIC9BGDwAoG5VpEW9xAU77biwtbnFh
	VSBmAomONwU9qwPkZzxq8chRL/or2XGIxdgSecnTVlDdD53tpOj9uy3nEroaaYKrdfdyexYP7Ll
	hj7wfrflFnKV+9g1SQ+JWvCI7TyYpsPvdOmADZMf1guQt4Fsc72ndXSAtW5STUWY=
X-Gm-Gg: ATEYQzypDriThfP/uleIblOY2rGv7MSXVuaisJFhGvEiXTUmLWsdY1rw2HgxyB7WamT
	ELqCMYRTlV5O7HjRhWA97uHq0tMlRA2DchzBMZ3CSaJO3H+vJwxI1qdWWAH4f05XDZuR5yiK9os
	Q1gaARUUZaVqQiAFDsyMshtLT7tBDGuA4ll4ErEJPwkB5oTvHfiSfYkW6Rxo0OOtPuwDmM1Lr1O
	G61fvElcwOSfmnq6ZnR+cQqhmRdU4nh/E6eWS17CBT4UqUOZHHvtKQoeIURImWZHT7AhF73OJcH
	PqJjk9A5engQiMWV8bnjpDtqL4ZP6lX+P25bT16t2FGaWKis5hw+ALpFxC+ZwMC2Wyvg0Eh5dj9
	qXMGfEUzqqb1LdATdH3U+NiHeXRMvlAZ3kdwHZxVfoTzm5m5G
X-Received: by 2002:ac8:5f93:0:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50b148bc253mr45865441cf.52.1773844440331;
        Wed, 18 Mar 2026 07:34:00 -0700 (PDT)
X-Received: by 2002:ac8:5f93:0:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50b148bc253mr45864721cf.52.1773844439720;
        Wed, 18 Mar 2026 07:33:59 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4b9892esm19606605e9.19.2026.03.18.07.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:33:57 -0700 (PDT)
Message-ID: <9ea16bfe-ac9b-405c-8597-e4f398347d8f@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 15:33:56 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
 <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
 <d2975a1a-04bb-4026-a0cd-34571f99ae02@oss.qualcomm.com>
 <2227a9d2-fb34-4d54-8122-c00f54009de1@oss.qualcomm.com>
 <846ae47c-8e0e-4fdb-899d-de679d013fa5@oss.qualcomm.com>
 <xofpfzgcsmjhprnnffqrwbauisbsctg7bedtri2vxtxk5zowz4@rjlmceevwesg>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <xofpfzgcsmjhprnnffqrwbauisbsctg7bedtri2vxtxk5zowz4@rjlmceevwesg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8f41vzWQuikROKSJo6tPPUBz4HM5XJNw
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bab7d9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0Xxaj_rZfRVFU6duThQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 8f41vzWQuikROKSJo6tPPUBz4HM5XJNw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyNCBTYWx0ZWRfXyQ7FTMgzgmYC
 i5WOulYHCzws+yB2MFEm2OLx3SRn3yWOs1ICeY/ldY0fp4E4WIB+d0LVmn8+N4CBHYGFCEfMLxM
 S1omCji8a9HIc9MEBDF9ajpJsfc3ITHYfaiGB2RfT6ZR/i9h/Y6+xpdXCzMrXdPFWxBQRl1bgg6
 plKzZkhvaBx5Kn00Wes9F7gS8eWifM/QXCwlZ47ylReKEahT9AMN4CX6sp5/U4JmnetwChn/kUt
 3ki5JT7zk9aAE3ltqq/Cf2Te63JAjnUlH1Ki6a0d0AT8R6tlU2hdECPRx1JrMH9uXlb0ibSIsQP
 SgdqfdfcAIl+oFUSgbectMnRqBXz2xZSMyHoXOj828wIqvWBCUsGy7TeeFUMtWU4EkFX4N3eINt
 udGkRuE9xSeRQNUgigAYDYk7SMyNJUYrfnuHJC8lEDJa28pD3zXcZlC1UtOLh3N/Y/tT4dYQ4no
 nYIQMAVQBs9Zs2Bdhxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180124

On 18/03/2026 14:46, Dmitry Baryshkov wrote:
> On Wed, Mar 18, 2026 at 12:36:24PM +0100, Krzysztof Kozlowski wrote:
>> On 18/03/2026 12:32, Konrad Dybcio wrote:
>>> On 3/18/26 12:13 PM, Krzysztof Kozlowski wrote:
>>>> On 18/03/2026 11:48, Konrad Dybcio wrote:
>>>>> On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
>>>>>> Add a driver for the display clock controller on Qualcomm Eliza SoC,
>>>>>> which is copied from SM8750 driver plus changes:
>>>>>>
>>>>>> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
>>>>>> 2. Eight new HDMI clocks,
>>>>>> 3. Different PLLs (lucid and pongo).
>>>>>>
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>
>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>> +/*
>>>>>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>>>>>> + * Copyright (c) 2023-2024, Linaro Ltd.
>>>>>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>
>>>>> -> Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>
>>>> That's the copyright I found in the downstream code I used in few places
>>>> here (with modifications) and I am not touching them. I also don't care
>>>> about these and I am surprised this keeps popping in community review...
>>>
>>> You may not care, but our legal department does..
>>
>> And your task as community maintainer is to care about community and
>> Linux kernel, not about legal department.
>>
>> Legal department can comment here, if they care. You as maintainer have
>> rather responsibilities regardless of that legal department.
>>
>> Don't bring corpo legal stuff to the community.
> 
> Then please follow the internal company guidelines as outlined in the
> legal&marketing documents.

That's not your task to instruct people what internal stuff should they
follow or not.

Especially not implied by previous comment "Then".

> 
> JFYI, several other Qualcomm maintainers also enforce use of copyright
> headers for Qualcomm-provided patches. Konrad is not unique here.

I already objected to one of them, so I know.

You do understand that this is completely broken review process? As
every contributor, I can object to that comment with arguments (and I
did in the past), however you as reviewer do not bring any
counter-arguments for that all. You just refer "follow legal internal
stuff". No, this does not work for that.

If you bring review comment you must be able to justify it, when it is
being discussed. You cannot refer "but legal team said".

Otherwise look for comments for your contributions where you are going
to receive review "please remove all boilerplate because my legal team
told me that and I am not going to provide actual arguments why".

Best regards,
Krzysztof
