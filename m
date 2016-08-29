Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:46206 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752154AbcH2CVr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 28 Aug 2016 22:21:47 -0400
MIME-Version: 1.0
In-Reply-To: <20160819191612.GU361@codeaurora.org>
References: <1470112223-24835-1-git-send-email-yamada.masahiro@socionext.com>
 <1470112223-24835-2-git-send-email-yamada.masahiro@socionext.com>
 <20160819002507.GS361@codeaurora.org> <CAK7LNAQg-LcK-vsWVU-b0WsF=Y_NBNR_cWqNDJKyMqp7Svdvqg@mail.gmail.com>
 <20160819191612.GU361@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Aug 2016 11:21:35 +0900
Message-ID: <CAK7LNAQownrE0n8rAYGgUs9_byvok8W0V=c6gts_C=8Wvio86g@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] clk: uniphier: add core support code for UniPhier
 clock driver
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


2016-08-20 4:16 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
>>
>> >> +
>> >> +     parent = of_get_parent(dev->of_node); /* parent should be syscon node */
>> >> +     regmap = syscon_node_to_regmap(parent);
>> >> +     of_node_put(parent);
>> >
>> > devm_get_regmap(dev->parent) should work then? Why do we need to
>> > use OF APIs?
>>
>> "git grep devm_get_regmap" did not hit anything.
>>
>> Where is it defined?
>>
>
> Sorry I meant dev_get_regmap().
>

I tried this, but it did not work.

To make dev_get_regmap() work,
the parent device needs to call dev_regmap_init_mmio() beforehand.


Since commit bdb0066df96e74a4002125467ebe459feff1ebef
(mfd: syscon: Decouple syscon interface from platform devices),
syscon_probe() is not called for platform devices,
so that never happens.



-- 
Best Regards
Masahiro Yamada
