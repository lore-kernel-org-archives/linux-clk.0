Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:35806 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751190AbdE2Qks (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 May 2017 12:40:48 -0400
Received: by mail-it0-f42.google.com with SMTP id c15so29364348ith.0
        for <linux-clk@vger.kernel.org>; Mon, 29 May 2017 09:40:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170527102308.1988-6-icenowy@aosc.io>
References: <20170527102308.1988-1-icenowy@aosc.io> <20170527102308.1988-6-icenowy@aosc.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 May 2017 18:40:47 +0200
Message-ID: <CACRpkdYbumcyJLcRGeWn1BRD-XuDi96jRm9hVcoerGkG2wRO9w@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] dt-bindings: add compatible string for Allwinner
 R40 pinctrl
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

> Allwinner R40 has a pin controller like the ones in older Allwinner SoCs
> (especially A20), and can use modified version of the A10/A20 pinctrl
> driver.
>
> Add a compatible string for it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v3:
> - Added Rob's ACK.

Patch applied with Chen-Yu's review tag.

Yours,
Linus Walleij
