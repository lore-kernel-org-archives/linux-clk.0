Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6680225A33F
	for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057682; cv=none; b=A5GCUoowBHvqHGle6lBlOch7WvpVJW3q8HV+OZy7cazC11THGfEJIhB21AFNLTA5QHNt3qEGv7CkFcdn2F2phgk/7H1F/+KzV7/6Dv3kM44y1MwlhsXawAneuXs0epJZuTsaJnzCZa0asi0xT5TYAI9yNXKntbDpexvjC2Wyh04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057682; c=relaxed/simple;
	bh=3Jtr8hfXIcpoL2wm9KUeSEOach/8o8JimSto8d6MKMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCzdIRaCMeD3non9/ybSJwZGeOMB15YFAQ1nQRvuXAYx0DjV0JVAcSjhSg6oGvq4y87nWJz0LyYMx9Lc940zBHzbv0fiQ74KCa23t9NwTuOBuer/KEH3zkCVFF5b86fBLhHt/zNu1SyDsc3/XyJMX7Jqp+ZFDMGcXZKfIBIOTfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fLacILKX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fLacILKX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so53910925e9.1
        for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 07:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768057679; x=1768662479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cR+G5T80P/4PxmcURhvOtZwvVr9pTtR/m1ae5uYMxT8=;
        b=fLacILKXFGRHFHL1J7il5DogkcFIsK6tLBI0ORjS9+I4PiZZ6IqobYGJLUCJXDa2Ev
         yUVTPQZOooLpJKmlTa4BVdifEE/12RB3jdFgmALPX6DNmalTag5yysltFYLXYQPf16Fs
         lKIDREgdCjCOtOz/3zWow3XZrNnlLu8HsslCrvT0QQpdAmjsixgpu07L8vvf2Kcy/vvm
         MgS9RQIgA5O68LNfM+ULvBD/ucVHJFWd+/ByqX7tyOAs29akssCHfh8R16n5h5JmG8cI
         JfESK8eDaxprs5PYvMalJ37Wgv5G0cFjWRJvjOuZZ6IuLzoDr0dz+V1KXwM68PRsxLXi
         q9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057679; x=1768662479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cR+G5T80P/4PxmcURhvOtZwvVr9pTtR/m1ae5uYMxT8=;
        b=HRTas/0R4mpSkQYOTa8xQkcY4u/xOQ2GTQtU888f66X9T+kQygRqzta/FBzJpz1V/j
         zr4avNjNRSkXAcHZY/VeGb+ppIjGatLfyC6coCt7IpCBI9SQ9pWHjxklSjgo9Aa/ogNQ
         yT5/P9c2kkvrKcMCLUItvksu+NCwIjfEtphqJ0qQeR+oZ+lKIKWevymgxD4H3w8NBnZ2
         4/GTB8mHX0DawNB9rAAPib9F/dCm37dthTwZ0jDHhzDJ37gXrsPquqmDlnKDIQjXhEoU
         UGecAjX4Wc8dUPBkQLWTFbPt0lEKVXNXSyvMzAAiMc4sMHVxEhW/6cmYGegOOw3LqsfP
         n+1A==
X-Gm-Message-State: AOJu0Yyyf2CY91HuRXpRAgIJtblKHOQuq0+hjf14siqLO/wsoR70a8zR
	CgczCiaddYDW/FxdxkaE/kM7cD7QgJap54qirueFgJmF2/koEApSX+qO4jY/oEUQpb8=
X-Gm-Gg: AY/fxX5aCUY0gMZ8abAm6xPLc9p6khicsc9zF77ipvnHCjmvJGxumZP7EKhahrzuUts
	/D0Kfoam046d0XGDgBsP2Y315A42ujPLhdiqpJ14RsqnO6YVanu05fmiWnq2sCB7oXN6X2dRvHy
	sqw1DWhiqP56LFFwas7U98LtCveagJ3kGAwssPkirP82oJ6xU/qoSNWCZ6it8qQanNODZN9LcwG
	PqFTvxWyGM+uBlOC/THtSaUpj+vA3XqqGnPnGfOngRHfgehOb/8jiPi6oIZDOdqddr9jRsLR22I
	3jWmSZpdlgpr1gv1uAxTjTwJ0K4WeE/X1FS+2iVdBL5NoWMzsIDeziKCfcfAlAhMjot73Fm8vLz
	Ezi+EKOjdeuNkyLQLJNnfGZI3PFRz7fJmB3mnsyZJ/TtFM+OPniq/Ibo23KwhCeEjZev1hrtGrt
	der61WK/WPnQTYAv6rnm2ic+okxFvh
X-Google-Smtp-Source: AGHT+IEYVV6CVZiBIJH8fcJdAkX68YotvoK8xvZNjWkRE9J4wka7M63evPSE8cyIGECtjH50PiK0aw==
X-Received: by 2002:a05:600c:1d19:b0:47d:5089:a476 with SMTP id 5b1f17b1804b1-47d84b386fdmr173305105e9.31.1768057678732;
        Sat, 10 Jan 2026 07:07:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184cbsm274940855e9.6.2026.01.10.07.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:07:58 -0800 (PST)
Message-ID: <5b43e5de-f262-457a-b797-f545abb4ee17@tuxon.dev>
Date: Sat, 10 Jan 2026 17:07:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/31] clk: at91: dt-compat: switch to parent_hw and
 parent_data
To: Ryan Wanner <ryan.wanner@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <628859234f4b2523f43b3ac05d5e29ceb05a7f61.1758226719.git.Ryan.Wanner@microchip.com>
 <eed15c43-dde3-410b-b2a3-655f4acf8d97@tuxon.dev>
 <0402804e-7575-42b2-9990-1b09fca80451@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <0402804e-7575-42b2-9990-1b09fca80451@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/9/26 19:03, Ryan Wanner wrote:
> On 10/20/25 12:15, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi, Ryan,
>>
>> On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>
>>> Switch old dt-compat clocks to use parent_hw and parent_data. Having
>>> parent_hw instead of parent names improves to clock registration
>>> speed and re-parenting.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>> ---
>>>   drivers/clk/at91/dt-compat.c | 80 +++++++++++++++++++++++++-----------
>>>   1 file changed, 56 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
>>> index fa8658d3be7b..9ca871b817e0 100644
>>> --- a/drivers/clk/at91/dt-compat.c
>>> +++ b/drivers/clk/at91/dt-compat.c
>>> @@ -43,7 +43,8 @@ static void __init of_sama5d2_clk_audio_pll_frac_setup(struct device_node *np)
>>>
>>>        parent_name = of_clk_get_parent_name(np, 0);
>>>
>>> -     hw = at91_clk_register_audio_pll_frac(regmap, name, parent_name, NULL);
>>> +     hw = at91_clk_register_audio_pll_frac(regmap, name, NULL,
>>> +                                           &AT91_CLK_PD_NAME(parent_name));
>>>        if (IS_ERR(hw))
>>>                return;
>>>
>>> @@ -69,7 +70,8 @@ static void __init of_sama5d2_clk_audio_pll_pad_setup(struct device_node *np)
>>>
>>>        parent_name = of_clk_get_parent_name(np, 0);
>>>
>>> -     hw = at91_clk_register_audio_pll_pad(regmap, name, parent_name, NULL);
>>> +     hw = at91_clk_register_audio_pll_pad(regmap, name, NULL,
>>> +                                          &AT91_CLK_PD_NAME(parent_name));
>>>        if (IS_ERR(hw))
>>>                return;
>>>
>>> @@ -95,7 +97,7 @@ static void __init of_sama5d2_clk_audio_pll_pmc_setup(struct device_node *np)
>>>
>>>        parent_name = of_clk_get_parent_name(np, 0);
>>>
>>> -     hw = at91_clk_register_audio_pll_pmc(regmap, name, parent_name, NULL);
>>> +     hw = at91_clk_register_audio_pll_pmc(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>>>        if (IS_ERR(hw))
>>>                return;
>>>
>>> @@ -129,6 +131,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>>>        struct clk_hw *hw;
>>>        unsigned int num_parents;
>>>        const char *parent_names[GENERATED_SOURCE_MAX];
>>> +     struct clk_parent_data parent_data[GENERATED_SOURCE_MAX];
>>>        struct device_node *gcknp, *parent_np;
>>>        struct clk_range range = CLK_RANGE(0, 0);
>>>        struct regmap *regmap;
>>> @@ -149,6 +152,8 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>>>        if (IS_ERR(regmap))
>>>                return;
>>>
>>> +     for (unsigned int i = 0; i < num_parents; i++)
>>> +             parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
>>>        for_each_child_of_node(np, gcknp) {
>>>                int chg_pid = INT_MIN;
>>>
>>> @@ -171,7 +176,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>>>
>>>                hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>>>                                                 &dt_pcr_layout, name,
>>> -                                              parent_names, NULL, NULL,
>>> +                                              NULL, parent_data, NULL,
>>>                                                 num_parents, id, &range,
>>>                                                 chg_pid);
>>>                if (IS_ERR(hw))
>>> @@ -201,7 +206,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
>>>
>>>        parent_name = of_clk_get_parent_name(np, 0);
>>>
>>> -     hw = at91_clk_register_h32mx(regmap, name, parent_name, NULL);
>>> +     hw = at91_clk_register_h32mx(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>>>        if (IS_ERR(hw))
>>>                return;
>>>
>>> @@ -228,6 +233,8 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
>>>                return;
>>>
>>>        for_each_child_of_node(np, i2s_mux_np) {
>>> +             struct clk_parent_data parent_data[2];
>>> +
>>>                if (of_property_read_u8(i2s_mux_np, "reg", &bus_id))
>>>                        continue;
>>>
>>> @@ -238,8 +245,10 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
>>>                if (ret != 2)
>>>                        continue;
>>>
>>> +             parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
>>> +             parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
>>>                hw = at91_clk_i2s_mux_register(regmap_sfr, i2s_mux_np->name,
>>> -                                            parent_names, NULL, 2, bus_id);
>>> +                                            NULL, parent_data, 2, bus_id);
>>>                if (IS_ERR(hw))
>>>                        continue;
>>>
>>> @@ -269,7 +278,8 @@ static void __init of_at91rm9200_clk_main_osc_setup(struct device_node *np)
>>>        if (IS_ERR(regmap))
>>>                return;
>>>
>>> -     hw = at91_clk_register_main_osc(regmap, name, parent_name, NULL, bypass);
>>> +     hw = at91_clk_register_main_osc(regmap, name, NULL,
>>> +                                     &AT91_CLK_PD_NAME(parent_name), bypass);
>>>        if (IS_ERR(hw))
>>>                return;
>>>
>>> @@ -323,7 +333,7 @@ static void __init of_at91rm9200_clk_main_setup(struct device_node *np)
>>>        if (IS_ERR(regmap))
>>>                return;
>>>
>>> -     hw = at91_clk_register_rm9200_main(regmap, name, parent_name, NULL);
>>> +     hw = at91_clk_register_rm9200_main(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>>>        if (IS_ERR(hw))
>>>                return;
>>>
>>> @@ -336,6 +346,7 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
>>>   {
>>>        struct clk_hw *hw;
>>>        const char *parent_names[2];
>>> +     struct clk_parent_data parent_data[2];
>>>        unsigned int num_parents;
>>>        const char *name = np->name;
>>>        struct regmap *regmap;
>>> @@ -354,7 +365,9 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
>>>
>>>        of_property_read_string(np, "clock-output-names", &name);
>>>
>>> -     hw = at91_clk_register_sam9x5_main(regmap, name, parent_names, NULL,
>>> +     parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
>>> +     parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
>>> +     hw = at91_clk_register_sam9x5_main(regmap, name, NULL, parent_data,
>>>                                           num_parents);
>>>        if (IS_ERR(hw))
>>>                return;
>>> @@ -396,6 +409,7 @@ of_at91_clk_master_setup(struct device_node *np,
>>>        struct clk_hw *hw;
>>>        unsigned int num_parents;
>>>        const char *parent_names[MASTER_SOURCE_MAX];
>>> +     struct clk_parent_data parent_data[MASTER_SOURCE_MAX];
>>>        const char *name = np->name;
>>>        struct clk_master_characteristics *characteristics;
>>>        struct regmap *regmap;
>>> @@ -419,13 +433,15 @@ of_at91_clk_master_setup(struct device_node *np,
>>>        if (IS_ERR(regmap))
>>>                return;
>>>
>>> +     for (unsigned int i = 0; i < MASTER_SOURCE_MAX; i++)
>>> +             parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
>>>        hw = at91_clk_register_master_pres(regmap, "masterck_pres", num_parents,
>>> -                                        parent_names, NULL, layout,
>>> +                                        NULL, parent_data, layout,
>>>                                           characteristics, &mck_lock);
>>>        if (IS_ERR(hw))
>>>                goto out_free_characteristics;
>>>
>>> -     hw = at91_clk_register_master_div(regmap, name, "masterck_pres", NULL,
>>> +     hw = at91_clk_register_master_div(regmap, name, NULL, &AT91_CLK_PD_HW(hw),
>>>                                          layout, characteristics,
>>>                                          &mck_lock, CLK_SET_RATE_GATE, 0);
>>
>> Looks like at91_clk_register_master_div() could be kept to use parent_hws
>> instead of parent_data.
> 
> Looking into this more the register_master_div calls
> at91_clk_register_master_internal() which is used for all of the SoCs.
> Some of the SoCs that use this function only have the parents passed in
> by name string and not clk_hw. Would it be wise to add another function
> for this to account for clk_hw and parent name? Or keep the use of
> parent_data?

Let's keep it as is for now.

Thank you,
Claudiu
