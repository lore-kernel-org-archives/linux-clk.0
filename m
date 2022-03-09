Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76667C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  9 Mar 2022 20:54:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236787AbiCIUzk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Mar 2022 15:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235059AbiCIUzj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Mar 2022 15:55:39 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB02674FD;
        Wed,  9 Mar 2022 12:54:39 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 725758399E;
        Wed,  9 Mar 2022 21:54:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1646859276;
        bh=8x9ip6XskdTCS9XgTDpegWPGD+ym4XXbveavhXy7Du8=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=LPpae7pt9aj2l56OhJ5fuVX8wnAlcVGcpjTHW7NS0u396W6fWRmGWZGCo1QC5vUm6
         Lyfpr1ZFsO5+0kVTrCbNPA5kX+/PMDrgduHIQk2QT+PFTecHsZqz55BMbekXn7+eYr
         82qzeJXk1bDX/+dQHE+IBetF2sp7bK5bUTn1jt0+k6VjU7crfSThWQ7pdzbWlI3uJ/
         mlJvFZK9hfhFj1lFRGDY8jqHzUgy3jc4wgUETAYFhhJqyGStm8VzX6PYvh7bQ3vRkA
         XkidNvg0sBAhTfgK0HEGQGny2Xr9LNJM7O5IQgC5w0uAGFgDekAInIbPUs7TaD9XPt
         3GZeB9YVgZbbg==
Message-ID: <4f1b946d-ee82-bd0e-c51e-100c23b87fdf@denx.de>
Date:   Wed, 9 Mar 2022 21:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/3] clk: Introduce 'critical-clocks' property
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220215084412.8090-1-marex@denx.de>
 <20220215084412.8090-2-marex@denx.de>
 <20220217222328.7F7B3C340E8@smtp.kernel.org>
 <77c85470-5378-8c8b-8e5f-d57c83773ed6@denx.de>
In-Reply-To: <77c85470-5378-8c8b-8e5f-d57c83773ed6@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/21/22 01:58, Marek Vasut wrote:
> On 2/17/22 23:23, Stephen Boyd wrote:
>> Quoting Marek Vasut (2022-02-15 00:44:11)
>>> Some platforms require clock to be always running, e.g. because those 
>>> clock
>>> supply devices which are not otherwise attached to the system. One 
>>> example
>>> is a system where the SoC serves as a crystal oscillator replacement 
>>> for a
>>> programmable logic device. The critical-clock property of a clock 
>>> controller
>>> allows listing clock which must never be turned off.
>>>
>>> The implementation here is similar to "protected-clock", except 
>>> protected
>>> clock property is currently driver specific. This patch attempts to make
>>> a generic implementation of "critical-clock" instead.
>>>
>>> Unlike "assigned-clocks", the "critical-clock" must be parsed much 
>>> earlier
>>> in __clk_register() to assign CLK_IS_CRITICAL flag to clk_init_data 
>>> .flags
>>> field. The parsing code obviously need to be cleaned up and factor 
>>> out into
>>> separate function.
>>>
>>> The new match_clkspec() callback is used to determine whether struct 
>>> clk_hw
>>> that is currently being registered matches the clock specifier in the DT
>>> "critical-clock" property, and if so, then the CLK_IS_CRITICAL is 
>>> added to
>>> these newly registered clock. This callback is currently driver 
>>> specific,
>>> although I suspect a common and/or generic version of the callback could
>>> be added. Also, this new callback could possibly be used to replace 
>>> (*get)
>>> argument of of_clk_add_hw_provider() later on too.
>>
>> I don't see any mention of of_clk_detect_critical() here. We don't want
>> to enshrine the critical clk flag in DT. There was a bunch of discussion
>> about this on the mailing list years ago and the end result was this
>> instantly deprecated function to set the flag based on a DT property.
>> That thread isn't mentioned here either.
> 
> I wasn't aware of clock-critical DT prop, but it seems deprecated and 
> not generic enough anyway.
> 
>> I see that there isn't any more 'clock-critical' in the kernel's dts so
>> I wonder if we would be able to get rid of that function or at least
>> hollow it out and see if anyone complains. Either way, what is the
>> actual problem trying to be solved? If the crystal oscillator isn't used
>> anywhere in the kernel why are we registering it with the clk framework?
> 
> The problem is the other way around -- the SoC clock IPs often have a 
> couple of general purpose clock routed to various SoC IO pins, those 
> clock can be used for any purpose, and those are already registered with 
> kernel clock framework. Some devices save on BoM and use those general 
> purpose clock to supply clock networks which are otherwise not 
> interacting with the kernel, like some CPLD for example. Since from the 
> kernel point of view, those clock are unused, the kernel can turn those 
> clock OFF and that will make the entire device fail.
> 
> So this critical-clocks property permits marking clock which must not 
> ever be turned OFF accordingly.

How can we proceed here ?
