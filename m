Return-Path: <ralph.sennhauser@gmail.com>
Return-Path: <ralph.sennhauser@gmail.com>
Date: Wed, 24 May 2017 17:02:12 +0200
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: linux-clk@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: mvebu: add support for 1866MHz variants
Message-ID: <20170524170212.0ffd2b16@gmail.com>
In-Reply-To: <878tlmwekd.fsf@free-electrons.com>
References: <20170523210106.16307-1-ralph.sennhauser@gmail.com>
	<878tlmwekd.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Wed, 24 May 2017 15:48:50 +0200
Gregory CLEMENT <gregory.clement@free-electrons.com> wrote:

> Hi Ralph,
>  
>  On mar., mai 23 2017, Ralph Sennhauser <ralph.sennhauser@gmail.com>
> wrote:
> 
> Adding a word about the fact this patch is for the armada 38x SoC in
> the title would be nice.

Agreed.

> 
> > The Linksys WRT3200ACM CPU is clocked at 1866MHz. Add 1866MHz to the
> > list of supported CPU frequencies. Also update multiplier and
> > divisor for the l2clk and ddrclk.
> >
> > Noticed by the following warning:
> > [    0.000000] Selected CPU frequency (16) unsupported  
> 
> I checked your values with the hardware datasheet and they match the
> documentation:
> 
> Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> 

Thanks for checking.

Ralph
