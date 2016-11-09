Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Boyd <sboyd@codeaurora.org>,  Michael Turquette <mturquette@baylibre.com>,  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: pxa: fix pxa2xx_determine_rate return
References: <20161108144950.3472058-1-arnd@arndb.de>
	<20161108144950.3472058-2-arnd@arndb.de>
	<87k2cdyhnu.fsf@belgarion.home> <2012366.hMim84DLbv@wuerfel>
Date: Wed, 09 Nov 2016 08:31:37 +0100
In-Reply-To: <2012366.hMim84DLbv@wuerfel> (Arnd Bergmann's message of "Tue, 08
	Nov 2016 23:22:40 +0100")
Message-ID: <871sylw1ly.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Arnd Bergmann <arnd@arndb.de> writes:

> On Tuesday, November 8, 2016 7:01:57 PM CET Robert Jarzmik wrote:
>> Arnd Bergmann <arnd@arndb.de> writes:
>> If a non-exact match is found, either by closest_below or closest_above, rate is
>> set (rate = freqs[closest_xxx].cpll). And a couple of lines later after the
>> if/else, req->rate = rate is set as well, so I don't think this part of the
>> commit message is accurate.
>
> It is only set if rate is zero, and that normally is not the case here:
>
>        if (!rate)
>                req->rate = rate;
Ah ok, that's where the bug was lurking, if should have been "if (rate)".

But anyway, after comparing the end result of your code and mine, I find yours
more maintainable, especially the replacement of 'ret = 0'.

So let's proceed, thanks for finding this one out.
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

--
Robert
