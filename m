Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8253C288BD
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721205087; cv=none; b=mvlvF6LC5evu/oQ8BBB7T8Nkneoy1VwH9AQEOGcbUCAy0uKA5hAWKWQ3kiPpEuYOKmAyEAwGa4nUl2aUUI7g6a4oYY3ZLSdRzi3GAoIu7dSGGVzC9caxDAOlIxHBQbAOHyCoTuM6S26SL93hLzlbsFuiBNSQetc/zyEg94RGV/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721205087; c=relaxed/simple;
	bh=WbzApNOLjNOdU1YCDYNMQErxOCTVZd8bojWaaykHLx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVRU1jo49k1tyvRQcFqS9Eqo97VPol9MZUdO6EHw1UVcofBq8MFI9G/333J0AfafCHJiJksChJv0fch72cktXJroStrYPIXXncBAU3069aciADAOQ7bNcKxC68kMiFBY1OWoNsgu6OCijGQxEJbgN5cxY5CjpQKw5cS1YH+pQhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CRcqOjr+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CRcqOjr+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42793fc0a6dso44230655e9.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 01:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721205083; x=1721809883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odTbO9u7AyhS8xreJluNKyj0ekqxabepcpFkDx/pdXM=;
        b=CRcqOjr+SXR7Qfot9mmHcCgFX83TQbFkUnfzYNGArIFhfSk/tcZgqK0jzpDMGnrVOa
         0atK4aMPnr6evmf7A1AsmpwqgNA69PWkzoXM0PqvvRNEK/mJoNg/WfufNVPRcFw0/St7
         CnlO4PheyqerrK8IsRQqgL0sbtqR6pY1kzrlx4voUmQKzJxHmR2UttFNx90yQwZjTJVY
         ftbIrmNTvQIO+06OF+o/8N8BnR7vMpLY5zB6JtG0j6H2+IWVh0AGqWR3jN6Cv4E/4gU5
         LZN57odQeUZ6oJLL0jjIZoXxsH0Q7l336aFZ9mRZSNvUhnnaUiItCsTdLks6/0dUuYFg
         Zt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721205083; x=1721809883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odTbO9u7AyhS8xreJluNKyj0ekqxabepcpFkDx/pdXM=;
        b=BOTjLFciYHIWi9D50AOqIIZfbh/FL7EqCnkJ1MV6CggjKkmmEe7nihNW+dkh5emmLT
         LKvIX97ii48932/Pnsz+cTS+bZHETm1Y52vFvL8Omi4345fO7b/aTS37jQXI5hMEgOdX
         ZL/9uOQvvAMJM2UR017vnyWIh4opaMVvXvOxRmapsJIfgOfKIskvz/Y844kJJ6lHQWMC
         F9OpGTNXTusZgDiz4lH955L/m1sqtBuZgnUQ0nWZxd9Lg3C5+uK97caqvX+BsJwxTpun
         5TS/6k6+IXZDAB9AQMJ4s5Ua202KJeQxD013ymI4yZJ7kkuEx9EN9eESKJPBL8FIVil1
         Yt9A==
X-Forwarded-Encrypted: i=1; AJvYcCU88t08TkrBFJa/YIRdrSxLKH2kSERjL9OkB/2kiI1o9IDV+Z9FJMcOkeGShYr0m/dPe4nESqrp/J9O0ULbLjY7jIDR3uG00ZJL
X-Gm-Message-State: AOJu0YxUsqONjc/hhfsT/JpR5xfW0OzeqJbVE61qz88Rj/ZgHUbdyqMp
	mjBHUx+YwZa+PQNWgfUvj3b13xXyYXuYpjXNGE1ylUGChj2x6WIB3saocAZX0/c=
X-Google-Smtp-Source: AGHT+IFxAFyo8cL/V89UtkMiApuS4cDBAYaqIrX7GtE+oWaOkWacfHj+o5WDxnzLrAffsH1ZbEmYMw==
X-Received: by 2002:a05:600c:1f0e:b0:426:60e4:c691 with SMTP id 5b1f17b1804b1-427c2cb36b1mr6643635e9.11.1721205082759;
        Wed, 17 Jul 2024 01:31:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f27846bsm196825965e9.25.2024.07.17.01.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 01:31:22 -0700 (PDT)
Message-ID: <e3103f07-ce8a-4c34-af5c-bb271c7ec99a@tuxon.dev>
Date: Wed, 17 Jul 2024 11:31:20 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] clk: renesas: clk-vbattb: Add VBATTB clock
 driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, alexandre.belloni@bootlin.com,
 conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org,
 lee@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-4-claudiu.beznea.uj@bp.renesas.com>
 <2abcd440664067d95b1ac0e765ad55a3.sboyd@kernel.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <2abcd440664067d95b1ac0e765ad55a3.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Stephen,

On 17.07.2024 01:28, Stephen Boyd wrote:
> Quoting Claudiu (2024-07-16 03:30:17)
>> diff --git a/drivers/clk/renesas/clk-vbattb.c b/drivers/clk/renesas/clk-vbattb.c
>> new file mode 100644
>> index 000000000000..8effe141fc0b
>> --- /dev/null
>> +++ b/drivers/clk/renesas/clk-vbattb.c
>> @@ -0,0 +1,212 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * VBATTB clock driver
>> + *
>> + * Copyright (C) 2024 Renesas Electronics Corp.
>> + */
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/clk.h>
> 
> Prefer clk providers to not be clk consumers.

I added it here to be able to use devm_clk_get_optional() as it was
proposed to me in v1 to avoid adding a new binding for bypass and detect if
it's needed by checking the input clock name.


> 
>> +#include <linux/clk-provider.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
> 
> Is of_platform.h used?
> 
> Include mod_devicetable.h for of_device_id.

Ok.

> 
>> +#include <linux/platform_device.h>
>> +
>> +#define VBATTB_BKSCCR                  0x0
>> +#define VBATTB_BKSCCR_SOSEL            BIT(6)
>> +#define VBATTB_SOSCCR2                 0x8
>> +#define VBATTB_SOSCCR2_SOSTP2          BIT(0)
> [..]
>> +
>> +static int vbattb_clk_probe(struct platform_device *pdev)
>> +{
>> +       struct device_node *np = pdev->dev.of_node;
>> +       struct clk_parent_data parent_data = {};
>> +       struct device *dev = &pdev->dev;
>> +       struct clk_init_data init = {};
>> +       struct vbattb_clk *vbclk;
>> +       u32 load_capacitance;
>> +       struct clk_hw *hw;
>> +       int ret, bypass;
>> +
>> +       vbclk = devm_kzalloc(dev, sizeof(*vbclk), GFP_KERNEL);
>> +       if (!vbclk)
>> +               return -ENOMEM;
>> +
>> +       vbclk->base = devm_platform_ioremap_resource(pdev, 0);
>> +       if (IS_ERR(vbclk->base))
>> +               return PTR_ERR(vbclk->base);
>> +
>> +       bypass = vbattb_clk_need_bypass(dev);
> 
> This is a tri-state bool :(
> 
>> +       if (bypass < 0) {
>> +               return bypass;
>> +       } else if (bypass) {
>> +               parent_data.fw_name = "clkin";
>> +               bypass = VBATTB_BKSCCR_SOSEL;
> 
> And now it is a mask value.
> 
>> +       } else {
>> +               parent_data.fw_name = "xin";
>> +       }
>> +
>> +       ret = of_property_read_u32(np, "renesas,vbattb-load-nanofarads", &load_capacitance);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = vbattb_clk_validate_load_capacitance(vbclk, load_capacitance);
>> +       if (ret)
>> +               return ret;
>> +
>> +       vbattb_clk_update_bits(vbclk->base, VBATTB_BKSCCR, VBATTB_BKSCCR_SOSEL, bypass);
> 
> Please don't overload 'bypass'. Use two variables or a conditional.

OK.

> 
> I also wonder if this is really a mux, 

It's a way to determine what type of clock (crystal oscillator or device
clock) is connected to RTXIN/RTXOUT pins of the module
(the module block diagram at [1]) based on the clock name. Depending on the
type of the clock connected to RTXIN/RTXOUT we need to select the XC or
XBYP as input for the mux at [1].

[1] https://gcdnb.pbrd.co/images/QYsCvhfQlX6n.png


> and either assigned-clock-parents should be used, 
> or the clk_ops should have an init routine that looks at
> which parent is present by determining the index and then use that to
> set the mux. The framework can take care of failing to set the other
> parent when it isn't present.


On the board, at any moment, it will be only one clock as input to the
VBATTB clock (either crystal oscillator or a clock device). If I'm getting
you correctly, this will involve describing both clocks in some scenarios.

E.g. if want to use crystal osc, I can use this DT description:

vbattclk: clock-controller@1c {
	compatible = "renesas,r9a08g045-vbattb-clk";
	reg = <0 0x1c 0 0x10>;
	clocks = <&vbattb_xtal>;
	clock-names = "xin";
	#clock-cells = <0>;
	status = "disabled";
};

vbattb_xtal: vbattb-xtal {
	compatible = "fixed-clock";
	#clock-cells = <0>;
	clock-frequency = <32768>;
};

If external clock device is to be used, I should describe a fake clock too:

vbattclk: clock-controller@1c {
	compatible = "renesas,r9a08g045-vbattb-clk";
	reg = <0 0x1c 0 0x10>;
	clocks = <&vbattb_xtal>, <&ext_clk>;
	clock-names = "xin", "clkin";
	#clock-cells = <0>;
	status = "disabled";
};

vbattb_xtal: vbattb-xtal {
	compatible = "fixed-clock";
	#clock-cells = <0>;
	clock-frequency = <0>;
};

ext_clk: ext-clk {
	compatible = "fixed-clock";
	#clock-cells = <0>;
	clock-frequency = <32768>;
};

Is this what you are suggesting?


> 
>> +
>> +       spin_lock_init(&vbclk->lock);
>> +
>> +       init.name = "vbattclk";
>> +       init.ops = &vbattb_clk_ops;
>> +       init.parent_data = &parent_data;
>> +       init.num_parents = 1;
>> +       init.flags = 0;
>> +
>> +       vbclk->hw.init = &init;
>> +       hw = &vbclk->hw;
>> +
>> +       ret = devm_clk_hw_register(dev, hw);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return of_clk_add_hw_provider(np, of_clk_hw_simple_get, hw);
>> +}
>> +
>> +static const struct of_device_id vbattb_clk_match[] = {
>> +       { .compatible = "renesas,r9a08g045-vbattb-clk" },
>> +       { /* sentinel */ }
>> +};
> 
> Any MODULE_DEVICE_TABLE?

I failed to added it.

Thank you for your review,
Claudiu Beznea
