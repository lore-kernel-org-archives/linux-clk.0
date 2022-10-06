Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCA9C433FE
	for <linux-clk@archiver.kernel.org>; Thu,  6 Oct 2022 12:39:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiJFMjm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Oct 2022 08:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiJFMjl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Oct 2022 08:39:41 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826572DF3;
        Thu,  6 Oct 2022 05:39:39 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id EE3D384C0C;
        Thu,  6 Oct 2022 14:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665059977;
        bh=nqZYIzyknxJ60ZMTGP686DtNVwBXuoLHSjNZNSdt1z0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=yfHEDYxRyW1cZSohu9sSwrJDuDSWwhYR86qjXX3Ay35/hP9CG2v875UVztpbHAhGz
         OULaLw9LP8vcrEmM/NmDRmdsuQTq6PMWMkYOqrN/wCyaZ9sbi2P21F7Sm/+agTN/tH
         Hfh9BskEOXwgMe+IyAALL5ygRe1yiH2OxuXhmbTccQx2VQ/uHPAqJ2KlcvsME3slSA
         USSHKRC8vr7m145BY0JrSnE/Nd68PLkXUPuGM+ZbMpUP0GHPGhV7HLCB310evQdq27
         6o41ylrXorwxBkb6NVcUgl3bFpg8WMZSmsmDrBgd2gVWTjANo/74XkE6kCm78eNIUi
         i39CdnqYJN5qw==
Message-ID: <5a1f9087-1be2-e468-6ef5-eb91ba67aa83@denx.de>
Date:   Thu, 6 Oct 2022 14:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4] clk: Introduce 'always-on-clocks' property
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220924174517.458657-1-marex@denx.de>
 <20221004182656.4DCD3C433D6@smtp.kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221004182656.4DCD3C433D6@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/4/22 20:26, Stephen Boyd wrote:
> Quoting Marek Vasut (2022-09-24 10:45:17)
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index b70769d0db99f..6b07f1a086277 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -3900,6 +3900,48 @@ static void clk_core_free_parent_map(struct clk_core *core)
>>          kfree(core->parents);
>>   }
>>   
>> +static void
>> +__clk_register_critical_clock(struct clk_core *core, struct clk_hw *hw)
>> +{
>> +       struct device_node *np = core->of_node;
>> +       struct of_phandle_args clkspec;
>> +       u32 clksize, clktotal;
>> +       int ret, i, index;
>> +
>> +       if (!np)
>> +               return;
>> +
>> +       if (of_property_read_u32(np, "#clock-cells", &clksize))
>> +               return;
>> +
>> +       /* Clock node with #clock-cells = <0> uses always-on-clocks; */
>> +       if (clksize == 0) {
>> +               if (of_property_read_bool(np, "always-on-clocks"))
>> +                       core->flags |= CLK_IS_CRITICAL;
> 
> Why must we set the CLK_IS_CRITICAL flag like this?

I don't quite understand the question here. Clock which shouldn't be 
turned off should have CLK_IS_CRITICAL flag set.

> Instead, when the
> clk provider is registered, parse the node of the provider and get the
> clks to call clk_prepare_enable() on. We can set the critical flag or
> make a new flag that causes clk_disable_unprepare() to not actually turn
> the clk off, if we have some sort of underflow issue with other
> consumers. Does that fail somehow?

Would your proposal be something that would have to be implemented in 
every single clock driver separately ?

>> +               return;
>> +       }
>> +
>> +       if (!core->ops->match_clkspec)
>> +               return;
>> +
>> +       clkspec.np = np;
>> +       clktotal = of_property_count_u32_elems(np, "always-on-clocks");
>> +       clktotal /= clksize;
>> +       for (index = 0; index < clktotal; index++) {
>> +               for (i = 0; i < clksize; i++) {
> 
> I'm mainly thinking that we're going to spin on this loop constantly for
> any clk providers that have many clks to register, but only a few to
> keep always on. It would be best to avoid that and only run through the
> DT property once.

Where could this be implemented in the clock core ?

>> +                       ret = of_property_read_u32_index(np, "always-on-clocks",
>> +                                                        (index * clksize) + i,
>> +                                                        &(clkspec.args[i]));
>> +                       if (ret) {
>> +                               pr_warn("Skipping always-on-clocks index %d (ret=%d)\n",
>> +                                       i, ret);
>> +                       }
>> +               }
>> +               if (!core->ops->match_clkspec(hw, &clkspec))
> 
> This callback is provider specific, and not necessarily clk_hw specific.
> For example, the clk_ops could be for a generic gate bit, but the
> provider wants to keep that gate always on. To implement such a clk we
> would have to copy the generic gate clk_ops and set this match_clkspec
> op. I'd like to avoid that if possible. If the clk_op must exist, then
> perhaps it should be in clk_init_data, which is sort of the place where
> we put provider specific information for a clk, i.e. clk_parent_data.

The core->ops is copied from struct clk_init_data .ops in 
__clk_register() , just before __clk_register_critical_clock() is 
called, so that op is already in clk_init_data.
