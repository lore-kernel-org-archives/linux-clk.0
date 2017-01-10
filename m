Return-Path: <sboyd@codeaurora.org>
Date: Mon, 9 Jan 2017 16:23:27 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] clk: vc5: Add support for IDT VersaClock 5P49V5923B
Message-ID: <20170110002327.GI17126@codeaurora.org>
References: <20161228000045.4540-1-marek.vasut@gmail.com>
 <2015482.2Xx0FSfo4q@avalon>
 <a94799ce-0030-ee4b-3d07-b3c190d79ba5@gmail.com>
 <7398143.JfNZUDgVyk@avalon>
 <69c22af5-717c-ce9d-5f4c-c1751894b885@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <69c22af5-717c-ce9d-5f4c-c1751894b885@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/05, Marek Vasut wrote:
> On 01/05/2017 03:13 PM, Laurent Pinchart wrote:
> > Hi Marek,
> 
> Hi!
> 
> [...]
> 
> >>>>> +static unsigned long vc5_mux_recalc_rate(struct clk_hw *hw,
> >>>>> +                                        unsigned long parent_rate)
> >>>>> +{
> >>>>> +       struct vc5_driver_data *vc5 =
> >>>>> +               container_of(hw, struct vc5_driver_data, clk_mux);
> >>>>> +       unsigned long idiv;
> >>>>> +       u8 div;
> >>>>> +
> >>>>> +       /* FIXME: Needs locking ? */
> >>>
> >>> Let's fix it then :-)
> >>
> >> I would like to get feedback on this one, does it ?
> > 
> > That's a question for Mike or Stephen I believe.
> 
> OK

What's the question?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
