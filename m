Return-Path: <javier@dowhile0.org>
MIME-Version: 1.0
In-Reply-To: <1483524753-32213-1-git-send-email-geert+renesas@glider.be>
References: <1483524753-32213-1-git-send-email-geert+renesas@glider.be>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Wed, 4 Jan 2017 17:43:11 -0300
Message-ID: <CABxcv=ng-EHsL8d3B1OhRGRNRSw88H7e8Wb_NSF13rSS_RxMrQ@mail.gmail.com>
Subject: Re: [PATCH] clk: clk-conf: Do not print error messages if EPROBE_DEFER
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hello Geert,

On Wed, Jan 4, 2017 at 7:12 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> EPROBE_DEFER is not an error, hence printing an error message like
>
>         clk: couldn't get clock 0 for /soc/display@feb00000
>
> may confuse the user.
>
> Suppress error messages in case of probe deferral to fix this.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
Javier
