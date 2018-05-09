Return-Path: <colin.king@canonical.com>
Subject: Re: [PATCH] clk: boston: fix memory leak of 'onecell' on error return
 paths
To: Paul Burton <paul.burton@mips.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-mips@linux-mips.org,
 linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20180509134031.11611-1-colin.king@canonical.com>
 <20180509140135.4dndt3baomtxups5@mwanda>
 <20180509163311.alvyibwwuwkumyxf@pburton-laptop>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <3fbc876f-cf9d-6184-96c2-f372a4406ab8@canonical.com>
Date: Wed, 9 May 2018 17:44:40 +0100
MIME-Version: 1.0
In-Reply-To: <20180509163311.alvyibwwuwkumyxf@pburton-laptop>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 09/05/18 17:33, Paul Burton wrote:
> Hi Colin & Dan,
> 
> On Wed, May 09, 2018 at 05:01:35PM +0300, Dan Carpenter wrote:
>> On Wed, May 09, 2018 at 02:40:31PM +0100, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> There are several error return paths that don't free up onecell
>>> and hence we have some memory leaks. Add an error exit path that
>>> kfree's onecell to fix the leaks.
>>>
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>>  drivers/clk/imgtec/clk-boston.c | 15 +++++++++++----
>>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/clk/imgtec/clk-boston.c b/drivers/clk/imgtec/clk-boston.c
>>> index 15af423cc0c9..d6bc468ff551 100644
>>> --- a/drivers/clk/imgtec/clk-boston.c
>>> +++ b/drivers/clk/imgtec/clk-boston.c
>>> @@ -73,27 +73,34 @@ static void __init clk_boston_setup(struct device_node *np)
>>>  	hw = clk_hw_register_fixed_rate(NULL, "input", NULL, 0, in_freq);
>>>  	if (IS_ERR(hw)) {
>>>  		pr_err("failed to register input clock: %ld\n", PTR_ERR(hw));
>>> -		return;
>>> +		goto error;
>>
>> I hate vague label names like "error" and "out"...
>>
>> There are a bunch of other resources that we should free if we decide
>> it's worth freeing things.
> 
> Agreed - for example unregistering the clocks that we'd be discarding
> references to by freeing onecell.
> 
>> Can this even boot without the clk?
> 
> Nope. If this clock setup fails then whether you free this memory or not
> you're going to be unable to do anything useful with it.
> 
> I imagine this patch is the result of some static analysis rather than a
> problem being observed at runtime?

Indeed. I propose ignoring this then as it's fairly terminal if one
can't get memory anyhow in the early boot.

Colin
> 
> Thanks,
>     Paul
> 
>> When
>> the label names says what is freed, then you mentally only have to keep
>> track of the most recently allocated resource.  So if
>>
>> 	hw = clk_hw_register_fixed_rate(NULL, "input", NULL, 0, in_freq);
>>
>> succeeds then the next goto is going to "goto free_clk_input;".
>>
>> regards,
>> dan carpenter
