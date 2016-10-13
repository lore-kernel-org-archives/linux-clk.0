Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:46323 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755040AbcJMFr0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Oct 2016 01:47:26 -0400
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com [209.85.161.171]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id u9D5lJbY006805
        for <linux-clk@vger.kernel.org>; Thu, 13 Oct 2016 14:47:20 +0900
Received: by mail-yw0-f171.google.com with SMTP id t192so46940236ywf.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2016 22:47:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161012093404.GA29062@mwanda>
References: <20161012093404.GA29062@mwanda>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 13 Oct 2016 14:47:19 +0900
Message-ID: <CAK7LNAQ9=SZMCwoEFasULX4arqkxqOMpREUn6GLtqTdXik5=3w@mail.gmail.com>
Subject: Re: [bug report] clk: uniphier: add core support code for UniPhier
 clock driver
To: Dan Carpenter <dan.carpenter@oracle.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Dan, Stephen,


2016-10-12 18:34 GMT+09:00 Dan Carpenter <dan.carpenter@oracle.com>:
> Hello Masahiro Yamada,
>
> The patch 734d82f4a678: "clk: uniphier: add core support code for
> UniPhier clock driver" from Sep 16, 2016, leads to the following
> static checker warning:
>
>         drivers/clk/uniphier/clk-uniphier-mux.c:56 uniphier_clk_mux_get_parent()
>         warn: signedness bug returning '(-22)'
>
> drivers/clk/uniphier/clk-uniphier-mux.c
>     40  static u8 uniphier_clk_mux_get_parent(struct clk_hw *hw)
>                ^^
>     41  {
>     42          struct uniphier_clk_mux *mux = to_uniphier_clk_mux(hw);
>     43          int num_parents = clk_hw_get_num_parents(hw);
>     44          int ret;
>     45          u32 val;
>     46          u8 i;
>     47
>     48          ret = regmap_read(mux->regmap, mux->reg, &val);
>     49          if (ret)
>     50                  return ret;
>     51
>     52          for (i = 0; i < num_parents; i++)
>     53                  if ((mux->masks[i] & val) == mux->vals[i])
>     54                          return i;
>     55
>     56          return -EINVAL;
>                        ^^^^^^^
>
> We can't return -EINVAL as a u8.
>
>     57  }



I think we should change the return type of .get_parent() callback to "int"
so we can handle error code.
(perhaps, the argument of .set_parent() as well for consistency?)

[1]
I guess regmap_read() is often involved in .get_parent()
and it may return a negative value on failure.

[2]
On boot-up, the register my be read as
a value that is not covered by the clk driver.






> There are a bunch of similar bugs:
>
> drivers/clk/samsung/clk-s3c2410-dclk.c:72 s3c24xx_clkout_get_parent() warn: signedness bug returning '(-22)'
> drivers/clk/uniphier/clk-uniphier-mux.c:56 uniphier_clk_mux_get_parent() warn: signedness bug returning '(-22)'
> drivers/clk/microchip/clk-core.c:296 roclk_get_parent() warn: signedness bug returning '(-22)'
> drivers/clk/microchip/clk-core.c:837 sclk_get_parent() warn: signedness bug returning '(-22)'
> drivers/clk/ti/mux.c:51 ti_clk_mux_get_parent() warn: signedness bug returning '(-22)'
> drivers/clk/ti/mux.c:61 ti_clk_mux_get_parent() warn: signedness bug returning '(-22)'
> drivers/clk/nxp/clk-lpc32xx.c:1018 clk_mux_get_parent() warn: signedness bug returning '(-22)'
> drivers/clk/nxp/clk-lpc32xx.c:1022 clk_mux_get_parent() warn: signedness bug returning '(-22)'
> drivers/clk/rockchip/clk-ddr.c:91 rockchip_ddrclk_get_parent() warn: signedness bug returning '(-22)'
> drivers/clk/clk-mux.c:51 clk_mux_get_parent() warn: signedness bug returning '(-22)'
> drivers/clk/clk-mux.c:61 clk_mux_get_parent() warn: signedness bug returning '(-22)'


Yes, I followed drivers/clk/clk-mux.c as a reference implementation.





-- 
Best Regards
Masahiro Yamada
