Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:39564 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752431AbeC0NLK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Mar 2018 09:11:10 -0400
Received: by mail-io0-f195.google.com with SMTP id v13so27499854iob.6
        for <linux-clk@vger.kernel.org>; Tue, 27 Mar 2018 06:11:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180316140215.28663-5-icenowy@aosc.io>
References: <20180316140215.28663-1-icenowy@aosc.io> <20180316140215.28663-5-icenowy@aosc.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Mar 2018 15:11:09 +0200
Message-ID: <CACRpkdafFgRvFXwJ=5s5a_VmvUfJGC3na0zUdU95Dg5451X_0A@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] pinctrl: sunxi: add support for the Allwinner H6
 main pin controller
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Mar 16, 2018 at 3:02 PM, Icenowy Zheng <icenowy@aosc.io> wrote:

> The Allwinner H6 SoC has two pin controllers, one main controller
> (called CPUX-PORT in user manual) and one controller in CPUs power
> domain (called CPUS-PORT in user manual).
>
> This commit introduces support for the main pin controller on H6.
>
> The pin bank A and B are not wired out and hidden from the SoC's
> documents, however it's shown that the "ATE" (an AC200 chip
> co-packaged with the H6 die) is connected to the main SoC die via these
> pin banks. The information about these banks is just copied from the BSP
> pinctrl driver, but re-formatted to fit the mainline pinctrl driver
> format. The GPIO functions are dropped, as they're impossible to use --
> except a GPIO&IRQ only pin (PB20) which might be the IRQ of ATE.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Acked-by: Rob Herring <robh@kernel.org>

Patch applied with all the ACKs.

Yours,
Linus Walleij
