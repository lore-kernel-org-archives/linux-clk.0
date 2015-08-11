Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 11 Aug 2015 19:20:13 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Maxime Coquelin <maxime.coquelin@st.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, maxime.ripard@free-electrons.com,
	s.hauer@pengutronix.de, geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Message-ID: <20150811182013.GS18282@x1>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
 <20150810144811.GN3249@x1>
 <20150810185516.2416.32293@quantum>
 <20150811084329.GA13374@x1>
 <55C9C82F.6060401@st.com>
 <20150811170924.2416.97764@quantum>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20150811170924.2416.97764@quantum>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, 11 Aug 2015, Michael Turquette wrote:

> Quoting Maxime Coquelin (2015-08-11 03:02:23)
> > Hi Mike,
> > 
> > On 08/11/2015 10:43 AM, Lee Jones wrote:
> > > On Mon, 10 Aug 2015, Michael Turquette wrote:
> > >
> > >>
> > >>
> > >> ST's driver is an unfortunate case. All of the clock data was shoved
> > >> into DT before we had a clue that doing so is a terrible idea.
> > 
> > I tend to agree, and wouldn't do it this way if we could rewrite the 
> > history.
> > But now, we have to support it.
> > 
> > How can we pass CLK_ENABLE_HAND_OFF flag to a specific clock on STi 
> > platform?
> > 
> > Could we imagine having a kind of "clocks-enable-hand-off" property we 
> > could use in our clock controller DT node?
> 
> Maxime,
> 
> Yes. I'm sure that the ST binding isn't the only one that needs
> something like this. Furthermore I am sure that there are interesting
> users like the FPGA people that would love to dynamically set this flag
> from DT based on their hardware description.
> 
> So the question is, what does it look like? We've already discussed
> doing a clk-conf.c approach, but that is really meant for consumers of a
> clock to set their default parameters. I don't think that is the right
> way here.
> 
> Probably we should list the hand-off clocks directly in the
> clock-provider node itself. We can design it as a list (for
> clock-controller nodes that expose multiple clocks). In practice for the
> st,flexgen binding it will always be a list with one element in it.
> 
> In my email to Lee a few minutes ago I asked if ST actually needs to
> turn on gated clocks, or if the goal is to prevent already-on clocks
> (enabled by default out of reset, or bootloader) from being gated? I
> guess that the goal is the latter since we've been discussing "critical"
> clocks that will crash the system if disabled.

The latter is correct.  Clocks are on at boot-up.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
