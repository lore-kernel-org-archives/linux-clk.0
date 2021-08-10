Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3726C432BE
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 06:55:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A39386023B
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 06:55:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236223AbhHJG4S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Aug 2021 02:56:18 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:37560 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbhHJG4S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Aug 2021 02:56:18 -0400
Received: by mail-ua1-f41.google.com with SMTP id 67so8173113uaq.4
        for <linux-clk@vger.kernel.org>; Mon, 09 Aug 2021 23:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kud17ACtN9yfWM3KLuemFK9HgmdKIREvVGyesEjaD5o=;
        b=co+xamDzd3zgXQGqFapzoQEZOI/MZNAxPNkL389glFDViw65Oh5QGw8Ri2TsctHugv
         gan5qnrh4nYGHerIBCOv+0RbfLPz8fu4e9AsJTFdtcffLnWM2PuiFSGEc8da14zpGtNW
         78MLe8A3n5ZF9AKpst7aXTRUW3aRgA+PBFt5WlvNUNlZfIqb9adNV79xmmk+Nv2GDbgt
         KIDEETSV2NsTcvthqooUqEigPKhUYJcPKT6HCCs0e+FB9iF1cWcGAMz5zjf3lAPQ7BZa
         ijYIyQGrgvD0sFvnvBLQvjkiO1aRM43w4D4bcjuB3qZaSFeMX/sB8/iyyXbSgueX15od
         UT3A==
X-Gm-Message-State: AOAM5318RPpC6qdhOLdml7PWDhFIPZcjbz4NlY6s2GXWGGCK5xtM4K2o
        RF3oUnF6e/wPmoWakdRIepIJrWbaviq7PtUIgV5DcqfkaSc=
X-Google-Smtp-Source: ABdhPJyykhBqVsRrWKOl0k/UPQBA0npL2upb+wU695x5+XBoFwMMq5WLAU106S9vmCvL1RG69UihXnAPW5/YYURDFjY=
X-Received: by 2002:a9f:31ad:: with SMTP id v42mr7000574uad.58.1628578556367;
 Mon, 09 Aug 2021 23:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210809223813.3766204-1-sean.anderson@seco.com> <20210809223813.3766204-3-sean.anderson@seco.com>
In-Reply-To: <20210809223813.3766204-3-sean.anderson@seco.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Aug 2021 08:55:44 +0200
Message-ID: <CAMuHMdWegtz-mBp6q5Pqbu21Qne=OKaGyzbVNivONPf0x+X3-g@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] clk: vc5: Add properties for configuring SD/OE behavior
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sean,

On Tue, Aug 10, 2021 at 12:38 AM Sean Anderson <sean.anderson@seco.com> wrote:
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
> @@ -886,6 +886,7 @@ static const struct of_device_id clk_vc5_of_match[];
>
>  static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  {
> +       unsigned int oe, sd, src_mask = 0, src_val = 0;
>         struct vc5_driver_data *vc5;
>         struct clk_init_data init;
>         const char *parent_names[2];
> @@ -913,6 +914,29 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>                 return dev_err_probe(&client->dev, PTR_ERR(vc5->regmap),
>                                      "failed to allocate register map\n");
>
> +       ret = of_property_read_u32(client->dev.of_node, "idt,shutdown", &sd);
> +       if (!ret) {
> +               src_mask |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
> +               if (sd)
> +                       src_val |= VC5_PRIM_SRC_SHDN_EN_GBL_SHDN;
> +       } else if (ret != -EINVAL) {
> +               return dev_err_probe(&client->dev, ret,
> +                                    "could not read idt,shutdown\n");
> +       }
> +
> +       ret = of_property_read_u32(client->dev.of_node,
> +                                  "idt,output-enable-active", &oe);
> +       if (!ret) {
> +               src_mask |= VC5_PRIM_SRC_SHDN_SP;
> +               if (oe)
> +                       src_val |= VC5_PRIM_SRC_SHDN_SP;
> +       } else if (ret != -EINVAL) {
> +               return dev_err_probe(&client->dev, ret,
> +                                    "could not read idt,output-enable-active\n");
> +       }
> +
> +       regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, src_mask, src_val);

The regmap core doesn't seem to return early if src_mask is zero,
so perhaps you want to avoid calling it if no bits have to be changed?

Regardless:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> +
>         /* Register clock input mux */
>         memset(&init, 0, sizeof(init));

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
