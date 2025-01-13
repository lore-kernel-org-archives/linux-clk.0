Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272521FBBC7
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779330; cv=none; b=F2+c+mzRDVq9Nvc55E1WT1RcUPC1DQHIohjRBMJcXeH1Hud27u/ALpxlFHDhVkIqcoDoBev1c72dU9z8BJe4zxERvGbk89NsioS58EseXd2hdRFXT945EJtHikSUSQxls27mQox8WgWCdJnBNpciLYIyw/rAw1l4Xpbexj/2QGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779330; c=relaxed/simple;
	bh=8AKwMQStcskqaYKDQrQljP8ITvDP2Yv4wOUtGdrHaGs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F0ON0RFGJvmZdkABM37v36skd3w+nsF9WNhkaGz6bZ2/cnJwgfjBCylX2ZHUPjTnc8/rWVeISOAXkQ4NPP73JdlG7NPg/vHsID1FLWgIpYSPCI6Vq+kp1/fGIHopgAdINB9sJQVeXmQhj5ElWzqTw3mRSsgvsnc/RBPYfKNQhqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AVRPt52K; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AVRPt52K"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e3621518so2248160f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 06:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736779325; x=1737384125; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lb6YuTAzu7Sf7E/71SNI8tjWjj+X6TF/vqmtM2CPGTQ=;
        b=AVRPt52KH6ui3aIQhk9zLWd8whQxBmUfqpaMR0/FqnXG3fN3DG6vi49H5TJknJK3sT
         c9cQOHbS7oNJWW7hqaIlApcnHUy+GDW7JC1JWzv8iPs6ln0Bg4gbClksK2CRWhYeb/gW
         t2/AK+qFLtohy3ivQu13XygDAU/jMqB/XsCRcvkGFzyTaQExi3goTDU5oTcI+qiUtPk8
         jgORmdn/UeFgW2GmocWIvq604F+iKzcK4TJYpEfevOe26dsAXtdO9IQr+6Rmwjp/l9dN
         A38/Sk5vefPe0j2Z1gpEhSRXzYtgQ6XFKvMs0yAiebMuqf6OuaUqIzH9P1jHd8LG7zGy
         oStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736779325; x=1737384125;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lb6YuTAzu7Sf7E/71SNI8tjWjj+X6TF/vqmtM2CPGTQ=;
        b=KWHa1HdYHNKXBPsSVwGP7C4ytYvGxAVRza2UJfMg1PDqkZa/BRMr6SOP0s42bFbzYG
         KvA5LREiwJR1JPPP6EMxfXQqQ2ijf5s64A5o5lkojcwGzrkUk5eh/Tf03mHoTmHn3uDd
         YJ/dEhIMb6NkgWx4puSXK6KwIv/ULLZiZQM3yfLGXha3Cmywx6UjZv03vuTbFNfjasig
         BW+zPLA9UBj41TJt1Sil3tDc7PYtG3I8tzjjZq8WNmtUPuES37nRi8TFR9gR1SfppXO8
         ZeLRIDf6UtkOwedbsipZOr3XeAmnnRqBgtohmy2HiZUIOC/ZClfowROrAw07hKofKuhB
         sfLg==
X-Forwarded-Encrypted: i=1; AJvYcCUDtd9E2YsrFO15J40s7us75DIhmsy4xW5alHO6WCL6vmpRYSFbzdElA+0g9KmsEah2hSZenG8F2Po=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Scmz2xBIxUFFB7UEszIdWMJMbujeFiZG2/G1ysPZ7ytRhlk6
	3ijDZCZ0RURPP6TaZJbaD2dEz2QfhZnTgV3FrOblOfxbHwFDjGitZ5onygbFz8U=
X-Gm-Gg: ASbGncsYBTZNhXScpZ2MRBsVxlMgd6yhw4EGl3RSB8gafRZmKJEkvCAz4EO5hsBCkSO
	2X+CE5i/UrCwjtV4E4djInV4BVVlkTIrHse+8iSUH/xxwJ1vK7GJXOREBALyvfwl0Zaq5fVdNiy
	KQOu0759qKM6K3eHMU/JXbDUi48RacZh31rat/OUBrlTsMoECIGydhobR0aqfn3Ep5+caF6v+g9
	yB2Gdce+jETRM32UQ2DLyTi5sdJ8lKkQNikQDV2akhu9p7LbdlJl5oW
X-Google-Smtp-Source: AGHT+IG6Iyk/usJ3PaXSgOJW8RQqZzytW1vPAaUf9mn5cj2JQm5o8RVraqAOcrvjtzBLdcWc+AXaxA==
X-Received: by 2002:a5d:6d09:0:b0:386:1c13:30d5 with SMTP id ffacd0b85a97d-38a872f6ebfmr18247061f8f.7.1736779325290;
        Mon, 13 Jan 2025 06:42:05 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:9d2d:28cc:aafd:8429])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e6251asm150714585e9.40.2025.01.13.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:42:04 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: amlogic: c3: Limit the rate boundaries of clk_hw
In-Reply-To: <2578a79d-1e24-4336-9859-e384c8f69269@amlogic.com> (Chuan Liu's
	message of "Mon, 13 Jan 2025 13:24:41 +0800")
References: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
	<20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
	<1j34hqai39.fsf@starbuckisacylon.baylibre.com>
	<2578a79d-1e24-4336-9859-e384c8f69269@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 13 Jan 2025 15:42:04 +0100
Message-ID: <1jr05693nn.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 13 Jan 2025 at 13:24, Chuan Liu <chuan.liu@amlogic.com> wrote:

> hi Jerome,
>
> Thanks for your prompt reply.
>
>
> On 1/10/2025 9:55 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Fri 10 Jan 2025 at 19:47, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>>
>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>
>>> The PLL can only stably lock within a limited frequency range.
>>>
>>> Due to timing constraints, the maximum frequency of the peripheral clock
>>> cannot exceed the design specifications.
>>>
>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>> ---
>>>   drivers/clk/meson/c3-peripherals.c | 21 +++++++++++++++++++++
>>>   drivers/clk/meson/c3-pll.c         |  4 ++++
>>>   2 files changed, 25 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
>>> index 7dcbf4ebee07..9f0a3990f0d6 100644
>>> --- a/drivers/clk/meson/c3-peripherals.c
>>> +++ b/drivers/clk/meson/c3-peripherals.c
>>> @@ -568,6 +568,7 @@ static const struct clk_parent_data pwm_parent_data[] = {
>>>                .ops = &clk_regmap_gate_ops,                    \
>>>                .parent_names = (const char *[]) { #_name "_div" },\
>>>                .num_parents = 1,                               \
>>> +             .max_rate = 200000000,                          \
>>>                .flags = CLK_SET_RATE_PARENT,                   \
>>>        },                                                      \
>>>   }
>>> @@ -724,6 +725,7 @@ static struct clk_regmap spicc_a = {
>>>                        &spicc_a_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 500000000,
>> I'm sorry but the whole thing is completly wrong.
>>
>> All the clocks I'm seeing here are gates. This type of HW hardly cares
>> what rates it handles. Same goes from mux, dividers, etc ...
>
>
> The purpose of the patch is to constrain the clock network between
> "clk_hw" and "clk_sonsumers". The output source of this clock network
> may come from gate, mux, divider, etc.
>
>
>>
>> All you are doing here is trying enforce some made up "safety" / use-case
>> defined limits that do not belong in the clock controller.
>
>
> Yes, the purpose is also to ensure "safety". From a strict perspective,
> this constraint indeed does not belong to the clock controller. However,
> the source of the potential hazard comes from the clock driver, and we
> have already identified this hazard. Therefore, I think it is better to
> avoid it in the clock driver?
>

No. The clock provider driver describe the how the clock are _provided_,
not how they are meant to used.

>
>>
>> The only piece of HW where limits could possibly make sense are PLL DCO,
>> and even there, you've got multiplier range which is way better as an
>> abstraction.
>
>
> From the perspective of HW, the timing constraints of the clock are for
> the entire clock network with the same name. The output source of this
> clock network may come from PLL, gate, mux, etc. The multiplier range
> of the PLL can also achieve a similar effect. If this approach works,
> we don't need to define the multiplier range for the PLL (PS: Our
> current multiplier range is limited to the case where "n" is not divided).
>
>
>>
>> So it's a nack on the series.
>>
>> If devices are have particular requirement on rate range, have the
>> related driver set it.
>
>
> I think that the clock configuration exceeding the timing constraints
> is a hidden danger that all chips have and face, but this hidden danger
> is not easy to be exposed?
>
> For instance, if the routing of a clock network is close to the clock
> or data bus of other modules, and this clock network is wrongly
> configured to a frequency beyond the constraints, causing crosstalk
> that affects the normal operation of other modules. If such a situation
> occurs, it will be very difficult to troubleshoot. How should this
> situation be handled more reasonably?

Fix your consumers drivers if you need to. Set range if you must.

Those are not clock provider constraints. Those are use-case ones. It
does belong here and CCF already provides the necessary infra to deal
with ranges.

>
>
>>
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -771,6 +773,7 @@ static struct clk_regmap spicc_b = {
>>>                        &spicc_b_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 500000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -829,6 +832,7 @@ static struct clk_regmap spifc = {
>>>                        &spifc_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 167000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -887,6 +891,7 @@ static struct clk_regmap sd_emmc_a = {
>>>                        &sd_emmc_a_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 250000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -934,6 +939,7 @@ static struct clk_regmap sd_emmc_b = {
>>>                        &sd_emmc_b_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 250000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -981,6 +987,7 @@ static struct clk_regmap sd_emmc_c = {
>>>                        &sd_emmc_c_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 1200000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1074,6 +1081,7 @@ static struct clk_regmap eth_rmii = {
>>>                        &eth_rmii_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 50000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1132,6 +1140,7 @@ static struct clk_regmap mipi_dsi_meas = {
>>>                        &mipi_dsi_meas_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 200000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1190,6 +1199,7 @@ static struct clk_regmap dsi_phy = {
>>>                        &dsi_phy_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 1500000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1248,6 +1258,7 @@ static struct clk_regmap vout_mclk = {
>>>                        &vout_mclk_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 334000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1306,6 +1317,7 @@ static struct clk_regmap vout_enc = {
>>>                        &vout_enc_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 200000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1431,6 +1443,7 @@ static struct clk_regmap hcodec = {
>>>                .ops = &clk_regmap_mux_ops,
>>>                .parent_data = hcodec_parent_data,
>>>                .num_parents = ARRAY_SIZE(hcodec_parent_data),
>>> +             .max_rate = 667000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1489,6 +1502,7 @@ static struct clk_regmap vc9000e_aclk = {
>>>                        &vc9000e_aclk_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 667000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1536,6 +1550,7 @@ static struct clk_regmap vc9000e_core = {
>>>                        &vc9000e_core_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 400000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1594,6 +1609,7 @@ static struct clk_regmap csi_phy0 = {
>>>                        &csi_phy0_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 200000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1652,6 +1668,7 @@ static struct clk_regmap dewarpa = {
>>>                        &dewarpa_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 800000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1710,6 +1727,7 @@ static struct clk_regmap isp0 = {
>>>                        &isp0_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 400000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1768,6 +1786,7 @@ static struct clk_regmap nna_core = {
>>>                        &nna_core_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 800000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1826,6 +1845,7 @@ static struct clk_regmap ge2d = {
>>>                        &ge2d_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 667000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> @@ -1884,6 +1904,7 @@ static struct clk_regmap vapb = {
>>>                        &vapb_div.hw
>>>                },
>>>                .num_parents = 1,
>>> +             .max_rate = 400000000,
>>>                .flags = CLK_SET_RATE_PARENT,
>>>        },
>>>   };
>>> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
>>> index 35fda31a19e2..d80d6ee2409d 100644
>>> --- a/drivers/clk/meson/c3-pll.c
>>> +++ b/drivers/clk/meson/c3-pll.c
>>> @@ -286,6 +286,8 @@ static struct clk_regmap gp0_pll_dco = {
>>>                        .fw_name = "top",
>>>                },
>>>                .num_parents = 1,
>>> +             .min_rate = 3000000000,
>>> +             .max_rate = 6000000000,
>>>        },
>>>   };
>>>
>>> @@ -370,6 +372,8 @@ static struct clk_regmap hifi_pll_dco = {
>>>                        .fw_name = "top",
>>>                },
>>>                .num_parents = 1,
>>> +             .min_rate = 3000000000,
>>> +             .max_rate = 6000000000,
>>>        },
>>>   };
>> --
>> Jerome

-- 
Jerome
