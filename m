Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1513627578.29566.6.camel@baylibre.com>
Subject: Re: [PATCH] clk: check ops pointer on clock register
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 18 Dec 2017 21:06:18 +0100
In-Reply-To: <20171218190303.GV7997@codeaurora.org>
References: <20171218170007.28042-1-jbrunet@baylibre.com>
	 <20171218190303.GV7997@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2017-12-18 at 11:03 -0800, Stephen Boyd wrote:
> On 12/18, Jerome Brunet wrote:
> > Nothing really prevents a provider from (trying to) register a clock
> > without providing the clock ops structure.
> > 
> > We do check the individual fields before using them, but not the
> > structure pointer itself. This may have the usual nasty consequences when
> > the pointer is dereferenced, mostly likely when checking one the field
> > during the initialization.
> 
> Yes, that nasty consequence should be a kernel oops,

Precisely

> and the
> developer should notice that before submitting the driver for
> inclusion. 

Agreed. But people may make mistakes, which is why (at least partly) we
do checks, isn't it ?

> I don't think we really care to return an error here
> if this happens.
> 

I don't understand why we would let a oops happen when can catch the error
properly ?
