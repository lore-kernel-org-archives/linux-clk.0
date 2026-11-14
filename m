Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673761;
	b=40VjcpguZ/85HXAuHqsrMk2Wv+UyK+rSx1CUXA/mOlXPFDU7H/JGaialWXNhL5Du9Jm7
	 toZ3jIdAKtPMAZo260NcBTfLu2LIYcSgsmaKDgYwG9QWJIBbEOyVwtBOaBnE+9NW2OpfK
	 KXuejr906PMiREayu6a+YgbI6nVvlfZPK8oNAOHvzNwCIGMjxXIgJgB08nPBLkRz/frdl
	 JNlTbgqdxLxr9nAEzIkf9QsLYJNiPHaXBno5APTZ6yfTr2l5XogHQGZk//CkkpYqqRTOk
	 qWHwY4CxcY4buR42WOuf3KIR/khzQh9xRB4bSBhMtVGTLwy4qWpF+69vjyUCT0odZzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cFSv36haa/S2tWhIqa+FIbiJpV2o1Z/WfYOu8JEVZLE=;
	b=ewwzhmVEHuMsO32aEhQP/ZRmKMduzOCAguA0rOGHFsnQd2RFJTkYWrk50lfvbPfvLidn
	 r0Hl+eOA2lL0EzrRXnmUn5d/kaEqbgWNBDH+nkqnaUdV9qx8jYEsbsBUSAM+NVgdx5Hhq
	 nOT62ebAuSb9e98Zdh+rHsBg+A2cgxzSn3polTfDQG4ZC030l618zm83R55JUpdLq4/B9
	 pXjBEo18riVnzJnssNV5Ot3e/Y/FmlIjt5sDUlw5qJX/lf+sg3Mg/ZfbSZBZu2iq6SADh
	 wPmBYUQEBcvs0xGwCS5sRL8NXk1zip7xjUkzdX+7PjpLR+cgIOgZcVFpAV/oDDgf8Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvznF1Xh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CIGaB6OB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6783E606A32D
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 16:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6783E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvznF1Xh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CIGaB6OB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDl0ZJ1557145
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 16:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFSv36haa/S2tWhIqa+FIbiJpV2o1Z/WfYOu8JEVZLE=; b=UvznF1XhPrghuV2M
	PrLHrrYddfSUSSJ1n8PYnT6QykUVLrDWkEP/ZkswjOW+z6avptbOaQXIkm7wTwgE
	TCBDTryheIMQHfSqTqEzyueFvC0Tr4L+ekmzi7jKVZAcmX6nFHhsy2Zq/v78ltc7
	BZ05eiOpV5p3gArlYLR60JGc0p0V7rPOzQUzwF70GZBY4r77KXA1E5KENnA8bN/i
	O0W/Q6++mZC+m/H/vjx9EQFEf/pzIBpM2WqkIF0gb/DJl6dsxFDTcgfWBn71QR5Q
	bXZ09I8PiU9AHAOjWFJA9Wc5iCjo2loxEqAURDhLG1uFRv8Z8Ps1C6XdAyXEaU5Y
	EdX4qQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8s5hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 16:29:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-378722fd4a3so2348785eec.0
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 08:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794673758; x=1795278558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFSv36haa/S2tWhIqa+FIbiJpV2o1Z/WfYOu8JEVZLE=;
        b=CIGaB6OBcuJStLHbOWYc/o7PukfiRwqFS1hm0IriIJapguovIxEWDsCCUTiq5kpoyq
         nBmoALJfc+wUnFfqx2m/RpObSk4wugb63gReCTTFDYj160BgIwPMWRzpAN1076Lx4NZJ
         GTY0yGdqGdoA+qT5f+Z7AHM51yOUj8SpdYYjcG80yjPADr60h+CnixNMW5MWnPzosjdz
         nM+ibGlg20LMcmhekVIWLIqSCraD8PDtuaGV56xfuubXtw9a2/pFRF9EV5KiBxfYt88e
         hWwaKZd/oKrOE/4uG9q7HDK9GAdpflR5ZR4DvIO9mbRnrTNQTcc3Cwxh1bgBytP+iiBe
         03CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673758; x=1795278558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFSv36haa/S2tWhIqa+FIbiJpV2o1Z/WfYOu8JEVZLE=;
        b=PI/L29VGNjhRkuFhNmkmEhNDp3ulynqE+IikinzJVHlWPgOh7GFYZInt+SiGHCxIrU
         z/QozEVvyvH2vVsEGsBU2FtVuIDgKQVReitgrmc6M0y8tmBIJ6cG11CMV6IAXqh+Tt2J
         15b5OKDk4qPhy7tUjz623sYaL0+OXBTHVUlkgLky4Cd80SDp9z15bspqJMFo0cBE2Anq
         61Q+3pWi4bwIbz7VQQj3RzFBad2czyGq0fdfiW971v7wa2ltqnUMPQTSkdWFyJOme4+M
         sckkkYe23+hpVbijwD8scme3atCQMXIu/yk2OfSIjBmECzgbytE7wlAhYq67YygYN5Xt
         SeEg==
X-Forwarded-Encrypted: i=1; AL+hErHrS+DRPSgoHDHNK9XdFZOICaBhpbzWdP+LjaOaf+G9rS3z7ZrvdjgVquH6bUti0gzGsR7w04GsAc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VUUsTXJv04tSX5asLgrlmxr41R9DmrBK4G2K3YTa21QmBkzWi
	agEeUTOlgTcB0navUeiSIBk4VMmixxnRCFdnvhm1X00DMIkhiurg8ZrqlZKuPFiXPway9Us7B0j
	KzRqparl9WUFuDHjt8xMFJEgpCnxju/ZhZdzt6lFgCrAWvym0HmRQm6lvfOEZXwI=
X-Gm-Gg: AYBFou3a2XgyhzpZ2bhNSlcLEL2dS9wTizQyiOCvkaYfBAX6XPrwv8kTdRpG6easuQ8
	Ximnm9g2kVvEiilA3HF5tbD69ZEz32R8fxV1pmxW6OrqTWmSpOPfo6X3pRWeKodXDoQ6JlM1D0J
	LyepWz+SGaexGVJhy4pelaKyu/qHdmXTLPH4ABc55rHHZ2p2+UTfK7gBGKjmQWKEPiBYyEPH2Np
	pwgeSjME4KDxy6pORqO3yx27THyvx7w1dwe/Sl1atqKvCPDt9mwIUnneMAal/O/4YSeCCXe3S70
	ZYJ+mXvIAg2YQNZgvzUc5aijj5w7NptUlID6YrrTdOCT+OEhs3nB9qcMAjSRd+9Lwb6KwtJtayH
	+oW4Aasu0bwebyZ4pJzajBmGUfOgjq2egmGwS4gB8SC0Hxm4CuS0T0xGmN8r+EXdC+nJNUsLGNK
	96PVF6731gHX1Ur089tQ==
X-Received: by 2002:a05:693c:808f:b0:375:ed63:5f12 with SMTP id 5a478bee46e88-37966a5595bmr6632331eec.22.1794673758055;
        Sat, 14 Nov 2026 08:29:18 -0800 (PST)
X-Received: by 2002:a05:693c:808f:b0:375:ed63:5f12 with SMTP id 5a478bee46e88-37966a5595bmr6632287eec.22.1794673757370;
        Sat, 14 Nov 2026 08:29:17 -0800 (PST)
Received: from [192.168.1.12] ([122.164.84.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm30930509eec.25.2026.11.14.08.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 08:29:16 -0800 (PST)
Message-ID: <4a2b0d2a-129b-452e-84d1-dad83353b10f@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 21:59:09 +0530
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] dt-bindings: clock: qcom: ipq5332-gcc: Describe
 clock inputs per compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-5-d242e3d49648@oss.qualcomm.com>
 <62a5fabc-3a06-42fa-9c6b-6504650e712b@kernel.org>
 <7bcffc7c-5dda-4ead-a053-7eb4980e43a4@oss.qualcomm.com>
 <bec2bee4-dd38-4846-91d7-006fe38fc9da@kernel.org>
 <af43c724-89b9-456d-a5da-0d8ba46a9b8d@oss.qualcomm.com>
 <e8dadc91-226d-4b05-8de1-4b22318fc7ea@oss.qualcomm.com>
 <ed3c4e4b-7c6a-46ea-b07c-ba7ce6214830@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <ed3c4e4b-7c6a-46ea-b07c-ba7ce6214830@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af88c5f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cs/8+e8xk1Wfje/1H545Gg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Mw7ywA0MMAP2sS5nzLUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2NSBTYWx0ZWRfX6ATRuos+GIfs
 YoGOfMIlXJpt5eGMDRrlEDJOyEpjdKYoHevl25NnZZRU6Q/6m9mBvh70XFgdJPb8L8WiezQIsj8
 56QpU1q30gOP7IcSeRTdh+jMpPrDTU0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2NSBTYWx0ZWRfXxQF/zadaLDNt
 Kifb+KXHq3sT1DVLMUReK9itRAmFmlYThOPV/WLLLKVwMJ62Vpf/qcWJu0fIQGSRzuFyO7/ESgR
 efTbg4ZY9cLA/3C3fzwBIolw+C9h3lqNHd34aWXC+rF5w2k72yFbnsqJFgVg5D3gekD7TlnAYIF
 iYCHMMXGzcMYbemjNZzWGxewZNdV4XMB5T6+NxJxi2BrSf9zG1Ts+UQeehItc3scYb7fkk40tD6
 /BG21698r8rpFdBTaXlk8D4iA2vQm0a8YFXE7LENDLkt31Jl52YNzXzjKeLUok+CVkyxBgLTEnn
 MCm/vYY5b9AHZSN6IYsnh2UFu31Ds7Vm6VO2bFkncX4SvH+/ChDeq01GIOn77Hg1kfOQ9uPsHSK
 qaVqv9Z0MQIAzJLWdG/I6me1SFAyRGxMWO/xbOyaa1Hv+syfAYBlRcNW0AcV4OayYLi/QVOY1Wd
 o+DP94VbIWtPDwJCZ7Q==
X-Proofpoint-ORIG-GUID: CTQDmKYh_y3cg41LBDBpBPlhIjgdOyqw
X-Proofpoint-GUID: CTQDmKYh_y3cg41LBDBpBPlhIjgdOyqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140065


On 11/12/2026 3:02 PM, Krzysztof Kozlowski wrote:
> On 12/11/2026 10:12, Kathiravan Thirumoorthy wrote:
>> On 9/25/2026 12:09 PM, Kathiravan Thirumoorthy wrote:
>>> On 9/24/2026 4:28 PM, Krzysztof Kozlowski wrote:
>>>> On 24/09/2026 11:15, Kathiravan Thirumoorthy wrote:
>>>>> On 9/23/2026 2:17 PM, Krzysztof Kozlowski wrote:
>>>>>> On 21/09/2026 08:19, Kathiravan Thirumoorthy wrote:
>>>>>>> The IPQ5332 and IPQ5424 GCC blocks use different clock input
>>>>>>> orderings.
>>>>>>> Document the clock inputs in compatible-specific schema
>>>>>>> constraints instead
>>>>>>> of using a common clock description.
>>>>>>>
>>>>>>> Also add the 375 MHz PPE clock generated by the CMN PLL to the
>>>>>>> IPQ5424
>>>>>>> clock input list.
>>>>>>>
>>>>>>> This keeps the binding aligned with the clock ordering used by the
>>>>>>> existing DTS and GCC driver implementations.
>>>>>>>
>>>>>>> Signed-off-by: Kathiravan Thirumoorthy
>>>>>>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>     .../bindings/clock/qcom,ipq5332-gcc.yaml           | 26
>>>>>>> +++++++++++++---------
>>>>>>>     1 file changed, 16 insertions(+), 10 deletions(-)
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>>>>>> b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>>>>>> index 1230183fc0a9..fb39dffca988 100644
>>>>>>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>>>>>> @@ -25,14 +25,7 @@ properties:
>>>>>>>          clocks:
>>>>>>>         minItems: 5
>>>>>>> -    items:
>>>>>>> -      - description: Board XO clock source
>>>>>>> -      - description: Sleep clock source
>>>>>>> -      - description: PCIE 2lane PHY pipe clock source
>>>>>>> -      - description: PCIE 2lane x1 PHY pipe clock source (For
>>>>>>> second lane)
>>>>>>> -      - description: USB PCIE wrapper pipe clock source
>>>>>>> -      - description: PCIE 2-lane PHY2 pipe clock source
>>>>>>> -      - description: PCIE 2-lane PHY3 pipe clock source
>>>>>> You are changing the order which is ABI break. Describe the actual
>>>>>> problem to justify such change. Are you saying this was broken since
>>>>>> beginning or what exactly is not working here? The driver was added by
>>>>>> Qualcomm in 2024, so how did it even work? It's not some 10 yo legacy
>>>>>> where we did some mistakes in binding while converting from TXT.
>>>>>>
>>>>>> Also, I do not get why the list cannot be shared.
>>>>> When the bindings was posted, list is combined for both IPQ5332 and
>>>>> IPQ5424. But the driver wasn't updated and it was following the below
>>>>> order, so was DTS, which is not compatible the DT binding description.
>>>>>
>>>>> enum {
>>>>>            DT_XO,
>>>>>            DT_SLEEP_CLK,
>>>>>            DT_PCIE30_PHY0_PIPE_CLK,
>>>>>            DT_PCIE30_PHY1_PIPE_CLK,
>>>>>            DT_PCIE30_PHY2_PIPE_CLK,
>>>>>            DT_PCIE30_PHY3_PIPE_CLK,
>>>>>            DT_USB_PCIE_WRAPPER_PIPE_CLK,
>>>>>            DT_CMN_PLL_NSS_375M_CLK,
>>>>> };
>>>>>
>>>>> So I'm splitting the description between IPQ5332 and IPQ5424 to
>>>>> matching
>>>>> with the DTS and the driver description.
>>>> So we asked back in 2024 to have the common part of the list. I even did
>>>> the effort to dig it:
>>>>
>>>> https://lore.kernel.org/all/ruti7hmkxkayzmqfbme6rw6j2vbhlx4ul4ptcckwamcpd4cyfx@owufhxwpvlcj/
>>>>
>>>>
>>>> Authors implemented it partially, broken drivers. Now you basically
>>>> revert what we asked, which is BTW logical option. It's logical and
>>>> reasonable, but leaves bitter feeling.
>>>>
>>>> I have feeling there is no accountability and no responsibility of the
>>>> IPQ at all.
>>>>
>>>> No, that's not going to work. You cannot come 1.5 year later and revert
>>>> what reviewer asked you, even if issue was just by mistake in the first
>>>> place. And you should not even try to do that.
>>> I understand the concern, and I agree this should have been caught much
>>> earlier.
>>>
>>> I only discovered the mismatch while working on the IPQ5424 clock
>>> additions. My intent here is resolve the inconsistency that currently
>>> exists between the binding and implementation.
>>>
>>>> NAK
>>> I'm happy to explore an alternative approach if updating the binding is
>>> not considered acceptable.
>> Krzysztof, I understand the frustration behind this, and we will make
>> sure issues like this are caught earlier going forward.
>>
>> Could you please advise us on the acceptable way forward for this series?
>>
> Unfortunately I don't know what to advise. I cannot Ack it, because
> people look at history commits, take them out of context and use as
> arguments in discussion ("oh look, here you acked such change, so I can
> do the same").
>
> Maintainer's feedback was basically only partially implemented and now
> you want to revert that part which was implemented, basically opening
> the gate to allow such patterns in the future. I don't know how you are
> going to guarantee such issues will not happen in the future, so I guess
> you need to live with broken platform. Please align with Qualcomm SoC
> maintainers on this, because I will not ack it.

Bjorn, could you please share your thoughts on this and suggest how we 
should proceed? These clocks are required by the networking modules.

Patches 11 and 12 are independent of this discussion. Since resolving 
this may take some time, would it make sense for me to send those 
separately so they can move forward independently?

>
> Best regards,
> Krzysztof
