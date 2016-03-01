Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH 11/41] clk: pxa: Remove CLK_IS_ROOT
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
	<1456858826-28541-12-git-send-email-sboyd@codeaurora.org>
Date: Tue, 01 Mar 2016 20:27:47 +0100
In-Reply-To: <1456858826-28541-12-git-send-email-sboyd@codeaurora.org>
	(Stephen Boyd's message of "Tue, 1 Mar 2016 10:59:56 -0800")
Message-ID: <87a8miq9qk.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Stephen Boyd <sboyd@codeaurora.org> writes:

> This flag is a no-op now. Remove usage of the flag.
>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/pxa/clk-pxa25x.c | 8 +++-----
>  drivers/clk/pxa/clk-pxa27x.c | 6 +++---
>  drivers/clk/pxa/clk-pxa3xx.c | 8 ++++----
>  3 files changed, 10 insertions(+), 12 deletions(-)
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
