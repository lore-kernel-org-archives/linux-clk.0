Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: iproc: Fix PLL output frequency calculation
To: Ray Jui <rjui@broadcom.com>
References: <1445035458-29340-1-git-send-email-rjui@broadcom.com>
 <1445035458-29340-2-git-send-email-rjui@broadcom.com>
 <20151019214911.GB19782@codeaurora.org> <562566C1.8080409@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Simran Rai <ssimran@broadcom.com>
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <56256BA5.3090705@codeaurora.org>
Date: Mon, 19 Oct 2015 15:16:05 -0700
MIME-Version: 1.0
In-Reply-To: <562566C1.8080409@broadcom.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 10/19/2015 02:55 PM, Ray Jui wrote:
>
>
> On 15-10-19 02:49 PM, Stephen Boyd wrote:
>> On 10/16, Ray Jui wrote:
>>> From: Simran Rai <ssimran@broadcom.com>
>>>
>>> This patch affects the clocks that use fractional ndivider in their
>>> PLL output frequency calculation. Instead of 2^20 divide factor, the
>>> clock's ndiv integer shift was used. Fixed the bug by replacing ndiv
>>> integer shift with 2^20 factor.
>>>
>>> Signed-off-by: Simran Rai <ssimran@broadcom.com>
>>> Signed-off-by: Ray Jui <rjui@broadcom.com>
>>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
>>> ---
>>
>> Did you want any Fixes: tag so this goes back to stable?
>>
>
> Yes, we want this fix to go back to the stable kernel.
>
> I will re-submit the patch with the Fixes: tag and at the same time cc
> stable@vger.kernel.org .

Please just tell me the commit that this fixes, I can add the tag and
apply to the right tree then.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
