Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC39C433ED
	for <linux-clk@archiver.kernel.org>; Tue, 11 May 2021 07:58:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AEC061400
	for <linux-clk@archiver.kernel.org>; Tue, 11 May 2021 07:58:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhEKH71 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 May 2021 03:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbhEKH70 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 May 2021 03:59:26 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564E7C06175F
        for <linux-clk@vger.kernel.org>; Tue, 11 May 2021 00:58:19 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id d30so6059055uae.13
        for <linux-clk@vger.kernel.org>; Tue, 11 May 2021 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PWykHEF/p6NwGSHpfqdT0ahXeKs26eIMYauFhcuYvYs=;
        b=X4NGL3EXhHONloTO2d8GpmmbopovhciNQUA0iaEVqjrszgS+cbhwdBnLKF8OUVer7J
         HVQA1aDGYRqlFctzvyxEzFm2+r5RcWejJaZLavQapvWisFZ8GcDu+7Aomj3cHv5oombr
         bUUAxTdXwa20QyFrTn6wkuxXPlWEaiU8ZaFGkTmGkH531RpWkdFgKVlhRpWxoF+yh0T+
         RJ72JKiFqdyPnYOMEd/JKpVo8O7OBHmogyRXTrp+XYtm5iLAyY8X7pqdihBgfI6N/9TX
         ZtS8z9kdk6dAyxq0D8KeDKAEXjzVZOgQgR7gNJwG0PIwjnCrm8yh4qfnK+7Un15UqM7B
         wpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PWykHEF/p6NwGSHpfqdT0ahXeKs26eIMYauFhcuYvYs=;
        b=E2hiy7sXiOTl0WoFgYDJCq5eof2RmB76K1kUhS/5QrxtZW19YARxKOx8v6+OuvmlYh
         GOVaPLgSZ8rshcVM15rF+0J50ErtUbFmABBrGrXAgHJJ/TzbnGyVl6ne0UboLdbPOUPf
         lFF1q12Ch332COlWIFt6LwSP/OMqmP9urqq9R8gYpZg24B4SmAEtgvoSi71fB8lOLVvH
         joE2JglioGYLUacjGpXj3X72a4of4sFFsgVkP7l7/rhtsnW8vk735wgsn1u4PBFt6CTf
         eOqetcKvqUQEvzKnr0ljc2mNt6uB8jqT2oU3tv0YTguExXdKbFN3MJfIt45pf8mz8eqq
         i3Vw==
X-Gm-Message-State: AOAM531acgDIsbMp8DSjQuwBtma8mEModzZKp+vjOkqrXNt6oXSMSrmh
        ePlBQI9Jz2bBD1Cs1exmNOXGzynmQRTMjZqNzWYhn3MLEw3MDw==
X-Google-Smtp-Source: ABdhPJz1qn4vWXTypydfHbwRxov7+bqFPgxM3p17wb2yl0rDv8dYJmGDgoEb0YxK/aVVVkQjMptfvyFwRPAm2ggPW9o=
X-Received: by 2002:ab0:260b:: with SMTP id c11mr24557170uao.42.1620719898512;
 Tue, 11 May 2021 00:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210510174142.986250-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210510174142.986250-1-u.kleine-koenig@pengutronix.de>
From:   Alexandru Ardelean <aardelean@deviqon.com>
Date:   Tue, 11 May 2021 10:58:07 +0300
Message-ID: <CAASAkoZroYcCTa6A0PtNsBe-rRJrNzaa+qiO4YpNZoVMrTaYHQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] clk: provide new devm helpers for prepared and
 enabled clocks
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        kernel@pengutronix.de,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        linux-spi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 10 May 2021 at 20:41, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> compared to v6 I rebased to v5.13-rc1 (which resulted in a conflict in
> the pwm-atmel patch), reformated the doc comments in patch 2 (as
> suggested by Jonathan Cameron) and added the two Reviewed-by tags for
> Jonathan Cameron.

This will definitely cleanup a lot of boiler-plate code for probe()/remove(=
).
What I'm noticing, is that some remove hooks [in the drivers in this
series] are being slightly re-ordered;
i.e. the clk_disable/unprepare may happen in a slightly different
order, but it doesn't look like those would be problematic.

So, for the series:
Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>

Thanks
Alex

>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (6):
>   clk: generalize devm_clk_get() a bit
>   clk: Provide new devm_clk_helpers for prepared and enabled clocks
>   pwm: atmel: Simplify using devm_clk_get_prepared()
>   rtc: at91sam9: Simplify using devm_clk_get_enabled()
>   i2c: imx: Simplify using devm_clk_get_enabled()
>   spi: davinci: Simplify using devm_clk_get_enabled()
>
>  drivers/clk/clk-devres.c     | 96 ++++++++++++++++++++++++++++++------
>  drivers/i2c/busses/i2c-imx.c | 12 +----
>  drivers/pwm/pwm-atmel.c      | 15 +-----
>  drivers/rtc/rtc-at91sam9.c   | 22 ++-------
>  drivers/spi/spi-davinci.c    | 11 +----
>  include/linux/clk.h          | 90 ++++++++++++++++++++++++++++++++-
>  6 files changed, 179 insertions(+), 67 deletions(-)
>
>
> base-commit: 6efb943b8616ec53a5e444193dccf1af9ad627b5
> --
> 2.30.2
>
