Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,  Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] clk: pxa: pxa3xx: fix CKEN register access
References: <1438631907-27993-1-git-send-email-robert.jarzmik@free.fr>
	<55C00A6B.2030508@codeaurora.org> <87h9ofmv2n.fsf@belgarion.home>
	<55C0FD5E.7000705@codeaurora.org> <874mkenbsp.fsf@belgarion.home>
	<55C10BC3.9080204@codeaurora.org>
Date: Tue, 04 Aug 2015 21:05:54 +0200
In-Reply-To: <55C10BC3.9080204@codeaurora.org> (Stephen Boyd's message of
	"Tue, 04 Aug 2015 12:00:19 -0700")
Message-ID: <87zj26lvql.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 08/04/2015 11:33 AM, Robert Jarzmik wrote:
>> Stephen Boyd <sboyd@codeaurora.org> writes:
>>
>>> On 08/03/2015 11:22 PM, Robert Jarzmik wrote:
>>>> Stephen Boyd <sboyd@codeaurora.org> writes:
>>>>
>>>>> On 08/03/2015 12:58 PM, Robert Jarzmik wrote:
>>>>>> Clocks 0 to 31 are on CKENA, and not CKENB. The clock register names
>>>>>> were inadequately inverted. As a consequence, all clock operations were
>>>>>> happening on CKENB, because almost all but 2 clocks are on CKENA.
>>>>>>
>>>>>> As the clocks were activated by the bootloader in the former tests, it
>>>>>> escaped the testing that the wrong clock gate was manipulated. The error
>>>>>> was revealed by changing the pxa3xx-and driver to a module, where tupon
>>>>>> unloading the wrong clock was disabled in CKENB.
>>>>>>
>>>>>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>>>>>> ---
>>>>> Did you want a fixes tag to send this back to stable?
>>>> Ah yes, good point, v2 on its way.
>>>>
>>>> Stephen and Mike, do you think this can still get in -rc6 ?
>>>>
>>> It's not a new regression for v4.2 so we'll leave it to v4.3. I'll apply it to
>>> clk-next.
>> Euh how so, not "new" ?
>>
>> The clock switch for pxa architecture happens just now, on v4.2, see [1]. So the
>> regression wasn't here on v4.1, but is introduced in v4.2
>>
>> I know I'm terribly late, but isn't it still possible to have it in v4.2 ?
>>
>
> Ah ok. I wasn't aware that we switched on CCF for PXA this time around. Did the
> commit text mean to mention the pxa3xx-nand driver? I can fix that up when
> applying.
Oh yes please, it's indeed pxa3xx-nand driver.

Thanks.

-- 
Robert
