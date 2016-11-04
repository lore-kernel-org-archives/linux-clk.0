Return-Path: <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 1/3] clk: keystone: Fix an error checking
To: Stephen Boyd <sboyd@codeaurora.org>
References: <cover.1477339880.git.christophe.jaillet@wanadoo.fr>
 <ff1de6a7af60b4e3804162e553d7174e2ad1ea16.1477339880.git.christophe.jaillet@wanadoo.fr>
 <20161102002228.GC16026@codeaurora.org>
Cc: lars@metafoo.de, dan.carpenter@oracle.com, ssantosh@kernel.org,
 mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <d2009738-ec07-8cad-10b3-4318f20b69b3@wanadoo.fr>
Date: Fri, 4 Nov 2016 06:43:59 +0100
MIME-Version: 1.0
In-Reply-To: <20161102002228.GC16026@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Le 02/11/2016 à 01:22, Stephen Boyd a écrit :
> On 10/24, Christophe JAILLET wrote:
>> clk_register_pll() can return ERR_PTR(-ENOMEM) so checking the return value
>> against NULL only is not correct.
> The code just doesn't propagate the error up to the caller.
> Instead the caller treats NULL as an error and non-NULL as valid.
> If the callee detects an error it hides it and returns NULL.

Could you please clarify?
I thought that your point was that 'clk_register_pll()' was returning 
NULL when 'clk_register()' was returning an error.
The proposed patch fixes it and now 'clk_register_pll()' returns:
    - either  ERR_PTR(-ENOMEM) if zkalloc fails
    - or clk if 'clk_register()' fails. In this case it is an error pointer
    - or a valid, non NULL, pointer in case of success

The caller, '_of_pll_clk_init()' has also been updated to test the 
return value using IS_ERR.


So, which caller/callee do you refer to?
Would you like '_of_pll_clk_init()' to also propagate the error?

Or is it the phrasing of the log entry which is not clear enough and 
should be updated?

>
>> In order to fix it, update clk_register_pll() to always return an error
>> pointer in case of error and check the return value with IS_ERR.
>>
>> While at it, also fix a tab vs space in the surrounding code.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Un-compiled and un-tested.
> Please at least compile test patches.
Agreed, and I usually do.
But in this particular case, I don't have the build environment to do it.

I preferred to report what looks like a (small) bug to me and clearly 
state that I didn't even compile-tested it rather than just ignoring it.
Hoping that this approach, in such a case, is acceptable.

CJ
