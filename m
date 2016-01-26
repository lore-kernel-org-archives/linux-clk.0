Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: =?utf-8?B?UGF3ZcWC?= Jarosz <paweljarosz3691@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com
Subject: Re: [PATCH 0/3] Add rk3066 tsadc device tree bindings
Date: Tue, 26 Jan 2016 01:13:39 +0100
Message-ID: <4176431.EN0Q2CUI1l@diego>
In-Reply-To: <1453205361-27267-1-git-send-email-paweljarosz3691@gmail.com>
References: <1453205361-27267-1-git-send-email-paweljarosz3691@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

Am Dienstag, 19. Januar 2016, 13:09:18 schrieb Pawe=C5=82 Jarosz:
> This patchset adds devicetree bindings for rockchip rk3066 tsadc with=
 needed
> dependencies.
>=20
> Pawe=C5=82 Jarosz (3):
>   clk: rockchip: Add new id for rk3066 tsadc clock
>   clk: rockchip: add tsadc clock on rk3066
>   ARM: dts: rockchip: add tsadc node

applied all three to appropriate branches for 4.6

I've removed the vref-supply from the dtsi and moved some properties ar=
ound a=20
bit.


Heiko
