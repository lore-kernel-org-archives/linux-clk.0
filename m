Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20150724232045.GA14059@www.outflux.net>
References: <20150724232045.GA14059@www.outflux.net>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 31 Jul 2015 11:13:59 +0200
Message-ID: <CAAObsKBp-hPknWUxJxJGPV1RTj+Q_yc+xxVG315FjQXk9_CK2g@mail.gmail.com>
Subject: Re: [PATCH] clk_register_clkdev: handle callers needing format string
To: Kees Cook <keescook@chromium.org>
Cc: akpm@linux-foundation.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 25 July 2015 at 01:20, Kees Cook <keescook@chromium.org> wrote:
> Many callers either use NULL or const strings for the third argument of
> clk_register_clkdev. For those that do not, this is a risk for format
> strings being accidentally processed (for example in device names). This
> adds the missing "%s" arguments to make sure format strings will not leak
> into the clkdev.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

[...]

> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 41cd87c67be6..97d9fb7e89ad 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -296,7 +296,7 @@ void __init tegra_register_devclks(struct tegra_devclk *dev_clks, int num)
>
>         for (i = 0; i < num; i++, dev_clks++)
>                 clk_register_clkdev(clks[dev_clks->dt_id], dev_clks->con_id,
> -                               dev_clks->dev_id);
> +                               "%s", dev_clks->dev_id);

This causes clocks to be registered with a dev_id string of "(null)",
which is causing lookups that used to succeed before to fail.

Regards,

Tomeu
