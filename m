Return-Path: <sebastian.hesselbarth@gmail.com>
Return-Path: <sebastian.hesselbarth@gmail.com>
Message-ID: <554A9596.10008@gmail.com>
Date: Thu, 07 May 2015 00:28:38 +0200
From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
 Mike Turquette <mturquette@linaro.org>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 06/19] clk: berlin: Silence sparse warning
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org> <1430897996-11597-7-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-7-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06.05.2015 09:39, Stephen Boyd wrote:
> drivers/clk/berlin/berlin2-pll.c:94:12: warning: symbol 'berlin2_pll_register' was not declared. Should it be static?
>
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Thanks!

> ---
>   drivers/clk/berlin/berlin2-pll.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/clk/berlin/berlin2-pll.c b/drivers/clk/berlin/berlin2-pll.c
> index bdc506b03824..f4b8d324b083 100644
> --- a/drivers/clk/berlin/berlin2-pll.c
> +++ b/drivers/clk/berlin/berlin2-pll.c
> @@ -25,14 +25,7 @@
>   #include <asm/div64.h>
>
>   #include "berlin2-div.h"
> -
> -struct berlin2_pll_map {
> -	const u8 vcodiv[16];
> -	u8 mult;
> -	u8 fbdiv_shift;
> -	u8 rfdiv_shift;
> -	u8 divsel_shift;
> -};
> +#include "berlin2-pll.h"
>
>   struct berlin2_pll {
>   	struct clk_hw hw;
>
