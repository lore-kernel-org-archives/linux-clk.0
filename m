Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] clk: pxa: pxa3xx: fix CKEN register access
References: <1438631907-27993-1-git-send-email-robert.jarzmik@free.fr>
	<55C00A6B.2030508@codeaurora.org> <87h9ofmv2n.fsf@belgarion.home>
	<55C0FD5E.7000705@codeaurora.org>
Date: Tue, 04 Aug 2015 20:33:42 +0200
In-Reply-To: <55C0FD5E.7000705@codeaurora.org> (Stephen Boyd's message of
	"Tue, 04 Aug 2015 10:58:54 -0700")
Message-ID: <874mkenbsp.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 08/03/2015 11:22 PM, Robert Jarzmik wrote:
>> Stephen Boyd <sboyd@codeaurora.org> writes:
>>
>>> On 08/03/2015 12:58 PM, Robert Jarzmik wrote:
>>>> Clocks 0 to 31 are on CKENA, and not CKENB. The clock register names
>>>> were inadequately inverted. As a consequence, all clock operations were
>>>> happening on CKENB, because almost all but 2 clocks are on CKENA.
>>>>
>>>> As the clocks were activated by the bootloader in the former tests, it
>>>> escaped the testing that the wrong clock gate was manipulated. The error
>>>> was revealed by changing the pxa3xx-and driver to a module, where tupon
>>>> unloading the wrong clock was disabled in CKENB.
>>>>
>>>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>>>> ---
>>> Did you want a fixes tag to send this back to stable?
>> Ah yes, good point, v2 on its way.
>>
>> Stephen and Mike, do you think this can still get in -rc6 ?
>>
>
> It's not a new regression for v4.2 so we'll leave it to v4.3. I'll apply it to
> clk-next.
Euh how so, not "new" ?

The clock switch for pxa architecture happens just now, on v4.2, see [1]. So the
regression wasn't here on v4.1, but is introduced in v4.2

I know I'm terribly late, but isn't it still possible to have it in v4.2 ?

-- 
Robert

[1] Commit triggering the error
commit 7448adca9361
Merge: e3abcb25d2ae 64227114c676
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Fri May 15 17:40:15 2015 +0200

    Merge tag 'pxa-for-4.2' of https://github.com/rjarzmik/linux into next/soc
    
    Merge "pxa changes for v4.2 cycle" from Robert Jarzmik:
    
    The main and only feature is the conversion of all pxa variants to clock
    framework. This encompasses pxa25x, pxa27x and pxa3xx, for all boards.
    
    This should be a disruptive cycle in the normally quiet pxa history, as
    the change can break any platform, and the test were performed on only 4
    boards (lubbock, zylonite, mioa701, cm-x300).
