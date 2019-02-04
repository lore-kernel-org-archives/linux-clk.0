Return-Path: <SRS0=RWSH=QL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E6CC282C4
	for <linux-clk@archiver.kernel.org>; Mon,  4 Feb 2019 11:30:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7AF220815
	for <linux-clk@archiver.kernel.org>; Mon,  4 Feb 2019 11:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y0qLziCh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfBDLaI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Feb 2019 06:30:08 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36910 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728891AbfBDLaH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Feb 2019 06:30:07 -0500
Received: by mail-lj1-f195.google.com with SMTP id t18-v6so11259011ljd.4
        for <linux-clk@vger.kernel.org>; Mon, 04 Feb 2019 03:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=osuavLz7brC0DOEgHfP8LzflHiXxFdskXEGvDqpOG8s=;
        b=Y0qLziChpsM3r8H1BSfx7euAyCtU8/9iWn5+GyA7WAUkeWIN1wdilggaGPVaeBQHNV
         SqLKI7IxynjARG3qvzpHkfE+UlmhNJ7J+HoayHrEOVy3iCEJm5YgVAqoDve9RSjiI2BG
         waxPUywCHieJtFGrNb2x0e3YYvGPrHb0Yhepk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=osuavLz7brC0DOEgHfP8LzflHiXxFdskXEGvDqpOG8s=;
        b=hznnyTM45OeqQV3WzDVCKXhx7FUOzOpI6iU8VS49GrRJdrcrMxaw2ZYDqjDJauVB0a
         +8jiL1AC5Qlo01ReF2QthF6EZpve1Eq99aWR9p4zDeRtHCkyUp7kYfxCxKn2WxTLaH7Q
         UKfev1rlZ1LT6091i9V5+PkEKWOX16bD/M8EGjwoRVFHejUVWw3g0vZjd///9QnFKJVi
         mvj7S8ddnd6ctMsX79ygib71S86x6bJhMbyTBSxXQ2BiTqSaWX2bXPnS18XcBT+XMXgU
         YjrG3GRvx368GYeYhFG29KqatbahntcKmCU+UOKt4uEeGDEoIZ+IQUk25IE9ZJfFWyX7
         3l0Q==
X-Gm-Message-State: AJcUukfc2x4UK2y1wgRWJ8pRZJ2d5LsxFe2uyE9uYcoxZZNK7KKpK/Tz
        AsWhzIqLAqbmxny8BHAZbJu3jfY1GONYXSoGQqW7Lg==
X-Google-Smtp-Source: ALg8bN6ZEPDpA3midCV/lkK6P4Ws7/B22xJbpb9blLfJftSYD8D6/JVmm3Q+/3QkqXZPwPIyld6lE+RuRRu8r2Y8Vyg=
X-Received: by 2002:a2e:568d:: with SMTP id k13-v6mr42136476lje.105.1549279805224;
 Mon, 04 Feb 2019 03:30:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1548935790.git.matti.vaittinen@fi.rohmeurope.com> <5f63684b62c7a320c514088bcf9091ed7efbd2cc.1548935790.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <5f63684b62c7a320c514088bcf9091ed7efbd2cc.1548935790.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Feb 2019 12:29:53 +0100
Message-ID: <CACRpkdauoQ=qcFUi7wTUKu22ZHeq=g0grWqvZz1gfOt0=dXrbw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 07/10] gpio: Initial support for ROHM bd70528 GPIO block
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-rtc@vger.kernel.org,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 31, 2019 at 1:08 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> ROHM BD70528 PMIC has 4 GPIO pins. Allow them to be
> controlled by GPIO framework.
>
> IRQs are handled by regmap-irq and GPIO driver is not
> aware of the irq usage.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
(...)
> I dropped the review-by from Linus Walleij because I would like to
> get a comment on if locking is required when we check the direction
> in order to detect the correct register for getting the pin state.

I don't know that. You isn't regmap locking inherently?

> My initial feeling is that locking makes no sense.

Mine too.

> +       bdgpio->gpio.get_direction = &bd70528_get_direction;
> +       bdgpio->gpio.direction_input = &bd70528_direction_input;
> +       bdgpio->gpio.direction_output = &bd70528_direction_output;
> +       bdgpio->gpio.set_config = &bd70528_gpio_set_config;
> +       bdgpio->gpio.can_sleep = true;
> +       bdgpio->gpio.get = &bd70528_gpio_get;
> +       bdgpio->gpio.set = &bd70528_gpio_set;

Drop the &ampersand in from of the functions. All functions
are pointers.

With that:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
