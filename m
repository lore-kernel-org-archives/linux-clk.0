Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:54478 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752446AbeC0NIk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Mar 2018 09:08:40 -0400
Received: by mail-it0-f65.google.com with SMTP id h143-v6so7447070ita.4
        for <linux-clk@vger.kernel.org>; Tue, 27 Mar 2018 06:08:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180316140215.28663-4-icenowy@aosc.io>
References: <20180316140215.28663-1-icenowy@aosc.io> <20180316140215.28663-4-icenowy@aosc.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Mar 2018 15:08:39 +0200
Message-ID: <CACRpkdaq6RYNdk5H4bFEJxfCErg0veqxY563uPr3W8d3cA9vZg@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] pinctrl: sunxi: change irq_bank_base to irq_bank_map
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

> The Allwinner H6 SoC have its pin controllers with the first IRQ-capable
> GPIO bank at IRQ bank 1 and the second bank at IRQ bank 5.
>
> Change the current code that uses IRQ bank base to a IRQ bank map, in
> order to support the case that holes exist among IRQ banks.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Extracted in v4.

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
