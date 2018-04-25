Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1524656245.4026.61.camel@baylibre.com>
Subject: Re: [PATCH v2 1/2] clk: meson: gxbb: expose VDEC_1 and VDEC_HEVC
 clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maxime Jourdan <maxi.jourdan@wanadoo.fr>, Neil Armstrong
	 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 25 Apr 2018 13:37:25 +0200
In-Reply-To: <20180424184838.3406-2-maxi.jourdan@wanadoo.fr>
References: <20180424184838.3406-1-maxi.jourdan@wanadoo.fr>
	 <20180424184838.3406-2-maxi.jourdan@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2018-04-24 at 20:48 +0200, Maxime Jourdan wrote:
> Signed-off-by: Maxime Jourdan <maxi.jourdan@wanadoo.fr>

Even if the change is trivial, please add commit description.
I'll do it for you this time.

Applied to next/headers
Thx

> ---
>  include/dt-bindings/clock/gxbb-clkc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
> index 8ba99a5e3fd3..7a892be90549 100644
> --- a/include/dt-bindings/clock/gxbb-clkc.h
> +++ b/include/dt-bindings/clock/gxbb-clkc.h
> @@ -125,5 +125,7 @@
>  #define CLKID_VAPB_1		138
>  #define CLKID_VAPB_SEL		139
>  #define CLKID_VAPB		140
> +#define CLKID_VDEC_1		153
> +#define CLKID_VDEC_HEVC		156
>  
>  #endif /* __GXBB_CLKC_H */
