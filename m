Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CEF40E8DB
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099538; cv=none; b=RrvQhpVqNWWylsku7DxCtcCg+LzQs9GGyu6rJpC1jlWQt9icrdpP9vWniTT5kPt4DA3mCb8obc8WMeSpX8xk4Oj+lg/qvHZJXphXsSJ1ovw7hhFUSFtIy+xPHqrpTFE0Z3HcOsyw25sM8Tcbgko0ytLFf2GopufsbomvHoAN72I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099538; c=relaxed/simple;
	bh=X7p60vKSYFVtf9zaaGW5ALzNV0QbUKPyCsrvu09GsgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M6jiMnj2iQxck+YyVZSib+96aEtx+leq9GlAA233KT6CnGwsLCgC5uAsK8lUdWPuDl8AM341XL42OfuWYds4iCIlg2bnRkyLmn+ACOejTXhHYcrvkE65+LeiERjb5rwmP95h7pf/1ycqhmiw87ygbaYPaQHWuXM1lJ6wbrQBO/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTbN00Jq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kfIE/atX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTbN00Jq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kfIE/atX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBeca1138062
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGXBjo6/TmiRcXkBy0wB760OqQYQ/wZz7svMuJEbpCk=; b=jTbN00JqmGgoqCCZ
	+XrlscxJK+AQbms/i6h6SJGN4ihBDHBt5jOnlmD5VW567vsU23Dg/Dcd6W4x4OZi
	+nVpF1k4V28ZUmJ3ApMq1tH7ZxjV1lUdZXB5ICt0KAjaOYYhkAQnaHSkvEgleclZ
	41QFWa+NbvSiUO76Ih6AfKKN6OOeGEIpLT25YYvd52fjiKZsudGxm/3bWE0hyTqx
	+78RTVYB57fqTtwWFnri9S8oioBcmgARsSWmEumfj3HtQHzTdBBeLrsGktzVSqkD
	LfiivvEx8eyoEFaTpUkDdacP4aV+6immx//bZc6TAkDBZZiuX0yx+MoYtR7giuFc
	67F1vA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jpt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:52:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cf9fa331ddso376993137.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099534; x=1781704334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aGXBjo6/TmiRcXkBy0wB760OqQYQ/wZz7svMuJEbpCk=;
        b=kfIE/atX9NGsZU8YLNuS8uNgebsJEPNhJ5wUzIwiiKSOrwnvN4eVyKVC6uiMCO/p+v
         7YrYw5NeurzLjoLaAwKoLV+BJNsU3g86ZOfU+tANGqVqD7coAQ4NT/lO0sC0AMJprEtQ
         Gurvebfbp4/jl1ivvElEk9PvE4fZ6dL4PiPzIT409q5yD1G0ViRqRzxQAwwHiUkJE79d
         Sk2pB1vNHChNQfAQrSpAwQWBT5IqPV/fEJjpfNUdvUIR9ArUvqYHSqLE5dVX41ftSLj/
         v6z0MuC1CmOL4s214n/KH5KJvtG3O/CjnL3rPVzKtqLXdm+fvmZxN2SVf+06HbntPqdu
         g7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099534; x=1781704334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGXBjo6/TmiRcXkBy0wB760OqQYQ/wZz7svMuJEbpCk=;
        b=YPJ7fYyo9r3eMWFQ5CJcW+Taw2OkwCkLzNojLI9Lb2hK9Wn6LNtZ6Th0qgD+TvVLCP
         qIrF4LW0WIlhd2TN9AnaB2KHEo6NjkAju5ThErbI3p0MveR1eyEiFqzlAoHI5GHP7999
         oemOmdtTkXanPQbEp6/I9CA600AUAb3IuUnGK6OONHnGzpc77wXcFjhP4IoDBmhd+Ix8
         RLw8v2EnQIjWQ3J2aPxqu6swW/X0L8VQ/FhEbu/kq8O8wjouDMFfwFP77h3QqZd9CH5P
         yY86EY5QAVnFXh1Rws4Naj2Pbf1cajgp7wPXxFDvX1G9Zitfr+BroDK3JaT39xxQxj6s
         2b6A==
X-Forwarded-Encrypted: i=1; AFNElJ/Y1TdzToT92z163lQEVgvLnETrKA/9S64kjTaiiMc+7rQhfq4zuoSk+3X1vBCFma1J4/4D7cUPL68=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQXbT9olq97mN2JbeSQTaw/jd3d32uWHHPw31DXOskkvEC4IiW
	iWo3lrHRefYFg+YANugBt7fDCIhNbhVJH98fDmrew7b3wfmS6iziYMHxlNHd8KCiEO4HqJC6VoH
	pCSBzK6zsM8eWeQ9PCRB3RK8fVGBw0CXv2yzFJB2ywjLgxzh2+dGtX21p34lLr/I=
X-Gm-Gg: Acq92OE6A1iPx5uCaZR4hf3WCHwKoW8TTRomb6jm30vlmuBZv/ODfOn2gHekcH5dgI2
	KP6TY+Q/+jQPOHqyOyHMwzImHTXgOiWKI4Q1ynU3DslR7udUicNBfRz/eFeq93ofaTGNFg1fdCh
	JAOZ2ivMdQrFOB2YDp46jIdEysP6o+AMQshib80LrjVntJGoI/0n0Ix0MBpp2c26y3EQPf9eTbc
	Ii5CgUddGIoMHgnVEqzIBLOzYzNo1pmFBZFw2yb4zeQumZp1+nuavUwrxOzbYG+udeS+rmEvQ9+
	aw6ALd6ooMvMb/VQRIlQw4oxZTv6qas3F3BUnI9sTf+xjrEiifAvfh9XxWHpB6hWz7CezPMzCVT
	2Iap4qiSbMgL6pA9ioe6GSJrZXnRccbtYyWkfN2eeoUy/B2NQ7SVSKiFy
X-Received: by 2002:a05:6102:442c:b0:65b:c17:7052 with SMTP id ada2fe7eead31-6fee2af191cmr3971310137.0.1781099534251;
        Wed, 10 Jun 2026 06:52:14 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:65b:c17:7052 with SMTP id ada2fe7eead31-6fee2af191cmr3971303137.0.1781099533817;
        Wed, 10 Jun 2026 06:52:13 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64c2f358sm10108440a12.6.2026.06.10.06.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:52:13 -0700 (PDT)
Message-ID: <73a30753-527b-4662-ba99-2ebc3878861b@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:52:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
 <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
 <cacfl4livqlkuk2c223hgapl45ojd6hsqg5sqqd7g5g2q57kk6@codcnqhfz3e6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cacfl4livqlkuk2c223hgapl45ojd6hsqg5sqqd7g5g2q57kk6@codcnqhfz3e6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a296c0f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iWv2uGAxcboP7Le9rM0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMiBTYWx0ZWRfX6a2dyMoUYnXo
 PmJIBUn9cMTF6IuC8D7zICb1ohzkPwOvMDoCXpx/d2/UWKd6soZPZpy4mziPxXm+MQu+mTZK3AL
 MdaZjIiAVX7XrlFgovawtBuy0FD3lIBN20ut0rGilwiDDUMBj3xJO5I7wTXGCYDmKkI3ALxCdeo
 665Ps/BdvEWc/7kWo+jl8uit4kgSjZm6AeBVorxkDugocCdHCwskxyKBJICcg7+wAxbzXMRWDtW
 2x6bUZm5r8xtsshE5PaIOZSUdKhhxANsOfRTRPdeH8GgWHESEAkDZJN/fByS0jsTNAVPIV+7x4v
 lm65TFxkMKe2LybgXZ175EQRW+DyVRkCBF6TpJNqJv8yn+gTP55DkBjzC+SWuIlaDHVrnNI6/6E
 vniCQFfhiiC+SXqglEDWpxN9R/ykx9MdhUl6l8iRDhGQQ5qfGagEKR0r0yh8aQQCmtVk3AYyLxH
 klcVSKqMmXxV9trZK4w==
X-Proofpoint-ORIG-GUID: kRrxneFr2OdON5GNTtjdfB6UEuDm4wS-
X-Proofpoint-GUID: kRrxneFr2OdON5GNTtjdfB6UEuDm4wS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100132

On 6/10/26 3:34 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 02:24:24PM +0200, Konrad Dybcio wrote:
>> On 6/4/26 6:22 PM, Dmitry Baryshkov wrote:
>>> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
>>> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
>>> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
>>> MMCX voltage levels.
>>>
>>> Add MMCX domain to the Iris device node.
>>>
>>> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
>>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>>  				opp-720000000 {
>>>  					opp-hz = /bits/ 64 <720000000>;
>>> -					required-opps = <&rpmhpd_opp_low_svs>;
>>> +					required-opps = <&rpmhpd_opp_svs>,
>>> +							<&rpmhpd_opp_low_svs>;
>>
>> So the computer tells me low_svs would be enough for PLL0 to generate 720MHz
>>
>> Is there some transient dependency that bumps this to svs?
>>
>> Your changelog mentions you altered this in v6, but I don't see any related
>> discussion
> 
> There are two sources of information. The "clocks plan" and the "pll
> info". For some reason, the clock plan doesn't reflect actual PLL
> requirements. See the info on the corresponding PLL type.

OK thanks, now I think I asked this already in the past..

still, both point to LOWSVS @ 720 for sm8250

Konrad
