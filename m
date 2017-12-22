Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1513935965-12909-1-git-send-email-aisheng.dong@nxp.com>
References: <1513935965-12909-1-git-send-email-aisheng.dong@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 22 Dec 2017 13:51:05 +0100
Message-ID: <CAPDyKFrdGEn8v3SCZueZGVoySRLX_qm3rHY6XAtTN5YgZ022GQ@mail.gmail.com>
Subject: Re: [RFC PATCH V1 1/2] clk: use atomic runtime pm api in clk_core_is_enabled
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On 22 December 2017 at 10:46, Dong Aisheng <aisheng.dong@nxp.com> wrote:
> Current clk_pm_runtime_put is using pm_runtime_put_sync which
> is not safe to be called in clk_core_is_enabled as it should
> be able to run in atomic context.
>
> Thus use pm_runtime_put instead which is atomic safe.
>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: 9a34b45397e5 ("clk: Add support for runtime PM")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/clk/clk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 5ec5809..e24968f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -227,7 +227,8 @@ static bool clk_core_is_enabled(struct clk_core *core)
>
>         ret = core->ops->is_enabled(core->hw);
>  done:
> -       clk_pm_runtime_put(core);
> +       if (core->dev)
> +               pm_runtime_put(core->dev);
>
>         return ret;
>  }
> --
> 2.7.4
>
