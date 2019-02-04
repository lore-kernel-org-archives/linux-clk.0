Return-Path: <SRS0=RWSH=QL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BBAC282C4
	for <linux-clk@archiver.kernel.org>; Mon,  4 Feb 2019 11:25:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF2E020815
	for <linux-clk@archiver.kernel.org>; Mon,  4 Feb 2019 11:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="OyoJQUVl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbfBDLZ4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Feb 2019 06:25:56 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41061 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728030AbfBDLZ4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Feb 2019 06:25:56 -0500
Received: by mail-lj1-f196.google.com with SMTP id k15-v6so11217971ljc.8
        for <linux-clk@vger.kernel.org>; Mon, 04 Feb 2019 03:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wRYfuP7oYobYTBvy6aIr+v9XulGm0xPZTNCq3iUqj+k=;
        b=OyoJQUVlHhFQSKp34oawUzjkkJD20j0DGfRc8AUsiwOh6L47Iq47rbho1DAC6JojOK
         8mdMAyYBzAuUpKy5aCmpgsA/pGdfSIm2Bwhu8w0vxuDCrVE8Y6nyXLMFaGqgCVZLxapX
         z3iL1LeErLJ6w5QXPD21yv8wYjA1U8A4zy8Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wRYfuP7oYobYTBvy6aIr+v9XulGm0xPZTNCq3iUqj+k=;
        b=adbsD/sISn5MJsf6fOgmLvsihydgVXeZcKZsfyb8xl9KBYvVuNES6LLNGnPEcpzPBs
         zBlQFBrC2bvhy30IOK+Aje8HBSeOcHEKTI3HHvYzcJGp5lw4IDJli710dltD8ioPheWU
         rs+Lc9QvPtkkN/xE/vzws2C+elV3w/WZUsMb+X5GMkBqRc9FiV+3x9v8bELlWoloP1Dl
         Kg8LCwP2NngeRYnpZmOtZdWPNq3zm8gEZIx1lqd1L7l3ZXfgl/2rh24dXfvB98qf931D
         3QEMvSbrgreGGqJO1PpUm7q2nXxYF2ro/xJD9ZN/NDhnR4QhW4+Sf2boku0J5BIzbRdj
         yPig==
X-Gm-Message-State: AJcUukfK6IVLVXvwPI96t52PHadBB2XrgQGcxPFRP6lqsLmPkF47DXDz
        ejt5FPPpQG6CTG9OBfIhi4G9Q/Jf6U/2NsfLaNGXhg==
X-Google-Smtp-Source: ALg8bN7nx6sXITFyoPuFfw23CVvKBGmyEoL5ZFGpk6r4uHCrK3mNJtdnoravyOf/yoASu8/EqQzyBvCsgA2Xe1ImuZE=
X-Received: by 2002:a2e:9356:: with SMTP id m22-v6mr39242047ljh.135.1549279554049;
 Mon, 04 Feb 2019 03:25:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1548935790.git.matti.vaittinen@fi.rohmeurope.com> <127bd8d6765e35272ad174c59838d1374813c910.1548935790.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <127bd8d6765e35272ad174c59838d1374813c910.1548935790.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Feb 2019 12:25:41 +0100
Message-ID: <CACRpkdZOzacQ5Myb_wsHz5wUGvwQ1avhfY5gaR+3oqhNtArH-A@mail.gmail.com>
Subject: Re: [RFC PATCH v4 06/10] devicetree: bindings: Document first ROHM
 BD70528 bindings
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

On Thu, Jan 31, 2019 at 1:04 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> Document bindings for regulators (3 bucks, 3 LDOs and 2 LED
> drivers) and 4 GPIO pins which can be configured for I/O or
> as interrupt sources withe configurable trigger levels.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
(...)
> +Required properties:
> + - compatible          : Should be "rohm,bd70528"
> + - reg                 : I2C slave address.
> + - interrupts          : The interrupt line the device is connected to.
> + - interrupt-controller        : To indicate bd70528 acts as an interrupt controller.
> + - #interrupt-cells    : Should be 2. usage is compliant to the 2 cells
> +                         variant of ../interrupt-controller/interrupts.txt
> + - gpio-controller     : To indicate bd70528 acts as a gpio controller.
> + - #gpio-cells         : Should be 2. The first cell is the pin number and
> +                         the second cell is used to specify flags. See
> +                         ../gpio/gpio.txt for more information.
> + - #clock-cells                : Should be 0.
> + - regulators:         : List of child nodes that specify the regulators.
> +                         Please see ../regulator/rohm,bd70528-regulator.txt

So if I understand correctly, the clocks and GPIO does not spawn any
child nodes but are attached directly to the MFD node.
This works!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
