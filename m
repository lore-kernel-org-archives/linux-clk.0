Return-Path: <sboyd@codeaurora.org>
Date: Tue, 20 Dec 2016 14:55:52 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2] clk: renesas: mstp: Support 8-bit registers for
 r7s72100
Message-ID: <20161220225552.GE5423@codeaurora.org>
References: <20161215170027.28411-1-chris.brandt@renesas.com>
 <CAMuHMdXxiH5ryerpCnDirOXf=b-Gw5R8gJrj4Kk8NmM_3FYBqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMuHMdXxiH5ryerpCnDirOXf=b-Gw5R8gJrj4Kk8NmM_3FYBqw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/19, Geert Uytterhoeven wrote:
> Hi Chris, Mike, Stephen,
> 
> On Thu, Dec 15, 2016 at 6:00 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> > The RZ/A1 is different than the other Renesas SOCs because the MSTP
> > registers are 8-bit instead of 32-bit and if you try writing values as
> > 32-bit nothing happens...meaning this driver never worked for r7s72100.
> 
> Thanks for your patch!
> 
> The only reason it ever worked was that almost all module clocks are
> enabled at boot time...
> 
> > Fixes: b6face404f38 ("ARM: shmobile: r7s72100: add essential clock nodes to dtsi")
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Mike/Stephen: as this is a fix for stable (v3.16+), can you please take it
> directly?

Sure, is it a fix for something that has been exposed as a
problem in this merge window? Just trying to gauge the urgency of
merging this.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
