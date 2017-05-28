Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:35062 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750886AbdE1PKT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 28 May 2017 11:10:19 -0400
MIME-Version: 1.0
In-Reply-To: <20170527102308.1988-8-icenowy@aosc.io>
References: <20170527102308.1988-1-icenowy@aosc.io> <20170527102308.1988-8-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 28 May 2017 23:09:45 +0800
Message-ID: <CAGb2v65174+qJTyReMH7ov0NWvp+f6YC3+ovPVZghw9tsokmZw@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] dt-bindings: add compatible string for Allwinner
 R40 CCU
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, May 27, 2017 at 6:23 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> Allwinner R40 has a clock controlling unit like the ones on other
> Allwinner SoCs after sun6i, and can also use a CCU-based driver.
>
> Add a compatible string for it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
