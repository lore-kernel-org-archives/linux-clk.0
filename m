Return-Path: <slemieux.tyco@gmail.com>
Return-Path: <slemieux.tyco@gmail.com>
Subject: Re: [PATCH] clk: lpc32xx: do not prepare clock "0"
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, stigge@antcom.de, vz@mleia.com,
 linux-clk@vger.kernel.org
In-Reply-To: <20160209190309.GD31947@codeaurora.org>
References: <1455042550-18766-1-git-send-email-slemieux.tyco@gmail.com>
	 <20160209190309.GD31947@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Feb 2016 15:11:07 -0500
Message-ID: <1455048667.19294.5.camel@localhost>
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2016-02-09 at 11:03 -0800, Stephen Boyd wrote:
> On 02/09, slemieux.tyco@gmail.com wrote:
> > From: Sylvain Lemieux <slemieux@tycoint.com>
> > 
> > The following errors are display in the console during the power-on:
> > [    0.000000] lpc32xx_usb_clk_init: failed to register (null) clock: -12
> > [    0.000000] lpc32xx_clk_init: failed to register (null) clock: -12
> > 
> > There is no need to prepare clock "0"; the first clock used is 1;
> > 
> > Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> > ---
> 
> Do you mean register instead of prepare? Change looks ok
> otherwise.
> 
Should read register in the description;
I will submit a new version of the patch tomorrow.
