Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180503183847.11046-4-icenowy@aosc.io>
References: <20180503183847.11046-1-icenowy@aosc.io> <20180503183847.11046-4-icenowy@aosc.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 May 2018 14:20:06 +0200
Message-ID: <CACRpkdY2HXmn8iez3LhVUPQKcxwxRW1t18jWj0PbQi6=wFf_2Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] pinctrl: sunxi: add support for H6 R_PIO pin controller
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
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 3, 2018 at 8:38 PM, Icenowy Zheng <icenowy@aosc.io> wrote:

> Allwinner H6 SoC has a R_PIO pin controller like other Allwinner SoCs,
> which controls the PL and PM pin banks.
>
> Add support for it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Patch applied with the ACKs.

Yours,
Linus Walleij
