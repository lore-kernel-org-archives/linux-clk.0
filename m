Return-Path: <scottwood@freescale.com>
Message-ID: <1439621017.15601.23.camel@freescale.com>
Subject: Re: [RFC PATCH 0/8] clk: qoriq: Move chip-specific knowledge into
 driver
From: Scott Wood <scottwood@freescale.com>
To: Michael Turquette <mturquette@linaro.org>
CC: Tang Yuantian <Yuantian.Tang@freescale.com>, "Rafael J. Wysocki"
	<rjw@rjwysocki.net>, Liberman Igal-B31950 <Igal.Liberman@freescale.com>,
	Bucur Madalin-Cristian-B32716 <madalin.bucur@freescale.com>,
	<linux-clk@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>
Date: Sat, 15 Aug 2015 01:43:37 -0500
In-Reply-To: <20150811182535.31346.52965@quantum>
References: <1434682158-7243-1-git-send-email-scottwood@freescale.com>
	 <20150811182535.31346.52965@quantum>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: scottwood@freescale.com
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2015-08-11 at 11:25 -0700, Michael Turquette wrote:
> Hi Scott,
> 
> Quoting Scott Wood (2015-06-18 19:49:10)
> > The existing device tree bindings are error-prone and inflexible. 
> > Correct the mistake by moving the knowledge into the driver, which
> > has more flexibility in describing the quirks of each chip.  This leaves
> > the device tree to its proper role of identifying a programming interface
> > rather than describing its individual registers.
> 
> Sorry for not responding to this one sooner. Fell through the cracks.
> 
> All of the changes to drives/clk/clk-qoriq.c look great to me. I assume
> you need to keep all of these patches together and want to the take
> through the freescale tree? If so feel free to add,
> 
> Acked-by: Michael Turquette <mturquette@baylibre.com>

I just sent a non-RFC v2, with improved compatibility with old device trees 
(especially ls1021a).  It depends on the cpufreq patch though (at least, to 
avoid breaking qoriq-cpufreq until that patch is merged), so I'll also need 
an ack from Rafael for that if I'm taking it through my tree.

-Scott
