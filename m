Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <55C9C82F.6060401@st.com>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
	<1438974570-20812-4-git-send-email-mturquette@baylibre.com>
	<20150810144811.GN3249@x1>
	<20150810185516.2416.32293@quantum>
	<20150811084329.GA13374@x1>
	<55C9C82F.6060401@st.com>
Date: Tue, 11 Aug 2015 12:11:05 +0200
Message-ID: <CAMuHMdVWxpZUQk6gUhSqA4K3gpDD8wUC6SHg6HAoiC1w=3+GLw@mail.gmail.com>
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maxime Coquelin <maxime.coquelin@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Maxime,

On Tue, Aug 11, 2015 at 12:02 PM, Maxime Coquelin
<maxime.coquelin@st.com> wrote:
> How can we pass CLK_ENABLE_HAND_OFF flag to a specific clock on STi
> platform?

Add the flag to the relevant clocks in the C code, e.g. in
clk_register_flexgen():

        if (!strcmp(name, "clk-icn-cpu"))
                init.flags |= CLK_ENABLE_HAND_OFF;

> Could we imagine having a kind of "clocks-enable-hand-off" property we could
> use in our clock controller DT node?

You can imagine doing "flex_flags |= CLK_ENABLE_HAND_OFF" in
st_of_flexgen_setup(), depending on the presence of such a property.

However, not disabling clocks is a software policy, not a hardware description,
so IMHO it doesn't belong in DT.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
