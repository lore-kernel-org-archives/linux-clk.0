Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCEEC433EF
	for <linux-clk@archiver.kernel.org>; Sat,  7 May 2022 12:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233394AbiEGMlW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 7 May 2022 08:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384788AbiEGMlU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 7 May 2022 08:41:20 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7D546147
        for <linux-clk@vger.kernel.org>; Sat,  7 May 2022 05:37:32 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id y76so17240015ybe.1
        for <linux-clk@vger.kernel.org>; Sat, 07 May 2022 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JUhgclDR3XBkbKooh+LIAZ5rgGQDmCxwnx2kPnqoYMA=;
        b=KCyiITVKgMi69PaUxMUe8kgt1g0I/YT1BNqXQ8g8jDYzoI10RIuW4XJdIAw+WABgPz
         sIoqAXB0wg2Fv4K4xa+UIk01I93aMUAh5zwWez9Y9woJgUGlFSInLIx46fZ5Gg1s601e
         a5i4HOw7TQkJg5Maw+WvNt0vTtgrsC6dMYDUfidiIqwE2Susa4bkzpuGE1IWxOsZTINs
         CB1T7vFcyxbamcJuoqj4cYj6aPJPj79FjZ60m16yN0qOI1to8EcKMqSlW8ohYQOIT3XX
         Y47JhHbhAM6byKlmpEHLlDWi3VANQBbeKYdvgbjI2HE4GR8wATeJNEQhXZFHSEQQgNal
         1RtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JUhgclDR3XBkbKooh+LIAZ5rgGQDmCxwnx2kPnqoYMA=;
        b=p9BE4Tar0q9DrSEhDqpvtkJZdlT/VPouq4l17gr2EEH+i8BCdnQWhChrtF2I0dPzUA
         EVzYqhLtAzlNYX1tIcmYcqfXNblb3X+cKURKn/HpwIHeF9ykikbnF8YjmC/b8sWZSoEM
         18Oq6LnVsnXFReKPo5l7E5z5Ct5LfGJ7+KzPzHeNjv3U80Nbc+MkjMKix6tJLoofwAKE
         0d6X57GL0dQK/zJjIBhHZQTZXfaD4SNoH/tUA3Y857gXbPXa1Rl+noJHAV1tSdhlRnXh
         42/fK6iIbaYTB29wDLW8m2sebdvbW1zLnnyigdm6fm0O2YxIyNWxkboGc79KiTo95t0G
         kcCw==
X-Gm-Message-State: AOAM533bjoykKMk9JX9heDt5vnG+2E9ka+g7E0O8E6A91x0NhyJuvRnS
        sFcpahZBCJTzfh7j6sZJqloNVs4FlB71eCu2bPp8Cg==
X-Google-Smtp-Source: ABdhPJzwJpXEUtAZEUc6bZUPoenoZ5sebSG72if0MOZ/TMe4dt5l953VkaeLr4GysoaOw6EpMxKFJUOEIy1GTdxXArc=
X-Received: by 2002:a25:e684:0:b0:645:d429:78e9 with SMTP id
 d126-20020a25e684000000b00645d42978e9mr6256768ybh.369.1651927052069; Sat, 07
 May 2022 05:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org> <20220419163810.2118169-41-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-41-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 7 May 2022 14:37:20 +0200
Message-ID: <CACRpkdbHGXfAKiN1sNTrLzRd5Qk-jerhcfvDo8FG=Zq94Dv19g@mail.gmail.com>
Subject: Re: [PATCH 40/48] ARM: pxa: tosa: use gpio lookup for battery
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
        alsa-devel@alsa-project.org, Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Apr 19, 2022 at 6:44 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The battery driver uses a lot of GPIO lines, hardcoded from a
> machine header file.
>
> Change it to use a gpiod lookup table instead.
>
> Reviewed-by: Sebastian Reichel <sre@kernel.org>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Oh, I've been iterating a patch for the Tosa charging code
going down in MFD ans ASoC and all:
https://lore.kernel.org/linux-arm-kernel/20220125003741.492954-1-linus.walleij@linaro.org/

I just rebased this on v5.18-rc1 and resent with collected ACKs.

Please take a look at it, and see if you rather take that patch,
at some point I realized I had to go pretty deep around the
legacy code in different subsystems because the MFD device
us spawning a GPIO chip...

Yours,
Linus Walleij
