Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,  Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v2] clk: pxa: pxa3xx: fix CKEN register access
References: <1438669293-6033-1-git-send-email-robert.jarzmik@free.fr>
	<20150807235515.GF16477@codeaurora.org>
Date: Sat, 08 Aug 2015 09:34:44 +0200
In-Reply-To: <20150807235515.GF16477@codeaurora.org> (Stephen Boyd's message
	of "Fri, 7 Aug 2015 16:55:15 -0700")
Message-ID: <87614qkzcb.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 08/04, Robert Jarzmik wrote:
>> Clocks 0 to 31 are on CKENA, and not CKENB. The clock register names
>> were inadequately inverted. As a consequence, all clock operations were
>> happening on CKENB, because almost all but 2 clocks are on CKENA.
>> 
>> As the clocks were activated by the bootloader in the former tests, it
>> escaped the testing that the wrong clock gate was manipulated. The error
>> was revealed by changing the pxa3xx-and driver to a module, where tupon
>> unloading the wrong clock was disabled in CKENB.
>> 
>> Fixes: 9bbb8a338fb2 ("clk: pxa: add pxa3xx clock driver")
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>> ---
>
> Applied to clk-fixes. Sorry, got busy last few days.
Thanks Stephen !

Cheers.

-- 
Robert
