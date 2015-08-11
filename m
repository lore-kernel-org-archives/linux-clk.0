Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 11 Aug 2015 19:17:13 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Maxime Coquelin <maxime.coquelin@st.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Message-ID: <20150811181713.GR18282@x1>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
 <20150810144811.GN3249@x1>
 <20150810185516.2416.32293@quantum>
 <20150811084329.GA13374@x1>
 <55C9C82F.6060401@st.com>
 <CAMuHMdVWxpZUQk6gUhSqA4K3gpDD8wUC6SHg6HAoiC1w=3+GLw@mail.gmail.com>
 <20150811170928.2416.70005@quantum>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20150811170928.2416.70005@quantum>
List-ID: <linux-clk.vger.kernel.org>

On Tue, 11 Aug 2015, Michael Turquette wrote:

> Quoting Geert Uytterhoeven (2015-08-11 03:11:05)
> > Hi Maxime,
> > 
> > On Tue, Aug 11, 2015 at 12:02 PM, Maxime Coquelin
> > <maxime.coquelin@st.com> wrote:
> > > How can we pass CLK_ENABLE_HAND_OFF flag to a specific clock on STi
> > > platform?
> > 
> > Add the flag to the relevant clocks in the C code, e.g. in
> > clk_register_flexgen():
> > 
> >         if (!strcmp(name, "clk-icn-cpu"))
> >                 init.flags |= CLK_ENABLE_HAND_OFF;
> > 
> > > Could we imagine having a kind of "clocks-enable-hand-off" property we could
> > > use in our clock controller DT node?
> > 
> > You can imagine doing "flex_flags |= CLK_ENABLE_HAND_OFF" in
> > st_of_flexgen_setup(), depending on the presence of such a property.
> 
> This is precisely what Lee is trying to avoid. The would constitute a
> hand-rolled, open-code, gather-and-mark exercise that drivers would have
> to re-invent each time. (rough paraphrase of what Lee said)

Thanks.

> I think that we can come up with a reasonable DT wrapper around the
> flag. I will be ecstatic if we can agree that the meaning of the flag
> can be tweaked just a bit to mean, "prevent this critical clock from
> being disabled, as it was enabled out of reset or by the bootloader,
> until a driver claims it and calls clk_prepare_enable".

Easy, how about:

'prevent_this_critical_clock_from_being_disabled_as_it_was_enabled_out_of_reset_or_by_the_bootloader_until_a_driver_claims_it_and_calls_clk_prepare_enable'

Or

I could come up with something else?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
