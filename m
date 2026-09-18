Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909BE4FDA70
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745721; cv=none; b=QnH6EdViia8eQU4iTiDo2M7dzGjVRuKHDsPZDBtGBbt0SlZEWxkZpH+s2Ep7C2dmulz5AfoWd0P/5YMaDRGfvlqosM2Z8q43bwh8Ahr8tLCJP+Gu7yvvFdJ64YsvvmgudI/hTaO0kgl8ZYPj3qUHfcvSGeLlyDKg3FYM3MSOGYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745721; c=relaxed/simple;
	bh=uyTDiFI7lyECCQdWVgeTPc3fns5zrGscBULgjnZQndg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IwLukry9HmSb4rsQpYg8BglS6FekJ8yf6nUxD7X0Aluw+huvRuecxL2jQIUOQQ2rPbOpwqTE0A4o/zvQdzooO5sFZDa42KWBET6HkoltwfyLy/3MnsTvLkDJQcQnv36zYLKCTmoVbpbsPrk5mImL16/kDNpwm6fTgjDePv08XMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DplJEfte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmbTLGt2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DplJEfte";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmbTLGt2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOUr91900378
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aHcExhZg4YAG4hA1dN6N72SyV2vQEXlXE7n6/XV+8ak=; b=DplJEfteIkHJQIZc
	nP93LSvXSWEihBwl8luAjm2eIo4XLMXT2aFpRColJabAlFEn2713hL2XhTULhj0/
	7ZdSSjiFrCrLUG9gsfoi0PoczEBZpCiYRPIfg9ffKLryLDGdo4kOpQDKZCpJidqI
	uh2g07zWMBHjMiOppmrH7m3Uxs43Rw9L4AStvKvYOtT+V+xoW86F7FYXApFHefn9
	QWZtjr0g7/cuKCKrEI7Xsctq3hvYgOBR7P+pTKnCOaOfZh39WgMZqrwB9GhHzx8f
	VY6D8fKSCs+/KhB0DG8yLdJdWp4Af5ZbooFheu6Kl922F9yPrfmDt6ybOzilpLHH
	5Eqz3w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpuc3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:35:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c3796d17dso47824241.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 08:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789745717; x=1790350517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHcExhZg4YAG4hA1dN6N72SyV2vQEXlXE7n6/XV+8ak=;
        b=JmbTLGt2Uyfut85gl8otiYNd/UlsZZgdh448iOGkmUI144UWI7QktLJt7lqvoWwHiH
         sr/1OHcuqZaiG7VufJ8bWCvsImWavefeWNYul4dzaJDRUxbLlSwrAPPsn2sMlH9R8ZD+
         hDgHoU4CysArqe9oDPs/fGSoh30TUk75GQ8I9/xZFoiHozptvjOUHuGK/FQB66sAwmio
         shtOKFUI15qAYI/vHxNc7pflBTeV8rvwEnuG2SQIibYYFCQ1sQgB3Ji7DaW3zclO7sgh
         d2/M6X6/5UJZe39NqpNrVkf7CkozB/JEmVCv78WnxkAFeEfXBIBNhtgO7+v1tqIlTtPV
         zuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745717; x=1790350517;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHcExhZg4YAG4hA1dN6N72SyV2vQEXlXE7n6/XV+8ak=;
        b=yRQ258r/ozBe3lVuzZiQOyfmoAP0bb0LicqC4iGVOoZCUT0otPe/gzTwkuS5s6Mpr/
         vviAPdMXeIsk4bnZG7T8n5JBh//zdW3NW30OlaWfgGAhqvJaqiOkBE4RAHImMTjSKF9o
         7Vzlc8kT9a8reIc4m1MNiGudpvObWBPcnaiAIdMnXxEKhzncNkWxMjTIMyLVel7bnK2G
         WxyvmGn6uDpvpFZL2Km6EGlVPXoH6+voE29B8af08uuboQq+t+75h2ilRIqUyLjOe/SQ
         Cwj1zBfLz2rOIyyZwRX2B68tgZIaJGpU/xBvzSW0c8wEqwA63X4kbxHlSaqb6nKBFx3G
         fymw==
X-Forwarded-Encrypted: i=1; AKwUvByMy6nXuTZ0X/Ej8QWOB/1HPq7nQ6AgsXIZDWNxpiZIGSR7k982k4yIGF1xSAyKA7trEBJwD01k7RU=@vger.kernel.org
X-Gm-Message-State: AFuF++nt2IO23Vjm4168BXMjpCv5wcMLjzJAko1h8v8ZBDMRcCqRnKOf
	SoxiOfPS9inZ62Y8qZjHsUhWEplSvQVSAgANUDtir/8aQhsFMa78RXr0FI0lV8CdxrmWfsZjrUT
	q6Y8e2DxAy0LslKMgm0FNM5+UYjZka/Md1SeweYdVFjbnuXmbn78JlXblQ28cTsc=
X-Gm-Gg: AYBFou2ATgZxOofj9ZA3uIQv5OoRPHYT0pPBlch2D1f61rlB9EZr5/ui4Z08LdngPMD
	SOCW9zHirM6OaFNOTiqLeS5HDKT2hsvRuNZjtEvS7XDvWDcumvT5sd4UBlfuTVyE6ZCDV3LQ+Y/
	u8ZKIkgqtyqCmAdjicecslnnmLccioNWDTq+GSkeZsMCVf/JWvqUIaDligt7P1ojufuzQiM9uRl
	zkM7hBLSoRDauBZ1PMBmlLNg1rBwlK2+386CDSEC7bVb75064mpDGMipa9PQxHqFaeWqEdx43O4
	vjS7HQAGuSYmZUxwGNsJTFeKG+SghZW2le+s5t4TAoIBTis9UBvBwU97l/b7brecYqImtzKRk2f
	mfJL/RZYipeqG8/C/FgMK5AWGLx6Cp+JQKWO5tZRZIi/OyNyiNZwhqYGbbsig3x9wMEj773/DZT
	n1d52TtRvhf9GGvEnbZELEfoYDmn+lHfdvw8ecjIYtbHFdayApT7NnpHW1cy+I+1mIjA==
X-Received: by 2002:a05:6102:6896:b0:7a1:f7d2:e842 with SMTP id ada2fe7eead31-7a55d28b47cmr1203969137.18.1789745717390;
        Fri, 18 Sep 2026 08:35:17 -0700 (PDT)
X-Received: by 2002:a05:6102:6896:b0:7a1:f7d2:e842 with SMTP id ada2fe7eead31-7a55d28b47cmr1203940137.18.1789745716771;
        Fri, 18 Sep 2026 08:35:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a4d2csm77669066b.3.2026.09.18.08.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 08:35:15 -0700 (PDT)
Message-ID: <49c7b4d8-a8ec-44e1-ab06-220cf3698ea0@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 17:35:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v20 2/6] phy: core: Add phy_get_by_of_node()
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-2-dc244e124e71@linaro.org>
 <211caa95-dfbc-427d-8ce8-49cc76c24124@linaro.org>
Content-Language: en-US, nl
In-Reply-To: <211caa95-dfbc-427d-8ce8-49cc76c24124@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIyMiBTYWx0ZWRfX3hdp5ADDNuea
 PWXERtFYsYrK1GGZ/C6FLhoeOHu3FUGQzOztzfr64DAf1ndIHw0mjO+dB7Wf7GNnZg6dKsRwVJn
 vjWuXLztrBpPW9V+hcBGSmJdBkpsiY28GO+wk2nPlfD79m0zaEtztlcwnctXc0pEnhp/xtc4p+2
 E0o0ukmmBwN23tysiivzpbskvGzrCk+EHU5ibpy8aYb/kr4FJqGFmxkCNL3A1LICVNBlk7jG+y6
 YUXmsxWTlr4uUjkdOKqoP1Uh0cV3utUVJtZybLLXIdCyBiwSLxT4NkwoSx+3XwA1TtnpJUr2jdJ
 9M6yD2nljmT1IFX7MgupBQuOymBMnnqPGRGnsffAhIWGyKA0cu+Us2ZchYyUqL/BsKaJKiidM3D
 OuHkS7pcdH3DL2OeM6PEH9SNFOZmwPul6sOi7HiHlahXCuQArqLzzwXOq59NfvK3OLvcAy4/qdU
 alZFMrCHiXVtG0pilcA==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad5a36 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=Hf2YA8zsX2DXZuERv7MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIyMiBTYWx0ZWRfX5CJXG5rcE6Ye
 2GDR0Wj3MwcGy9JlHPd3DVaxUAiBVYTxTmReyiipl3f53Ev879YIo6RabBu5VDtpJK2GPjyfI47
 y0Lx2peYSC638qZqPaNC1aw5cuAyXqE=
X-Proofpoint-ORIG-GUID: 3dPZSGffrT7wl3lGq4qtifQvMQxSFVZI
X-Proofpoint-GUID: 3dPZSGffrT7wl3lGq4qtifQvMQxSFVZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180222

Hi Neil,

On 18-Sep-26 16:10, Neil Armstrong wrote:
> On 9/18/26 15:56, Bryan O'Donoghue wrote:
>> Add new function phy_get_by_of_node() allowing lookup of a phy by
>> device_node. Separates existing logic in _of_phy_get() into an internal
>> helper method _of_phy_get_with_args() to allow for reuse in new method.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/phy/phy-core.c  | 83 ++++++++++++++++++++++++++++++++++++++-----------
>>   include/linux/phy/phy.h |  6 ++++
>>   2 files changed, 71 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>> index 89addd732bff3..42c27a2b45159 100644
>> --- a/drivers/phy/phy-core.c
>> +++ b/drivers/phy/phy-core.c
>> @@ -606,6 +606,38 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
>>   }
>>   EXPORT_SYMBOL_GPL(phy_validate);
>>   +/**
>> + * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
>> + * @args: of_phandle_args to the phy
>> + *
>> + * Returns: the phy from the provider's of_xlate, -ENODEV if disabled,
>> + * -EPROBE_DEFER if the provider is not yet registered.
>> + */
>> +static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
>> +{
>> +    struct phy *phy;
>> +    struct phy_provider *phy_provider;
>> +
>> +    lockdep_assert_held(&phy_provider_mutex);
>> +
>> +    phy_provider = of_phy_provider_lookup(args->np);
>> +    if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))
>> +        return ERR_PTR(-EPROBE_DEFER);
>> +
>> +    if (!of_device_is_available(args->np)) {
>> +        dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
>> +        phy = ERR_PTR(-ENODEV);
>> +        goto out_put_module;
>> +    }
>> +
>> +    phy = phy_provider->of_xlate(phy_provider->dev, args);
>> +
>> +out_put_module:
>> +    module_put(phy_provider->owner);
>> +
>> +    return phy;
>> +}
>> +
>>   /**
>>    * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>>    * @np: device_node for which to get the phy
>> @@ -620,8 +652,7 @@ EXPORT_SYMBOL_GPL(phy_validate);
>>   static struct phy *_of_phy_get(struct device_node *np, int index)
>>   {
>>       int ret;
>> -    struct phy_provider *phy_provider;
>> -    struct phy *phy = NULL;
>> +    struct phy *phy;
>>       struct of_phandle_args args;
>>         lockdep_assert_held(&phy_provider_mutex);
>> @@ -637,22 +668,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
>>           goto out_put_node;
>>       }
>>   -    phy_provider = of_phy_provider_lookup(args.np);
>> -    if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
>> -        phy = ERR_PTR(-EPROBE_DEFER);
>> -        goto out_put_node;
>> -    }
>> -
>> -    if (!of_device_is_available(args.np)) {
>> -        dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
>> -        phy = ERR_PTR(-ENODEV);
>> -        goto out_put_module;
>> -    }
>> -
>> -    phy = phy_provider->of_xlate(phy_provider->dev, &args);
>> -
>> -out_put_module:
>> -    module_put(phy_provider->owner);
>> +    phy = _of_phy_get_with_args(&args);
>>     out_put_node:
>>       of_node_put(args.np);
>> @@ -1001,6 +1017,37 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>>   }
>>   EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>>   +/**
>> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
>> + * @np: node containing the phy
>> + *
>> + * Returns: the phy associated with the device node or ERR_PTR.
>> + */
>> +struct phy *phy_get_by_of_node(struct device_node *np)
>> +{
>> +    struct of_phandle_args args = { .np = np, .args_count = 0 };
>> +    struct phy *phy;
>> +
>> +    mutex_lock(&phy_provider_mutex);
> 
> I don't really understand the usage of lockdep_assert_held(), but why
> does _of_phy_get() uses lockdep_assert_held() and here you use mutex_lock()
> like before patch 1 ?

Hi, not Bryan but I can answer this question.

lockdep_assert_held() check that the mutex is lock and triggers
a WARN() when not held.

So lockdep_assert_held() is used in functions which expect to
be called with the mutex already locked, like the new
_of_phy_get_with_args() helper which is added here.

This new helper factors out bits of _of_phy_get(), which itself
already has lockdep_assert_held(), but since this new helper
also is directly called from the new phy_get_by_of_node() it
is good for it to also check the mutex is locked itself.

And since the new phy_get_by_of_node() calls this new helper
it must lock the mutex.

Note that _of_phy_get() is already always called with the mutex
locked from of_phy_get(), phy_get(), or devm_of_phy_get_by_index().

Regards,

Hans




> 
> Neil
> 
>> +
>> +    phy = _of_phy_get_with_args(&args);
>> +    if (IS_ERR(phy))
>> +        goto out_unlock;
>> +
>> +    if (!try_module_get(phy->ops->owner)) {
>> +        phy = ERR_PTR(-EPROBE_DEFER);
>> +        goto out_unlock;
>> +    }
>> +
>> +    get_device(&phy->dev);
>> +
>> +out_unlock:
>> +    mutex_unlock(&phy_provider_mutex);
>> +
>> +    return phy;
>> +}
>> +EXPORT_SYMBOL_GPL(phy_get_by_of_node);
>> +
>>   /**
>>    * phy_create() - create a new phy
>>    * @dev: device that is creating the new phy
>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>> index ea47975e288ae..71c2e16397130 100644
>> --- a/include/linux/phy/phy.h
>> +++ b/include/linux/phy/phy.h
>> @@ -284,6 +284,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
>>                        const char *con_id);
>>   struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>>                        int index);
>> +struct phy *phy_get_by_of_node(struct device_node *np);
>>   void of_phy_put(struct phy *phy);
>>   void phy_put(struct device *dev, struct phy *phy);
>>   void devm_phy_put(struct device *dev, struct phy *phy);
>> @@ -493,6 +494,11 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
>>       return ERR_PTR(-ENOSYS);
>>   }
>>   +static inline struct phy *phy_get_by_of_node(struct device_node *np)
>> +{
>> +    return ERR_PTR(-ENOSYS);
>> +}
>> +
>>   static inline void of_phy_put(struct phy *phy)
>>   {
>>   }
>>
> 
> 

