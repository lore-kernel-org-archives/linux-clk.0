Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0374E3781
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675901; cv=none; b=Z890KHlQjoR/r5iXkoMtvfmqGo/IyZ4QYzos8uL+602hRlXAlcH7tvTb7s1xwODNoMxcmK+UskeUI8h0647znwEE8TxnsGX9TZlzc6IQjqpdPX1Lz2Zu3QY0ebHVFYfbNgKBZJplh1AGg39sjhHDPJ0q0r7+REnY+iesaYlsSXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675901; c=relaxed/simple;
	bh=AyQlhHn/ZGofFAIPNVNLtAHbPpfbmqfVZrPlxdgxWDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOntJt3myToWe1lHyobsr9hWfejIZNR40Ei7eYDcB0Ou/zlUrgPvWc6qeKWbXbSc2C56eAaBY75ZhXuWyUtAXRGR8qPbRyEqXcDAujMXmcU3zff5WUa4rTxZUtR+bnbfVm8TT3gzTAlDYpw+fsGu2DJHSgI+qstuq9HCn/2ammI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QK5JIihT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP4Qsvup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QK5JIihT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UP4Qsvup"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Trde4098174
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 09:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hrf/BRu9vxuRgHvHJCDyLhP6Fml6xeXWnXwjv05Uq5M=; b=QK5JIihTRv/kofqt
	4QaoUpy65LqzTQHfXDhdtFjOwFKUi6/+nsI95VEXDSggZ6Vc9mnegaKosyoeccz/
	FhGi/AKvkoqLzJtIDjpJ1DdwBoIR1gxXqFLYpz9n2yNbqfMpuBlhVwqVykDWWGgO
	lRVFWKWRqUj9gFFdfJxdwvD5glXbu90v8CaRD+zz1DEiXOJmGXpHtdV3kIVxaOKI
	m0R4Y7o+Tj2ulR5f8dDNeSeWvX+bKhSECwaSUT43d5g9yhzn6GwdKpNBnGqcfPjQ
	Zd6/gS8utn/fuhwPpsZM1L/t2KeCMG4GhjnF2baHaDUkLpiEamySAi85hRi0AwdL
	nKkJHw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew1uhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 09:58:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4a053dcadso676223a91.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 02:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790675897; x=1791280697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hrf/BRu9vxuRgHvHJCDyLhP6Fml6xeXWnXwjv05Uq5M=;
        b=UP4Qsvuplc3TWyDX7e9qHDigqDhHaPfPJAWb0zOJxuQz8fk3b87R0NMvnwH7DCcCAu
         dKFFRmjJMzXV09C6rXSXFiCyJH0OXtRePLbYpiuo0R7N/PWnggYc+pvNZTJEea/KiEbU
         RTAcFG4aba29vgFdGwwvMMN290Vtai4iodeQPkQl/5ooTzKruwLZjF5eWQgDcuPoSvLg
         WUeCEZdKfqrkznMx3JAadB75IqLBti2mRpRzYQmpeML3b6ddie9gdIX+ShO+rLnmJo78
         iI3jE/LXX6JpvPKI41t+X2LfuD1gaCQNkGwlKEhL2Pt4ZJOQalMWfYmtqn5TwKsU+2gG
         gbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675897; x=1791280697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hrf/BRu9vxuRgHvHJCDyLhP6Fml6xeXWnXwjv05Uq5M=;
        b=bqykEVKVIB3niCa9NPyyDN7ZebWn9fTIfPcv7NSTABAdFp2CjSprgHRBdzV+Kw3qRD
         0zAqKt+R9TYyfJp5usFFH6xqq5Q0OvW36lUhi8fD8nR4OwBan5yrRddB08bs9cO/VONF
         WmzIfjpCTQMg1MhNory0yeoN5u/lwIGgvgqnUhvYMrEopSe3RbgIC0ohkVDbXW/6nLsG
         SZPBGOsTeEvfbwQ7qmwKCv34ELl/55bl1ALKHt831szol49zATTdXVjfWXaeffmiNkFl
         scy/ugddeVzsGl0UrSAUry4yCb9yg1FzUF2ZL9zQmO98N5IKfAPvRJoEFkfOH4wgc899
         j90A==
X-Forwarded-Encrypted: i=1; AKwUvByh1QdstHVuFcKNsRwJuIUezX/dHtIN1gKFTZ8uibenGnudq7bm0kTzdJBeCzJ0+QIUdhJGY741EQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKct9sI3m9Y1h+BkCMlLXzaW6Rou3xzEkQ3AsmFimfWckTmhDnM
	25okTNKooX6pmaxTXG2kOm/UQjrqg9x37HAGSLaG6cPgvHY8fifkJN/DOuHmH5tvPhQhpfBWIlh
	xhyj5+zHFYMaTF/GOKt0vJtvMtwrOmv5wBeYzQ7QJ6r499UMgPm7lhAQ7q6ey0SI=
X-Gm-Gg: AYBFou3pEF7I5nuq6mydueHukE2uxRvjyHYxz8ZPoz6U+Nu8vMapDgToGoiBuP+BuWR
	v54sYAEAi0w+YYSZfXulRRKe5vP3qfd5YmZX2cqfglW6wBAJcDUcZvawZM/u4dy8xkNho0wQKK6
	EvvoUmtU/xB6j1WXtPFsBbqxe36v1rCbL/Qq+cOZZwUrMqbLF+X2DXozsaCdq9jlU9y8D3C2hG2
	sdq2MkOZaU417HH/jLFbCXNjLaS+Czkro73/h+teHuarlLuqA4/Q/G4EiG+CJeeROrb/Kpqdwv7
	/4lNLZ/kk5kHV9P+1b1gknr2obhP1bw6qbol8Ih2Spv0bGDxEtnsI6luytgfdmvpr/68CTamDF2
	/UbfBUczVkZsMEQLIdGM23hdpyDKVHc4JT83+ZR0uvcrikrmE/KiiaTMXzgoJMvBT5qjamMS0ko
	ksY6Yb3Zm8acokQMk52OJ7
X-Received: by 2002:a17:90a:ec8c:b0:39e:2e7c:d43c with SMTP id 98e67ed59e1d1-3a0bb552ff6mr9601330a91.7.1790675897472;
        Tue, 29 Sep 2026 02:58:17 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8c:b0:39e:2e7c:d43c with SMTP id 98e67ed59e1d1-3a0bb552ff6mr9601308a91.7.1790675897013;
        Tue, 29 Sep 2026 02:58:17 -0700 (PDT)
Received: from [10.149.102.240] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498057a62sm4634983a91.13.2026.09.29.02.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:58:16 -0700 (PDT)
Message-ID: <ca8e656a-50b5-4cb2-a2e6-c6b275fb7b5d@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:28:07 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
 <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
 <5a55edf8-bbcd-4e2e-aa08-c9b62e527a43@oss.qualcomm.com>
 <c341b7ab-fc59-4234-a25f-715035fc1779@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <c341b7ab-fc59-4234-a25f-715035fc1779@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfXzu8fROa0Pstc
 1/NldApAoFR05R32dWyFvMhT00TPqrAa9qQN1rL2C4WdX5ktYg3TFMHywTNzOMvRZXIIOh954fR
 oq2KE3y0rakPQ/+fRPdS1pQPfgmKmYA=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb8bba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eAyIkxj0YKcLyhwK4dIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX+sNDYb77v6tV
 afJL1jGjbuS9LI/H5YiHy44sSGqjlLResJ7Vnmd9jkmwq/EtbWEDAYF1pGtppbqQtniTYvyC7CU
 A6G8VnUvmekte7fbB65Y6KvbW/yvZAl8Ps4oFHOTFjgYh/VE7Idl4y0FCjusVl6d/fqxcVLKbJ1
 BoxG/B0M9wJAf4i/YnsSLyKCjGS+HpclEVLqojn39Yss5QmyVNVRXFHJ73F3NtQOWhgjiU3A7rB
 iKk4q5XoeOuO35xZQmR+vsi4pwjckN5pdWO47lIQRaedRIZlJ7H8xbjGZKwLPZdqh0NIFWxvbMG
 FwWZ8f9L61jF4o7IHo9QNnjUGsYstrFxl0hEoAeshqQ9o8yJayCPle3jSGEIxMD90gGhUnPns5m
 my0E+9zxU94xLNXiElCr10ci903tte0qrHoeEtdDirchCTvFBNnN3EIbIZOTqEfJtObbTOjRjA2
 6pMwxk8FekhMxBdQXXw==
X-Proofpoint-GUID: ist6_8oXw1IyP3Fqe3N5NmE3yKZX2aEm
X-Proofpoint-ORIG-GUID: ist6_8oXw1IyP3Fqe3N5NmE3yKZX2aEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290039


On 9/29/2026 1:56 PM, Konrad Dybcio wrote:
> On 9/29/26 8:59 AM, Hardeep Sharma wrote:
>> On 9/3/2026 4:27 PM, Konrad Dybcio wrote:
>>> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>>>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>>>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> [...]
>
>>>> +            ranges = <0x0 0x0 0x0 0x0 0x1000000>;
>>> likewise here, you don't need to precisely limit this.
>>>
>>> Konrad
>> Hi Konrad
>>
>> Here I cannot use ranges;
>>
>> An empty ranges; only works when the child node uses the same number of address and size cells as its parent. That can't happen here:
>>    - The binding fixes qup0 at 2/2. qcom,geni-se.yaml requires #address-cells and #size-cells to be 2.
> Fix the binding please
>
> Konrad

Thanks Konrad for review.

Fixed in v7 : 
https://lore.kernel.org/all/20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

>
>>    - soc is 1/1. It uses 1 cell for addresses and sizes, like the other 32-bit Qualcomm SoCs.
>>
>> Best Wishes
>>
>> Hardeep Sharma
