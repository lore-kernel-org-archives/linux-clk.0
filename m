Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20180110020225.GE21040@codeaurora.org>
References: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
 <1514977577-11854-4-git-send-email-geert+renesas@glider.be> <20180110020225.GE21040@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Jan 2018 08:53:12 +0100
Message-ID: <CAMuHMdWEdbjNZmT0XSTPOXDhMkM3UEMnseYnxTvo0g828RNSPw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: Show symbolic clock flags in debugfs
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Wed, Jan 10, 2018 at 3:02 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 01/03, Geert Uytterhoeven wrote:
>> Currently the virtual "clk_flags" file in debugfs shows the numeric
>> value of the top-level framework flags for the specified clock.
>> Hence the user must manually interpret these values.
>>
>> Moreover, on big-endian 64-bit systems, the wrong half of the value is
>> shown, due to the cast from "unsigned long *" to "u32 *".
>>
>> Fix both issues by showing the symbolic flag names instead.
>> Any non-standard flags are shown as a hex number.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> I wonder if it can be a little simpler with something like the
> below patch squashed in? It would also be nice to detect if we

Sure, I didn't bother adding a macro for that as the list isn't that long,
and fairly static.

But feel free to fold in that part.

> fail to add another flag, but that may mean we need to make the
> flags into some sort of enum that we also set equal to BIT(x) and
> then have a case statement in the for loop instead of an array
> lookup. Not sure that's a big win.

Yes, you need an enum for that.
The case statement and for loop can be avoided by indexing the array
by enum value.

And the check for unknown flags can be moved to clock registration time
later, if you deem that's the way forward.

Thanks!

> @@ -2558,18 +2559,20 @@ static const struct {
>         unsigned long flag;
>         const char *name;
>  } clk_flags[] = {
> -       { CLK_SET_RATE_GATE,            "CLK_SET_RATE_GATE",            },
> -       { CLK_SET_PARENT_GATE,          "CLK_SET_PARENT_GATE",          },
> -       { CLK_SET_RATE_PARENT,          "CLK_SET_RATE_PARENT",          },
> -       { CLK_IGNORE_UNUSED,            "CLK_IGNORE_UNUSED",            },
> -       { CLK_IS_BASIC,                 "CLK_IS_BASIC",                 },
> -       { CLK_GET_RATE_NOCACHE,         "CLK_GET_RATE_NOCACHE",         },
> -       { CLK_SET_RATE_NO_REPARENT,     "CLK_SET_RATE_NO_REPARENT",     },
> -       { CLK_GET_ACCURACY_NOCACHE,     "CLK_GET_ACCURACY_NOCACHE",     },
> -       { CLK_RECALC_NEW_RATES,         "CLK_RECALC_NEW_RATES",         },
> -       { CLK_SET_RATE_UNGATE,          "CLK_SET_RATE_UNGATE",          },
> -       { CLK_IS_CRITICAL,              "CLK_IS_CRITICAL",              },
> -       { CLK_OPS_PARENT_ENABLE,        "CLK_OPS_PARENT_ENABLE",        },
> +#define ENTRY(f) { f, __stringify(f) }
> +       ENTRY(CLK_SET_RATE_GATE),
> +       ENTRY(CLK_SET_PARENT_GATE),
> +       ENTRY(CLK_SET_RATE_PARENT),
> +       ENTRY(CLK_IGNORE_UNUSED),
> +       ENTRY(CLK_IS_BASIC),
> +       ENTRY(CLK_GET_RATE_NOCACHE),
> +       ENTRY(CLK_SET_RATE_NO_REPARENT),
> +       ENTRY(CLK_GET_ACCURACY_NOCACHE),
> +       ENTRY(CLK_RECALC_NEW_RATES),
> +       ENTRY(CLK_SET_RATE_UNGATE),
> +       ENTRY(CLK_IS_CRITICAL),
> +       ENTRY(CLK_OPS_PARENT_ENABLE),
> +#undef ENTRY
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
