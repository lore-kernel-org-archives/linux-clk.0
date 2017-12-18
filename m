Return-Path: <sboyd@codeaurora.org>
Date: Mon, 18 Dec 2017 13:06:39 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: check ops pointer on clock register
Message-ID: <20171218210639.GX7997@codeaurora.org>
References: <20171218170007.28042-1-jbrunet@baylibre.com>
 <20171218190303.GV7997@codeaurora.org>
 <1513627578.29566.6.camel@baylibre.com>
 <CAEG3pNBi13BCPcftf=mj5LJh3JQQi+Q7C5QLZwoy6LG__krJXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAEG3pNBi13BCPcftf=mj5LJh3JQQi+Q7C5QLZwoy6LG__krJXA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/18, Michael Turquette wrote:
> Hi Jerome & Stephen,
> 
> On Mon, Dec 18, 2017 at 12:06 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > On Mon, 2017-12-18 at 11:03 -0800, Stephen Boyd wrote:
> >> On 12/18, Jerome Brunet wrote:
> >> > Nothing really prevents a provider from (trying to) register a clock
> >> > without providing the clock ops structure.
> >> >
> >> > We do check the individual fields before using them, but not the
> >> > structure pointer itself. This may have the usual nasty consequences when
> >> > the pointer is dereferenced, mostly likely when checking one the field
> >> > during the initialization.
> >>
> >> Yes, that nasty consequence should be a kernel oops,
> >
> > Precisely
> >
> >> and the
> >> developer should notice that before submitting the driver for
> >> inclusion.
> >
> > Agreed. But people may make mistakes, which is why (at least partly) we
> > do checks, isn't it ?
> 
> Agreed the developers should test before submitting, but procedurally
> generated clocks (e.g. registering clocks in a loop using a
> predictable register map, etc) could lead to a situation where a
> developer doesn't test every possible iteration.
> 
> Hypothetical, but easy easy easy to fix with Jerome's patch.
> 
> >
> >> I don't think we really care to return an error here
> >> if this happens.
> >>
> >
> > I don't understand why we would let a oops happen when can catch the error
> > properly ?
> >
> 
> Agreed with Jerome on this one.
> 
> Let's flip it on its head: any downside to this patch? If not I can merge.
> 

If code is not checking return values from clk_register(), then
an oops turns into a silently ignored error. Hunting that down is
going to take some time vs. an oops when we attempt to call the
clk ops that aren't there.

The idea is fine, but I would change two things. First I would
throw a WARN_ON() around the condition so developers notice
quicker that something is wrong, and second I would strip off the
'Fixes' tag because this isn't really fixing anything that we
need to backport to stable trees. It just converts an oops into a
warning.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
