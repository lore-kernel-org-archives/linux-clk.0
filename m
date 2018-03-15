Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20180312104945.3001-1-riku.voipio@linaro.org>
References: <20180312104945.3001-1-riku.voipio@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Mar 2018 14:47:06 +0100
Message-ID: <CAPDyKFqjcak8buKYvy4OFy=5rUk95OPMHjDcwGs=NtNiD0hhww@mail.gmail.com>
Subject: Re: [RESEND PATCH] clk: enable hi655x common clk automatically
To: Riku Voipio <riku.voipio@linaro.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Arnd Bergmann <arnd@linaro.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>, John Stultz <john.stultz@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On 12 March 2018 at 11:49,  <riku.voipio@linaro.org> wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> Without COMMON_CLK_HI655X Wifi and bluetooth are non-functional on Hikey.
> As suggested by Arnd, enable the driver automatically when the parent
> driver is selected. With sensible defaults in place, we can leave other
> choices for EXPERT.
>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Suggested-by: Arnd Bergmann <arnd@linaro.org>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> Previous discussion at https://patchwork.kernel.org/patch/9767143/
> ---
>  drivers/clk/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 98ce9fc6e6c0..448ce83b334d 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -55,8 +55,10 @@ config COMMON_CLK_RK808
>           by control register.
>
>  config COMMON_CLK_HI655X
> -       tristate "Clock driver for Hi655x"
> -       depends on MFD_HI655X_PMIC || COMPILE_TEST
> +       tristate "Clock driver for Hi655x" if EXPERT
> +       depends on (MFD_HI655X_PMIC || COMPILE_TEST)
> +       depends on REGMAP
> +       default MFD_HI655X_PMIC
>         ---help---
>           This driver supports the hi655x PMIC clock. This
>           multi-function device has one fixed-rate oscillator, clocked
> --
> 2.15.1
>
