Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54168C433EF
	for <linux-clk@archiver.kernel.org>; Sun,  1 May 2022 21:42:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355517AbiEAVpr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 1 May 2022 17:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355387AbiEAVpp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 1 May 2022 17:45:45 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12A87673
        for <linux-clk@vger.kernel.org>; Sun,  1 May 2022 14:42:17 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2f7c424c66cso131952057b3.1
        for <linux-clk@vger.kernel.org>; Sun, 01 May 2022 14:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MwcGhzUMzuQB5fGeykDG23vjACySyYiqBWBdUcZ2GFk=;
        b=GsyTsXTnDN4CY7AA1wrUQT+Y1CVIulHFr4oTp0Tg20CKmvaI7383RxQl+UgGOv+N+2
         7ou2YNXArVG+yi2/xmhm3RwrSr3D5kp2Qgn4DGjh7X2FOJT6wCnWESaCleX/OA9RyV1j
         bwVae0byfjRjtxi5dpkNZn4RfOZ4A1Dd5ugrXFBMXK6tcItRBG80t8J5dKLVZDkoSscm
         wLvaYka4x9i1J8J19EMXqtisuJV8Y/+IS/CbNSohuvWMsp4QiDVXj73xIQP7ss5xnIhF
         n2lEDjG6braJDzS8nQh1+rl3rM6D4gPTo91/XI5EArn82a4AseinskiVs5gU1UTGg9+F
         pAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MwcGhzUMzuQB5fGeykDG23vjACySyYiqBWBdUcZ2GFk=;
        b=nSnP28/5uanUKxdUEgTorNbygbF9snbJObJoTOZ4sEcbrO7+5UIX7skzg2kcSBUoxp
         SfhUfJVbd5uxcIhn7VAFVXNvgCMKOK56Ne4maLP4QAEAUoa4/QyylFV/ypGtJNh9WZHW
         1mmKbYaa8X78idqU3DTR6Ob2L37Css+zEnhPVTkWd0A4Fl3GuXy/sN6xbitY6nsDF57x
         2W/bldbOCkVk14KAJNgVKOxnlDocPIQviyIStTD5mfEP5JNTJaG+uzV3p3vq0Jpz2Md8
         NTG8DJEC0bsxnLoeYoFjo9qNQxlrIERDlWZw6yzOsas4xXXJyK2lEjicqGqcY+eriPxM
         +DOg==
X-Gm-Message-State: AOAM532xO3c3p5bBz3PhY6BKOOfdgoFNZawW53MPcbhpQuhfiX6NEzgJ
        cImloZr7YcozKauWs0j/4J7P7RE+rpkej+ygNzNokg==
X-Google-Smtp-Source: ABdhPJweSDfNcHOc9BYhAdVgxvU92j70ljyyRr/zhBZuYvLYJv5UF4MYF8uqkqj6NhL3p2ezG4XOpBAT8/G/pJAvCNA=
X-Received: by 2002:a81:2108:0:b0:2f5:6938:b2b8 with SMTP id
 h8-20020a812108000000b002f56938b2b8mr9549829ywh.151.1651441337159; Sun, 01
 May 2022 14:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org> <20220419163810.2118169-21-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-21-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 1 May 2022 23:42:05 +0200
Message-ID: <CACRpkdY3krNDWcGznSB5fNGM9NXw6xA2qWduDidS1KNM-hbynQ@mail.gmail.com>
Subject: Re: [PATCH 20/48] ARM: pxa: spitz: use gpio descriptors for audio
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Paul Parsons <lost.distance@yahoo.com>,
        Tomas Cech <sleep_walker@suse.com>,
        Sergey Lapin <slapin@ossfans.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Apr 19, 2022 at 6:41 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The audio driver should not use a hardwired gpio number
> from the header. Change it to use a lookup table.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
