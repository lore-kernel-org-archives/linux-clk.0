Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1868217727
	for <linux-clk@vger.kernel.org>; Mon,  9 Dec 2024 11:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742855; cv=none; b=jn62f1nIJYMu9MoeJxynp/6CfuoFVHQe5aZ9/amyJf9+wu6OXQ4l5PXUrZsl7Jp7nRdfS+EwJrsPTEIZqsB+iGI3gctBMOJFjsF6iT1fbQiplvhfSa7FJsGycLTvu1cSpE+mZhQ2t/4Y9YY9v6E9GHan3if7ra2qC4ejHfiXqV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742855; c=relaxed/simple;
	bh=tSSUYMatrCQQdpnXgcZPEocEhQcK96jIbNBQCZaNtV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgB/5jT/JX8zKaKDPNcFUBkEaC2kyJPojsa/5YxDfhky6QtpSQ4LWz3uX6Bd0OdXPeywLKqbQyT5aOgiOAxp7RYLM6ZeYHngIjWmPnUPZ/VdqbOL44HBAetR7z9admICHE0V34C22E8uvdkCo2kRdjCqUqcsXRGgVCFp7QEkJEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TVBTZwiD; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TVBTZwiD"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9ec267b879so816668466b.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Dec 2024 03:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733742852; x=1734347652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CthL2HIvpDHwSh60SukizT++co+OfAHNNaSOkrvRlwY=;
        b=TVBTZwiDTY6ZnN02WT6Cj9SsKP34CQpCeMX5JFSuHqAZZSRe7Gr7CEPGDfyx4Wis0E
         PINmO75gRXagvplriDJACfh8FoWeN+A9Hvs8zQ6gj/CVRT2uJfTNeXMshK2SKLxHzWG4
         CTHHVEaqS4LEjWF+7Y2NYKhYgFJyGl1nVa873onswhVBSfkU6IT1Qm8j5BR9Sk69VtAz
         33yeni8r63rFtBy7MPG4pF8Yzd2yvyMH4IkjiSiUYhx8t+S+KFQZNKBh3AiklUeoNuPI
         iSeDV56C9zO7eKxd8eQFFPMm0x1IloleXI5PJYw2LjJQ30TwvS9AnxWaIJGDJmvA2sOM
         aMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742852; x=1734347652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CthL2HIvpDHwSh60SukizT++co+OfAHNNaSOkrvRlwY=;
        b=DQgcC8J2vtf+g5Bfj38uzETKgkijcFF1bEnam0qQxUKRNOamxvtPPrgjk+Q6ze8j/P
         sr+tTFqwcRazjO+RX1IadhhpG7z8LL5ox6MtvB2msoraXe+cRc4Yk/2QYmjG6BKun/eU
         27UQnqcNuQgzYDpds7e11wub75gtG0cJoUA24Mhto92hxd6OLLg6O5MU78RTnTaf3DSe
         dat6a6gaYLLQDfN98xm9xXbs1xAz89Our7u8wXUec1aJsP4tk42bEbfm8C5zjtfiYWxh
         NNipkGCeq+HBEl1ufvYhgkP77KKRSKrLNVb1hS1Gf8lOUHnoiV9BI5xw1wV/w8K0Jml9
         iejg==
X-Forwarded-Encrypted: i=1; AJvYcCU+yGUfA8vzZGimv6x2iSLlsZa2xQP/ervRisSq+RuKLb/euBhc5Yf+/g4+2r7keo/K8h83wfq83/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJE73Cfz5PXPmWZq4ux29Ta12ZCXKlj5Dw53bDOUAKUdA0yEc
	JWXV2WjUFkVG42fqu3CBGEStFSYeE/h27pxUgW+hFsNvwS/iFiNcjcjLfh6xhbw=
X-Gm-Gg: ASbGncvPQL5E9da8rSKkoKSrVWTJ7gAU9mKaUsgH3GrK7N7hmzy9NRWBUTS8GwKjd1H
	xMIyZniDWIBu7ECMrOj7pofHMFHdssUEaBYw4MmyjMuOv9eFPMBefVAKg4fPpOnXKLy3ruJ2oPr
	EzmOAJJMGyYZOANpc7PiaWGxdazRB2P6UEzdMzSHZah14aBNz4b1D7b0CiAUP3IG8k/RILczjCZ
	khRMXph9/VjFhztfrXbmwRluvFB9Cuk6rmiAkp8lKO/9jzaqZACocZITes=
X-Google-Smtp-Source: AGHT+IHoQ7WAsDc55U41wiatcnvONP6Fqp8ddPKm8X85/t0dO50PlbWhCYg2d0SVujfhtHdBtbHSPA==
X-Received: by 2002:a17:906:18a9:b0:aa6:8211:ff85 with SMTP id a640c23a62f3a-aa6821201demr407640666b.35.1733742851827;
        Mon, 09 Dec 2024 03:14:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa691a83250sm79666366b.130.2024.12.09.03.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 03:14:11 -0800 (PST)
Message-ID: <d65354a0-c4b8-4379-b824-f4541718a3c2@tuxon.dev>
Date: Mon, 9 Dec 2024 13:14:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/25] clk: versaclock3: Prepare for the addition of
 5L35023 device
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com,
 broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org,
 perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVv+2tEQ5hf+sbihbJMo3+=8kJaWy0YNU_spxQnmWF-bA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVv+2tEQ5hf+sbihbJMo3+=8kJaWy0YNU_spxQnmWF-bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 09.12.2024 12:57, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Nov 13, 2024 at 2:35 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The 5P35023 and 5L35035 Versa 3 clock generator variants are different but
>> the versaclock3 driver could be used with small adjustments. The features
>> that are implemented in driver and differs b/w variants are the PLL2 Fvco
>> and clock sel bit for SE2 clock. Adjust the driver to prepare for the
>> addition of 5L35023 device.
>>
>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/clk-versaclock3.c
>> +++ b/drivers/clk/clk-versaclock3.c
>> @@ -166,12 +167,17 @@ struct vc3_div_data {
>>  struct vc3_hw_data {
>>         struct clk_hw hw;
>>         struct regmap *regmap;
>> -       const void *data;
>> +       void *data;
>>
>>         u32 div_int;
>>         u32 div_frc;
>>  };
> 
>> @@ -698,8 +706,6 @@ static struct vc3_hw_data clk_pll[] = {
>>                         .num = VC3_PLL2,
>>                         .int_div_msb_offs = VC3_PLL2_FB_INT_DIV_MSB,
>>                         .int_div_lsb_offs = VC3_PLL2_FB_INT_DIV_LSB,
>> -                       .vco_min = VC3_PLL2_VCO_MIN,
>> -                       .vco_max = VC3_PLL2_VCO_MAX
>>                 },
>>                 .hw.init = &(struct clk_init_data) {
>>                         .name = "pll2",
> 
>> @@ -1029,9 +1037,16 @@ static int vc3_probe(struct i2c_client *client)
>>                                              clk_pfd[i].hw.init->name);
>>         }
>>
>> +       data = i2c_get_match_data(client);
>> +
>>         /* Register pll's */
>>         for (i = 0; i < ARRAY_SIZE(clk_pll); i++) {
>>                 clk_pll[i].regmap = regmap;
>> +               if (i == VC3_PLL2) {
>> +                       struct vc3_pll_data *pll_data = clk_pll[i].data;
>> +
>> +                       pll_data->vco = data->pll2_vco;
> 
> You cannot modify the global clk_pll[] data, as it is shared when
> there are multiple instances.

By "multiple instances" do you mean, multiple versa3 devices using this
driver? Do you know if we have such a board integrated, ATM?

Thank you,
Claudiu

> Oops, the driver already did this before, as the .regmap, .div_int,
> and .div_frc fields are modified during operation.
> 
>> +               }
>>                 ret = devm_clk_hw_register(dev, &clk_pll[i].hw);
>>                 if (ret)
>>                         return dev_err_probe(dev, ret, "%s failed\n",
>> @@ -1059,6 +1074,11 @@ static int vc3_probe(struct i2c_client *client)
>>         /* Register clk muxes */
>>         for (i = 0; i < ARRAY_SIZE(clk_mux); i++) {
>>                 clk_mux[i].regmap = regmap;
>> +               if (i == VC3_SE2_MUX) {
>> +                       struct vc3_clk_data *clk_data = clk_mux[i].data;
>> +
>> +                       clk_data->bitmsk = data->se2_clk_sel_msk;
>> +               }
> 
> Likewise.
> 
>>                 ret = devm_clk_hw_register(dev, &clk_mux[i].hw);
>>                 if (ret)
>>                         return dev_err_probe(dev, ret, "%s failed\n",
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
