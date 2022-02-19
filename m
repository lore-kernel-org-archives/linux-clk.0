Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63110C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 19 Feb 2022 03:28:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239876AbiBSD2S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Feb 2022 22:28:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiBSD2R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Feb 2022 22:28:17 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799D24A928;
        Fri, 18 Feb 2022 19:27:58 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 56A9383B9B;
        Sat, 19 Feb 2022 04:27:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1645241275;
        bh=aRtziGvGKQ0yJ+NF1mQSSUBxsxlyEIkgVwgL9biQI/k=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=vGHRRaXiPqnHwESIdioo9d5Yp3Msj0yr7Y4bc5y0rKvyErV0GgsfSXGjGBdarpq19
         XgEEs3BPiFo5c58TaCyZve9RKx60umekJpIj+V5XNkocflL3YuOndiCL9/eCM7FXot
         inYOBxJ2vG7v61x0OGAxn0Ec9wl9ZZS6t5/ZoKboGQZuiLe3acwcY5qKu79k18yRY5
         Kg0DDELacf1n1P3oMLaO8cXVhdnmxj2KLxGKzyEubgOnWdoSzup4glt02PXXEMdq5N
         vHObftsuRnoXDf83FyUoimOgjdq+ChuuXekLvkZYvcdBFOA9Bk65Oso7QOOgOsnIjE
         jauPpepQFGmBA==
Message-ID: <0391894f-751c-81ca-c437-8e843874c019@denx.de>
Date:   Sat, 19 Feb 2022 04:27:54 +0100
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
 <182f1f73-70eb-5811-b3ad-35b6428ed59a@denx.de>
 <20220219030521.0A6B0C340E9@smtp.kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220219030521.0A6B0C340E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/19/22 04:05, Stephen Boyd wrote:
> Quoting Marek Vasut (2022-02-18 17:11:04)
>> On 2/18/22 23:15, Stephen Boyd wrote:
>>>>
>>>>>> +       if (!parent_clk)
>>>>>> +               return dev_err_probe(&client->dev, -EINVAL,
>>>>>> +                                    "Missing XTal input clock\n");
>>>>>> +
>>>>>> +       rs9->regmap = devm_regmap_init_i2c(client, &rs9_regmap_config);
>>>>>> +       if (IS_ERR(rs9->regmap))
>>>>>> +               return dev_err_probe(&client->dev, PTR_ERR(rs9->regmap),
>>>>>> +                                    "Failed to allocate register map\n");
>>>>>> +
>>>>>> +       /* Register clock */
>>>>>> +       for (i = 0; i < rs9->chip_info->num_clks; i++) {
>>>>>> +               name[3]++;
>>>>>> +               hw = clk_hw_register_fixed_factor(&client->dev, name,
>>>>>> +                                                 parent_clk, 0, 4, 1);
>>>
>>> To do that it looks like maybe we'll need to export
>>> __clk_hw_register_fixed_factor() and introduces some sort of
>>> clk_hw_register_fixed_factor_parent_data() API.
>>
>> Setting parent_clk to NULL should be enough.
>>
> 
> Perfect, but also weird. I worry that's a bug that snuck in. Probably a
> good idea to not rely on that.

No, I was wrong, the index=0 is right, and it is already fixed in V2.
