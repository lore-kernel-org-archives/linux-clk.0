Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F3023A106
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779605; cv=none; b=FOs//itNwSYjz3w/x7dNpJf075DyYgVB1gMFPp/Xb4iS6b7kstlv7f1UuwmlnqP0iHo+rpDP3LU/QYDl5FBODE3SL01UrCIwv3k1UPk8QwHrd1uscxqPhoD6vFT/FzYix3NMp0Z9T1G9rn595M0kl4RGrUPIU9opiAJcnbvweV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779605; c=relaxed/simple;
	bh=SriqCVrEowAp6BXPDxIZ4IdpEUaMb7Erfom/ZP9KIjg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lC33hh7gmoM9378MljK18DRWnlo6t41EynkYBM58ZnN8LFPsogoK/m+oXulKnpv0GyYCEr6ibn8gKGmRep/lWKFto58FIIR7lSaXc2G1n7ZHoIkHkm2nC7TbUI4+aPdauyZU+HBOm5NuNiNETKsSe0YUG4VXOG3S8i7SvirsAVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hoo9TPwn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hoo9TPwn"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so31541685e9.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 06:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736779601; x=1737384401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tE6hZ+Fd5mw5nOuuEkulLuKJpq+Pv/1H3hGSSWLum8w=;
        b=hoo9TPwnkNgOAtHl7Zh+voKbKChQx+6RUi11d2PWcypxLGvpk4nNlYkZNCtj81K5AP
         Sd+ec8QBSPcFW4ybnCJ7YDCv0VHs9PcCaDHuD1xnEfFMdy6zHb9i7lzJlF/gZXW5LspD
         PD33oaqFJuwNeS6dK19PFvpYoqYLXwuQqWGQfQurnDieDvqnERwug6DpOLpHzYoXn8Em
         OMzuBxleRh7vsEh4NPDLzVn+x3P4O+b1OQGUACy8A0w+gP1xFnHkMSeMV3Fk559EfsQy
         NYN97YWrmd7/pUAawqTvLLsTIryt+8rDXicmtsRZaKYMgB+02N0r5Wu7T+tUxrIZuXGf
         ozmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736779601; x=1737384401;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tE6hZ+Fd5mw5nOuuEkulLuKJpq+Pv/1H3hGSSWLum8w=;
        b=G5obVPCtFFYNhQlBtQqVZtxYb8MPZXvj/TT5kVRilllf9umq5r4KeybwXOYxSFR4lb
         5pbUmA3TM2r6yuiFjLI3yQjI2GKaSwCNNGG7KhUaDlCjrhv0yqQPQ+GDKvnGwg/1rHNB
         QzQ/2kARzuNVzFQzCKV+yDuSGFiytvcR6jjIBg4hyzsNjE38p1lm1/eUPSTLzfhNGzmU
         +WpHgfXZ2fe2mAOWrIvASPa0/YGmjaNSzebxjkYZo0UMZ9qT8upFWAbY5+rJ7wubK8lb
         xvBrGxWWh7asM1uGOl6TUMw02BQ2f9GrUtLg9vKuVzcjqwDwcQsngqo4t0/rYqvzt8pL
         0QTg==
X-Forwarded-Encrypted: i=1; AJvYcCVBnVsQFcARI1rzx7fT8cFRduH015XG6Tpy5pgl/2vCPuH7pvsPF7gem/QuG/Hd68deHbwoCFFbpDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAJT7o2V2y5gw9aLgbztNIZZA5p/MkAINkxvSmBdeJpRkSaXXU
	tqfpvLsIVCwgekne/TeDtOtzAiwrCEZw0McuH577E1ASzquI1JY5MDI3A2ya1U8=
X-Gm-Gg: ASbGncszlsPD45gF0+8l+Y6JekD8qHBdxreHe62ZCnrHAfgJG+EQBHsazSPLxawNd7p
	UChQMRjU5OYElfVZn1Zc/4J66vhhfZyKbqhmw5xsMbEcAEABi6PcZhtwgA/p6+vBdW8b4xhG7yy
	wWnmuLf8p6r0fIqycwR4F6AGxcq5sBIHRKiBiK9q5Q2CsJirn5Ru7HfA5P7AC6762twQXg+FapB
	pVbRg4Hc76/O+2RWbwL5No1vGkWIYiH2dBmhEPDNM3XPNewRAtncq1JRkRkFTslh2WO6pEP26BU
	XLLuXMlLRZamNTBKTb1Cs8fbXGQ9wGx+kA==
X-Google-Smtp-Source: AGHT+IGSgrLOXrRzTlVLniHLSwjw2ewxLMRWdGdwprfbH4ZVqnu/OhLOX7NBhsM0TFAi3c/YYUsydA==
X-Received: by 2002:a05:600c:a09:b0:434:f1e9:afb3 with SMTP id 5b1f17b1804b1-436e267863emr180558495e9.3.1736779601413;
        Mon, 13 Jan 2025 06:46:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d7c2:9cac:29c7:268b? ([2a01:e0a:982:cbb0:d7c2:9cac:29c7:268b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d7fsm144561755e9.32.2025.01.13.06.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 06:46:40 -0800 (PST)
Message-ID: <af501f2e-2dd6-4182-872d-76260edba973@linaro.org>
Date: Mon, 13 Jan 2025 15:46:39 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] clk: amlogic: c3: Limit the rate boundaries of clk_hw
To: Jerome Brunet <jbrunet@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
 <20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
 <1j34hqai39.fsf@starbuckisacylon.baylibre.com>
 <2578a79d-1e24-4336-9859-e384c8f69269@amlogic.com>
 <1jr05693nn.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1jr05693nn.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/01/2025 15:42, Jerome Brunet wrote:
> On Mon 13 Jan 2025 at 13:24, Chuan Liu <chuan.liu@amlogic.com> wrote:
> 
>> hi Jerome,
>>
>> Thanks for your prompt reply.
>>
>>
>> On 1/10/2025 9:55 PM, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Fri 10 Jan 2025 at 19:47, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>>
>>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>>
>>>> The PLL can only stably lock within a limited frequency range.
>>>>
>>>> Due to timing constraints, the maximum frequency of the peripheral clock
>>>> cannot exceed the design specifications.
>>>>
>>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>>> ---
>>>>    drivers/clk/meson/c3-peripherals.c | 21 +++++++++++++++++++++
>>>>    drivers/clk/meson/c3-pll.c         |  4 ++++
>>>>    2 files changed, 25 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
>>>> index 7dcbf4ebee07..9f0a3990f0d6 100644
>>>> --- a/drivers/clk/meson/c3-peripherals.c
>>>> +++ b/drivers/clk/meson/c3-peripherals.c
>>>> @@ -568,6 +568,7 @@ static const struct clk_parent_data pwm_parent_data[] = {
>>>>                 .ops = &clk_regmap_gate_ops,                    \
>>>>                 .parent_names = (const char *[]) { #_name "_div" },\
>>>>                 .num_parents = 1,                               \
>>>> +             .max_rate = 200000000,                          \
>>>>                 .flags = CLK_SET_RATE_PARENT,                   \
>>>>         },                                                      \
>>>>    }
>>>> @@ -724,6 +725,7 @@ static struct clk_regmap spicc_a = {
>>>>                         &spicc_a_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 500000000,
>>> I'm sorry but the whole thing is completly wrong.
>>>
>>> All the clocks I'm seeing here are gates. This type of HW hardly cares
>>> what rates it handles. Same goes from mux, dividers, etc ...
>>
>>
>> The purpose of the patch is to constrain the clock network between
>> "clk_hw" and "clk_sonsumers". The output source of this clock network
>> may come from gate, mux, divider, etc.
>>
>>
>>>
>>> All you are doing here is trying enforce some made up "safety" / use-case
>>> defined limits that do not belong in the clock controller.
>>
>>
>> Yes, the purpose is also to ensure "safety". From a strict perspective,
>> this constraint indeed does not belong to the clock controller. However,
>> the source of the potential hazard comes from the clock driver, and we
>> have already identified this hazard. Therefore, I think it is better to
>> avoid it in the clock driver?
>>
> 
> No. The clock provider driver describe the how the clock are _provided_,
> not how they are meant to used.
> 
>>
>>>
>>> The only piece of HW where limits could possibly make sense are PLL DCO,
>>> and even there, you've got multiplier range which is way better as an
>>> abstraction.
>>
>>
>>  From the perspective of HW, the timing constraints of the clock are for
>> the entire clock network with the same name. The output source of this
>> clock network may come from PLL, gate, mux, etc. The multiplier range
>> of the PLL can also achieve a similar effect. If this approach works,
>> we don't need to define the multiplier range for the PLL (PS: Our
>> current multiplier range is limited to the case where "n" is not divided).
>>
>>
>>>
>>> So it's a nack on the series.
>>>
>>> If devices are have particular requirement on rate range, have the
>>> related driver set it.
>>
>>
>> I think that the clock configuration exceeding the timing constraints
>> is a hidden danger that all chips have and face, but this hidden danger
>> is not easy to be exposed?
>>
>> For instance, if the routing of a clock network is close to the clock
>> or data bus of other modules, and this clock network is wrongly
>> configured to a frequency beyond the constraints, causing crosstalk
>> that affects the normal operation of other modules. If such a situation
>> occurs, it will be very difficult to troubleshoot. How should this
>> situation be handled more reasonably?
> 
> Fix your consumers drivers if you need to. Set range if you must.
> 
> Those are not clock provider constraints. Those are use-case ones. It
> does belong here and CCF already provides the necessary infra to deal
> with ranges.

I kind of disagree here, if the vendor has the data and is willing to share
the range for each clock path of the system, I think it should be welcome!

Usually those ranges are not disclosed, so we don't set them, but CCF will
certainly use all those range to make an even better decision on the lock
routing.

Neil

> 
>>
>>
>>>
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -771,6 +773,7 @@ static struct clk_regmap spicc_b = {
>>>>                         &spicc_b_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 500000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -829,6 +832,7 @@ static struct clk_regmap spifc = {
>>>>                         &spifc_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 167000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -887,6 +891,7 @@ static struct clk_regmap sd_emmc_a = {
>>>>                         &sd_emmc_a_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 250000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -934,6 +939,7 @@ static struct clk_regmap sd_emmc_b = {
>>>>                         &sd_emmc_b_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 250000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -981,6 +987,7 @@ static struct clk_regmap sd_emmc_c = {
>>>>                         &sd_emmc_c_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 1200000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1074,6 +1081,7 @@ static struct clk_regmap eth_rmii = {
>>>>                         &eth_rmii_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 50000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1132,6 +1140,7 @@ static struct clk_regmap mipi_dsi_meas = {
>>>>                         &mipi_dsi_meas_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 200000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1190,6 +1199,7 @@ static struct clk_regmap dsi_phy = {
>>>>                         &dsi_phy_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 1500000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1248,6 +1258,7 @@ static struct clk_regmap vout_mclk = {
>>>>                         &vout_mclk_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 334000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1306,6 +1317,7 @@ static struct clk_regmap vout_enc = {
>>>>                         &vout_enc_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 200000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1431,6 +1443,7 @@ static struct clk_regmap hcodec = {
>>>>                 .ops = &clk_regmap_mux_ops,
>>>>                 .parent_data = hcodec_parent_data,
>>>>                 .num_parents = ARRAY_SIZE(hcodec_parent_data),
>>>> +             .max_rate = 667000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1489,6 +1502,7 @@ static struct clk_regmap vc9000e_aclk = {
>>>>                         &vc9000e_aclk_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 667000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1536,6 +1550,7 @@ static struct clk_regmap vc9000e_core = {
>>>>                         &vc9000e_core_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 400000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1594,6 +1609,7 @@ static struct clk_regmap csi_phy0 = {
>>>>                         &csi_phy0_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 200000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1652,6 +1668,7 @@ static struct clk_regmap dewarpa = {
>>>>                         &dewarpa_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 800000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1710,6 +1727,7 @@ static struct clk_regmap isp0 = {
>>>>                         &isp0_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 400000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1768,6 +1786,7 @@ static struct clk_regmap nna_core = {
>>>>                         &nna_core_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 800000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1826,6 +1845,7 @@ static struct clk_regmap ge2d = {
>>>>                         &ge2d_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 667000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> @@ -1884,6 +1904,7 @@ static struct clk_regmap vapb = {
>>>>                         &vapb_div.hw
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .max_rate = 400000000,
>>>>                 .flags = CLK_SET_RATE_PARENT,
>>>>         },
>>>>    };
>>>> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
>>>> index 35fda31a19e2..d80d6ee2409d 100644
>>>> --- a/drivers/clk/meson/c3-pll.c
>>>> +++ b/drivers/clk/meson/c3-pll.c
>>>> @@ -286,6 +286,8 @@ static struct clk_regmap gp0_pll_dco = {
>>>>                         .fw_name = "top",
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .min_rate = 3000000000,
>>>> +             .max_rate = 6000000000,
>>>>         },
>>>>    };
>>>>
>>>> @@ -370,6 +372,8 @@ static struct clk_regmap hifi_pll_dco = {
>>>>                         .fw_name = "top",
>>>>                 },
>>>>                 .num_parents = 1,
>>>> +             .min_rate = 3000000000,
>>>> +             .max_rate = 6000000000,
>>>>         },
>>>>    };
>>> --
>>> Jerome
> 

