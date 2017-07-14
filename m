Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Subject: Re: [PATCH v2] clk: qcom: clk-smd-rpm: Fix the reported rate of
 branches
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, andy.gross@linaro.org, architt@codeaurora.org,
 hverkuil@xs4all.nl, bjorn.andersson@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20170712231413.GP22780@codeaurora.org>
 <20170713133224.753-1-georgi.djakov@linaro.org>
 <20170713180332.GC22780@codeaurora.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <08a12dcd-bd96-cd81-66e1-17502cb15cee@linaro.org>
Date: Fri, 14 Jul 2017 16:01:33 +0300
MIME-Version: 1.0
In-Reply-To: <20170713180332.GC22780@codeaurora.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 07/14/2017 12:56 AM, Stephen Boyd wrote:
> On 07/13, Georgi Djakov wrote:
>> As there is no way to actually query the hardware for the current clock
>> rate, now racalc_rate() just returns the last rate that was previously
>> set. But if the rate was not set yet, we return the bogus rate of 1000Hz.
>>
>> The branch clocks actually have the same rate as their parent (xo_board),
>> so just return this rate.
>>
>> Reported-by: Archit Taneja <architt@codeaurora.org>
>> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>> ---
>>  drivers/clk/qcom/clk-smd-rpm.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>> index d990fe44aef3..b45782657ca9 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>> @@ -364,6 +364,10 @@ static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
>>  {
>>  	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
>>  
>> +	/* Return the parent rate for branches */
>> +	if (r->branch)
>> +		return parent_rate;
>> +
> 
> What's parent_rate here though? 0? I don't see where we parent
> the branch clks to anything.

Its 19.2MHz as xo_board is a fixed-clock in DT. We use the
__DEFINE_CLK_SMD_RPM_BRANCH macro to define all the branch clks
and this macro sets their parent name to "xo_board". Sorry for
not explaining this earlier.

> And we should really just remove the recalc_rate() op for
> branches entirely so that we don't have to call down into the
> driver to find out something we could have known in the core.

Yes this would be better. I agree. Will remove recalc/round_rate
ops for the branch clks.

Thanks,
Georgi
