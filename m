Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BF4C11F68
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 07:29:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64DED613F4
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 07:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhGBHcE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jul 2021 03:32:04 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:34692 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhGBHcD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jul 2021 03:32:03 -0400
Received: by mail-vs1-f42.google.com with SMTP id x15so3793012vsc.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Jul 2021 00:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYfm5YvbmuNCk12+wLR8GoUiUKFaoILGT/Enxd7D7Tw=;
        b=MMh5EY/TFSk3bJpZ0cEoqE0veLHdPiy5lpePPISLdXKlHePSuMfIppYMJiL5SRnI9/
         jNvF3QgOGTuQhsbfg1XSZ7bOaJgDxXyTOxx+C41s/Ttoo9hvqgyOVuzppyDOaBg3gHBg
         UWHfI6eaUGF+H6HNlKTN4pH76y0hawhhDp/J/kDQL3/v1jGQMunCgLTCIIrH7jnGrCH8
         a1mpVibN4PyCIW/1JBXGhbOfWxP6jlTXdXwoDBkwIbNfIOurhD6eXlez/9f4eKnvxCdk
         FlUeH1i/em9dwcqn393Sqspp8aks9WDc53x3Jhaadsd/6vwAyd4BpheSm5PafGolEDJF
         LYFQ==
X-Gm-Message-State: AOAM530MSaH/uye+e6VIPSeo6+Ze2pxEjOv6r1IUxR1MPqlblzNoJL7N
        2Gpyble1b3DOcgZcXBz8df7R/GpG1oym6m76xYw=
X-Google-Smtp-Source: ABdhPJzeJDQ0p+FwclJ3NbpzvWDuDA1sSOqlZOa77oLPuxYxe+vojgKt0SSNYdDq1T4ISvBh2jjvWeQ08+f1bM6ZEJU=
X-Received: by 2002:a67:f98c:: with SMTP id b12mr3585978vsq.40.1625210970932;
 Fri, 02 Jul 2021 00:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210701182012.3421679-1-sean.anderson@seco.com> <20210701182012.3421679-3-sean.anderson@seco.com>
In-Reply-To: <20210701182012.3421679-3-sean.anderson@seco.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Jul 2021 09:29:19 +0200
Message-ID: <CAMuHMdWJc_b=3jAnsG_uXjzP-GT9L3YrB=vWO8G1dnQOeiBMRg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] clk: vc5: Add properties for configuring SD/OE behavior
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

 Hi Sean,

On Thu, Jul 1, 2021 at 8:20 PM Sean Anderson <sean.anderson@seco.com> wrote:
> The SD/OE pin may be configured to enable output when high or low, and
> to shutdown the device when high. This behavior is controller by the SH
> and SP bits of the Primary Source and Shutdown Register (and to a lesser
> extent the OS and OE bits). By default, both bits are 0 (unless set by
> OTP memory), but they may need to be configured differently, depending
> on the external circuitry controlling the SD/OE pin.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>

Thanks for your patch!

> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -886,6 +886,8 @@ static const struct of_device_id clk_vc5_of_match[];
>
>  static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  {
> +       bool oe_high, oe_low, sh_enable, sh_disable;
> +       unsigned int sp_mask, sh_mask, sp_val, sh_val;
>         struct vc5_driver_data *vc5;
>         struct clk_init_data init;
>         const char *parent_names[2];
> @@ -913,6 +915,25 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>                 return dev_err_probe(&client->dev, PTR_ERR(vc5->regmap),
>                                      "failed to allocate register map\n");
>
> +       oe_high = of_property_read_bool(client->dev.of_node,
> +                                       "idt,output-enable-active-high");
> +       oe_low = of_property_read_bool(client->dev.of_node,
> +                                       "idt,output-enable-active-low");
> +       sh_enable = of_property_read_bool(client->dev.of_node,
> +                                         "idt,enable-shutdown");
> +       sh_disable = of_property_read_bool(client->dev.of_node,
> +                                          "idt,disable-shutdown");
> +       if ((oe_high && oe_low) || (sh_enable && sh_disable))
> +               return dev_err_probe(&client->dev, -EINVAL,
> +                                    "conflicting properties for SD/OE pin\n");
> +
> +       sp_mask = (oe_high || oe_low) ? VC5_PRIM_SRC_SHDN_SP : 0;
> +       sh_mask = (sh_enable || sh_disable) ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0;
> +       sp_val = oe_high ? VC5_PRIM_SRC_SHDN_SP : 0;
> +       sh_val = sh_enable ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0;

I'm not so fond of ternary operators where one branch uses zero, so
I would write this (with pre-initialization of mask/val to zero):

    if (oe_high || oe_low)
            mask |= VC5_PRIM_SRC_SHDN_SP;
    if (oe_high)
            val |= VC5_PRIM_SRC_SHDN_SP;

which also has the benefit you need only one mask and val.
But that's purely my personal preference.

> +       regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, sp_mask | sh_mask,
> +                          sp_val | sh_val);
> +
>         /* Register clock input mux */
>         memset(&init, 0, sizeof(init));

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
