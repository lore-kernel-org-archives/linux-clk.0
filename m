Return-Path: <slemieux.tyco@gmail.com>
Return-Path: <slemieux.tyco@gmail.com>
Subject: Re: [PATCH 1/2] clk: lpc32xx: add clock frequency output
 configuration
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, stigge@antcom.de,
 vz@mleia.com,  devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20160209185723.GC31947@codeaurora.org>
References: <1455043670-19025-1-git-send-email-slemieux.tyco@gmail.com>
	 <20160209185723.GC31947@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Feb 2016 15:00:04 -0500
Message-ID: <1455048004.19294.1.camel@localhost>
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2016-02-09 at 10:57 -0800, Stephen Boyd wrote:
> On 02/09, slemieux.tyco@gmail.com wrote:
> > From: Sylvain Lemieux <slemieux@tycoint.com>
> > 
> > This patch add the support to setup the clock frequency output
> > using an optional parameter from the device tree.
> > 
> > The previous kernel version did not change the clock frequency
> > output setup by the kickstart and/or bootloader;
> > this version always setup the clock frequency output to 208MHz.
> > 
> > Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> > ---
> 
> We have assigned-clock-rates, can you use that instead?
> 
I will submit a version 2 with this change tomorrow.
