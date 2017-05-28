Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170527102308.1988-3-icenowy@aosc.io>
References: <20170527102308.1988-1-icenowy@aosc.io> <20170527102308.1988-3-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 28 May 2017 22:58:34 +0800
Message-ID: <CAGb2v67YigaybOqiHJ-cSF4vNvkP7xBgt2jTd4NHdyGfB75kEQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] pinctrl: sunxi: Add SoC ID definitions for A10,
 A20 and R40 SoCs
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
> Allwinner A10, A20 and R40 SoCs have similar GPIO layout.
>
> Add SoC definitions in pinctrl-sunxi.h, in order to merge A20 support
> into A10 driver, and add R40 support into it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
