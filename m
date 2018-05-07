Return-Path: <tdas@codeaurora.org>
Subject: Re: [v8] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1525428158-29147-1-git-send-email-tdas@codeaurora.org>
 <1525428158-29147-2-git-send-email-tdas@codeaurora.org>
 <152545267793.138124.15345698220033125655@swboyd.mtv.corp.google.com>
From: Taniya Das <tdas@codeaurora.org>
Message-ID: <a926924f-2033-acd6-67cb-210a5e487ebb@codeaurora.org>
Date: Mon, 7 May 2018 16:18:06 +0530
MIME-Version: 1.0
In-Reply-To: <152545267793.138124.15345698220033125655@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen,

Could you please let me know your comments on the below.

On 5/4/2018 10:21 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-05-04 03:02:38)
>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>> new file mode 100644
>> index 0000000..944fe04
>> --- /dev/null
>> +++ b/drivers/clk/qcom/clk-rpmh.c
>> @@ -0,0 +1,334 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +};
>> +
>> +struct clk_rpmh_desc {
>> +       struct clk_hw **clks;
>> +       size_t num_clks;
>> +};
> 
> This could be replaced with the clk_hw_onecell_data struct and then the
> only problem becomes the const part which seems pretty impossible to fix
> at this point. One "workaround" is to memdup the structure. Ugh.
> 

Will be okay, if I can the following?

_probe...
{
	struct clk_rpmh_desc *hw_desc_data;
	....

	hw_desc_data = kmemdup(desc, sizeof(*desc), GFP_KERNEL);

	...
	ret = devm_of_clk_add_hw_provider(&pdev->dev, 	  of_clk_rpmh_hw_get, 
hw_desc_data);
         ....

}

And also I fix the "getter" function.

>> +
>> +static DEFINE_MUTEX(rpmh_clk_lock);
>> +
>> +#define __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,   \
>> +                         _res_en_offset, _res_on, _div)                \
>> +       static struct clk_rpmh _platform##_##_name_active;              \
>> +       static struct clk_rpmh _platform##_##_name = {                  \
> [..]
>> +
>> +static unsigned long clk_rpmh_recalc_rate(struct clk_hw *hw,
>> +                                       unsigned long prate)
>> +{
>> +       struct clk_rpmh *r = to_clk_rpmh(hw);
>> +       unsigned long rate = prate;
>> +
>> +       /*
>> +        * RPMh clocks have a fixed rate. Return static rate.
>> +        */
>> +       do_div(rate, r->div);
> 
> Integer division won't suffice?
> 
>> +       return rate;
>> +}
> [...]
>> +
>> +static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>> +                                            void *data)
>> +{
>> +       struct clk_hw *hw_clks = data;
>> +       unsigned int idx = clkspec->args[0];
>> +
>> +       if (idx < 0) {
> 
> It can't be less than 0 though because it's unsigned.
> 
>> +               pr_err("%s: invalid index %u\n", __func__, idx);
>> +               return ERR_PTR(-EINVAL);
>> +       }
>> +
>> +       return &hw_clks[idx];
>> +}

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
