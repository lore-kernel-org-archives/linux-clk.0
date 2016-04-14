Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp5-g21.free.fr ([212.27.42.5]:41086 "EHLO smtp5-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752627AbcDNSOk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 14 Apr 2016 14:14:40 -0400
Date: Thu, 14 Apr 2016 20:14:28 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@csie.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: Accept a greater rate when setting a parent
 clock
Message-Id: <20160414201428.0c89d3b943db543c3ab08740@free.fr>
In-Reply-To: <20160414172400.GR4005@lukather>
References: <20160310081658.B749246B@mail.free-electrons.com>
	<20160321072546.GT30977@lukather>
	<20160321092549.4e6245e4f02839e29aeb86a9@free.fr>
	<56FC3BEB.8030106@elopez.com.ar>
	<20160414172400.GR4005@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, 14 Apr 2016 19:24:00 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> > >> That being said, we had a similar discussion for SPI around a month
> > >> ago where we wanted a rate strictly lower than the requested one. I
> > >> guess it's time to add a flag to tell how you want to round.
> > > 
> > > You are right, I just removed half of the constraint, but I still wonder
> > > why does this sequence introduced by the commit 862b728387aef3a37
> > > (clk: sunxi: factors: automatic reparenting support) do
> > > 	"provide the fastest rate <= rate"
> > > instead of
> > > 	"provide the closest rate" ?
> > > 
> > > Emilio?
> > 
> > Overclocking components is usually not a good default in my opinion. I
> > don't recall at the moment if there was some other justification apart
> > from playing it safe.
> 
> Yeah, I'd agree, it should be the exception rather than the norm. In
> some cases that are very timings sensitive (audio or video), we
> probably want to enforce something as close as possible to the
> expected rate, even if it trips above the rate.
> 
> For all the other, I'd prefer to keep the current behaviour.

OK, then, as I have no solution for this clock, there will be no audio
44.1KHz from the H3...

-- 
Ken ar c'hentañ	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
