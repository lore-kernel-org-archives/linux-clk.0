Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg001.nifty.com ([202.248.44.39]:51897 "EHLO
	conssluserg001-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751914AbbKBQFs (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 2 Nov 2015 11:05:48 -0500
MIME-Version: 1.0
In-Reply-To: <1446470642.3442.54.camel@pengutronix.de>
References: <CAK7LNARGbHqn9D3fDtN9xzwzFoYCur2qJUnnyRA4Q52D9XUVVA@mail.gmail.com>
	<1446470642.3442.54.camel@pengutronix.de>
Date: Tue, 3 Nov 2015 01:05:36 +0900
Message-ID: <CAK7LNASnSJ+Y-cGhUxffUGcoVaY1y0H9-mXQfNbGvYBa4V4Jhg@mail.gmail.com>
Subject: Re: ML for reset controller sub-system?
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Philipp,

2015-11-02 22:24 GMT+09:00 Philipp Zabel <p.zabel@pengutronix.de>:
> Hi Masahiro,
>
> Am Montag, den 02.11.2015, 22:05 +0900 schrieb Masahiro Yamada:
>> Hi Philipp,
>>
>>
>> I searched for the reset controller entry in MAINTAINERS.
>>
>>
>> RESET CONTROLLER FRAMEWORK
>> M:      Philipp Zabel <p.zabel@pengutronix.de>
>> S:      Maintained
>> F:      drivers/reset/
>> F:      Documentation/devicetree/bindings/reset/
>> F:      include/dt-bindings/reset/
>> F:      include/linux/reset.h
>> F:      include/linux/reset-controller.h
>>
>>
>> Nothing is mentioned which mailing list
>> reset controller patches should be sent to.
>>
>> Please advise me.
>
> There is no special reset-controller mailing list. Due to the low amount
> of patches until now, I'm just using linux-kernel@vger.kernel.org.
> scripts/get_maintainer.pl should give you the right list for existing
> drivers.
>
> For new drivers consider adding the SoC/architecture specific mailing
> list to --cc, especially when coordination between reset and other
> drivers is needed during bringup. If new device tree bindings are added,
> always include devicetree@vger.kernel.org.
>

This helped me a lot.

Thanks!



-- 
Best Regards
Masahiro Yamada
