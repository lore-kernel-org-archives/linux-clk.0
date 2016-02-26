Return-Path: <slash.tmp@free.fr>
Subject: Re: [PATCH RFC] tango4 clk rewrite
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Sebastian Frias <sf84@laposte.net>
References: <56BE0F25.2040909@free.fr> <20160225220803.GK4847@codeaurora.org>
From: Mason <slash.tmp@free.fr>
Message-ID: <56D02E2F.1010908@free.fr>
Date: Fri, 26 Feb 2016 11:51:27 +0100
MIME-Version: 1.0
In-Reply-To: <20160225220803.GK4847@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen,

Thanks for taking a look. Hope either you or Michael will be
available to discuss some of the issues you raised.

On 25/02/2016 23:08, Stephen Boyd wrote:

> On 02/12, Mason wrote:
>
>> +#define FATAL(cond) if (cond) panic("Unsupported clkgen setup!\n")
> 
> Please just use BUG_ON instead.

The issue (from my POV) is that, AFAICT, BUG_ON() can be disabled.
If one compiles a CONFIG_BUG=n kernel, then BUG_ON() is a NOP, right?

But, if the firmware set the clock generator up in a way not supported
by the driver, then bad things will happen, should the kernel be allowed
to proceed, so panic() here seems necessary.

>> +#define PLL_N(v)	extract(v,  0, 7)
>> +#define PLL_K(v)	extract(v, 13, 3)
>> +#define PLL_M(v)	extract(v, 16, 3)
>> +#define PLL_ISEL(v)	extract(v, 24, 3)
> 
> I would have left it like it is, but made it lower case to
> signify "function" and not "constant".

OK, I can change the function-macros to lower case.

> #define pll_n(val)	((val) & 0x7f)
> #define pll_k(val)	(((val) >> 13) & 0x7)
> #define pll_m(val)	(((val) >> 16) & 0x7)
> #define pll_isel(val)	(((val) >> 24) & 0x7)
> 
> Note how I didn't use _another_ macro to make writing the
> shifting and anding logic common. That's because I'd like to know
> what the pll_n "function" does without having to go through
> another macro that does little but obscure the code.

My rationale was: the documentation specifies offset and width
for the fields. And the code should mirror the documentation
(leaving the arithmetic to the compiler).

BTW, my preferred version used bit-fields:
#define REG(name, ...) union name { struct { u32 __VA_ARGS__; }; u32 val; }
REG(SYS_clkgen_pll, N:7, :6, K:3, M:3, :5, Isel:3, :3, T:1, B:1);

But you wrote:
"This is new to me. Using bitfields like this is not really a good
idea though. Please just use masks, shifts, etc. instead."

IMHO, this is one place where bit-fields /are/ in fact useful.

> And to make things even clearer, maybe calling them
> extract_pll_n(), extract_pll_k(), etc. would make it clear from
> the calls sites that we're extracting the pll n and pll k values
> without having to look at the macro definitions.

OK, I can change the names.

>> +	div = (1 << 28) + readl_relaxed(base + idx*8);
> 
> Please add spaces around '*'. Also, just do it on two lines.
> 
> 	div = 1 << 28;
> 	div += readl_relaxed(base + idx * 8)

Is that because of the function-like macro?

>> +	FATAL(readl_relaxed(base + CPUCLK_DIV) & BIT(23));
>> +	FATAL(readl_relaxed(base + SYSCLK_DIV) & BIT(23));
> 
> BUG_ON would read much better here. Plus a comment on what
> BIT(23) means or a macro definition of it would make it clear
> what we're testing for.

There is a problem if BUG_ON() is a NOP.

I can indeed define BIT(23) as BYPASS_ENABLE.

Thanks again for reviewing, hope to hear back from you.

Regards.
