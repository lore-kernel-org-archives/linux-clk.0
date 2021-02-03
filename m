Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8B5C433E6
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 18:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 266F164DF4
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 18:16:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbhBCSQX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Feb 2021 13:16:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232969AbhBCSQS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Feb 2021 13:16:18 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C4CC061788
        for <linux-clk@vger.kernel.org>; Wed,  3 Feb 2021 10:15:37 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id j84so532119ybg.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Feb 2021 10:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6sqZaAUfYP8DNj5oKyeEZdFXBpvCgFM5Th4Vqh4Q634=;
        b=lOCi5F89Jo6/RQia3F3QjW5H8JRtVAggDniGtWTFvyV29+w/Me9pVYU6kUFe+j8AdD
         qR/LTy8y0uCprC78deNpv0fM4YqNxpwAlhTkmPymYshYb58sHNW6VxQ3VeQDwfP9pwUD
         SRIH+3sg5aSF0mreMNA4LIqsyTSfytG9hVCw8diN2pZRiQV0maZkxpsMncxXL1t79+pc
         ITxSmChZwdKprpJ2cfy2SJfVLcA8AfrkZOdEgJoVOQIwnIQefxdOUKPFZhG1UMKB5LDk
         xjzJ/dDwZFpWlZ7HTeQgdbIXpAtf4jv8Top90svdbXLULybjAQJK1nvChss4hc8iKTb8
         mldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6sqZaAUfYP8DNj5oKyeEZdFXBpvCgFM5Th4Vqh4Q634=;
        b=HckasK2k3/w8Gl3DoGA3w6oWZV8gZVlI+sQT+g5z1f6p+lZmBg6ZxI0s8mO5FHsRws
         VLTLhyrL66uyAWK5rBPAy34x7y/Mlqthj64AOA1uxdt9sTxnkQGmvRuH3igL/FSzzebc
         8Znzz/BddHS7dN9jadH+ZQOf9vFTdTfVAOD/8ch0ia6bnXzNGUHknlbNPshe4P1HoEN2
         GyVSUDOpKjwl6+ZhkAc47w12Dubn4DJ6k/pKI5KbNScVfeJab5Z/46QbFmBBr3WQrbJh
         BYd1aj3g+DcGo0l9RxD2aN3YbOk9dd3uyc/0Ad/Iv1B2iITBksGjuvW5VPrQ0JpTOgTt
         Cy2g==
X-Gm-Message-State: AOAM531m2zbyrm/vJLQ1XDLLScsqT2OzAhO1illr7Azn2B6yUdZxbGkl
        21DQdaIINLppkZqF+H9afgckG9WFpmg/sYYSFzUAwg==
X-Google-Smtp-Source: ABdhPJz6aZVy82ZsC3b1j0AJTJk7Kz1cmCa03LfsrOrXyhMqcF+421DMroQW7sZo7ORWxNkWA8sj6OoRS32EqQl5p9o=
X-Received: by 2002:a25:718b:: with SMTP id m133mr6743785ybc.412.1612376136653;
 Wed, 03 Feb 2021 10:15:36 -0800 (PST)
MIME-Version: 1.0
References: <20210203154332.470587-1-tudor.ambarus@microchip.com>
In-Reply-To: <20210203154332.470587-1-tudor.ambarus@microchip.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 3 Feb 2021 10:15:00 -0800
Message-ID: <CAGETcx9ki6tM7Z8B8ghm9cZVNbwUo9rQPY1H0-s2rRifC=_m8A@mail.gmail.com>
Subject: Re: [PATCH] clk: at91: Fix the declaration of the clocks
To:     Tudor Ambarus <tudor.ambarus@microchip.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, nicolas.ferre@microchip.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        mirq-linux@rere.qmqm.pl,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        a.fatoum@pengutronix.de, Krzysztof Kozlowski <krzk@kernel.org>,
        codrin.ciubotariu@microchip.com,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 3, 2021 at 7:43 AM Tudor Ambarus
<tudor.ambarus@microchip.com> wrote:
>
> These are all "early clocks" that require initialization just at
> of_clk_init() time. Use CLK_OF_DECLARE() to declare them.
>
> This also fixes a problem that was spotted when fw_devlink was
> set to 'on' by default: the boards failed to boot. The reason is
> that CLK_OF_DECLARE_DRIVER() clears the OF_POPULATED and causes
> the consumers of the clock to be postponed by fw_devlink until
> the second initialization routine of the clock has been completed.
> One of the consumers of the clock is the timer, which is used as a
> clocksource, and needs the clock initialized early. Postponing the
> timers caused the fail at boot.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Thanks Tudor!
Acked-by: Saravana Kannan <saravanak@google.com>

-Saravana

> ---
> Tested on sama5d2_xplained.
>
>  drivers/clk/at91/at91rm9200.c  |  3 +--
>  drivers/clk/at91/at91sam9260.c | 16 ++++++++--------
>  drivers/clk/at91/at91sam9g45.c |  3 +--
>  drivers/clk/at91/at91sam9n12.c |  3 +--
>  drivers/clk/at91/at91sam9rl.c  |  3 ++-
>  drivers/clk/at91/at91sam9x5.c  | 20 ++++++++++----------
>  drivers/clk/at91/sama5d2.c     |  3 ++-
>  drivers/clk/at91/sama5d3.c     |  2 +-
>  drivers/clk/at91/sama5d4.c     |  3 ++-
>  9 files changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm9200.c
> index 0fad1009f315..428a6f4b9ebc 100644
> --- a/drivers/clk/at91/at91rm9200.c
> +++ b/drivers/clk/at91/at91rm9200.c
> @@ -215,5 +215,4 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
>   * deferring properly. Once this is fixed, this can be switched to a platform
>   * driver.
>   */
> -CLK_OF_DECLARE_DRIVER(at91rm9200_pmc, "atmel,at91rm9200-pmc",
> -                     at91rm9200_pmc_setup);
> +CLK_OF_DECLARE(at91rm9200_pmc, "atmel,at91rm9200-pmc", at91rm9200_pmc_setup);
> diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
> index ceb5495f723a..b29843bea278 100644
> --- a/drivers/clk/at91/at91sam9260.c
> +++ b/drivers/clk/at91/at91sam9260.c
> @@ -491,26 +491,26 @@ static void __init at91sam9260_pmc_setup(struct device_node *np)
>  {
>         at91sam926x_pmc_setup(np, &at91sam9260_data);
>  }
> -CLK_OF_DECLARE_DRIVER(at91sam9260_pmc, "atmel,at91sam9260-pmc",
> -                     at91sam9260_pmc_setup);
> +
> +CLK_OF_DECLARE(at91sam9260_pmc, "atmel,at91sam9260-pmc", at91sam9260_pmc_setup);
>
>  static void __init at91sam9261_pmc_setup(struct device_node *np)
>  {
>         at91sam926x_pmc_setup(np, &at91sam9261_data);
>  }
> -CLK_OF_DECLARE_DRIVER(at91sam9261_pmc, "atmel,at91sam9261-pmc",
> -                     at91sam9261_pmc_setup);
> +
> +CLK_OF_DECLARE(at91sam9261_pmc, "atmel,at91sam9261-pmc", at91sam9261_pmc_setup);
>
>  static void __init at91sam9263_pmc_setup(struct device_node *np)
>  {
>         at91sam926x_pmc_setup(np, &at91sam9263_data);
>  }
> -CLK_OF_DECLARE_DRIVER(at91sam9263_pmc, "atmel,at91sam9263-pmc",
> -                     at91sam9263_pmc_setup);
> +
> +CLK_OF_DECLARE(at91sam9263_pmc, "atmel,at91sam9263-pmc", at91sam9263_pmc_setup);
>
>  static void __init at91sam9g20_pmc_setup(struct device_node *np)
>  {
>         at91sam926x_pmc_setup(np, &at91sam9g20_data);
>  }
> -CLK_OF_DECLARE_DRIVER(at91sam9g20_pmc, "atmel,at91sam9g20-pmc",
> -                     at91sam9g20_pmc_setup);
> +
> +CLK_OF_DECLARE(at91sam9g20_pmc, "atmel,at91sam9g20-pmc", at91sam9g20_pmc_setup);
> diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
> index 0214333dedd3..15da0dfe3ef2 100644
> --- a/drivers/clk/at91/at91sam9g45.c
> +++ b/drivers/clk/at91/at91sam9g45.c
> @@ -228,5 +228,4 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
>   * The TCB is used as the clocksource so its clock is needed early. This means
>   * this can't be a platform driver.
>   */
> -CLK_OF_DECLARE_DRIVER(at91sam9g45_pmc, "atmel,at91sam9g45-pmc",
> -                     at91sam9g45_pmc_setup);
> +CLK_OF_DECLARE(at91sam9g45_pmc, "atmel,at91sam9g45-pmc", at91sam9g45_pmc_setup);
> diff --git a/drivers/clk/at91/at91sam9n12.c b/drivers/clk/at91/at91sam9n12.c
> index f9db5316a7f1..7fe435f4b46b 100644
> --- a/drivers/clk/at91/at91sam9n12.c
> +++ b/drivers/clk/at91/at91sam9n12.c
> @@ -255,5 +255,4 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
>   * The TCB is used as the clocksource so its clock is needed early. This means
>   * this can't be a platform driver.
>   */
> -CLK_OF_DECLARE_DRIVER(at91sam9n12_pmc, "atmel,at91sam9n12-pmc",
> -                     at91sam9n12_pmc_setup);
> +CLK_OF_DECLARE(at91sam9n12_pmc, "atmel,at91sam9n12-pmc", at91sam9n12_pmc_setup);
> diff --git a/drivers/clk/at91/at91sam9rl.c b/drivers/clk/at91/at91sam9rl.c
> index 66736e03cfef..ecbabf5162bd 100644
> --- a/drivers/clk/at91/at91sam9rl.c
> +++ b/drivers/clk/at91/at91sam9rl.c
> @@ -186,4 +186,5 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
>  err_free:
>         kfree(at91sam9rl_pmc);
>  }
> -CLK_OF_DECLARE_DRIVER(at91sam9rl_pmc, "atmel,at91sam9rl-pmc", at91sam9rl_pmc_setup);
> +
> +CLK_OF_DECLARE(at91sam9rl_pmc, "atmel,at91sam9rl-pmc", at91sam9rl_pmc_setup);
> diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
> index 79b9d3667228..5cce48c64ea2 100644
> --- a/drivers/clk/at91/at91sam9x5.c
> +++ b/drivers/clk/at91/at91sam9x5.c
> @@ -302,33 +302,33 @@ static void __init at91sam9g15_pmc_setup(struct device_node *np)
>  {
>         at91sam9x5_pmc_setup(np, at91sam9g15_periphck, true);
>  }
> -CLK_OF_DECLARE_DRIVER(at91sam9g15_pmc, "atmel,at91sam9g15-pmc",
> -                     at91sam9g15_pmc_setup);
> +
> +CLK_OF_DECLARE(at91sam9g15_pmc, "atmel,at91sam9g15-pmc", at91sam9g15_pmc_setup);
>
>  static void __init at91sam9g25_pmc_setup(struct device_node *np)
>  {
>         at91sam9x5_pmc_setup(np, at91sam9g25_periphck, false);
>  }
> -CLK_OF_DECLARE_DRIVER(at91sam9g25_pmc, "atmel,at91sam9g25-pmc",
> -                     at91sam9g25_pmc_setup);
> +
> +CLK_OF_DECLARE(at91sam9g25_pmc, "atmel,at91sam9g25-pmc", at91sam9g25_pmc_setup);
>
>  static void __init at91sam9g35_pmc_setup(struct device_node *np)
>  {
>         at91sam9x5_pmc_setup(np, at91sam9g35_periphck, true);
>  }
> -CLK_OF_DECLARE_DRIVER(at91sam9g35_pmc, "atmel,at91sam9g35-pmc",
> -                     at91sam9g35_pmc_setup);
> +
> +CLK_OF_DECLARE(at91sam9g35_pmc, "atmel,at91sam9g35-pmc", at91sam9g35_pmc_setup);
>
>  static void __init at91sam9x25_pmc_setup(struct device_node *np)
>  {
>         at91sam9x5_pmc_setup(np, at91sam9x25_periphck, false);
>  }
> -CLK_OF_DECLARE_DRIVER(at91sam9x25_pmc, "atmel,at91sam9x25-pmc",
> -                     at91sam9x25_pmc_setup);
> +
> +CLK_OF_DECLARE(at91sam9x25_pmc, "atmel,at91sam9x25-pmc", at91sam9x25_pmc_setup);
>
>  static void __init at91sam9x35_pmc_setup(struct device_node *np)
>  {
>         at91sam9x5_pmc_setup(np, at91sam9x35_periphck, true);
>  }
> -CLK_OF_DECLARE_DRIVER(at91sam9x35_pmc, "atmel,at91sam9x35-pmc",
> -                     at91sam9x35_pmc_setup);
> +
> +CLK_OF_DECLARE(at91sam9x35_pmc, "atmel,at91sam9x35-pmc", at91sam9x35_pmc_setup);
> diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
> index 9a5cbc7cd55a..3d1f78176c3e 100644
> --- a/drivers/clk/at91/sama5d2.c
> +++ b/drivers/clk/at91/sama5d2.c
> @@ -372,4 +372,5 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>  err_free:
>         kfree(sama5d2_pmc);
>  }
> -CLK_OF_DECLARE_DRIVER(sama5d2_pmc, "atmel,sama5d2-pmc", sama5d2_pmc_setup);
> +
> +CLK_OF_DECLARE(sama5d2_pmc, "atmel,sama5d2-pmc", sama5d2_pmc_setup);
> diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
> index 87009ee8effc..d376257807d2 100644
> --- a/drivers/clk/at91/sama5d3.c
> +++ b/drivers/clk/at91/sama5d3.c
> @@ -255,4 +255,4 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
>   * The TCB is used as the clocksource so its clock is needed early. This means
>   * this can't be a platform driver.
>   */
> -CLK_OF_DECLARE_DRIVER(sama5d3_pmc, "atmel,sama5d3-pmc", sama5d3_pmc_setup);
> +CLK_OF_DECLARE(sama5d3_pmc, "atmel,sama5d3-pmc", sama5d3_pmc_setup);
> diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
> index 57fff790188b..5cbaac68da44 100644
> --- a/drivers/clk/at91/sama5d4.c
> +++ b/drivers/clk/at91/sama5d4.c
> @@ -286,4 +286,5 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
>  err_free:
>         kfree(sama5d4_pmc);
>  }
> -CLK_OF_DECLARE_DRIVER(sama5d4_pmc, "atmel,sama5d4-pmc", sama5d4_pmc_setup);
> +
> +CLK_OF_DECLARE(sama5d4_pmc, "atmel,sama5d4-pmc", sama5d4_pmc_setup);
> --
