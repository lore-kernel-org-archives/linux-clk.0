Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <55C9DF7B.4040308@st.com>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
	<1438974570-20812-4-git-send-email-mturquette@baylibre.com>
	<20150810144811.GN3249@x1>
	<20150810185516.2416.32293@quantum>
	<20150811084329.GA13374@x1>
	<55C9C82F.6060401@st.com>
	<CAMuHMdVWxpZUQk6gUhSqA4K3gpDD8wUC6SHg6HAoiC1w=3+GLw@mail.gmail.com>
	<55C9DE57.2090105@st.com>
	<55C9DF7B.4040308@st.com>
Date: Tue, 11 Aug 2015 13:49:09 +0200
Message-ID: <CAMuHMdVvS2n=J5paZzXdtD0vZ4Q4m9k7XeF_MF1zV4pD-nk9aw@mail.gmail.com>
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

On Tue, Aug 11, 2015 at 1:41 PM, Maxime Coquelin <maxime.coquelin@st.com> wrote:
> On 08/11/2015 01:36 PM, Maxime Coquelin wrote:
>> On 08/11/2015 12:11 PM, Geert Uytterhoeven wrote:
>>> On Tue, Aug 11, 2015 at 12:02 PM, Maxime Coquelin
>>> <maxime.coquelin@st.com> wrote:
>>>> How can we pass CLK_ENABLE_HAND_OFF flag to a specific clock on STi
>>>> platform?
>>>
>>> Add the flag to the relevant clocks in the C code, e.g. in
>>> clk_register_flexgen():
>>>
>>>          if (!strcmp(name, "clk-icn-cpu"))
>>>                  init.flags |= CLK_ENABLE_HAND_OFF;
>
> The main problem I see with this proposal is that clk_register_flexgen() is
> called for several SoCs (STiH407/410/418...).
> Each of these SoCs have this clock, but maybe STiH407 will need the flag,
> but not STiH410 and STiH418.
> So I think the best place to set this information is in DT, where the
> differentiation is made between the SoCs.

If (of_machine_is_compatible("st,stih410")) ...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
