Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
 "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1444951178-18733-1-git-send-email-sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 "Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 geert@linux-m68k.org, magnus.damm@gmail.com
References: <20151015215648.2024f611@free-electrons.com>
 <1444951178-18733-1-git-send-email-sboyd@codeaurora.org>
Message-ID: <20151016125533.20687.23387@quantum>
Subject: Re: [PATCH] clk: Make of_clk_get_parent_name() robust with #clock-cells = 1
Date: Fri, 16 Oct 2015 05:55:33 -0700
List-ID: <linux-clk.vger.kernel.org>

Cc'ing Geert.

Quoting Stephen Boyd (2015-10-15 16:19:38)
> If a clock provider has #clock-cells =3D 1 and we call
> of_clk_get_parent_name() on it we may end up returning the name
> of the provider node if the provider doesn't have a
> clock-output-names property. This doesn't make sense, especially
> when you consider that calling of_clk_get_parent_name() on such a
> node with different indices will return the same name each time.
> =

> Let's try getting the clock from the framework via of_clk_get()
> instead, and only fallback to the node name if we have a provider
> with #clock-cells =3D 0. This way, we can't hand out the same name
> for different clocks when we don't actually know their names.
> =

> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Geert,

Does this approach fix the issues you had removing clock-output-names
from your clock provider DTS?

Regards,
Mike

> ---
>  drivers/clk/clk.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b005f666e3a1..a0fe9ca1f0af 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3055,6 +3055,7 @@ const char *of_clk_get_parent_name(struct device_no=
de *np, int index)
>         u32 pv;
>         int rc;
>         int count;
> +       struct clk *clk;
>  =

>         if (index < 0)
>                 return NULL;
> @@ -3080,8 +3081,25 @@ const char *of_clk_get_parent_name(struct device_n=
ode *np, int index)
>  =

>         if (of_property_read_string_index(clkspec.np, "clock-output-names=
",
>                                           index,
> -                                         &clk_name) < 0)
> -               clk_name =3D clkspec.np->name;
> +                                         &clk_name) < 0) {
> +               /*
> +                * Best effort to get the name if the clock has been
> +                * registered with the framework. If the clock isn't
> +                * registered, we return the node name as the name of
> +                * the clock as long as #clock-cells =3D 0.
> +                */
> +               clk =3D of_clk_get_from_provider(&clkspec);
> +               if (IS_ERR(clk)) {
> +                       if (clkspec.args_count =3D=3D 0)
> +                               clk_name =3D clkspec.np->name;
> +                       else
> +                               clk_name =3D NULL;
> +               } else {
> +                       clk_name =3D __clk_get_name(clk);
> +                       clk_put(clk);
> +               }
> +       }
> +
>  =

>         of_node_put(clkspec.np);
>         return clk_name;
> -- =

> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>=20
