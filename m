Return-Path: <manabian@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1463413536-20292-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1463413536-20292-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Date: Mon, 16 May 2016 18:55:40 +0200
Message-ID: <CAGhQ9VzQUbe7A9e2MtPe5eX99bnLAX_JEEa_GDETfEJiQwQm0A@mail.gmail.com>
Subject: Re: [PATCH] clk: nxp: Select MFD_SYSCON for creg driver
From: Joachim  Eastwood <manabian@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Ezequiel,

On 16 May 2016 at 17:45, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> Commit 378523d15003 ("clk: add lpc18xx creg clk driver")
> added a new clock driver but missed the proper MFD_SYSCON select.
> Fix it.
>
> Fixes: 378523d15003 ("clk: add lpc18xx creg clk driver")
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/clk/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 53ddba26578c..98efbfcdb503 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -175,6 +175,7 @@ config COMMON_CLK_KEYSTONE
>  config COMMON_CLK_NXP
>         def_bool COMMON_CLK && (ARCH_LPC18XX || ARCH_LPC32XX)
>         select REGMAP_MMIO if ARCH_LPC32XX
> +       select MFD_SYSCON if ARCH_LPC18XX

Acked-by: Joachim Eastwood <manabian@gmail.com>


regards,
Joachim Eastwood
