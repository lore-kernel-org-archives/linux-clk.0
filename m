Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1455539977-23308-1-git-send-email-geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 "Geert Uytterhoeven" <geert+renesas@glider.be>
References: <1455539977-23308-1-git-send-email-geert+renesas@glider.be>
Message-ID: <20160215231651.2278.72320@quark.deferred.io>
Subject: Re: [PATCH] clk: shmobile: cpg-mssr: Update serial port clock in example
Date: Mon, 15 Feb 2016 15:16:51 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Geert Uytterhoeven (2016-02-15 04:39:37)
> Cfr. commit a9ec81f4ed5c05db ("serial: sh-sci: Drop the interface
> clock").
> =

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I plan to queue this up with the other clk-shmobile patches in
> clk-shmobile-for-v4.6 and send a pull request later.

Ack.

Regards,
Mike

> =

>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt=
 b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> index 59297d34b2084429..fefb8023020f1a54 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> @@ -61,7 +61,7 @@ Examples
>                 reg =3D <0 0xe6e88000 0 64>;
>                 interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks =3D <&cpg CPG_MOD 310>;
> -               clock-names =3D "sci_ick";
> +               clock-names =3D "fck";
>                 dmas =3D <&dmac1 0x13>, <&dmac1 0x12>;
>                 dma-names =3D "tx", "rx";
>                 power-domains =3D <&cpg>;
> -- =

> 1.9.1
>=20
