Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1CD542EDC
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079550; cv=none; b=kthunfMV2nt591p1POHNcCfU2qOwrC/pA2C1A6p6zhdCBRMkJNzDh35+46+lg3Plc33849lTHcak5pRpivdY3+iZkibcIsCXT689+g5McohBGIgapDOHZ3GN8wwO9pG+e9bJz+U3qFo9edukC7asHPaF8Y0C4FAlm1AuMixB0AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079550; c=relaxed/simple;
	bh=l/N4Obxa3qgIEYJcYmPAv8aHX52C8bN08nhVD2V0YFw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=l/E4w6MLeNxTb7HfQaPyUF5vPLydb0O2xPl5+YXr/JHBkKdBAMRr/QaX0TCGpjzN928kDTFIyqNlmYLs4cnv+wsfvEwe2vnRZKSNgKYUAP6rSz1IlewNfXuVmyIycivz+52ElumUMlWveABgHwXnL6nyub3CPWnBGrFdUfJgC/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YA/2FEXW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YA/2FEXW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so21779845e9.0
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 05:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790079545; x=1790684345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5u3EIzpPsS1zIA0D9Df1lz7j9vWVWGBTpUVoDk4tGw=;
        b=YA/2FEXWzCUrq6yRxSpeWWi/mOHKQDrO+7g//Y4YrQ4gRH9s/0B+tIogHV439r/aT/
         hGxbRlVQ/R2CTvQF02pr87iUr9Od0MOyZjblai8OX6TwlSOm7lWFmOhJGsTazhMy85YH
         uOhb79KjHCR1tnoBn73j2vBpqIcAT+pc545VXJeQvbwnyQy3qW7WNWwOAa92M1YFS5cD
         Pvd4HpLJz8WAWDjQu34ES3gTcejPWU9+qkxvQWrgob7Cq0ccmQmoAXMWbOljxYJV0crO
         0jjFLN1A/U1OREeCSl0IQyT8WqZWA/cSuQqEOSXk0RhwUjkI1vOVstfZIlqv0QO80oE4
         2+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079545; x=1790684345;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5u3EIzpPsS1zIA0D9Df1lz7j9vWVWGBTpUVoDk4tGw=;
        b=Z8eaecmGTsA6quM1Qw4jney3AM/igAWnfTNpUWU78PufdHcL60/877H0wiWhr6k8r4
         x89TV3neZ97K7/M7k6vM2ggAKagVXLUidCrrtVcLVlP5VE1rm0Yd+vtKQJXUKCtEteCT
         ENWPBD57CuAMJLCtkus+oI/tqDr1n9ropz7OO0Ilgf2JNyFmf78w1HyDyjuZTB5MuUS5
         34UMEvAQTvK3ku2oaffvl65F7ratiSyZNKgugCrE18Pwan0dq6hd6NUoMvUe7/Zbf6Kc
         rneV2iIFChZXK1C0/7TRhnH8+2VzOy6R7OJjLflZyJHoK5YjdDofsQcxug7Qip2b833T
         wr+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxnfEJeM98+VhVXaeq5lpferVLGuSoq9+gXubJja6o362efXpvYaMSVJFF3xfiFYsKvqCgXCfNIN2k=@vger.kernel.org
X-Gm-Message-State: AFuF++nQCAHBQGlqDfJig9YaMyseKPTLotFytfrcvFPmGReksNF4o/7g
	0TG6QLgT11uanTDaSWVosyoc7x/3cnJRRoUGpfIzZHDzS2Fcx8buBj9UUAFfOZggrF4=
X-Gm-Gg: AYBFou3GjEncibdH4MfyAoDeCw6yXVKoRn7bEOSm28aXwsMOZMc5guoHwgWYNPJNDpp
	Ss/i2qCo6k2BEcNlb+lfroIHw1iHugB3q+6MNG+Ht+gm5imr1OmmHZUm62Bz6D/vfoZw/6MNQlY
	71maVD5Q6KmebrRuuXm33DD4neYKYapuB0utpIgmTdtCEyxEp4sRPT2R7R0XV2C6AvZsWsho4sq
	4WtkaaUb623LAvGWubtlDQ0j5ppC8kXlxg5+kLO0kk70JdLA9zNJBLgeLTzdoa3bnUMMY2wcgl3
	iusxISVvOZGF7qXF+tqwLJNWaqguYTEn71htRPg2X0MxZLZt7g708Jbm0+h7zk2KwDS6TB1hEDD
	9XjkafMDpj2n7wOLUFq5aLckuADW6ZyYmz0/LhTpuRhn1lInMURTZz/z3NP/4noIYW3qlmW4YLH
	FKmzlB7QgB6deLjz92Wt+DGCOvYQ3oJsEzo4Ig3P+FNUvf9KxvoDNmDgZ9jhBL9YCH5+OFYXn9U
	Xw+nDFYiSq0TeXFxEOpZbwJYGYocMe1mQiTSn4q05r9Ot5hSxp8+g==
X-Received: by 2002:a05:600c:6088:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-49fd6f0406cmr64899245e9.19.1790079544988;
        Tue, 22 Sep 2026 05:19:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ddd0:8cc7:9887:fa82? ([2a01:e0a:106d:1080:ddd0:8cc7:9887:fa82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862775412sm4849378f8f.10.2026.09.22.05.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:19:04 -0700 (PDT)
Message-ID: <5cadf2e6-9dbb-4320-b866-cf2fad599c41@linaro.org>
Date: Tue, 22 Sep 2026 14:19:03 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v20 2/6] phy: core: Add phy_get_by_of_node()
To: johannes.goede@oss.qualcomm.com,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-2-dc244e124e71@linaro.org>
 <211caa95-dfbc-427d-8ce8-49cc76c24124@linaro.org>
 <49c7b4d8-a8ec-44e1-ab06-220cf3698ea0@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <49c7b4d8-a8ec-44e1-ab06-220cf3698ea0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/26 17:35, johannes.goede@oss.qualcomm.com wrote:
> Hi Neil,
> 
> On 18-Sep-26 16:10, Neil Armstrong wrote:
>> On 9/18/26 15:56, Bryan O'Donoghue wrote:
>>> Add new function phy_get_by_of_node() allowing lookup of a phy by
>>> device_node. Separates existing logic in _of_phy_get() into an internal
>>> helper method _of_phy_get_with_args() to allow for reuse in new method.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>    drivers/phy/phy-core.c  | 83 ++++++++++++++++++++++++++++++++++++++-----------
>>>    include/linux/phy/phy.h |  6 ++++
>>>    2 files changed, 71 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>>> index 89addd732bff3..42c27a2b45159 100644
>>> --- a/drivers/phy/phy-core.c
>>> +++ b/drivers/phy/phy-core.c
>>> @@ -606,6 +606,38 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
>>>    }
>>>    EXPORT_SYMBOL_GPL(phy_validate);
>>>    +/**
>>> + * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
>>> + * @args: of_phandle_args to the phy
>>> + *
>>> + * Returns: the phy from the provider's of_xlate, -ENODEV if disabled,
>>> + * -EPROBE_DEFER if the provider is not yet registered.
>>> + */
>>> +static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
>>> +{
>>> +    struct phy *phy;
>>> +    struct phy_provider *phy_provider;
>>> +
>>> +    lockdep_assert_held(&phy_provider_mutex);
>>> +
>>> +    phy_provider = of_phy_provider_lookup(args->np);
>>> +    if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))
>>> +        return ERR_PTR(-EPROBE_DEFER);
>>> +
>>> +    if (!of_device_is_available(args->np)) {
>>> +        dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
>>> +        phy = ERR_PTR(-ENODEV);
>>> +        goto out_put_module;
>>> +    }
>>> +
>>> +    phy = phy_provider->of_xlate(phy_provider->dev, args);
>>> +
>>> +out_put_module:
>>> +    module_put(phy_provider->owner);
>>> +
>>> +    return phy;
>>> +}
>>> +
>>>    /**
>>>     * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>>>     * @np: device_node for which to get the phy
>>> @@ -620,8 +652,7 @@ EXPORT_SYMBOL_GPL(phy_validate);
>>>    static struct phy *_of_phy_get(struct device_node *np, int index)
>>>    {
>>>        int ret;
>>> -    struct phy_provider *phy_provider;
>>> -    struct phy *phy = NULL;
>>> +    struct phy *phy;
>>>        struct of_phandle_args args;
>>>          lockdep_assert_held(&phy_provider_mutex);
>>> @@ -637,22 +668,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
>>>            goto out_put_node;
>>>        }
>>>    -    phy_provider = of_phy_provider_lookup(args.np);
>>> -    if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
>>> -        phy = ERR_PTR(-EPROBE_DEFER);
>>> -        goto out_put_node;
>>> -    }
>>> -
>>> -    if (!of_device_is_available(args.np)) {
>>> -        dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
>>> -        phy = ERR_PTR(-ENODEV);
>>> -        goto out_put_module;
>>> -    }
>>> -
>>> -    phy = phy_provider->of_xlate(phy_provider->dev, &args);
>>> -
>>> -out_put_module:
>>> -    module_put(phy_provider->owner);
>>> +    phy = _of_phy_get_with_args(&args);
>>>      out_put_node:
>>>        of_node_put(args.np);
>>> @@ -1001,6 +1017,37 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>>>    }
>>>    EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>>>    +/**
>>> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
>>> + * @np: node containing the phy
>>> + *
>>> + * Returns: the phy associated with the device node or ERR_PTR.
>>> + */
>>> +struct phy *phy_get_by_of_node(struct device_node *np)
>>> +{
>>> +    struct of_phandle_args args = { .np = np, .args_count = 0 };
>>> +    struct phy *phy;
>>> +
>>> +    mutex_lock(&phy_provider_mutex);
>>
>> I don't really understand the usage of lockdep_assert_held(), but why
>> does _of_phy_get() uses lockdep_assert_held() and here you use mutex_lock()
>> like before patch 1 ?
> 
> Hi, not Bryan but I can answer this question.
> 
> lockdep_assert_held() check that the mutex is lock and triggers
> a WARN() when not held.
> 
> So lockdep_assert_held() is used in functions which expect to
> be called with the mutex already locked, like the new
> _of_phy_get_with_args() helper which is added here.
> 
> This new helper factors out bits of _of_phy_get(), which itself
> already has lockdep_assert_held(), but since this new helper
> also is directly called from the new phy_get_by_of_node() it
> is good for it to also check the mutex is locked itself.
> 
> And since the new phy_get_by_of_node() calls this new helper
> it must lock the mutex.
> 
> Note that _of_phy_get() is already always called with the mutex
> locked from of_phy_get(), phy_get(), or devm_of_phy_get_by_index().

Ok thanks for the detailed explanation, I missed that !

Neil

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>>
>> Neil
>>
>>> +
>>> +    phy = _of_phy_get_with_args(&args);
>>> +    if (IS_ERR(phy))
>>> +        goto out_unlock;
>>> +
>>> +    if (!try_module_get(phy->ops->owner)) {
>>> +        phy = ERR_PTR(-EPROBE_DEFER);
>>> +        goto out_unlock;
>>> +    }
>>> +
>>> +    get_device(&phy->dev);
>>> +
>>> +out_unlock:
>>> +    mutex_unlock(&phy_provider_mutex);
>>> +
>>> +    return phy;
>>> +}
>>> +EXPORT_SYMBOL_GPL(phy_get_by_of_node);
>>> +
>>>    /**
>>>     * phy_create() - create a new phy
>>>     * @dev: device that is creating the new phy
>>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>>> index ea47975e288ae..71c2e16397130 100644
>>> --- a/include/linux/phy/phy.h
>>> +++ b/include/linux/phy/phy.h
>>> @@ -284,6 +284,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
>>>                         const char *con_id);
>>>    struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>>>                         int index);
>>> +struct phy *phy_get_by_of_node(struct device_node *np);
>>>    void of_phy_put(struct phy *phy);
>>>    void phy_put(struct device *dev, struct phy *phy);
>>>    void devm_phy_put(struct device *dev, struct phy *phy);
>>> @@ -493,6 +494,11 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
>>>        return ERR_PTR(-ENOSYS);
>>>    }
>>>    +static inline struct phy *phy_get_by_of_node(struct device_node *np)
>>> +{
>>> +    return ERR_PTR(-ENOSYS);
>>> +}
>>> +
>>>    static inline void of_phy_put(struct phy *phy)
>>>    {
>>>    }
>>>
>>
>>
> 

