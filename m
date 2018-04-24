Return-Path: <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
In-Reply-To: <20180409135921.5617-2-jbrunet@baylibre.com>
References: <20180409135921.5617-1-jbrunet@baylibre.com> <20180409135921.5617-2-jbrunet@baylibre.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 24 Apr 2018 11:04:25 -0300
Message-ID: <CAAEAJfDgGYu9WR5+qA-trQUTkb--bam=LLbhH+1N2OdrtBGLzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: honor CLK_MUX_ROUND_CLOSEST in generic clk mux
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On 9 April 2018 at 10:59, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> CLK_MUX_ROUND_CLOSEST is part of the clk_mux documentation but clk_mux
> directly calls __clk_mux_determine_rate(), which overrides the flag.
> As result, if clk_mux is instantiated with CLK_MUX_ROUND_CLOSEST, the
> flag will be ignored and the clock rounded down.
>
> To solve this, this patch expose clk_mux_determine_rate_flags() in the
> clk-provider API and uses it in the determine_rate() callback of clk_mux.
>
> Fixes: 15a02c1f6dd7 ("clk: Add __clk_mux_determine_rate_closest")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/clk-mux.c        | 10 +++++++++-
>  drivers/clk/clk.c            |  7 ++++---
>  include/linux/clk-provider.h |  3 +++
>  3 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
> index ac4a042f8658..1628b93655ed 100644
> --- a/drivers/clk/clk-mux.c
> +++ b/drivers/clk/clk-mux.c
> @@ -112,10 +112,18 @@ static int clk_mux_set_parent(struct clk_hw *hw, u8=
 index)
>         return 0;
>  }
>
> +static int clk_mux_determine_rate(struct clk_hw *hw,
> +                                 struct clk_rate_request *req)
> +{
> +       struct clk_mux *mux =3D to_clk_mux(hw);
> +
> +       return clk_mux_determine_rate_flags(hw, req, mux->flags);
> +}
> +
>  const struct clk_ops clk_mux_ops =3D {
>         .get_parent =3D clk_mux_get_parent,
>         .set_parent =3D clk_mux_set_parent,
> -       .determine_rate =3D __clk_mux_determine_rate,
> +       .determine_rate =3D clk_mux_determine_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_mux_ops);
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index ea67ac81c6f9..7af555f0e60c 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -426,9 +426,9 @@ static bool mux_is_better_rate(unsigned long rate, un=
signed long now,
>         return now <=3D rate && now > best;
>  }
>
> -static int
> -clk_mux_determine_rate_flags(struct clk_hw *hw, struct clk_rate_request =
*req,
> -                            unsigned long flags)
> +int clk_mux_determine_rate_flags(struct clk_hw *hw,
> +                                struct clk_rate_request *req,
> +                                unsigned long flags)
>  {
>         struct clk_core *core =3D hw->core, *parent, *best_parent =3D NUL=
L;
>         int i, num_parents, ret;
> @@ -488,6 +488,7 @@ clk_mux_determine_rate_flags(struct clk_hw *hw, struc=
t clk_rate_request *req,
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(clk_mux_determine_rate_flags);
>

Why do we need to export this?

>  struct clk *__clk_lookup(const char *name)
>  {
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 210a890008f9..1d25e149c1c5 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -765,6 +765,9 @@ int __clk_mux_determine_rate(struct clk_hw *hw,
>  int __clk_determine_rate(struct clk_hw *core, struct clk_rate_request *r=
eq);
>  int __clk_mux_determine_rate_closest(struct clk_hw *hw,
>                                      struct clk_rate_request *req);
> +int clk_mux_determine_rate_flags(struct clk_hw *hw,
> +                                struct clk_rate_request *req,
> +                                unsigned long flags);
>  void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
>  void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
>                            unsigned long max_rate);
> --
> 2.14.3
>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks!
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
