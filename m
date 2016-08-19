Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:20053 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755295AbcHSRqn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2016 13:46:43 -0400
MIME-Version: 1.0
In-Reply-To: <20160819002507.GS361@codeaurora.org>
References: <1470112223-24835-1-git-send-email-yamada.masahiro@socionext.com>
 <1470112223-24835-2-git-send-email-yamada.masahiro@socionext.com> <20160819002507.GS361@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 20 Aug 2016 02:46:29 +0900
Message-ID: <CAK7LNAQg-LcK-vsWVU-b0WsF=Y_NBNR_cWqNDJKyMqp7Svdvqg@mail.gmail.com>
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


2016-08-19 9:25 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
>> +int uniphier_clk_probe(struct platform_device *pdev)
>
> static?


Thanks.
Will fix in v7.


>> +{
>> +     struct device *dev = &pdev->dev;
>> +     const struct of_device_id *match;
>> +     struct clk_hw_onecell_data *hw_data;
>> +     struct device_node *parent;
>> +     struct regmap *regmap;
>> +     const struct uniphier_clk_data *p;
>> +     int clk_num = 0;
>> +
>> +     match = of_match_node(uniphier_clk_match, dev->of_node);
>> +     if (!match)
>> +             return -ENODEV;
>
> We can use of_driver_match_device() to make this simpler.


I want to use the returned "match".
The of_driver_match_device() just checks if it matches or not,
so I do not think it can be the replacement.

I can use of_match_device() instead, if you like.



>> +
>> +     parent = of_get_parent(dev->of_node); /* parent should be syscon node */
>> +     regmap = syscon_node_to_regmap(parent);
>> +     of_node_put(parent);
>
> devm_get_regmap(dev->parent) should work then? Why do we need to
> use OF APIs?

"git grep devm_get_regmap" did not hit anything.

Where is it defined?



>> +     init.name = name;
>> +     init.ops = &clk_fixed_factor_ops;
>> +     init.flags = data->parent_name ? CLK_SET_RATE_PARENT : 0;
>> +     init.flags |= CLK_IS_BASIC;
>
> Please don't use CLK_IS_BASIC unless you need it. So far we've
> kept it to OMAP and I'm hoping to delete it.


Will do in v7.



-- 
Best Regards
Masahiro Yamada
