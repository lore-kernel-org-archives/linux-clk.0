Return-Path: <tdas@codeaurora.org>
Subject: Re: [PATCH v4 0/2] clk: qcom: Add support for RCG to register for DFS
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1533952436-17221-1-git-send-email-tdas@codeaurora.org>
 <153455835372.28926.7641705907931269497@swboyd.mtv.corp.google.com>
 <693d9cf4-4a6f-feb5-0c3f-ded842bbdf0a@codeaurora.org>
 <2db97037-b5f1-9234-862c-fa483b8aeb62@codeaurora.org>
 <153486545785.28926.5289007760649251969@swboyd.mtv.corp.google.com>
From: Taniya Das <tdas@codeaurora.org>
Message-ID: <4cda3c7e-3ac3-af97-6d9f-24dd5a4efa28@codeaurora.org>
Date: Wed, 22 Aug 2018 15:58:31 +0530
MIME-Version: 1.0
In-Reply-To: <153486545785.28926.5289007760649251969@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 8/21/2018 9:00 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-08-21 04:36:20)
>> On 8/18/2018 11:31 PM, Taniya Das wrote:
>>> Hello Stephen,
>>>
>>> I will test these changes and get back.
>>>
>>> On 8/18/2018 7:42 AM, Stephen Boyd wrote:
>>>> Quoting Taniya Das (2018-08-10 18:53:54)
>>>>>    [v4]
>>>>>     * Add recalc_clk_ops to calculate the clock frequency reading the
>>>>> current
>>>>>       perf state, also add CLK_GET_RATE_NOCACHE flag.
>>>>>     * Cleanup 'goto' during mode check in 'clk_rcg2_calculate_freq'.
>>>>>     * cleanup return from function 'com_cc_register_rcg_dfs'.
>>>>
>>>> I want to squash this in. I have only compile tested it. Let me know
>>>> what you think.
>>>>
>>>> ----8<---
>>>> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
>>>> index e6300e05d5df..e5eca8a1abe4 100644
>>>> --- a/drivers/clk/qcom/clk-rcg.h
>>>> +++ b/drivers/clk/qcom/clk-rcg.h
>>>> @@ -163,6 +163,15 @@ extern const struct clk_ops clk_pixel_ops;
>>>>    extern const struct clk_ops clk_gfx3d_ops;
>>>>    extern const struct clk_ops clk_rcg2_shared_ops;
>>>> +struct clk_rcg_dfs_data {
>>>> +    struct clk_rcg2 *rcg;
>>>> +    struct clk_init_data *init;
>>>> +};
>>>> +
>>>> +#define DEFINE_RCG_DFS(r) \
>>>> +    { .rcg = &r##_src, .init = &r##_init }
>>>> +
>>>>    extern int qcom_cc_register_rcg_dfs(struct regmap *regmap,
>>>> -                 struct clk_rcg2 **rcgs, int num_clks);
>>>> +                    const struct clk_rcg_dfs_data *rcgs,
>>>> +                    size_t len);
>>>>    #endif
>>>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>>>> index 55a5b58cbb15..bbe2a1916296 100644
>>>> --- a/drivers/clk/qcom/clk-rcg2.c
>>>> +++ b/drivers/clk/qcom/clk-rcg2.c
>>>> @@ -1051,48 +1051,24 @@ static unsigned long
>>>>    clk_rcg2_dfs_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>>>>    {
>>>>        struct clk_rcg2 *rcg = to_clk_rcg2(hw);
>>>> -    u32 cfg, hid_div, m = 0, n = 0, mode = 0, mask, level;
>>>> -    int num_parents, i;
>>>> -    unsigned long prate;
>>>> -
>>>> -    regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr +
>>>> -                SE_CMD_DFSR_OFFSET, &cfg);
>>>> -    level = (GENMASK(4, 1) & cfg) >> 1;
>>>> -
>>>> -    regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr +
>>>> -                SE_PERF_DFSR(level), &cfg);
>>>> -    if (rcg->mnd_width) {
>>>> -        mask = BIT(rcg->mnd_width) - 1;
>>>> -        regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr +
>>>> -                SE_PERF_M_DFSR(level), &m);
>>>> -        m &= mask;
>>>> -        regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr +
>>>> -                SE_PERF_N_DFSR(level), &n);
>>>> -        n =  ~n;
>>>> -        n &= mask;
>>>> -        n += m;
>>>> -        mode = cfg & CFG_MODE_MASK;
>>>> -        mode >>= CFG_MODE_SHIFT;
>>>> -    }
>>>> +    int ret;
>>>> +    u32 level;
>>>> -    mask = BIT(rcg->hid_width) - 1;
>>>> -    hid_div = cfg >> CFG_SRC_DIV_SHIFT;
>>>> -    hid_div &= mask;
>>>> -    cfg &= CFG_SRC_SEL_MASK;
>>>> -    cfg >>= CFG_SRC_SEL_SHIFT;
>>>> +    regmap_read(rcg->clkr.regmap,
>>>> +            rcg->cmd_rcgr + SE_CMD_DFSR_OFFSET, &level);
>>>> +    level &= GENMASK(4, 1);
>>>> +    level >>= 1;
>>>> -    num_parents = clk_hw_get_num_parents(hw);
>>>> -    for (i = 0; i < num_parents; i++) {
>>>> -        if (cfg == rcg->parent_map[i].cfg) {
>>>> -            prate = clk_hw_get_rate(
>>>> -                clk_hw_get_parent_by_index(&rcg->clkr.hw, i));
>>>> -            if (parent_rate != prate)
>>>> -                parent_rate = prate;
>>>> +    if (!rcg->freq_tbl) {
>>>> +        ret = clk_rcg2_dfs_populate_freq_table(rcg);
>>
>> This function would retrieve the parent_rate and if the parent_rate is
>> not ready then it would fail to boot up.
>>
>> So we have to make sure the parents are registered before these RCGs.
>> That also was one reason for me to not populate the frequency table at
>> recalc.
>>
>> We would need this patch to make this work.
> 
> Hmmmm. Ok. That won't work then. recalc_rate() better not try to
> populate the frequency table then or it will not work. So I suppose it
> needs to fallback to reading the registers and assuming the parent_rate
> coming in is the actual frequency of it's parent until the frequency
> table pointer is non-NULL. Would that work?
> 
Yes that would work.

> BTW, does DFS switch parents without software knowing about it? 
DFS would not switch until a HW request is sent, but SW would be unware 
of the switch except the current_perf_state being updated with the 
requested level.

What
> happens in that case? Does the QUP driver make sure that the new parent
> of this RCG is properly enabled so that it can switch to it when needed?

I am not sure if they poll for any of their QUP HW state to make sure 
the switch is complete.

> I'm still trying to understand this whole design. Who takes care of the
> voltage requirements in this case? The QUP driver as well?
> 

When the QUP driver requires to switch to new performance level, the 
first request would be to set_rate()(QUP driver would get the list of 
supported frequencies using the clk_round_rate()) which in QCOM clock 
driver would take care of setting the required voltage for the new 
parent switch.
Then the QUP driver would request the HW for a new perf switch which 
would result to a DFS switch for the QUP clocks.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
