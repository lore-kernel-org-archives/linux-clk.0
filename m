Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 sjan@baylibre.com, ahaslam@baylibre.com, abailon@baylibre.com
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1459510635-8204-5-git-send-email-narmstrong@baylibre.com>
Cc: "Neil Armstrong" <narmstrong@baylibre.com>
References: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
 <1459510635-8204-5-git-send-email-narmstrong@baylibre.com>
Message-ID: <20160401161840.23150.64514@quark.deferred.io>
Subject: Re: [PATCH 4/5] dt-bindings: clock: add schrodinger clock bindings
Date: Fri, 01 Apr 2016 09:18:40 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Neil Armstrong (2016-04-01 04:37:14)
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/clock/schrodinger.txt          | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/schrodinger.t=
xt
> =

> diff --git a/Documentation/devicetree/bindings/clock/schrodinger.txt b/Do=
cumentation/devicetree/bindings/clock/schrodinger.txt
> new file mode 100644
> index 0000000..ecb1a51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/schrodinger.txt
> @@ -0,0 +1,18 @@
> +Binding for schrodinger Quantum clock sources.
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible : shall be "schrodinger-clock".
> +- #clock-cells : from common clock binding; shall be set to 0.
> +
> +Optional properties:
> +- clock-output-names : From common clock binding.
> +
> +Example:
> +       cat {
> +               compatible =3D "schrodinger-clock";
> +               #clock-cells =3D <0>;

I know it is out of scope for this series, but I wonder what would
constitute a valid status property for the cat node? Should we propose
adding "dead" and "alive" values to the status property in ePAPR?

Regards,
Mike

> +       };
> -- =

> 1.9.1
>=20
