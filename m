Return-Path: <ralph.sennhauser@gmail.com>
Return-Path: <ralph.sennhauser@gmail.com>
Date: Thu, 1 Jun 2017 22:11:20 +0200
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Michael Turquette
 <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: mvebu: armada-38x: add support for 1866MHz
 variants
Message-ID: <20170601221120.5f396b80@gmail.com>
In-Reply-To: <20170601072511.GR20170@codeaurora.org>
References: <20170524145852.9077-1-ralph.sennhauser@gmail.com>
	<20170601072511.GR20170@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Thu, 1 Jun 2017 00:25:11 -0700
Stephen Boyd <sboyd@codeaurora.org> wrote:

> On 05/24, Ralph Sennhauser wrote:
> > The Linksys WRT3200ACM CPU is clocked at 1866MHz. Add 1866MHz to the
> > list of supported CPU frequencies. Also update multiplier and
> > divisor for the l2clk and ddrclk.
> > 
> > Noticed by the following warning:
> > [    0.000000] Selected CPU frequency (16) unsupported
> > 
> > Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
> > Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> > ---
> > 
> > Hi everyone,
> > 
> > This patch was part of a series adding support for the Linksys
> > WRT3200ACM which got merged already. This patch is the reminder and
> > intended for 4.13.
> > 
> > Thanks
> > Ralph
> > ---
> > 
> > Changes since v2:
> > 
> >   - Add armada-38x tag to subject  
> 
> OK sure I'll do that manually.
> 

Thanks
Ralph
