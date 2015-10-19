Return-Path: <rjui@broadcom.com>
Subject: Re: [PATCH] clk: iproc: Fix PLL output frequency calculation
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1445035458-29340-1-git-send-email-rjui@broadcom.com>
 <1445035458-29340-2-git-send-email-rjui@broadcom.com>
 <20151019214911.GB19782@codeaurora.org>
CC: Michael Turquette <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
	Simran Rai <ssimran@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
Message-ID: <562566C1.8080409@broadcom.com>
Date: Mon, 19 Oct 2015 14:55:13 -0700
MIME-Version: 1.0
In-Reply-To: <20151019214911.GB19782@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Return-Path: rjui@broadcom.com
List-ID: <linux-clk.vger.kernel.org>



On 15-10-19 02:49 PM, Stephen Boyd wrote:
> On 10/16, Ray Jui wrote:
>> From: Simran Rai <ssimran@broadcom.com>
>>
>> This patch affects the clocks that use fractional ndivider in their
>> PLL output frequency calculation. Instead of 2^20 divide factor, the
>> clock's ndiv integer shift was used. Fixed the bug by replacing ndiv
>> integer shift with 2^20 factor.
>>
>> Signed-off-by: Simran Rai <ssimran@broadcom.com>
>> Signed-off-by: Ray Jui <rjui@broadcom.com>
>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
>> ---
>
> Did you want any Fixes: tag so this goes back to stable?
>

Yes, we want this fix to go back to the stable kernel.

I will re-submit the patch with the Fixes: tag and at the same time cc 
stable@vger.kernel.org .

Thanks,

Ray
