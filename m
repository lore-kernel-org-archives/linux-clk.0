Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170527102308.1988-5-icenowy@aosc.io>
References: <20170527102308.1988-1-icenowy@aosc.io> <20170527102308.1988-5-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 28 May 2017 23:08:02 +0800
Message-ID: <CAGb2v64ycEzmyZBMvvmHosJSpp2hqRo4gc6xKKPhqK96Npq5xg@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] pinctrl: sunxi: drop dedicated A20 driver
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
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, May 27, 2017 at 6:23 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> As we added A20 support to A10 pinctrl driver, now we can delete the
> dedicated A20 pinctrl driver, which is duplicated code.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v3:
> - Only remove the A20 driver(A10 driver for A20 is enabled in
>   the previous commit now).
>
>  drivers/pinctrl/sunxi/Kconfig             |    4 -
>  drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c | 1056 -----------------------------

You forgot to remove the Makefile entry. Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
