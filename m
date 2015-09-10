Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] clk: qcom: Add support for RCGs with shared
 branches
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1439477317-1902-1-git-send-email-georgi.djakov@linaro.org>
 <1439477317-1902-3-git-send-email-georgi.djakov@linaro.org>
 <20150909224613.GW15099@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <55F1B0FD.4050406@linaro.org>
Date: Thu, 10 Sep 2015 19:34:05 +0300
MIME-Version: 1.0
In-Reply-To: <20150909224613.GW15099@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/10/2015 01:46 AM, Stephen Boyd wrote:
> On 08/13, Georgi Djakov wrote:
[..]
>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>> index 9aec1761fd29..681faf2dcdc5 100644
>> --- a/drivers/clk/qcom/clk-rcg2.c
>> +++ b/drivers/clk/qcom/clk-rcg2.c
>> +
>> +static int clk_rcg2_shared_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
>> +	const char *name = clk_hw_get_name(hw);
>> +
>> +	if (!rcg->current_freq) {
>> +		pr_err("%s: Please set rate before enabling\n", name);
> 
> Why? Can't we find the current freq during recalc_rate?
> 

Yes, thank you!

