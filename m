Return-Path: <arvind.yadav.cs@gmail.com>
Return-Path: <arvind.yadav.cs@gmail.com>
Subject: Re: [PATCH] clk: st: clk-flexgen: Unmap region obtained by of_iomap
To: Stephen Boyd <sboyd@codeaurora.org>
References: <y> <57d92940.6329c80a.3d959.9d78@mx.google.com>
 <20160914182454.GR7243@codeaurora.org>
Cc: mturquette@baylibre.com, a.hajda@samsung.com, lee.jones@linaro.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From: arvind Yadav <arvind.yadav.cs@gmail.com>
Message-ID: <4e87aaaf-9169-0c19-e3ad-21b23babb20e@gmail.com>
Date: Mon, 19 Sep 2016 23:14:46 +0530
MIME-Version: 1.0
In-Reply-To: <20160914182454.GR7243@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On Wednesday 14 September 2016 11:54 PM, Stephen Boyd wrote:
> On 09/14, arvind.yadav.cs@gmail.com wrote:
>> @@ -337,6 +339,8 @@ static void __init st_of_flexgen_setup(struct device_node *np)
>>   	return;
>>   
>>   err:
>> +	if (reg)
> This is always true? Why check?
> I have removed this check. Please review updated patch.
>> +		iounmap(reg);
>>   	if (clk_data)
>>   		kfree(clk_data->clks);
>>   	kfree(clk_data);
>> -- 
>> 1.7.9.5
>>
