Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732DBC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 12 Mar 2022 10:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbiCLK12 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Mar 2022 05:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbiCLK11 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 12 Mar 2022 05:27:27 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A28B1D2B75;
        Sat, 12 Mar 2022 02:26:21 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3FDF883AE6;
        Sat, 12 Mar 2022 11:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1647080778;
        bh=+SIpbN1h62mK1m8ERiHpYNLT4Fclt7J2/nx1fzIBje8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SsMarSwmceMhqU/AVSSt1wuMGBmEdSfmNnRqtR9Or7IK4nwfjMyGGBOYjfftnXj9m
         ggqfVB/2IN7gMURdSgKz+pFx9pQEEnQH7i0vIG9Uv3MOKHGh1KjcuB3frU5FZw++7g
         kuhHGaEjJQkma1g6vI5SkdFwYed7USi67L0NH6UCUrerhdfWkk3DL6bzMlzDNEZ7xW
         R3jP2rjH5SRscKZlqyAHWdg+XqeDe7j92eUa3c6YgzJ2/IuMfichd5t9qGoamTaYKZ
         MfutNEF9poFLqznVle1sEL56KUPlH9gGCkLuuYtct6C9enklqV7M1w9W3DUsxKp+1W
         +RcHSrRcJAHPw==
Message-ID: <00479d7f-1124-de8b-d125-40f8139331f1@denx.de>
Date:   Sat, 12 Mar 2022 11:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/3] clk: Introduce 'critical-clocks' property
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220215084412.8090-1-marex@denx.de>
 <20220215084412.8090-2-marex@denx.de>
 <20220217222328.7F7B3C340E8@smtp.kernel.org>
 <77c85470-5378-8c8b-8e5f-d57c83773ed6@denx.de>
 <4f1b946d-ee82-bd0e-c51e-100c23b87fdf@denx.de>
 <20220312050419.2AB91C340EE@smtp.kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220312050419.2AB91C340EE@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/12/22 06:04, Stephen Boyd wrote:
> Quoting Marek Vasut (2022-03-09 12:54:35)
>> On 2/21/22 01:58, Marek Vasut wrote:
>>> On 2/17/22 23:23, Stephen Boyd wrote:
>>>
>>>> I see that there isn't any more 'clock-critical' in the kernel's dts so
>>>> I wonder if we would be able to get rid of that function or at least
>>>> hollow it out and see if anyone complains. Either way, what is the
>>>> actual problem trying to be solved? If the crystal oscillator isn't used
>>>> anywhere in the kernel why are we registering it with the clk framework?
>>>
>>> The problem is the other way around -- the SoC clock IPs often have a
>>> couple of general purpose clock routed to various SoC IO pins, those
>>> clock can be used for any purpose, and those are already registered with
>>> kernel clock framework. Some devices save on BoM and use those general
>>> purpose clock to supply clock networks which are otherwise not
>>> interacting with the kernel, like some CPLD for example. Since from the
>>> kernel point of view, those clock are unused, the kernel can turn those
>>> clock OFF and that will make the entire device fail.
>>>
>>> So this critical-clocks property permits marking clock which must not
>>> ever be turned OFF accordingly.
>>
>> How can we proceed here ?
> 
> Why are we registering the clks with the framework on device that are
> saving on BoM and using them outside of the kernel. What is the use of
> kernel memory for struct clk_core that aren't ever used?

Those clock may be used to supply a device in DT on another hardware 
using the same SoC.

Take e.g. this random git grep result:

arch/arm/boot/dts/imx7d-remarkable2.dts
/ {
   wifi_pwrseq {
     ...
     clocks = <&clks IMX7D_CLKO2_ROOT_DIV>;
     ...
   };
};

This IMX7D_CLKO2_ROOT_DIV is one such general purpose clock output. In 
the aforementioned case, it is used to supply 32 kHz clock to a WiFi 
chip, i.e. it has a consumer in DT. These clock are registered by the 
platform clock driver:

drivers/clk/imx/clk-imx7d.c

But those clock can also be used to supply e.g. CPLD which has no other 
connection to the SoC but the clock. That is where it needs this 
critical-clocks property. Because then there is no consumer in DT. So 
the kernel will now think the clock are not used and will turn them off 
after boot, thus e.g. crashing such platform.

So in the later case, the DT would contain the following to avoid the crash:
&clks {
   critical-clocks = <IMX7D_CLKO2_ROOT_DIV>;
};
