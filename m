Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: pxa: Use __iomem properly and staticize lock variable
References: <20161108224756.25842-1-sboyd@codeaurora.org>
Date: Wed, 09 Nov 2016 21:18:03 +0100
In-Reply-To: <20161108224756.25842-1-sboyd@codeaurora.org> (Stephen Boyd's
	message of "Tue, 8 Nov 2016 14:47:56 -0800")
Message-ID: <87shr0v24k.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Stephen Boyd <sboyd@codeaurora.org> writes:

> This function is passed an __iomem pointer but we use a u32
> pointer instead which makes checkers like spare complain.
> Furthermore, "lock" is a pretty poor variable name for a string
> that will go into lockdep reports and the symbol isn't marked
> static. Cleanup all this.
>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
Most certainly.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
