Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:35352 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750896AbdE2QdP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 May 2017 12:33:15 -0400
Received: by mail-io0-f171.google.com with SMTP id f102so43436322ioi.2
        for <linux-clk@vger.kernel.org>; Mon, 29 May 2017 09:33:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170527102308.1988-3-icenowy@aosc.io>
References: <20170527102308.1988-1-icenowy@aosc.io> <20170527102308.1988-3-icenowy@aosc.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 May 2017 18:33:13 +0200
Message-ID: <CACRpkdbPcAELAySk77xofYNVqach+0-2oJ1qMcGK5X1zA8gdeA@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] pinctrl: sunxi: Add SoC ID definitions for A10,
 A20 and R40 SoCs
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, May 27, 2017 at 12:23 PM, Icenowy Zheng <icenowy@aosc.io> wrote:

> Allwinner A10, A20 and R40 SoCs have similar GPIO layout.
>
> Add SoC definitions in pinctrl-sunxi.h, in order to merge A20 support
> into A10 driver, and add R40 support into it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v3:
> - Commit message change.

Patch applied with Chen-Yu's review tag.

Yours,
Linus Walleij
