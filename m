Return-Path: <rnayak@codeaurora.org>
Subject: Re: [PATCH v2 2/5] clk: Add clk_hw_get_clk() helper API to be used by
 clk providers
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1500526099-9935-1-git-send-email-rnayak@codeaurora.org>
 <1500526099-9935-3-git-send-email-rnayak@codeaurora.org>
 <20170727224713.GP2146@codeaurora.org>
Cc: mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stanimir.varbanov@linaro.org, vivek.gautam@codeaurora.org
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <733f03bf-c05b-7fb7-6052-d78f9f6eaf7f@codeaurora.org>
Date: Fri, 28 Jul 2017 13:26:59 +0530
MIME-Version: 1.0
In-Reply-To: <20170727224713.GP2146@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>



On 07/28/2017 04:17 AM, Stephen Boyd wrote:
> On 07/20, Rajendra Nayak wrote:
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index fc58c52..c9bbfb3 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -186,6 +186,45 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
>>  }
>>  EXPORT_SYMBOL_GPL(clk_hw_get_name);
>>  
>> +struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *dev_id,
>> +			   const char *con_id)
>> +{
>> +	return __clk_create_clk(hw, dev_id, con_id);
>> +}
>> +EXPORT_SYMBOL_GPL(clk_hw_get_clk);
>> +
>> +void clk_hw_put_clk(struct clk *clk)
>> +{
>> +	__clk_free_clk(clk);
>> +}
>> +EXPORT_SYMBOL_GPL(clk_hw_put_clk);
> 
> Isn't this just clk_put()? Not sure why we need this API.
> 
>> +
>> +static void devm_clk_hw_put(struct device *dev, void *res)
>> +{
>> +	clk_hw_put_clk(*(struct clk **)res);
>> +}
> 
> Same comment.

yes, I guess we don;t need these.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
