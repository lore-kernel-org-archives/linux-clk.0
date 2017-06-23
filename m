Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] clk: gcc-msm8996: Add missing lpass smmu clks
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Andy Gross <andy.gross@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20170612094137.6821-1-srinivas.kandagatla@linaro.org>
 <20170620004709.GD20170@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9449e968-bddb-2b34-3ede-b786238b6421@linaro.org>
Date: Fri, 23 Jun 2017 12:03:50 +0100
MIME-Version: 1.0
In-Reply-To: <20170620004709.GD20170@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 20/06/17 01:47, Stephen Boyd wrote:
> On 06/12, Srinivas Kandagatla wrote:
>> This patch adds missing LPASS smmu clks which are required by the audio driver.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/clk/qcom/gcc-msm8996.c               | 26 ++++++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,gcc-msm8996.h |  2 ++
>>   2 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
>> index 56e0a295c74e..6290ce551505 100644
>> --- a/drivers/clk/qcom/gcc-msm8996.c
>> +++ b/drivers/clk/qcom/gcc-msm8996.c
>> @@ -2644,6 +2644,30 @@ static struct clk_fixed_factor ufs_rx_cfg_clk_src = {
>>   	},
>>   };
>>   
>> +static struct clk_branch gcc_hlos1_vote_lpass_core_smmu_clk = {
>> +	.halt_reg = 0x7d010,
> 
> Don't we need .halt_check = BRANCH_HALT_VOTED for these?
> 
I don't think we need it for these clks, Downstream driver has 
no_halt_check_on_disable = true for both these clks.



thanks,
srini

>> +	.clkr = {
>> +		.enable_reg = 0x7d010,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(struct clk_init_data){
>> +			.name = "hlos1_vote_lpass_core_smmu_clk",
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch gcc_hlos1_vote_lpass_adsp_smmu_clk = {
>> +	.halt_reg = 0x7d014,
>> +	.clkr = {
>> +		.enable_reg = 0x7d014,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(struct clk_init_data){
>> +			.name = "hlos1_vote_lpass_adsp_smmu_clk",
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
> 
