Return-Path: <SRS0=U0T3=7A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1C6C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 18 May 2020 07:29:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDDDF20826
	for <linux-clk@archiver.kernel.org>; Mon, 18 May 2020 07:29:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdzqRAP4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgERH3y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 May 2020 03:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgERH3y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 May 2020 03:29:54 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2AFEC061A0C
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2020 00:29:53 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id d22so7097602lfm.11
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2020 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0QQj8C5JeEmDZ6ZApGtOW1NT9hev78BCGty9WyW8HQU=;
        b=KdzqRAP43Jx15JsBd7CMIo/2/+5tguTprPLSwNIyfoZQ0+ufPuN6S/BANnhJsjrhDD
         DtP3v+cVRz1H4W7gZemFOLYygUe9Nnqc8CiVseZ1qH7MkopzW0uYIM/6QDifbVQUaEzY
         I9Io5hrtK55gyaPukpP3UulY28GmqBr7704IEqyzsek9z5cWKXKh+nj6/8N35gBEzKLB
         z7UbsMop5bQJkCqzM/P6qv2TYsuzenpxX9AvppK/Ewkg0FlUbL6cOIGLnAWxK13GtB1K
         pL1FPAWkCnhD9H5FlvEDJp4hPMXkM7uAmjEi0J/HlDU7NpDvA7JOV3+ynsGeu4wzmRsg
         XxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0QQj8C5JeEmDZ6ZApGtOW1NT9hev78BCGty9WyW8HQU=;
        b=NzKlLLcDqeRPni4w9xXpLOz+epuShC0gJwsr6FlZUGzW0Wx4YdaaH/Z9yKY12QHKFH
         Oh4Elwwgtk8nveHH2y1nEEbyEjbPw5xNWP95gS8O5C9pTbZAVykAPzHlfjTFafwTrTUG
         5TGPvUVlOP6m3InXEdrvx0+DfsNUw/YsyVT7fxr7MeQR7PUyMos3fBNwXOhYn0Xhnw8t
         p+po92vAJ5RgebTBlFK6SNKXdIt2GBL6Dl4cssPqqTWpdWO4J1F26ux1GhtwxKt/FSgd
         Q3nl5rum/ko+LXR+BzsAW2QYh+Jhng1gyZ+w6y1ETeeO/noH/MTPkH0G1eURgKx5wJe4
         VwAA==
X-Gm-Message-State: AOAM531CNcRLbzBnn0hE8uiCeKheymLEh+mrHD0u8GcAMsop+1UpATxD
        70cTE2Whm06AQlPglW9IYPYb0x1VWNP5jlAmXzj44Q==
X-Google-Smtp-Source: ABdhPJx6fCXx6eAlYEP7owDMWFfg7cz4sOJv/yQfCTAhywTwMqJW95DyJ7NsllwioD8AhEiAVzPb9dcty/D6ToHML3U=
X-Received: by 2002:a19:c8cb:: with SMTP id y194mr7741076lff.89.1589786992310;
 Mon, 18 May 2020 00:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-2-lars.povlsen@microchip.com>
In-Reply-To: <20200513125532.24585-2-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:29:41 +0200
Message-ID: <CACRpkdZF++0AExBvDHNT+whKP2sNKnbczV4w9SXksG2Dyctecw@mail.gmail.com>
Subject: Re: [PATCH 01/14] pinctrl: ocelot: Should register GPIO's even if not
 irq controller
To:     Lars Povlsen <lars.povlsen@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 13, 2020 at 2:56 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> This fixes the situation where the GPIO controller is not used as an
> interrupt controller as well.
>
> Previously, the driver would silently fail to register even the
> GPIO's. With this change, the driver will only register as an
> interrupt controller if a parent interrupt is provided.
>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
