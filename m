Return-Path: <SRS0=hB7x=4X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DFDC3F2D2
	for <linux-clk@archiver.kernel.org>; Fri,  6 Mar 2020 02:52:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0D6620828
	for <linux-clk@archiver.kernel.org>; Fri,  6 Mar 2020 02:52:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgCFCwT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Mar 2020 21:52:19 -0500
Received: from regular1.263xmail.com ([211.150.70.198]:56910 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbgCFCwT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Mar 2020 21:52:19 -0500
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Mar 2020 21:52:04 EST
Received: from localhost (unknown [192.168.167.235])
        by regular1.263xmail.com (Postfix) with ESMTP id F12BF2E6;
        Fri,  6 Mar 2020 10:44:44 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [192.168.0.111] (unknown [112.49.232.150])
        by smtp.263.net (postfix) whith ESMTP id P4341T139655460669184S1583462673111013_;
        Fri, 06 Mar 2020 10:44:44 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <152acf520750412cb5189f053d53cfd5>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-clk@vger.kernel.org
X-SENDER-IP: 112.49.232.150
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH 1/2] ARM: Rockchip: Handle rk3288/rk3288w revision
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc:     =?UTF-8?Q?Myl=c3=a8ne_Josserand?= <mylene.josserand@collabora.com>,
        linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel@collabora.com,
        linux-clk@vger.kernel.org
References: <20200302155703.278421-1-mylene.josserand@collabora.com>
 <2221545.2vEflg7qi2@diego>
 <5fa8402863c7fb4171d8b2021a776b9ac0be1596.camel@collabora.com>
 <35989681.7qWAQounLj@diego>
 <8b993ec8ae9dccc6a8633cfe5e5b6d40d58ffbae.camel@collabora.com>
 <506e1aeda3ed14276734f22f320b0ceb6a4b06b0.camel@collabora.com>
From:   Kever Yang <kever.yang@rock-chips.com>
Message-ID: <933e1ce3-68be-9e78-18a3-eb3d4e038cfb@rock-chips.com>
Date:   Fri, 6 Mar 2020 10:44:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <506e1aeda3ed14276734f22f320b0ceb6a4b06b0.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Ezequiel,


On 2020/3/5 下午7:35, Ezequiel Garcia wrote:
> (Adding Kever to the loop)
>
> On Thu, 2020-03-05 at 08:32 -0300, Ezequiel Garcia wrote:
>> On Thu, 2020-03-05 at 01:51 +0100, Heiko Stübner wrote:
>>> Hi Ezequiel,
>>>
>>> Am Donnerstag, 5. März 2020, 01:03:30 CET schrieb Ezequiel Garcia:
>>>> Hi Heiko,
>>>>
>>>> On Wed, 2020-03-04 at 11:59 +0100, Heiko Stübner wrote:
>>>>> Hi,
>>>>>
>>>>> Am Montag, 2. März 2020, 16:57:02 CET schrieb Mylène Josserand:
>>>>>> Determine which revision of rk3288 by checking the HDMI version.
>>>>>> According to the Rockchip BSP kernel, on rk3288w, the HDMI
>>>>>> revision equals 0x1A which is not the case for the rk3288 [1].
>>>>>>
>>>>>> As these SOC have some differences, the new function
>>>>>> 'soc_is_rk3288w' will help us to know on which revision
>>>>>> we are.
>>>>> what happened to just having a different compatible in the dts?
>>>>> Aka doing a
>>>>>
>>>>> rk3288w.dtsi with
>>>>>
>>>>> #include "rk3288.dtsi"
>>>>>
>>>>> &cru {
>>>>> 	compatible = "rockchip,rk3288w-cru";
>>>>> }
>>>>>
>>>> I guess you have something like this in mind:
>>>>
>>>> static void __init rk3288_clk_init(struct device_node *np)
>>>> {
>>>>          __rk3288_clk_init(np, RK3288_SOC_REV_RK3288W);
>>>> }
>>>> CLK_OF_DECLARE(rk3288_cru, "rockchip,rk3288-cru", rk3288_clk_init);
>>>>
>>>> static void __init rk3288w_clk_init(struct device_node *np)
>>>> {
>>>>          __rk3288_clk_init(np, RK3288_SOC_REV_RK3288);
>>>> }
>>>> CLK_OF_DECLARE(rk3288_cru, "rockchip,rk3288w-cru", rk3288w_clk_init);
>>>>
>>>> And the rest is mostly untouched, except the revision is
>>>> no longer queried and is now passed by the DT?
>>> Essentially yes, but I guess I was more thinking along the lines of
>>> the rk3188/rk3066a/rk3188a (drivers/clk/rockchip/clk-rk3188.c)
>>>
>>>
>>>> This would be cleaner for the kernel, with the obvious
>>>> drawback being that you now have to maintain
>>>> another DTS.
>>> Right now we would end up with the pretty minimal devicetree
>>> having just that cru. So not very invasive.
>>>
>>>
>>>> This could be an inconvenience. I believe
>>>> RK3288W is meant as a direct replacement for RK3288,
>>>> so folks building products would expect to just use
>>>> RK3288W, and not really bother with passing a
>>>> different DTS or what not.
>>> Not sure I follow. As below, I don't think boards will magically switch
>>> between soc variants, so a boards devicetree should just include
>>> the variant - especially as I don't really know how many
>>> additional new boards we will see with it (rk3288 being quite old itself).
>>>
>> It's not about new boards, any company does sells some RK32888-based product,
>> will eventually want to produce some more.
>>
>> If I understand correctly, RK3288W is the SoC that Rockchip is now offering,
>> and not RK3288 anymore.


No, the RK3288 will continue to supply to the legacy projects which may 
have a long contract with Rockchip,

and RK3288W is the recommend to use in all new project.

>>
>> So, if you have to produce another batch of _the same RK3288_ product,
>> you'll have to use RK3288W. In other words, they would "just switch"
>> between SoC variants.
>>
>> In fact, such a case motivates these patches :-)
>>
>>>>> I somehow don't expect boards to just switch between soc variants
>>>>> on the fly.
>>>>>
>>>> While I agree they are nasty, quirks like this
>>>> are not uncommon.
>>>>
>>>>> Also, doing things in mach-rockchip is not very future-proof:
>>>>>
>>>> There is actually no reason to keep this in mach-rockchip, right?
>>>>
>>>> The quirk could be placed in other places. For instance,
>>>> directly in the clock driver.
>>> Mapping the hdmi controller inside the clock driver to read some "random"
>>> register that hopefully indicates an (undocumented) distinction between soc
>>> variants.
>>>
>>> Somehow just having that minimal devicetree for the "w" sounds
>>> way cleaner ;-) .

I agree with Heiko on this.

What Rockchip done is:

- kernel is using "rockchip,rk3288w" compatible to identify rk3288w, 
which is clean in kernel;

- kernel evb dts do not have compatible "rockchip,rk3288w" for we would 
like to identify it dynamic in bootloader;

- We use U-Boot to identify the rk3288w with HDMI reg value, and pass it 
to kernel via modify the

    dtb pass to kernel, so that we can support all kind of rockchip 
customer projects with any kind of rk3288;

- For upstream kernel, it make sense to add "rockchip,rk3288w" in board 
dts for which using rk3288w SoC.


Thanks,

- Kever

>>>
>>>
>>> It's definitly cool to have support for the rk3288w but I don't like
>>> adding hacks for something that is after all some sort of niche product.
>>>
>> Why do you think it's a niche product?
>>
>> Thanks,
>> Ezequiel
>>
>>> Heiko
>>>
>>>
>>>>> (1) having random soc-specific APIs spanning the kernel feels wrong,
>>>>>      especially as at some point it might not be contained to our own special
>>>>>      drivers like the cru. I cannot really see people being enthusiastic if
>>>>>      something like this would be needed in say the core Analogix-DP bridge ;-)
>>>>> (2) I guess the rk3288w will not be the last soc doing this and on arm64 you
>>>>>      can't do it that way, as there is no mach-rockchip there
>>>>>
>>>>> So my personal preference would really would be just a specific compatible
>>>>> for affected ip blocks.
>>>>>
>>>>> Heiko
>>>>>
>>>>>> [1]:https://github.com/rockchip-linux/u-boot/blob/f992fe3334aa5090acb448261982628b5a3d37a5/arch/arm/include/asm/arch-rockchip/cpu.h#L30..L34
>>>>>>
>>>>>> Signed-off-by: Mylène Josserand <mylene.josserand@collabora.com>
>>>>>> ---
>>>>>>   arch/arm/mach-rockchip/rockchip.c | 45 +++++++++++++++++++++++++++++++
>>>>>>   include/soc/rockchip/revision.h   | 22 +++++++++++++++
>>>>>>   2 files changed, 67 insertions(+)
>>>>>>   create mode 100644 include/soc/rockchip/revision.h
>>>>>>
>>>>>> diff --git a/arch/arm/mach-rockchip/rockchip.c b/arch/arm/mach-rockchip/rockchip.c
>>>>>> index f9797a2b5d0d..b907ba390093 100644
>>>>>> --- a/arch/arm/mach-rockchip/rockchip.c
>>>>>> +++ b/arch/arm/mach-rockchip/rockchip.c
>>>>>> @@ -9,12 +9,14 @@
>>>>>>   #include <linux/kernel.h>
>>>>>>   #include <linux/init.h>
>>>>>>   #include <linux/io.h>
>>>>>> +#include <linux/of_address.h>
>>>>>>   #include <linux/of_platform.h>
>>>>>>   #include <linux/irqchip.h>
>>>>>>   #include <linux/clk-provider.h>
>>>>>>   #include <linux/clocksource.h>
>>>>>>   #include <linux/mfd/syscon.h>
>>>>>>   #include <linux/regmap.h>
>>>>>> +#include <soc/rockchip/revision.h>
>>>>>>   #include <asm/mach/arch.h>
>>>>>>   #include <asm/mach/map.h>
>>>>>>   #include <asm/hardware/cache-l2x0.h>
>>>>>> @@ -22,6 +24,49 @@
>>>>>>   #include "pm.h"
>>>>>>   
>>>>>>   #define RK3288_TIMER6_7_PHYS 0xff810000
>>>>>> +#define RK3288_HDMI_REV_REG	0x04
>>>>>> +#define RK3288W_HDMI_REV	0x1A
>>>>>> +
>>>>>> +static const struct of_device_id rk3288_dt_hdmi_match[] __initconst = {
>>>>>> +	{ .compatible = "rockchip,rk3288-dw-hdmi" },
>>>>>> +	{ }
>>>>>> +};
>>>>>> +
>>>>>> +int rk3288_get_revision(void)
>>>>>> +{
>>>>>> +	static int revision = RK3288_SOC_REV_UNKNOWN;
>>>>>> +	struct device_node *dn;
>>>>>> +	void __iomem *hdmi_base;
>>>>>> +
>>>>>> +	if (revision != RK3288_SOC_REV_UNKNOWN)
>>>>>> +		return revision;
>>>>>> +
>>>>>> +	dn = of_find_matching_node(NULL, rk3288_dt_hdmi_match);
>>>>>> +	if (!dn) {
>>>>>> +		pr_err("%s: Couldn't find HDMI node\n", __func__);
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>> +
>>>>>> +	hdmi_base = of_iomap(dn, 0);
>>>>>> +	of_node_put(dn);
>>>>>> +
>>>>>> +	if (!hdmi_base) {
>>>>>> +		pr_err("%s: Couldn't map %pOF regs\n", __func__,
>>>>>> +		       hdmi_base);
>>>>>> +		return -ENXIO;
>>>>>> +	}
>>>>>> +
>>>>>> +	if (readl_relaxed(hdmi_base + RK3288_HDMI_REV_REG) ==
>>>>>> +	    RK3288W_HDMI_REV)
>>>>>> +		revision = RK3288_SOC_REV_RK3288W;
>>>>>> +	else
>>>>>> +		revision = RK3288_SOC_REV_RK3288;
>>>>>> +
>>>>>> +	iounmap(hdmi_base);
>>>>>> +
>>>>>> +	return revision;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(rk3288_get_revision);
>>>>>>   
>>>>>>   static void __init rockchip_timer_init(void)
>>>>>>   {
>>>>>> diff --git a/include/soc/rockchip/revision.h b/include/soc/rockchip/revision.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..226419c60af0
>>>>>> --- /dev/null
>>>>>> +++ b/include/soc/rockchip/revision.h
>>>>>> @@ -0,0 +1,22 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>> +/*
>>>>>> + * Copyright 2020 Collabora
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef __SOC_ROCKCHIP_REVISION_H__
>>>>>> +#define __SOC_ROCKCHIP_REVISION_H__
>>>>>> +
>>>>>> +enum rk3288_soc_revision {
>>>>>> +	RK3288_SOC_REV_UNKNOWN,
>>>>>> +	RK3288_SOC_REV_RK3288,
>>>>>> +	RK3288_SOC_REV_RK3288W,
>>>>>> +};
>>>>>> +
>>>>>> +int rk3288_get_revision(void);
>>>>>> +
>>>>>> +static inline bool soc_is_rk3288w(void)
>>>>>> +{
>>>>>> +	return rk3288_get_revision() == RK3288_SOC_REV_RK3288W;
>>>>>> +}
>>>>>> +
>>>>>> +#endif /* __SOC_ROCKCHIP_REVISION_H__ */
>>>>>>
>>>>>
>>>
>>
>
>
>
>


