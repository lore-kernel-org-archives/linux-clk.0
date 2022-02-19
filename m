Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3EAC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 19 Feb 2022 01:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240497AbiBSBL0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Feb 2022 20:11:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiBSBL0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Feb 2022 20:11:26 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68743256EDC;
        Fri, 18 Feb 2022 17:11:07 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DEA26838FC;
        Sat, 19 Feb 2022 02:11:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1645233065;
        bh=4SHsxBH5ZD2zX8xKdgkrtOxu71RgyMGTeNTz+vpWntg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=TlwLmdUAKmjLJxm5eMMKQOFIwBo6/wv3h6vYARwhRyeF8evHd2mVweCMNx08YDpGw
         JE3LgB9yP+O7YlR5ylOAtZ0EGdel948SlgZ6iLAuZGp/4/OQAsmRxngUhMyhAs80tH
         7k+C9bK9bNA0LofPN0RKyWMyQV4UThHs+Jd1vMr8Pp8wHG+XiPBFk8RMu/buZbtxvF
         tVQMSZdbTDb0JSAR/Sn+F13pGy9FPkVyqtxXFuR6HCnjByFuH7TylsTgKH45YPkKJT
         xr3YJr2bLPvaQKFI9QPbZVauNk/uS9xl2/7LxK5CVsxSRhki5YwIi9S+BKIFmbJnqQ
         TdUCXjW3byuTg==
Message-ID: <182f1f73-70eb-5811-b3ad-35b6428ed59a@denx.de>
Date:   Sat, 19 Feb 2022 02:11:04 +0100
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
 <006919c7-74c9-390a-964e-6b76611988e5@denx.de>
 <20220218221504.54F8DC340E9@smtp.kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220218221504.54F8DC340E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/18/22 23:15, Stephen Boyd wrote:

Hi,

>>>> @@ -68,6 +68,7 @@ obj-$(CONFIG_COMMON_CLK_STM32MP157)   += clk-stm32mp1.o
>>>>    obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
>>>>    obj-$(CONFIG_CLK_TWL6040)              += clk-twl6040.o
>>>>    obj-$(CONFIG_ARCH_VT8500)              += clk-vt8500.o
>>>> +obj-$(CONFIG_COMMON_CLK_RS9_PCIE)      += clk-renesas-pcie.o
>>>
>>> Is there a reason it doesn't go into drivers/clk/renesas?
>>
>> The drivers/clk/renesas/ is for renesas SoC (R-Car/RZ/...),
>> this chip is different group (it's probably even IDT PLL IP).
> 
> Ah ok so it's not a renesas SoC but a renesas IP?

I suspect it is IDT IP, since the datasheet looks similar to what 
versaclock datasheets used to look like, except the register layout is 
much simpler and the registers are completely different. So it _might_ 
be some mutation of the IDT PLL, and it is now owned by renesas.

The renesas SoC clock IP is something entirely different from the IP 
used here.

>>>> +#include <linux/mod_devicetable.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/of_platform.h>
>>>
>>> Is this used? If not please remove.
>>
>> This one is for of_device_get_match_data()
>>
> 
> So it's going away?

Yes

[...]

>>> Use clk_parent_data please.
>>
>> This one line I don't understand -- can you expand on what you expect me
>> to do here ?
> 
> Use 'struct clk_parent_data' and set .index to 0 so that when
> registering the clk you don't need to get the parent clk name.
> 
>>
>>>> +       if (!parent_clk)
>>>> +               return dev_err_probe(&client->dev, -EINVAL,
>>>> +                                    "Missing XTal input clock\n");
>>>> +
>>>> +       rs9->regmap = devm_regmap_init_i2c(client, &rs9_regmap_config);
>>>> +       if (IS_ERR(rs9->regmap))
>>>> +               return dev_err_probe(&client->dev, PTR_ERR(rs9->regmap),
>>>> +                                    "Failed to allocate register map\n");
>>>> +
>>>> +       /* Register clock */
>>>> +       for (i = 0; i < rs9->chip_info->num_clks; i++) {
>>>> +               name[3]++;
>>>> +               hw = clk_hw_register_fixed_factor(&client->dev, name,
>>>> +                                                 parent_clk, 0, 4, 1);
> 
> To do that it looks like maybe we'll need to export
> __clk_hw_register_fixed_factor() and introduces some sort of
> clk_hw_register_fixed_factor_parent_data() API.

Setting parent_clk to NULL should be enough.

[...]
