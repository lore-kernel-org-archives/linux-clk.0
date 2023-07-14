Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18691C001DD
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jul 2023 09:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbjGNJg6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jul 2023 05:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235660AbjGNJgj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jul 2023 05:36:39 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD493AA0
        for <linux-clk@vger.kernel.org>; Fri, 14 Jul 2023 02:36:34 -0700 (PDT)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F20F23F738
        for <linux-clk@vger.kernel.org>; Fri, 14 Jul 2023 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689327392;
        bh=+yiF1ij/z+iWY/wZthjD0aPjMSoVu9B46XxEpPJ5vvs=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=tul1H40eiEJ5ir5lmiOokb3byqiymVG0q9qLOQk8TBjB6xInwuQq2zmA5VcbrEbhj
         DbPpOQuT7+qKLvjHUVpKtYOapdt301/JbyOHVkhXMIycxeYRawRiY8ykK3K13M2H4D
         qs2HviBjQskEuP0au8NEpqg+YOqJ2QYNUCVn/BSExnH9R5TGOxulvM7qPAIgPi+I0a
         d6YpapkSA9rDzVBkEp/5qralzZgNuIBVFiUjGR+gjVUbIq0Nao+ge/1d77mXJEheld
         JbI5x82yyqX3JjQyr5Y3BV8MllZJ8CT/xrQXCO5xjU/Az3lPQtDM3WE0c57m9ta4Eg
         w8mh7zxqCaE0g==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-403c7ffd25eso19775031cf.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Jul 2023 02:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689327386; x=1691919386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yiF1ij/z+iWY/wZthjD0aPjMSoVu9B46XxEpPJ5vvs=;
        b=la3Q7AxCMFYGlLsrGyAiOMmWbKL/pgcuKkjbMBMQXvCYk7MqioFUWnkWk3s3m32Efw
         ZoHcKB9ryZ4tRuvcMH9rCVTuU8bI/uZZcDoNUacQ2PHMEfCj+5c/vlSgBDtCFf4GeHT8
         pXMjyay2IqMUFP1oU60lwy0VL11Bv1pB0250DEAH4BizbUy/gAiyp1rP9HH4sUfBkVoR
         oZDiuJCrpY5AGVKWyDfbbPJXQa3eA5ma+iMESpvdf0AE2UySRbsaPYPv8v2bxhQIUVBl
         HC6EhM+RFT/YE5pB8poawTpnPCUVEOqL8h7TO7IEagdyoto7qG17Z7vAt60FnivdUVG+
         Dtsw==
X-Gm-Message-State: ABy/qLbh3fhO8tgzBFJJ3ouMdm3/E8hGIhta4elY0fcaxk49mJc1VJC7
        9PMTDpA38pyqLn2YMR9GPNs48AbOnZzgltVjj04dsFAsqTZ+mg8kOLx+bJtXaAhEc2XYFf4lLns
        F5GY8PBW0mXurIGaE2BGc3xA1YyAqE9Ovpwm63hiSA8rHnQMf0HObMQ==
X-Received: by 2002:a05:622a:181:b0:403:ac95:c6a9 with SMTP id s1-20020a05622a018100b00403ac95c6a9mr5242752qtw.30.1689327386206;
        Fri, 14 Jul 2023 02:36:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGxE6bkszZ+7BBq2hyHda3ibW1kqoUiril9bmmHYh1J06irx78LOa5uu+I/iZMoL2sy2f6nXwFaMqHTE34JLQw=
X-Received: by 2002:a05:622a:181:b0:403:ac95:c6a9 with SMTP id
 s1-20020a05622a018100b00403ac95c6a9mr5242716qtw.30.1689327385565; Fri, 14 Jul
 2023 02:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <20230704064610.292603-6-xingyu.wu@starfivetech.com> <CAJM55Z-OSmQCV6mO+SD4R2eU5gfx9TArSqDy+d-M2aer6bKL_A@mail.gmail.com>
 <9a2f0aa0-ad7e-c12d-245d-5f80928705d6@starfivetech.com>
In-Reply-To: <9a2f0aa0-ad7e-c12d-245d-5f80928705d6@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Fri, 14 Jul 2023 11:36:09 +0200
Message-ID: <CAJM55Z8rXOyT4Q-JbzZof5050qGqohDTRCj7RDavuzi1Zb6wMQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 5/7] clk: starfive: jh7110-sys: Add PLL clocks
 source from DTS
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 14 Jul 2023 at 10:05, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> On 2023/7/13 21:15, Emil Renner Berthing wrote:
> > On Tue, 4 Jul 2023 at 08:49, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
> >>
> >> Modify PLL clocks source to be got from DTS or
> >> the fixed factor clocks.
> >>
> >> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> >> ---
> >>  drivers/clk/starfive/Kconfig                  |  1 +
> >>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 45 +++++++++++--------
> >>  2 files changed, 28 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> >> index 5195f7be5213..978b78ec08b1 100644
> >> --- a/drivers/clk/starfive/Kconfig
> >> +++ b/drivers/clk/starfive/Kconfig
> >> @@ -35,6 +35,7 @@ config CLK_STARFIVE_JH7110_SYS
> >>         select AUXILIARY_BUS
> >>         select CLK_STARFIVE_JH71X0
> >>         select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
> >> +       select CLK_STARFIVE_JH7110_PLL
> >>         default ARCH_STARFIVE
> >>         help
> >>           Say yes here to support the system clock controller on the
> >> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> >> index e6031345ef05..d56f48013388 100644
> >> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> >> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> >> @@ -7,6 +7,7 @@
> >>   */
> >>
> >>  #include <linux/auxiliary_bus.h>
> >> +#include <linux/clk.h>
> >>  #include <linux/clk-provider.h>
> >>  #include <linux/init.h>
> >>  #include <linux/io.h>
> >> @@ -386,6 +387,7 @@ EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
> >>
> >>  static int __init jh7110_syscrg_probe(struct platform_device *pdev)
> >>  {
> >> +       bool use_fixed_pll = true;      /* PLL clocks use fixed factor clocks or PLL driver */
> >
> > nit: reverse christmas tree ordering, eg. move this below priv
> >
> >>         struct jh71x0_clk_priv *priv;
> >>         unsigned int idx;
> >>         int ret;
> >> @@ -402,28 +404,29 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
> >>         if (IS_ERR(priv->base))
> >>                 return PTR_ERR(priv->base);
> >>
> >> -       /*
> >> -        * These PLL clocks are not actually fixed factor clocks and can be
> >> -        * controlled by the syscon registers of JH7110. They will be dropped
> >> -        * and registered in the PLL clock driver instead.
> >> -        */
> >> +       if (!IS_ERR(devm_clk_get(priv->dev, "pll0_out")))
> >> +               use_fixed_pll = false;  /* can get pll clocks from PLL driver */
> >
> > The devm_clk_get() variant will allocate memory for a callback to call
> > clk_put() when the driver is unloaded, but proper references
> > associated with the consumers of the pll0_out clock are already taken
> > below. So unless we find a better way to detect if the pll references
> > are specified in the device tree or not, maybe something like this
> > instead:
> >
>
> Thanks. It looks more reasonable. I will follow it in next version.
>
> > priv->pll[0] = clk_get(priv->dev, "pll0_out);
>
> The priv->pll[] are clk_hw* struct no clk* struct and this could be failed
> when building. So maybe use a temporary clk* struct.

Ah yes, you're right. You'll need a local struct clk *clk for that then.

> > if (IS_ERR(priv->pll[0])) {
> >   /* 24MHZ -> 1000.0MHz */
> >   priv->pll[0] = ...
> >   ...
> >
> > } else {
> >   clk_put(priv->pll[0]);
> >   priv->pll[0] = NULL;
>
> >
> >> +       /* Use fixed factor clocks if can not get the PLL clocks from DTS */
> >> +       if (use_fixed_pll) {
> >>         /* 24MHz -> 1000.0MHz */
> >
> > These comments are not indented with the code, which just looks weird.
>
> Will fix.
>
> >
> >> -       priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
> >> -                                                        "osc", 0, 125, 3);
> >> -       if (IS_ERR(priv->pll[0]))
> >> -               return PTR_ERR(priv->pll[0]);
> >> +               priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
> >> +                                                                "osc", 0, 125, 3);
> >> +               if (IS_ERR(priv->pll[0]))
> >> +                       return PTR_ERR(priv->pll[0]);
> >>
> >>         /* 24MHz -> 1066.0MHz */
> >> -       priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
> >> -                                                        "osc", 0, 533, 12);
> >> -       if (IS_ERR(priv->pll[1]))
> >> -               return PTR_ERR(priv->pll[1]);
> >> +               priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
> >> +                                                                "osc", 0, 533, 12);
> >> +               if (IS_ERR(priv->pll[1]))
> >> +                       return PTR_ERR(priv->pll[1]);
> >>
> >>         /* 24MHz -> 1188.0MHz */
> >> -       priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
> >> -                                                        "osc", 0, 99, 2);
> >> -       if (IS_ERR(priv->pll[2]))
> >> -               return PTR_ERR(priv->pll[2]);
> >> +               priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
> >> +                                                                "osc", 0, 99, 2);
> >> +               if (IS_ERR(priv->pll[2]))
> >> +                       return PTR_ERR(priv->pll[2]);
> >> +       }
> >>
> >>         for (idx = 0; idx < JH7110_SYSCLK_END; idx++) {
> >>                 u32 max = jh7110_sysclk_data[idx].max;
> >> @@ -462,8 +465,14 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
> >>                                 parents[i].fw_name = "tdm_ext";
> >>                         else if (pidx == JH7110_SYSCLK_MCLK_EXT)
> >>                                 parents[i].fw_name = "mclk_ext";
> >> -                       else
> >> +                       else if (use_fixed_pll)
> >
> > else if (priv->pll[0])
>
> Will change.
>
> >
> >>                                 parents[i].hw = priv->pll[pidx - JH7110_SYSCLK_PLL0_OUT];
> >> +                       else if (pidx == JH7110_SYSCLK_PLL0_OUT)
> >> +                               parents[i].fw_name = "pll0_out";
> >> +                       else if (pidx == JH7110_SYSCLK_PLL1_OUT)
> >> +                               parents[i].fw_name = "pll1_out";
> >> +                       else if (pidx == JH7110_SYSCLK_PLL2_OUT)
> >> +                               parents[i].fw_name = "pll2_out";
> >>                 }
> >>
> >>                 clk->hw.init = &init;
> >> --
> >> 2.25.1
> >>
>
> Best regards,
> Xingyu Wu
