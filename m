Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Kevin Hilman" <khilman@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20170321183330.26722-3-jbrunet@baylibre.com>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20170321183330.26722-1-jbrunet@baylibre.com>
 <20170321183330.26722-3-jbrunet@baylibre.com>
Message-ID: <149228804557.88277.9328911897442773852@resonance>
Subject: Re: [RFC 2/7] clk: add set_phase core function
Date: Sat, 15 Apr 2017 22:27:25 +0200
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome,

Quoting Jerome Brunet (2017-03-21 19:33:25)
> Create a core function for set_phase, as it is done for set_rate and
> set_parent.
> =

> This rework is done to ease the integration of "protected" clock
> functionality.
> =

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/clk.c | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index e77f03a47da6..57982a06dbce 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1876,6 +1876,23 @@ int clk_set_parent(struct clk *clk, struct clk *pa=
rent)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_parent);
>  =

> +static int clk_core_set_phase(struct clk_core *core, int degrees)

s/clk_core_set_phase/clk_core_set_phase_nolock/

Otherwise patch looks OK to me.

Regards,
Mike

> +{
> +       int ret =3D -EINVAL;
> +
> +       if (!core)
> +               return 0;
> +
> +       trace_clk_set_phase(clk->core, degrees);
> +
> +       if (core->ops->set_phase)
> +               ret =3D core->ops->set_phase(core->hw, degrees);
> +
> +       trace_clk_set_phase_complete(core, degrees);
> +
> +       return ret;
> +}
> +
>  /**
>   * clk_set_phase - adjust the phase shift of a clock signal
>   * @clk: clock signal source
> @@ -1898,7 +1915,7 @@ EXPORT_SYMBOL_GPL(clk_set_parent);
>   */
>  int clk_set_phase(struct clk *clk, int degrees)
>  {
> -       int ret =3D -EINVAL;
> +       int ret;
>  =

>         if (!clk)
>                 return 0;
> @@ -1909,17 +1926,7 @@ int clk_set_phase(struct clk *clk, int degrees)
>                 degrees +=3D 360;
>  =

>         clk_prepare_lock();
> -
> -       trace_clk_set_phase(clk->core, degrees);
> -
> -       if (clk->core->ops->set_phase)
> -               ret =3D clk->core->ops->set_phase(clk->core->hw, degrees);
> -
> -       trace_clk_set_phase_complete(clk->core, degrees);
> -
> -       if (!ret)
> -               clk->core->phase =3D degrees;
> -
> +       ret =3D clk_core_set_phase(clk->core, degrees);
>         clk_prepare_unlock();
>  =

>         return ret;
> -- =

> 2.9.3
>=20
