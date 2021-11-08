Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849BAC433F5
	for <linux-clk@archiver.kernel.org>; Mon,  8 Nov 2021 15:01:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 655FB61207
	for <linux-clk@archiver.kernel.org>; Mon,  8 Nov 2021 15:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239374AbhKHPEM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Nov 2021 10:04:12 -0500
Received: from phobos.denx.de ([85.214.62.61]:49126 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240664AbhKHPEM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Nov 2021 10:04:12 -0500
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 677C983176;
        Mon,  8 Nov 2021 16:01:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1636383684;
        bh=VW6XSQLYJ9hNWv0H95auB8+BwWLkGYH+tDrXB+ybyKk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=vInYaAnAqS5cbYJNtZgdZPtp5P83QrWlYfCvuEsLD3PjJwAtIfJVeYsrxT9ANR79z
         ur2G8rf5k5qTnWXFgZBjoG4gSH91x57YG7p1ts49MDE1A10nhZJ4vK4WwUB99T7hf5
         w0qJNd3NTZDTXT+0kzbO2mzJFbnqMs6tj8+aIsfBDE3er/Z7j3IGkTwY+NnkcLxzYE
         ZQCMJuPwhQueMyQjlcammR2XPu/7wv6fsAh5oQHChAjP2M47QHcbmwGescBlDPskga
         gkTSboRBZCfvYSc4T8JbLI4fTYO24e4nxdCBIbb/2YK0c0As3HkC4aiFsvdJUnKJhd
         +BdbzeTIn3jKQ==
Subject: Re: [PATCH 1/2] dt-bindings: mfd: rohm,bd71847-pmic: Document
 rohm,clock-output-is-critical property
To:     Rob Herring <robh@kernel.org>
Cc:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
References: <20211020084956.83041-1-marex@denx.de>
 <263da45f-d648-3c65-aed3-e4ba41927911@fi.rohmeurope.com>
 <4b3cc52c-a618-ea7d-6778-68060cfadf8e@denx.de>
 <YXsVHRnzAWCFTPCo@robh.at.kernel.org>
From:   Marek Vasut <marex@denx.de>
Message-ID: <cd8b50cf-409f-20a4-ce5b-0e94701d9ab3@denx.de>
Date:   Mon, 8 Nov 2021 16:01:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXsVHRnzAWCFTPCo@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/28/21 11:24 PM, Rob Herring wrote:
> On Wed, Oct 20, 2021 at 01:06:13PM +0200, Marek Vasut wrote:
>> On 10/20/21 12:14 PM, Vaittinen, Matti wrote:
>> [...]
>>
>>> I wonder if this really is something specific to ROHM ICs? Do you think
>>> this would warrant a generic, non vendor specific property? I am Ok with
>>> the ROHM specific property too but it just seems to me this might not be
>>> unique to ROHM IC(s).
> 
> I imagine we debated the need for a DT property when critical clocks was
> added to the kernel.

Have you got some reference to this debate ?

I think something like clk-hog , similar to gpio-hog , would be useful, 
since we could also configure the critical clock frequency in DT.

>>> By the way, the very same clk driver where you implemented the property
>>> reading (patch 2/2) is used by few other ROHM PMICs. At least by
>>> BD71837, BD71828, BD71815, BD9576 and BD9573. So the code change here
>>> adds support for this property to all of those PMICs. I wonder if the
>>> property should be mentioned in all of the binding docs... That could be
>>> another argument for making this a generic property and describing it in
>>> clk yaml ;)
>>>
>>> Well, just my 10 Cents - I am ok with this change as you presented it
>>> here if you don't think this should be generic one.
>>
>> I think we need something like gpio-hog, except for clock. Some clk-hog
>> maybe ? That would be useful not only here, but also for things where some
>> output generates clock for random stuff which cannot be described in the DT
>> for whatever reason (like e.g. the SoC is used as a substitute for CPLD XTAL
>> and the CPLD isn't connected to the SoC in any other way).
> 
> The justification given in this patch was for an SoC input which should
> get described so that the clock is handled and kept enabled properly.

This is the case I had here, yes. Although I've been running into 
similar requirements repeatedly for almost a decade, I'm surprised 
nobody implemented something like this yet.

> The CPLD case would be more interesting, but is there an actual need or
> just a possible case?

This is an iMX53 board from 2012 or so, where they figured they don't 
need an XTal for the CPLD because the SoC has this OSC_OUT and that can 
be used to supply clock to the CPLD at just the frequency they need. So 
the SoC is a clock source for the CPLD, and that's all there is to it.

So far I hacked it in the clock driver to keep the clock running at 
specific rate, but that hack has been a thorn in my side for long enough.

> You could use the 'protected-clocks' property here. Maybe that's a bit
> overloaded between can't access and don't turn off. But what it means is
> really up the clock controller.

This does not seem to describe what is needed here, protected-clock are 
used to tell OS not to touch certain clock because they are protected by 
e.g. firmware access restriction, it does not say anything about whether 
the clock are critical. Also, it seems to be a non-generic property only 
for some qualcomm clock driver.

commit 48d7f160b10711f014bf07b574c73452646c9fdd
[...]
dt-bindings: clk: Introduce 'protected-clocks' property

Add a generic clk property for clks which are not intended to be used by
the OS due to security restrictions put in place by firmware. For
example, on some Qualcomm firmwares reading or writing certain clk
registers causes the entire system to reboot, but on other firmwares
reading and writing those same registers is required to make devices
like QSPI work. Rather than adding one-off properties each time a new
set of clks appears to be protected, let's add a generic clk property to
describe any set of clks that shouldn't be touched by the OS. This way
we never need to register the clks or use them in certain firmware
configurations.
