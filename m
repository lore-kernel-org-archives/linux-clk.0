Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>,  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: pxa: fix building on older compilers
References: <20170915195402.1469159-1-arnd@arndb.de>
Date: Tue, 19 Sep 2017 20:46:29 +0200
In-Reply-To: <20170915195402.1469159-1-arnd@arndb.de> (Arnd Bergmann's message
	of "Fri, 15 Sep 2017 21:53:47 +0200")
Message-ID: <87y3pabk6y.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Arnd Bergmann <arnd@arndb.de> writes:

> gcc-4.4 got confused by the inline assembler statement:
>
> drivers/clk/pxa/clk-pxa.c: In function 'pxa2xx_core_turbo_switch':
> drivers/clk/pxa/clk-pxa.c:152: error: expected string literal before ')' token
>
> This removes the extraneous ':' to let all compilers parse the
> driver correctly.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
