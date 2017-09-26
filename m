Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170923050029.19013-1-bjorn.andersson@linaro.org>
References: <20170923050029.19013-1-bjorn.andersson@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Sep 2017 01:57:29 +0200
Message-ID: <CAPDyKFoS5QoMGx_SeZf4tJR6QSttAmZ8upVP17UyGceT9OsJtg@mail.gmail.com>
Subject: Re: [PATCH] clk: Export clk_bulk_prepare()
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On 23 September 2017 at 07:00, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> Allow clk_bulk_prepare() to be referenced by kernel modules by adding
> the missing EXPORT_SYMBOL_GPL().
>
> Fixes: 266e4e9d9150 ("clk: add clk_bulk_get accessories")
> Reported-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

If not too late,

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/clk/clk-bulk.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/clk-bulk.c b/drivers/clk/clk-bulk.c
> index c834f5abfc49..4c10456f8a32 100644
> --- a/drivers/clk/clk-bulk.c
> +++ b/drivers/clk/clk-bulk.c
> @@ -105,6 +105,7 @@ int __must_check clk_bulk_prepare(int num_clks,
>
>         return  ret;
>  }
> +EXPORT_SYMBOL_GPL(clk_bulk_prepare);
>
>  #endif /* CONFIG_HAVE_CLK_PREPARE */
>
> --
> 2.12.0
>
