Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Boyd <sboyd@codeaurora.org>,  Michael Turquette <mturquette@baylibre.com>,  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: pxa mark dummy helper as 'inline'
References: <20161108144950.3472058-1-arnd@arndb.de>
Date: Tue, 08 Nov 2016 18:50:44 +0100
In-Reply-To: <20161108144950.3472058-1-arnd@arndb.de> (Arnd Bergmann's message
	of "Tue, 8 Nov 2016 15:49:30 +0100")
Message-ID: <87oa1pyi6j.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Arnd Bergmann <arnd@arndb.de> writes:

> The dummy_clk_set_parent function is marked as 'static' but is
> no longer referenced from the pxa25x clk driver after the last use
> of the RATE_RO_OPS() macro is gone from this file, causing a
> harmless build warning:
>
> In file included from drivers/clk/pxa/clk-pxa25x.c:24:0:
> drivers/clk/pxa/clk-pxa.h:146:12: error: 'dummy_clk_set_parent' defined but not used [-Werror=unused-function]
>
> This marks the functon as 'inline', which lets the compiler simply
> drop it when it gets referenced.
>
> Fixes: 9fe694295098 ("clk: pxa: transfer CPU clock setting from pxa2xx-cpufreq")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
