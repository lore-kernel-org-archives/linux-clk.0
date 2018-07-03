Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <20180619144141.8506-1-jbrunet@baylibre.com>
In-Reply-To: <20180619144141.8506-1-jbrunet@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Jul 2018 11:27:27 +0200
Message-ID: <CAMuHMdVTZOS91UUK2zqq019xMPfLUVgDPD8EAWSHntza0-ShVw@mail.gmail.com>
Subject: Re: [PATCH v4] clk: add duty cycle support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome,

On Tue, Jun 19, 2018 at 4:42 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> Add the possibility to apply and query the clock signal duty cycle ratio.
>
> This is useful when the duty cycle of the clock signal depends on some
> other parameters controlled by the clock framework.
>
> For example, the duty cycle of a divider may depends on the raw divider
> setting (ratio = N / div) , which is controlled by the CCF. In such case,
> going through the pwm framework to control the duty cycle ratio of this
> clock would be a burden.
>
> A clock provider is not required to implement the operation to set and get
> the duty cycle. If it does not implement .get_duty_cycle(), the ratio is
> assumed to be 50%.
>
> This change also adds a new flag, CLK_DUTY_CYCLE_PARENT. This flag should
> be used to indicate that a clock, such as gates and muxes, may inherit
> the duty cycle ratio of its parent clock. If a clock does not provide a
> get_duty_cycle() callback and has CLK_DUTY_CYCLE_PARENT, then the call
> will be directly forwarded to its parent clock, if any. For
> set_duty_cycle(), the clock should also have CLK_SET_RATE_PARENT for the
> call to be forwarded
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Thanks for your patch!

> ---
> The series has been developed to handled the sample clocks provided by
> audio clock controller of amlogic's A113 SoC. To support i2s modes, this
> clock need to have a 50% duty cycle ratio, while it should be just one
> pulse of the parent clock in dsp modes.

"one pulse" means num = 1, den = the clock rate, right?

> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h

> @@ -66,6 +68,17 @@ struct clk_rate_request {
>         struct clk_hw *best_parent_hw;
>  };
>
> +/**
> + * struct clk_duty - Struture encoding the duty cycle ratio of a clock
> + *
> + * @num:       Numerator of the duty cycle ratio
> + * @den:       Denominator of the duty cycle ratio
> + */
> +struct clk_duty {
> +       unsigned int num;
> +       unsigned int den;

So shouldn't both fields be "unsigned long" instead, to match clock rates?
(Yes, I do know we don't support +4.3 GHz clock rates on 32-bit yet ;-)

Also, you may want to have a higher precision than degrees for the
phase property when handling pulses.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
