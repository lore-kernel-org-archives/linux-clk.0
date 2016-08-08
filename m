Return-Path: <amit.kucheria@verdurent.com>
MIME-Version: 1.0
In-Reply-To: <1470627463-20570-1-git-send-email-leo.yan@linaro.org>
References: <1470627463-20570-1-git-send-email-leo.yan@linaro.org>
From: Amit Kucheria <amit.kucheria@verdurent.com>
Date: Mon, 8 Aug 2016 11:23:31 +0530
Message-ID: <CAHLCerN1dwvjT_r7UD2ZFD0Aar8uPg_RkCh_FDSFxNvLKZPqDQ@mail.gmail.com>
Subject: Re: [PATCH] clk: Hi6220: enable stub clock driver for ARCH_HISI
To: Leo Yan <leo.yan@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Guodong Xu <guodong.xu@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 8, 2016 at 9:07 AM, Leo Yan <leo.yan@linaro.org> wrote:
> In current kernel config 'CONFIG_STUB_CLK_HI6220' is disabled by
> default, as result stub clock driver has not been registered and
> CPUFreq driver cannot work.

I have a related patch that has been pending for a while:
https://lkml.org/lkml/2016/6/20/375 but it was tied only to the
thermal driver.

Is the stub mandatory for the architecture? Will other SoCs in the
family will use the same stub?


> This patch is to enable stub clock driver in config for ARCH_HISI.
>
> Reported-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  drivers/clk/hisilicon/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/hisilicon/Kconfig b/drivers/clk/hisilicon/Kconfig
> index 3f537a0..9e0a95e 100644
> --- a/drivers/clk/hisilicon/Kconfig
> +++ b/drivers/clk/hisilicon/Kconfig
> @@ -23,5 +23,6 @@ config RESET_HISI
>  config STUB_CLK_HI6220
>         bool "Hi6220 Stub Clock Driver"
>         depends on COMMON_CLK_HI6220 && MAILBOX
> +       default ARCH_HISI
>         help
>           Build the Hisilicon Hi6220 stub clock driver.
> --
> 1.9.1
>
