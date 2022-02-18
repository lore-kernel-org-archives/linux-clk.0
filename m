Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156BCC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 18 Feb 2022 01:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbiBRB0l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Feb 2022 20:26:41 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:57530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiBRB0k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 20:26:40 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3846366;
        Thu, 17 Feb 2022 17:26:24 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3788A83764;
        Fri, 18 Feb 2022 02:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1645147583;
        bh=4acNGSSFhhnONR7GJh9i8so+dPypyNubtUZUdtY0nf0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=UO7zfjdkT21Fq5y/09FmuCJ7xpvBhJp7oHsyHwFQQeyMaY3NsBCwC1eGeBhVoKk2U
         1ZWwgw+8UFTvRcYRZuraCfUm/AkSGFi2mF9WL9wbVev0/vu3imrOitNbM4AtdY5CXI
         3vbXjjy3svfDkGem6b8vng1RKu0Az0z/5NDMm1aMwKsDr30EzojXh3tjy9Pi+103/X
         iHuGtzdCmpTzSjFwfqfiiCxGjehrdwZJ8PAkqW6ZVAtM9aAXEi48njRJweaR+WbUmX
         6cn9dWdoXpn6DC9yekUTiesuKwIRjv7TIZ8e/UkFOQgmx4hN8nBd2465VnV/w4dAs4
         dWmvJhkBvVrew==
Message-ID: <006919c7-74c9-390a-964e-6b76611988e5@denx.de>
Date:   Fri, 18 Feb 2022 02:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] clk: rs9: Add Renesas 9-series PCIe clock generator
 driver
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20220213173310.152230-1-marex@denx.de>
 <20220213173310.152230-2-marex@denx.de>
 <20220217234539.819AEC340E8@smtp.kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220217234539.819AEC340E8@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/18/22 00:45, Stephen Boyd wrote:
> Quoting Marek Vasut (2022-02-13 09:33:10)
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index 6a98291350b64..3ec27842ec779 100644
>> --- a/drivers/clk/Makefile
>> +++ b/drivers/clk/Makefile
>> @@ -68,6 +68,7 @@ obj-$(CONFIG_COMMON_CLK_STM32MP157)   += clk-stm32mp1.o
>>   obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
>>   obj-$(CONFIG_CLK_TWL6040)              += clk-twl6040.o
>>   obj-$(CONFIG_ARCH_VT8500)              += clk-vt8500.o
>> +obj-$(CONFIG_COMMON_CLK_RS9_PCIE)      += clk-renesas-pcie.o
> 
> Is there a reason it doesn't go into drivers/clk/renesas?

The drivers/clk/renesas/ is for renesas SoC (R-Car/RZ/...),
this chip is different group (it's probably even IDT PLL IP).

[...]

>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
> 
> Is this used? If not please remove.

This one is for of_device_get_match_data()

[...]

>> +static struct clk_hw *
>> +rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
>> +{
>> +       struct rs9_driver_data *rs9 = data;
>> +       unsigned int idx = clkspec->args[0];
>> +
>> +       return rs9->clk_dif[idx];
>> +}
>> +
>> +static const struct of_device_id clk_rs9_of_match[];
> 
> Why the forward declare?

Remnant from development, dropped.

>> +static int rs9_probe(struct i2c_client *client, const struct i2c_device_id *id)
>> +{
>> +       struct device_node *np = client->dev.of_node;
>> +       unsigned char *name = "DIF0";
>> +       struct rs9_driver_data *rs9;
>> +       const char *parent_clk;
>> +       struct clk_hw *hw;
>> +       int i, ret;
>> +
>> +       rs9 = devm_kzalloc(&client->dev, sizeof(*rs9), GFP_KERNEL);
>> +       if (!rs9)
>> +               return -ENOMEM;
>> +
>> +       i2c_set_clientdata(client, rs9);
>> +       rs9->client = client;
>> +       rs9->chip_info = of_device_get_match_data(&client->dev);
> 
> Check for NULL? Use device_get_match_data()? Or does that not work for
> i2c devices?
> 
>> +
>> +       /* Fetch common configuration from DT (if specified) */
>> +       ret = rs9_get_common_config(rs9);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Fetch DIFx output configuration from DT (if specified) */
>> +       for (i = 0; i < rs9->chip_info->num_clks; i++) {
>> +               ret = rs9_get_output_config(rs9, i);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>> +       /* Mandatory XTal */
> 
> Oh it's mandatory here but not in the binding?
> 
>> +       parent_clk = of_clk_get_parent_name(np, 0);
> 
> Use clk_parent_data please.

This one line I don't understand -- can you expand on what you expect me 
to do here ?

>> +       if (!parent_clk)
>> +               return dev_err_probe(&client->dev, -EINVAL,
>> +                                    "Missing XTal input clock\n");
>> +
>> +       rs9->regmap = devm_regmap_init_i2c(client, &rs9_regmap_config);
>> +       if (IS_ERR(rs9->regmap))
>> +               return dev_err_probe(&client->dev, PTR_ERR(rs9->regmap),
>> +                                    "Failed to allocate register map\n");
>> +
>> +       /* Register clock */
>> +       for (i = 0; i < rs9->chip_info->num_clks; i++) {
>> +               name[3]++;
>> +               hw = clk_hw_register_fixed_factor(&client->dev, name,
>> +                                                 parent_clk, 0, 4, 1);
>> +               if (IS_ERR(hw))
>> +                       return PTR_ERR(hw);
>> +
>> +               rs9->clk_dif[i] = hw;
>> +       }
>> +
>> +       ret = devm_of_clk_add_hw_provider(&client->dev, rs9_of_clk_get, rs9);
>> +       if (!ret)
>> +               rs9_update_config(rs9);
>> +
>> +       return ret;
>> +}

[...]
