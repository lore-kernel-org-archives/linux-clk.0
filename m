Return-Path: <rnayak@codeaurora.org>
Message-ID: <57BEB6AF.3070206@codeaurora.org>
Date: Thu, 25 Aug 2016 14:43:19 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 tdas@codeaurora.org
Subject: Re: [PATCH v2 10/10] clk: qcom: Fix .set_rate to handle alpha PLLs
 w/wo dynamic update
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org> <1470904858-11930-11-git-send-email-rnayak@codeaurora.org> <20160824062613.GW6502@codeaurora.org>
In-Reply-To: <20160824062613.GW6502@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>



On 08/24/2016 11:56 AM, Stephen Boyd wrote:
> On 08/11, Rajendra Nayak wrote:
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 2184dc1..68c90f3 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -113,6 +113,11 @@ static int wait_for_pll_offline(struct clk_alpha_pll *pll, u32 mask)
>>  #define PLL_OFFLINE_ACK		BIT(28)
>>  #define PLL_ACTIVE_FLAG		BIT(30)
>>  
>> +/* alpha pll with dynamic update support */
>> +#define PLL_UPDATE		BIT(22)
>> +#define PLL_HW_LOGIC_BYPASS	BIT(23)
>> +#define PLL_ACK_LATCH		BIT(29)
> 
> These need to move next to associated registers.

will do

> 
>> +
>>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>  			     const struct alpha_pll_config *config)
>>  {
>> @@ -366,6 +402,7 @@ clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>>  static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>  				  unsigned long prate)
>>  {
>> +	int enabled;
> 
> bool

sure

> 
>>  	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>>  	const struct pll_vco *vco;
>>  	u32 l, off = pll->offset;
>> @@ -378,6 +415,11 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>  		return -EINVAL;
>>  	}
>>  
>> +	enabled = hw->init->ops->is_enabled(hw);
> 
> We have clk_hw_is_enabled() for this.

sure, will change it to use clk_hw_is_enabled

> 
>> +
>> +	if (!(pll->flags & SUPPORTS_DYNAMIC_UPDATE) && enabled)
>> +		hw->init->ops->disable(hw);
> 
> Please call the function directly instead of going through the
> init structure to get the clk ops.

okay

> 
>> +
>>  	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
>>  
>>  	regmap_write(pll->clkr.regmap, off + PLL_L_VAL, l);
>> @@ -391,6 +433,12 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>  	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL, PLL_ALPHA_EN,
>>  			   PLL_ALPHA_EN);
>>  
>> +	if (!(pll->flags & SUPPORTS_DYNAMIC_UPDATE) && enabled)
>> +		hw->init->ops->enable(hw);
>> +
>> +	if (pll->flags & SUPPORTS_DYNAMIC_UPDATE)
>> +		clk_alpha_pll_dynamic_update(pll);
>> +
> 
> Perhaps write it as
> 
> 	if (pll->flags & SUPPORTS_DYNAMIC_UPDATE)
> 		clk_alpha_pll_dynamic_update()
> 	else if (enabled)
> 		toggle the enable bit...

okay will update, thanks
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
