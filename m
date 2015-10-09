Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Subject: Re: [PATCH] clk: add support for Sigma Designs SMP86xx/87xx clocks
To: Mans Rullgard <mans@mansr.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
References: <1444394121-9587-1-git-send-email-mans@mansr.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Mason <slash.tmp@free.fr>
Message-ID: <5617EE61.6080805@sigmadesigns.com>
Date: Fri, 9 Oct 2015 18:42:09 +0200
MIME-Version: 1.0
In-Reply-To: <1444394121-9587-1-git-send-email-mans@mansr.com>
Content-Type: text/plain; charset="ISO-8859-1"
List-ID: <linux-clk.vger.kernel.org>

On 09/10/2015 14:35, Mans Rullgard wrote:

> This adds support for most of the clocks in the Sigma Designs
> SMP86xx (tango3) and SMP87xx (tango4) chips.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
> I'm sending this now to avoid the maintainers wasting more time reviewing
> the woefully incomplete patch that was posted earlier this week.  Unlike
> that patch, this driver accurately represents the various PLLs, muxes,
> and dividers, allowing it to work correctly across all the chip variants.
> That said, this patch still needs some work, which is why I have not posted
> it sooner.  Obvious shortcomings off the top of my head:
> - DT binding documentation is missing
> - Most clocks are mostly read-only
> - Some control register fields are ignored (lack of documentation)

As the author of the supposedly "woefully incomplete patch that was posted
earlier this week", thanks for having CCed me in the discussion...

Your driver comes in at 656 lines. Mine is 60 lines (give or take).

Having access to the (incomplete) documentation, the Verilog code,
and the HW engineer who wrote the clock generator, I have told you
that your driver was unnecessarily complex because it made use of
features that were either not used (such as the post-dividers) or
disabled because of a HW bug (like the sysclk_mux divider).

But somehow, you know better, and your driver handles everything
that my driver cannot...

Could you perhaps be more specific (this is a technical mailing list
after all) so that I may address your concerns one by one?

Regards.
