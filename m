Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 "Maxime Coquelin" <maxime.coquelin@st.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <CAMuHMdVWxpZUQk6gUhSqA4K3gpDD8wUC6SHg6HAoiC1w=3+GLw@mail.gmail.com>
Cc: "Lee Jones" <lee.jones@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Maxime Ripard" <maxime.ripard@free-electrons.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
 <20150810144811.GN3249@x1> <20150810185516.2416.32293@quantum>
 <20150811084329.GA13374@x1> <55C9C82F.6060401@st.com>
 <CAMuHMdVWxpZUQk6gUhSqA4K3gpDD8wUC6SHg6HAoiC1w=3+GLw@mail.gmail.com>
Message-ID: <20150811170928.2416.70005@quantum>
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Date: Tue, 11 Aug 2015 10:09:28 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Geert Uytterhoeven (2015-08-11 03:11:05)
> Hi Maxime,
> =

> On Tue, Aug 11, 2015 at 12:02 PM, Maxime Coquelin
> <maxime.coquelin@st.com> wrote:
> > How can we pass CLK_ENABLE_HAND_OFF flag to a specific clock on STi
> > platform?
> =

> Add the flag to the relevant clocks in the C code, e.g. in
> clk_register_flexgen():
> =

>         if (!strcmp(name, "clk-icn-cpu"))
>                 init.flags |=3D CLK_ENABLE_HAND_OFF;
> =

> > Could we imagine having a kind of "clocks-enable-hand-off" property we =
could
> > use in our clock controller DT node?
> =

> You can imagine doing "flex_flags |=3D CLK_ENABLE_HAND_OFF" in
> st_of_flexgen_setup(), depending on the presence of such a property.

This is precisely what Lee is trying to avoid. The would constitute a
hand-rolled, open-code, gather-and-mark exercise that drivers would have
to re-invent each time. (rough paraphrase of what Lee said)

I think that we can come up with a reasonable DT wrapper around the
flag. I will be ecstatic if we can agree that the meaning of the flag
can be tweaked just a bit to mean, "prevent this critical clock from
being disabled, as it was enabled out of reset or by the bootloader,
until a driver claims it and calls clk_prepare_enable".

Then everyone should be happy.

Regards,
Mike

> =

> However, not disabling clocks is a software policy, not a hardware descri=
ption,
> so IMHO it doesn't belong in DT.
> =

> Gr{oetje,eeting}s,
> =

>                         Geert
> =

> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
> =

> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
