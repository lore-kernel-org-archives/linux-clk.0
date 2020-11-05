Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88606C4741F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 09:09:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F8A52073A
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 09:09:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gnCWxb3A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730126AbgKEJJL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 04:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726787AbgKEJJK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 04:09:10 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D996C0613D2
        for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2020 01:09:08 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id t11so703112edj.13
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2020 01:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DAVVTcqOtshkqa//jG0tMqJnAZn8lkJ/jC3ZQlpD4iI=;
        b=gnCWxb3A2YT1XunheHSuiLH9SajfLtYxFoSSt/SMRqAjsx1al/ZDjdmGmdcaRCgATD
         VjIP7kiSbjNExGEXiLiKkUKac6IoHWJ/Fimd03ck22Y3TV8a4rMz01X4WGQkmlH9oyFA
         9esubFwVfP/2m1vKPl5C03O/MKjH3usvIu/M/u1jCtkmZsVaRlPUI4GOMG2G25yqE1WE
         FkwCiZzuIp80ijwg2sDMrq/aDxArFsCDn2GSr7ejg4GkjzXoXRmPg7sE+KMD8rfx5UT2
         P0rDV2vx/4uXjrJDE1VHH5s96ArZURV9t0QiVse/pLv22O/+my2jfZQspbaaigUdqAgS
         xSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DAVVTcqOtshkqa//jG0tMqJnAZn8lkJ/jC3ZQlpD4iI=;
        b=tyv61tPc0PNNE3VcIqS+mPKMV9okE0/0G2MU4osuLnuPJXsdQieNKgW81xYHN56YV3
         c+L3ko9Lglt0SFD2hAgoOZdwGwPXE9EuLeZn0u43Tjh21qM8qwXKGpYv3pi5Loc2bvxA
         DBgeNtk4VnIIwUy5VlJYQjVnTdfPMCfuI+qgUN+um+nCfmlmbTHNjF/Cv9aJZxGB3OTb
         4LgjXw60EwVkdOJ+hPfZ7PLSd5kvbvQFE9kNNVCGtxCHsQQhMWul35iVp8AR8FFE+FDX
         ig0nAiZykMrbjlqmHePEJanRbcHVJTxatLCZLEqgK/z95Y5JMpZYo1NX77Elk2eas43F
         qvmQ==
X-Gm-Message-State: AOAM531NxnQzJS/XfDEW3jhRs9K7gdlOYSQyR3yCDAxhXwmtTI0ymEkr
        H0pqDQft1s8ubGArasABzXJ7xO1GIItYYsrlNDCdpg==
X-Google-Smtp-Source: ABdhPJyqANWyJ3aSTbJtEhMCIaR58Dz9yl2OLSrIAItWEawq6opjRvdm8/eux/hxk+LAgMAS7EPN7dAVW7T2X8+w+iU=
X-Received: by 2002:a05:6402:283:: with SMTP id l3mr1593849edv.232.1604567347374;
 Thu, 05 Nov 2020 01:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20201104103938.1286-1-nsaenzjulienne@suse.de> <20201104103938.1286-4-nsaenzjulienne@suse.de>
In-Reply-To: <20201104103938.1286-4-nsaenzjulienne@suse.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 5 Nov 2020 10:08:56 +0100
Message-ID: <CAMpxmJWv3nfD2xpS4jEq+vJvr=+cD7BV3AFDnsRjCG5qB60c-A@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] gpio: raspberrypi-exp: Release firmware handle
 on unbind
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-pwm@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-devicetree <devicetree@vger.kernel.org>, wahrenst@gmx.net,
        Linux Input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-rpi-kernel@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 4, 2020 at 11:39 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Use devm_rpi_firmware_get() so as to make sure we release RPi's firmware
> interface when unbinding the device.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>
> ---
>
> Changes since v2:
>  - Use devm_rpi_firmware_get(), instead of remove function
>
>  drivers/gpio/gpio-raspberrypi-exp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-raspberrypi-exp.c
> index bb100e0124e6..64a552ecc2ad 100644
> --- a/drivers/gpio/gpio-raspberrypi-exp.c
> +++ b/drivers/gpio/gpio-raspberrypi-exp.c
> @@ -208,7 +208,7 @@ static int rpi_exp_gpio_probe(struct platform_device *pdev)
>                 return -ENOENT;
>         }
>
> -       fw = rpi_firmware_get(fw_node);
> +       fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
>         of_node_put(fw_node);
>         if (!fw)
>                 return -EPROBE_DEFER;
> --
> 2.29.1
>

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
