Return-Path: <dinguyen@opensource.altera.com>
Message-ID: <5571C1CC.7060404@opensource.altera.com>
Date: Fri, 5 Jun 2015 10:35:40 -0500
From: Dinh Nguyen <dinguyen@opensource.altera.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <mturquette@linaro.org>, <dinh.linux@gmail.com>, <geert@linux-m68k.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC/PATCHv2 1/2] clk: of: helper for filling parent clock array
 and return num of parents
References: <1433445153-25320-1-git-send-email-dinguyen@opensource.altera.com>
 <1433445153-25320-2-git-send-email-dinguyen@opensource.altera.com>
 <20150604212447.GP676@codeaurora.org>
In-Reply-To: <20150604212447.GP676@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>



On 6/4/15 4:24 PM, Stephen Boyd wrote:
> On 06/04, dinguyen@opensource.altera.com wrote:
>> From: Dinh Nguyen <dinguyen@opensource.altera.com>
>>
>> Sprinkled all through the platform clock drivers are code like this to
>> fill the clock parent array:
>>
>> for (i = 0; i < num_parents; ++i)
>> 	parent_names[i] = of_clk_get_parent_name(np, i);
>>
>> The of_clk_parent_fill() will do the same as the code above, and while
>> at it, return the number of parents as well since the logic of the
>> function is to the walk the clock node to look for the parent.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
>> ---
>> v2: use unsigned int for size
>> ---
>>  drivers/clk/clk.c            | 20 ++++++++++++++++++++
>>  include/linux/clk-provider.h |  1 +
>>  2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 459ce9d..778bebd 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -3060,6 +3060,26 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>>  }
>>  EXPORT_SYMBOL_GPL(of_clk_get_parent_name);
>>  
>> +/*
> 
> Need a double ** here for kernel doc.
> 

Ok...

>> + * of_clk_parent_fill(): Helper clock function that will fill the parent
>> + * clock's array and return the number of parents it found.
> 
> Please try to shorten this sentence.
> 
> 	Fill @parents with names of @np's parents and return number of parents
> 
>> + * @np: Device node pointer associated with clock provider
>> + * @parents: pointer to char array that hold the parent's name
> 
> s/parent's name/parents' names/ ?
> 

Will address in v3.

>> + * @size: size of the parents array
>> + *
>> + * Returns number of parents for the clock node.
>> + */
>> +int of_clk_parent_fill(struct device_node *np, const char **parents, unsigned int size)
>> +{
>> +	unsigned int i = 0;
>> +
>> +	while (i < size && (parents[i] = of_clk_get_parent_name(np, i)) != NULL)
>> +		i++;
>> +
>> +	return i;
>> +}
>> +EXPORT_SYMBOL(of_clk_parent_fill);
> 
> Can this be GPL?
> 

Yes.

Thanks,
Dinh
