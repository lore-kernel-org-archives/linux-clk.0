Return-Path: <maxime.coquelin@st.com>
Message-ID: <55C9DE57.2090105@st.com>
Date: Tue, 11 Aug 2015 13:36:55 +0200
From: Maxime Coquelin <maxime.coquelin@st.com>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Lee Jones <lee.jones@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, Stephen Boyd
	<sboyd@codeaurora.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>	<1438974570-20812-4-git-send-email-mturquette@baylibre.com>	<20150810144811.GN3249@x1>	<20150810185516.2416.32293@quantum>	<20150811084329.GA13374@x1>	<55C9C82F.6060401@st.com> <CAMuHMdVWxpZUQk6gUhSqA4K3gpDD8wUC6SHg6HAoiC1w=3+GLw@mail.gmail.com>
In-Reply-To: <CAMuHMdVWxpZUQk6gUhSqA4K3gpDD8wUC6SHg6HAoiC1w=3+GLw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

On 08/11/2015 12:11 PM, Geert Uytterhoeven wrote:
> Hi Maxime,
>
> On Tue, Aug 11, 2015 at 12:02 PM, Maxime Coquelin
> <maxime.coquelin@st.com> wrote:
>> How can we pass CLK_ENABLE_HAND_OFF flag to a specific clock on STi
>> platform?
> Add the flag to the relevant clocks in the C code, e.g. in
> clk_register_flexgen():
>
>          if (!strcmp(name, "clk-icn-cpu"))
>                  init.flags |= CLK_ENABLE_HAND_OFF;
The main problem I see with this proposal
>
>> Could we imagine having a kind of "clocks-enable-hand-off" property we could
>> use in our clock controller DT node?
> You can imagine doing "flex_flags |= CLK_ENABLE_HAND_OFF" in
> st_of_flexgen_setup(), depending on the presence of such a property.
Exactly, this is what I was thinking about.

>
> However, not disabling clocks is a software policy, not a hardware description,
> so IMHO it doesn't belong in DT.
>
I disagree here because if these clocks get gated the system is dead, so 
I wouldn't call this a SW Policy.
Moreover, I don't see how this property is different from 
assigned-clock-parents and assigned-clock-rates properties, which have 
been accepted.

Thanks,
Maxime
