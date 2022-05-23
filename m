Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74BBC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 23 May 2022 10:49:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234283AbiEWKtq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 May 2022 06:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234300AbiEWKtp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 06:49:45 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1392E4CD55
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 03:49:43 -0700 (PDT)
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M2gt5-1nrAXl1qU3-004EAy; Mon, 23 May 2022 12:44:34 +0200
Received: by mail-yb1-f172.google.com with SMTP id v71so24625779ybi.4;
        Mon, 23 May 2022 03:44:33 -0700 (PDT)
X-Gm-Message-State: AOAM530qeCxaHCmTmie4hv7Wx8oD2I4W6nmutjXgFkxho8NzdLnMdAjk
        LrMYbxgRZCF4bwL8p6q5muFE7gCnVGMfCCzTnEk=
X-Google-Smtp-Source: ABdhPJzbbTU7bxyEy+V6QZ7ro2Wti/wri258NXrp2iXt1Owp7jIbpPdzCSwsk8vjZl8l7XWvxC1S+1Cf8oUw+fAt8d0=
X-Received: by 2002:a81:6283:0:b0:2ff:2443:6f3c with SMTP id
 w125-20020a816283000000b002ff24436f3cmr22577090ywb.135.1653302662526; Mon, 23
 May 2022 03:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-13-tmaimon77@gmail.com>
In-Reply-To: <20220522155046.260146-13-tmaimon77@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 23 May 2022 12:44:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0PKvqpTjNeKUm6EnxpmJAtmk1jv+b4YXxr+fXFpsWXtw@mail.gmail.com>
Message-ID: <CAK8P3a0PKvqpTjNeKUm6EnxpmJAtmk1jv+b4YXxr+fXFpsWXtw@mail.gmail.com>
Subject: Re: [PATCH v1 12/19] reset: npcm: Add NPCM8XX support
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        gregkh <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Jiri Slaby <jirislaby@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        robert.hancock@calian.com,
        "nathan=20Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>,
        Lubomir Rintel <lkundrak@v3.sk>, SoC Team <soc@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:YHq8xzHHHcsfvYjSzSq+E07jIVbAebTZh9CDYUzTJWXfz/CNC4d
 DH5SoIfeUq+NJ0Nc8rFHY/R3FL/QCnVF1C9T2g2LIt3h7UY5J4dV1QADFb/h19lg4+G/mrl
 ru20c2th0IR3ckojIyJXvf17QEBdoGmeSS9umxMJsalQdaVTJpPNusRaXfENjA+29+RBrAc
 A/eMxpOhu6DPI5EC1lONg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:N0iuJGFrog4=:/VRLoTq7PxAYLeOfhO5SI4
 oDU/qxUk2vsA3lxYxlgCT9f3z2Y/OJR6iDM56BKPJeN+0mYwL/c9aq1uur+h877kqsucyP0tu
 n0al99BaM4jti/zVedWJX08Ih1M+EBisrk8A03idRCRVdjpvd65DL11kG46OJ/poljDS/onY/
 R8xlF9nUG46suwuyTPSOJPtVtV8FZ/fjMJJUoadWCcfGHUIKPr6C+PbE9+MoCQefZ5+Zq/hZo
 n7TvRrrIfIpk7RKix32HOvk1bfqnZX5rPwsJwmhZtaG35+PRUTVJmfoh75HcqcG0mu3kVJo2I
 40SBgOso8PbVJaGPRY5OFCLkeuL/5S+/l+A1AlrMl+KSwYHDB8yK5DqMLjHyskSH+6JxtoqcH
 /SV6BfCt2NBhwqZsJhS4JmneduUTmT2MOFzbfUJa5pUPXFSTTvfIVZqFZIramZwVI1BO9gHkE
 Ry7EztR0dwplV6MAyDAS0/TdLGZzFWIfihbKgX+1r8PVR7VqVrJ9BoLbKvfm03wx7Ja5MGDLO
 2SeD2pwHLENnSzcr4BGnoBliwZNxbtF4kMjYnhKQhrxsaLb8HjYuYcbkpjgHwKciRZtWLnK+d
 kC5DF3NGPHZw/8+fC/u6tii9KWweS6FbFotQsJAqA40Oo07oRAlWasozY7GIt3TCSpb8VnU8w
 fBlAxFI6DToPcvlHFJacdgN+b60tKBnVsUGj3OB2sC/PEtoQp+48yuMnhAnBbieR0te/aDQ5A
 va2lNCWJ7mipRdLnxhaSQFKAUioDinfo4b1lzU4cJDk117x2KLnNJBAUIIxjUt6P6naF4gaOc
 gH4gKoSb2rg5AUscVQ2LFUD3SvBEKuwjADk/gvgPuwIN5yVP9e47HhU00fahFyE06HIM/OmbT
 D5zHMS92vtuEByPU29R6XVKH/yrhNQuvLgKx225uc=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, May 22, 2022 at 5:50 PM Tomer Maimon <tmaimon77@gmail.com> wrote:

>  static const struct of_device_id npcm_rc_match[] = {
>         { .compatible = "nuvoton,npcm750-reset"},
> +       { .compatible = "nuvoton,npcm845-reset"},
>         { }
>  };
> +/*
> + *  The following procedure should be observed in USB PHY, USB device and
> + *  USB host initialization at BMC boot
> + */
> +static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       struct device *dev = &pdev->dev;
> +
> +       rc->gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> +       if (IS_ERR(rc->gcr_regmap)) {
> +               dev_err(&pdev->dev, "Failed to find gcr syscon");
> +               return PTR_ERR(rc->gcr_regmap);
> +       }
> +
> +       if (of_device_is_compatible(np, "nuvoton,npcm750-reset"))
> +               npcm_usb_reset_npcm7xx(rc);
> +       else if (of_device_is_compatible(np, "nuvoton,npcm845-reset"))
> +               npcm_usb_reset_npcm8xx(rc);
> +       else
> +               return -ENODEV;
>

In place of the string comparison in of_device_is_compatible(), maybe just use
the .data field of the of_device_id structure to point to the actual
reset function.

Alternatively, register two separate platform_driver instances here and
use separate probe functions that do the soc specific bits and call into
shared functions for the bits that are the same.

       Arnd
