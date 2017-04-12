Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20170331101417.21312-1-jbrunet@baylibre.com>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Neil Armstrong" <narmstrong@baylibre.com>
References: <20170331101417.21312-1-jbrunet@baylibre.com>
Message-ID: <149200104942.88277.9316023212145785561@resonance>
Subject: Re: [PATCH] MAINTAINERS: Add maintainers for the meson clock driver
Date: Wed, 12 Apr 2017 14:44:09 +0200
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-03-31 12:14:17)
> Suggested-by: Michael Turquette <mturquette@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>,
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> =

> Hi Mike, Stephen,
> =

> If this is OK with you, this will be the first patch of our upcoming pull
> request.

Sounds goods to me.

Regards,
Mike

> =

>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> index c265a5fe4848..8cb237925b06 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1069,6 +1069,16 @@ F:       drivers/pinctrl/meson/
>  F:     drivers/mmc/host/meson*
>  N:     meson
>  =

> +ARM/Amlogic Meson SoC CLOCK FRAMEWORK
> +M:     Neil Armstrong <narmstrong@baylibre.com>
> +M:     Jerome Brunet <jbrunet@baylibre.com>
> +L:     linux-amlogic@lists.infradead.org
> +S:     Maintained
> +F:     drivers/clk/meson/
> +F:     include/dt-bindings/clock/meson*
> +F:     include/dt-bindings/clock/gxbb*
> +F:     Documentation/devicetree/bindings/clock/amlogic*
> +
>  ARM/Annapurna Labs ALPINE ARCHITECTURE
>  M:     Tsahee Zidenberg <tsahee@annapurnalabs.com>
>  M:     Antoine Tenart <antoine.tenart@free-electrons.com>
> -- =

> 2.9.3
>=20
