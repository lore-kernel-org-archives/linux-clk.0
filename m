Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26A6552920
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955951; cv=none; b=ozbQ5sYcDXNkK9okeHZYFprKsSo++UQ7zsQW3ndYyNDBSJGI2KZiimE+WPWmJNbpXxUGhRQC9KiSDR2wC2pmSBdOtTx5ezxNb30yBxPaMChaneucXoVpRxlyhEnzH5jWXuboLwYNPGybQHxD7Pa2SpOLnSzqNgtq6ruMLVEJnDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955951; c=relaxed/simple;
	bh=Np7c5aBXs40Izu6BhIoBcwK6jKTo21Aj+MxYQLBZy98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTjPQz1cXVmqtGfNDhW3SPltbJQEZsAfpEXwEKRx8ZgjmUFDCfgF42q3sG32ltQ13DweAGpPOZzrH6TSd9LLeA263UNBViehRbr18nNH27lvT6CQwX8zF3AJ8MyjD/UfBEpI4/DwgAOcUYwRb904QKXjbk0DTfmewMCHqJLWBiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7M4UGz4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWirkZ3y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7M4UGz4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWirkZ3y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUFH71843126
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 12:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qdXJHKg9yw3m3xvjN/96iKJOr0TVN9REc8Mom5izEBY=; b=C7M4UGz4QFPthV4l
	yS18nJkdeOLTVx7y2IPax42+mmc3Hn3N/vFtUzCkfsi4g1TpYRnWBjn79I4SjjQK
	CA+Rw5WK+OM4fY4WM6PCNzUVoloKqk2tP/5xDCRp6ybEy8RN1hIESUbo7h+YUSYa
	eopKOdWSgbvf0JWgYg+XXlzknNWdemqgqnpNS6F8UeGZocMSdLYSuCrdP7yv28rW
	8ymbtsktpmFoMPySPTcJfEMtX8cMWgueiHcnznBzOxiq15yVKy2ludY050OcmJHi
	5zslGt6qMPC07koi2QMGURnRkAxmGcgaS+GjXKSC2hf2F0NbXtKPztONVv5f7Gwd
	H3gpAw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqja5ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 12:12:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cc288296fso11694376d6.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 05:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955948; x=1789560748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdXJHKg9yw3m3xvjN/96iKJOr0TVN9REc8Mom5izEBY=;
        b=IWirkZ3yI9EI68EWCLeqmB4c+t7Khg8mud5Yo4kEwsT5zLYoq6JjGcIIevzpTIq1wm
         zI6TmknUbMT+OBRNX9Ax5KoG3jbOYhjrVQX6DAuJ7+/WzfIhWXcEe7imF4P632mXoYdZ
         9jl7wKHaNd4LrVI76pLAlCAYEw1c0y4/KUoQT9+HOWlyJUSkZ6/oaNmD/Q1r8V9NNPW3
         PAgg51TXmAhCgEwWeZXOceIM7YG5mAOBofTNAFLCwzyLkOJ/eWqFZTqMv97KbRSrZAJZ
         NYQ2IIb2ct56rJlvVJulDdeOgs1oqYyPP5J315VQkqjBYqr50x46shO1FVKq1L5EcduE
         jXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955948; x=1789560748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdXJHKg9yw3m3xvjN/96iKJOr0TVN9REc8Mom5izEBY=;
        b=SxQ6tkUTfuFB1KlUVM2DjyJ5KhQJPqezrh7YQTjYrIyvAztCJSq9SaPUnJygvCh2wA
         dazhDTEFJ6T7EuT/2d7/RyUJ3qHmAnEXN/i8MNkJPOmG0H+XsPLoZ8MFb5dKTHfkATrw
         5weshKx2V/ine54b9Qb+XR8ktHf8ZUnh6wYMe5vkdj+MxZUEN9cAjnd9uOguGORHNCf3
         yMj45UZyu50jzMhIW37QElKfvrCtMOI1i/P1HZTO4XEijWvFmyz8BiiZ7qdjlmR0YV4D
         zUlUMBwUFXdN2wpQLWXGey08OM/B1EtMkKL5Vy4Sphvrv5HR6vrlgMlqUIjCNR1+1ZIU
         XOzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9b7P9dVcsNm8Uhu8kurSCm++ieOyK51MQ1JryDZ71tbU5/pEzAxCAf48kxhdserfL6N4lDvwp9WE=@vger.kernel.org
X-Gm-Message-State: AFuF++kbL59btEuhFw0MWdS2szhGaQT8JNvLY8HlyAPOA6e+3BVyOjf3
	YWHkPnlsNpfvzOCP9ai7R5/QOOfLueYyr79HUxtfG9qxeWpvkxyI2sQ8ZaYTGlPq8WLfJde1jjH
	HqjKlFZL59D8BJzvj+TZJTDwUAiczkkQQiFTr324WnQaVpmJgurV6R4w70O/cwF8=
X-Gm-Gg: AYBFou2MGp8cZHu0qcwzt9jKp1rnO3WfVznd2Kti/iNJkAXQCKwusr7P5LTYR36JBWF
	eQ3n+pg/0CjA7hkBAIa3X6XB0fUrTDD4qhq1HA3+7dp7l5dlJQLcs7QRYu8H/+lUd2nQUyKC07i
	geGdPYGzeOqOXMM0cSZIg+Da3Z/BUzX9jXwDoo7ESjILqAIsWj5wZM2S07v9PWjzM+fcwzh256k
	gkil72ceI5+2bWHlf+VmTG02HJ0KLIiyg9Ditd+AG7aZEEbpGtPU55cp1IogpCHM1Hvd4KuTyoz
	KJaflWEwHhtvedZ+nD7AFPs3g/fFBfLB8aAZT7IHnWtQopkht0RgKvvH2FKr52U8VBOmVVMGBdk
	hna44bzCo7sRUHnpiNMjorQ==
X-Received: by 2002:a05:6214:5012:b0:90c:c716:91b5 with SMTP id 6a1803df08f44-910476c940emr268734356d6.2.1788955947890;
        Wed, 09 Sep 2026 05:12:27 -0700 (PDT)
X-Received: by 2002:a05:6214:5012:b0:90c:c716:91b5 with SMTP id 6a1803df08f44-910476c940emr268733556d6.2.1788955947372;
        Wed, 09 Sep 2026 05:12:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036902sm752132366b.3.2026.09.09.05.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:12:26 -0700 (PDT)
Message-ID: <b58e3f64-1a5c-4db4-a51b-7138fb3609da@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:12:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Jie Luo <jie.luo@oss.qualcomm.com>,
        Mieczyslaw Nalewaj
 <namiltd@yahoo.com>,
        Stanislaw Pal <kuncy7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260730191353.557494-1-kuncy7@gmail.com>
 <aeeeebf9-dbd4-4f57-847a-5f495b3236a2@oss.qualcomm.com>
 <20260803091003.15285-1-kuncy7@gmail.com>
 <8af46926-fecc-4396-973e-2290ae285998@oss.qualcomm.com>
 <cd5a25ed-76a3-4f1f-b924-06bb685ff426@oss.qualcomm.com>
 <181944c2-2484-4384-9c91-45cc87f31955@oss.qualcomm.com>
 <8286b42e-0314-477b-ac2e-4b410a97d833@yahoo.com>
 <f8b9192f-fe88-4a8e-86f0-6e2c33ed3f31@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f8b9192f-fe88-4a8e-86f0-6e2c33ed3f31@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g98GUSoIe2i1z8pFr8XMtD1TPNGqcG71
X-Proofpoint-GUID: g98GUSoIe2i1z8pFr8XMtD1TPNGqcG71
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX1k6aZMFDkUb0
 CFhPdJqkinZNOt8p/UBg0GHt9a/FWBmMXW2dJhfY2o3S5rUkZ7FhXd9QTObqEhtr6i2CqGQ5wOP
 iaCRwkG29Db1iJdBDJnlJjqnNj05tFDo1KvUjbbtnDvXtyo/dmzXzG7ZdxOxc90YSAx70GQYgR1
 5SyLiTvXxyaXdTDv496RX8kjiYwu5D2omBLivoS5veCKZ+z1zesDokyhbYW82lM3h7CkZSKa8SI
 rlWxS2DWfWU0KJVSOtfdXOS3jq+vGse11ptWMQmOFtI2eLrlthTqS01X23zxknBdL85x8BqJu8s
 peVU8p24eyClkVVoV2VmKNQYmNq6HhPf3SW6R604vGBtjdlyHaG2kMq4L/QeH2sQJiwC07myQJr
 i5u+3YxfP89GppJK9+8LaValMDccfAEe+QatIUWPgcPqYPBItzyLf4GCLgDaePQ5pDed8HUKMk8
 wEkxqYKkEdhbcdHvzFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX1UqYfwHCYQgy
 5aYkHjbgl5zXNpGuJKSjtEeTjydsExf8GyJPWJ3yGXYi07bxEFhWqzByx9c93mn+qb3TrWNwPvv
 GcmdTzKOnLkQNqeJ8Lgg0y1fIe3tzL8=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa14d2d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=W21wEWUqPQRnM_OgY4wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090136

On 8/24/26 12:28 PM, Jie Luo wrote:
> 
> 
> On 8/22/2026 7:19 PM, Mieczyslaw Nalewaj wrote:
>> On Thu, Aug 20, 2026 at 01:39:52PM +0800, Jie Luo wrote:
>>> The CMN PLL output clocks do not depend on the AHB or SYS clocks. They
>>> continue to operate correctly at the fixed rates even when the AHB
>>> and SYS clocks are disabled.
>>
>> The PLL outputs keep running, but the AHB register interface does not.
>> Once autosuspend gates AHB/SYS, any later register access to the CMN
>> block hangs the bus. That is the bug we are fixing.
> 
> As far as I understand, there is no expectation that the CMN PLL
> registers need to be accessed after the CMN PLL driver has finished
> loading on IPQ5018.
> 
> Could we identify which module is blocked after the CMN PLL driver probe
> completes?
> 
>>
>>> On IPQ5018, the CMN PLL provides a 50 MHz output clock that is used as
>>> the reference clock for the connected Ethernet device.
>>
>> Correct, and that consumer is hardwired in silicon — the internal GE
>> PHY and uniphy blocks take proxied this clock without any Linux driver
>> calling clk_get() on it. Therefore no device link exists to keep the
>> provider active, and CCF rightfully gates the bus clocks after probe.
> 
> The UNIPHY block is the consumer of this 50 MHz clock. It divides and
> gates the 50 MHz clock, then routes it to the connected PHY or switch
> on the IPQ5018 platform.

Is it only the UNIPHY consuming the 50 MHz one?

static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
	CLK_PLL_OUTPUT(IPQ5018_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
	CLK_PLL_OUTPUT(IPQ5018_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
	CLK_PLL_OUTPUT(IPQ5018_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),
	{ /* Sentinel */ }
};

What consumes the XO clock? What consumes the sleep clock?

Konrad

