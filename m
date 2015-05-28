Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dong Aisheng <aisheng.dong@freescale.com>,  linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1431610143-21853-2-git-send-email-aisheng.dong@freescale.com>
Cc: linux-kernel@vger.kernel.org, sboyd@codeaurora.org, shawn.guo@linaro.org,
 b29396@freescale.com, linux-arm-kernel@lists.infradead.org,
 Ranjani.Vaidyanathan@freescale.com, b20596@freescale.com,
 r64343@freescale.com, b20788@freescale.com
References: <1431610143-21853-1-git-send-email-aisheng.dong@freescale.com>
 <1431610143-21853-2-git-send-email-aisheng.dong@freescale.com>
Message-ID: <20150528040919.22384.79189@quantum>
Subject: Re: [PATCH v2 1/5] clk: remove duplicated code with __clk_set_parent_after
Date: Wed, 27 May 2015 21:09:19 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Dong Aisheng (2015-05-14 06:28:59)
> __clk_set_parent_after() actually used the second argument then we
> could put this duplicate logic in there and call it with a different
> order of arguments in the success vs. error paths in this function.
> =

> Cc: Mike Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@freescale.com>

Patch looks good to me.

Also just noticed that the second argument to __clk_set_parent_after is
never used :-(

Regards,
Mike

> ---
>  drivers/clk/clk.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 659f2b0..0e813ea 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1159,14 +1159,8 @@ static int __clk_set_parent(struct clk_core *core,=
 struct clk_core *parent,
>                 flags =3D clk_enable_lock();
>                 clk_reparent(core, old_parent);
>                 clk_enable_unlock(flags);
> +               __clk_set_parent_after(core, old_parent, parent);
>  =

> -               if (core->prepare_count) {
> -                       flags =3D clk_enable_lock();
> -                       clk_core_disable(core);
> -                       clk_core_disable(parent);
> -                       clk_enable_unlock(flags);
> -                       clk_core_unprepare(parent);
> -               }
>                 return ret;
>         }
>  =

> -- =

> 1.9.1
>=20
