Return-Path: <linux-pm-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170723102749.17323-2-icenowy@aosc.io>
References: <20170723102749.17323-1-icenowy@aosc.io> <20170723102749.17323-2-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 24 Jul 2017 11:06:01 +0800
Message-ID: <CAGb2v66wBpwr+-MG5+3LyFUrYjd0ernqQ777xgw_gsiYTEm5VA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 01/10] dt-bindings: add binding for the
 SY8160A voltage regulator
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Ondrej Jirman <megous@megous.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jul 23, 2017 at 6:27 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> From: Ondrej Jirman <megous@megous.com>
>
> SY8106A is an I2C-controlled adjustable voltage regulator made by
> Silergy Corp.
>
> Add its device tree binding.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> [Icenowy: Change commit message]
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../bindings/regulator/sy8106a-regulator.txt        | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/sy8106a-regulator.txt
>
> diff --git a/Documentation/devicetree/bindings/regulator/sy8106a-regulator.txt b/Documentation/devicetree/bindings/regulator/sy8106a-regulator.txt
> new file mode 100644
> index 000000000000..1e623a34b1cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/sy8106a-regulator.txt
> @@ -0,0 +1,21 @@
> +SY8106A Voltage regulator
> +
> +Required properties:
> +- compatible: Must be "silergy,sy8106a"
> +- reg: I2C slave address - must be <0x65>
> +
> +Any property defined as part of the core regulator binding, defined in
> +regulator.txt, can also be used.

Nit: use ./regulator.txt to show that this is a path, and not just a
file name. This should help other people find the file quickly.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> +
> +Example:
> +
> +       sy8106a {
> +               compatible = "silergy,sy8106a";
> +               reg = <0x65>;
> +               regulator-name = "sy8106a-vdd";
> +               regulator-min-microvolt = <1000000>;
> +               regulator-max-microvolt = <1400000>;
> +               regulator-ramp-delay = <200>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> --
> 2.13.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.
