Return-Path: <rnayak@codeaurora.org>
Message-ID: <57BEB66C.2000602@codeaurora.org>
Date: Thu, 25 Aug 2016 14:42:12 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 tdas@codeaurora.org
Subject: Re: [PATCH v2 04/10] clk: qcom: Add support for PLLs with alpha mode
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org> <1470904858-11930-5-git-send-email-rnayak@codeaurora.org> <20160824061540.GU6502@codeaurora.org>
In-Reply-To: <20160824061540.GU6502@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 08/24/2016 11:45 AM, Stephen Boyd wrote:
> On 08/11, Rajendra Nayak wrote:
>> Some PLLs can support an alpha mode, and a single alpha
>> register (instead of registers to program the M/N values),
>> the contents of which depend on the alpha mode selected.
>> (They are either treated as two's complement or M/N value)
> 
> That's just a sentence, so please drop the parentheses.

OK

> 
>> Add support for this in the clk PLL driver.
>>
> 
> I'm confused, don't we already have clk-alpha-pll.c to handle
> alpha type plls? What are we doing adding support to the "legacy"
> pll code?

Yes, this does look confusing now that I took a relook at it all.
I will redo this whole thing so it fits into the alpha PLL support that
we already have.

> 
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>  drivers/clk/qcom/clk-pll.c | 8 ++++++--
>>  drivers/clk/qcom/clk-pll.h | 2 ++
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-pll.c b/drivers/clk/qcom/clk-pll.c
>> index 5b940d6..08d2fa2 100644
>> --- a/drivers/clk/qcom/clk-pll.c
>> +++ b/drivers/clk/qcom/clk-pll.c
>> @@ -255,8 +255,12 @@ static void clk_pll_configure(struct clk_pll *pll, struct regmap *regmap,
>>  	u32 mask;
>>  
>>  	regmap_write(regmap, pll->l_reg, config->l);
>> -	regmap_write(regmap, pll->m_reg, config->m);
>> -	regmap_write(regmap, pll->n_reg, config->n);
>> +	if (pll->alpha_reg) {
> 
> This assumes that alpha_reg is not 0 offset from base, which
> seems like a bad assumption to make.

sure, I need to handle this in a better way

> 
>> +		regmap_write(regmap, pll->alpha_reg, config->alpha);
>> +	} else {
>> +		regmap_write(regmap, pll->m_reg, config->m);
>> +		regmap_write(regmap, pll->n_reg, config->n);
>> +	}
>>  
>>  	val = config->vco_val;
>>  	val |= config->pre_div_val;
>>
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
