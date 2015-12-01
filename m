Return-Path: <sboyd@codeaurora.org>
Date: Mon, 30 Nov 2015 16:49:46 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] clk: split of_clk_get_parent_name() into two
 functions
Message-ID: <20151201004946.GD17532@codeaurora.org>
References: <1448004981-11133-1-git-send-email-yamada.masahiro@socionext.com>
 <1448004981-11133-3-git-send-email-yamada.masahiro@socionext.com>
 <20151121003702.GC28998@codeaurora.org>
 <CAK7LNATR3Y0T5XEGA4WQJksTO7qoCEjR+TKC0YmvVUZhLdiPSg@mail.gmail.com>
 <CAK7LNATzraLEavLGHR0c1-0J1-CzvCsfgW1URitAFOnej7+-Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAK7LNATzraLEavLGHR0c1-0J1-CzvCsfgW1URitAFOnej7+-Ug@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/24, Masahiro Yamada wrote:
> Hi Stephen,
> 
> 
> 2015-11-22 14:44 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> > Hi Stephen,
> >
> >
> > 2015-11-21 9:37 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> >> On 11/20, Masahiro Yamada wrote:
> >>> Currently, there is no function to get the clock name of the given
> >>> node.  Create a new helper function, of_clk_get_name().  This is
> >>> useful to get the clock name where "clock-indices" property is used.
> >>>
> >>>   of_clk_get_name(): get the clock name in the given node
> >>>   of_clk_get_parent_name(): get the name of the parent clock
> >>>
> >>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >>> ---
> >>>
> >>> I want to use of_clk_get_name() for my clk drivers for my SoCs,
> >>> which I will submit later.
> >>>
> >>> I found this helper function is useful.
> >>
> >> I don't see how this is useful. Is the new driver so generic it
> >> doesn't know what clocks it's outputting? We've been trying to
> >> move people away from using clock-output-names, so most likely
> >> this sort of information should be conveyed from DT via the
> >> compatible string and a table in the driver that matches up the
> >> compatible string with the list of clock names.
> >
> >
> > What I implemented in my driver was:
> >
> > [1] Use the clock names built in the driver, if "clock-output-names"
> >     is missing in the DT.
> >
> > [2] If "clock-output-names" is specified, the driver overrides
> >     the clock names, respecting the "clock-output-names".
> >
> >
> > The following is a snippet from my driver code.
> >
> >
> >     /*
> >      * update the clock name with the one provided by
> >      * clock-output-names property, if exists
> >      */
> >     new_name = of_clk_get_name(np, index);
> >     if (new_name)
> >             init_data[i].name = new_name;
> >     else
> >             pr_info("DT does not specify output name for %s[%d]\n",
> >                     np->name, index);
> >
> >
> > I read the Documentation/devicetree/bindings/clock-bindings.txt
> > before I stared my driver development.
> >
> > I did not know we are deprecating the "clock-output-names".
> > (Should it be mentioned in the clock-bindings.txt?)
> 
> 
> 
> 
> Please let me clarify the driver implementation guideline.
> 
> [1] Do not add "clock-output-names" in new device trees.
> [2] New clock drivers should not rely on "clock-output-names" at all.
> 
> 
> Is this correct?
> 

Seems a little extreme, but yes, we would like to see clock
provider drivers stop using clock-output-names. The binding isn't
deprecated, so we shouldn't say that in the binding document, but
perhaps we could add a comment that it's strongly suggested that
another way be found.

The only use I can think of is for something like fixed rate
clocks or other pure DT described clocks that want to tell us
their name. But the end goal is to make that irrelevant by using
something besides strings (or at least, user definded strings) to
describe the linkages between clocks in the clock tree. When this
is done, the clock-output-names property will be unused.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
