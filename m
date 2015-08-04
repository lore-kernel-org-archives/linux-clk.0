Return-Path: <sboyd@codeaurora.org>
Message-ID: <55C0FD5E.7000705@codeaurora.org>
Date: Tue, 04 Aug 2015 10:58:54 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
CC: Michael Turquette <mturquette@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] clk: pxa: pxa3xx: fix CKEN register access
References: <1438631907-27993-1-git-send-email-robert.jarzmik@free.fr> <55C00A6B.2030508@codeaurora.org> <87h9ofmv2n.fsf@belgarion.home>
In-Reply-To: <87h9ofmv2n.fsf@belgarion.home>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 08/03/2015 11:22 PM, Robert Jarzmik wrote:
> Stephen Boyd <sboyd@codeaurora.org> writes:
>
>> On 08/03/2015 12:58 PM, Robert Jarzmik wrote:
>>> Clocks 0 to 31 are on CKENA, and not CKENB. The clock register names
>>> were inadequately inverted. As a consequence, all clock operations were
>>> happening on CKENB, because almost all but 2 clocks are on CKENA.
>>>
>>> As the clocks were activated by the bootloader in the former tests, it
>>> escaped the testing that the wrong clock gate was manipulated. The error
>>> was revealed by changing the pxa3xx-and driver to a module, where tupon
>>> unloading the wrong clock was disabled in CKENB.
>>>
>>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>>> ---
>> Did you want a fixes tag to send this back to stable?
> Ah yes, good point, v2 on its way.
>
> Stephen and Mike, do you think this can still get in -rc6 ?
>

It's not a new regression for v4.2 so we'll leave it to v4.3. I'll apply 
it to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
