Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Nicholas Mc Guire <hofrat@osadl.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1531649904-6072-1-git-send-email-hofrat@osadl.org>
Cc: Kees Cook <keescook@chromium.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>
References: <1531649904-6072-1-git-send-email-hofrat@osadl.org>
Message-ID: <153255129875.48062.4075642035553635128@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/2] drivers: clk: st: warn on iomap failure
Date: Wed, 25 Jul 2018 13:41:38 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Nicholas Mc Guire (2018-07-15 03:18:23)
>  While the return value of clkgen_get_register_base() is being checked
> at the call site, there is no indication of failure cause thus making
> diagnosis of the issues hard. The WARN_ON() allows to determine the
> cause of failure.
> =

> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
> =

> Problem found by an experimental coccinelle script
> =

> Patch was compile tested with: multi_v7_defconfig (implies
> CONFIG_ARCH_STI=3Dy)
> =

> Patch is against 4.18-rc4 (localversion-next is next-20180713)
> =

>  drivers/clk/st/clkgen-pll.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
> index cbb5184..aeb30ab 100644
> --- a/drivers/clk/st/clkgen-pll.c
> +++ b/drivers/clk/st/clkgen-pll.c
> @@ -647,6 +647,7 @@ static void __iomem * __init clkgen_get_register_base(
>                 return NULL;
>  =

>         reg =3D of_iomap(pnode, 0);
> +       WARN_ON(!reg);
>  =

>         of_node_put(pnode);
>         return reg;

Shouldn't the caller blow up on NULL pointer access? This patch doesn't
seem useful, sorry.
