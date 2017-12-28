Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Igor Grinberg <grinberg@compulab.co.il>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>,  linux-clk@vger.kernel.org,  Haojian Zhuang <haojian.zhuang@gmail.com>,  Daniel Mack <daniel@zonque.org>,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: pxa: unbreak lookup of CLK_POUT
References: <20171226133036.11432-1-grinberg@compulab.co.il>
Date: Thu, 28 Dec 2017 08:59:11 +0100
In-Reply-To: <20171226133036.11432-1-grinberg@compulab.co.il> (Igor Grinberg's
	message of "Tue, 26 Dec 2017 15:30:36 +0200")
Message-ID: <87vagr706o.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Igor Grinberg <grinberg@compulab.co.il> writes:

> Since switching to clk drivers, the CLK_POUT cannot be searched for by
> clk_get() API and thus it returns with ENOENT.
> Register it with the clk_lookup and thus unbreak the users of it.
>
> Signed-off-by: Igor Grinberg <grinberg@compulab.co.il>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
