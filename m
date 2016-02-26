Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Subject: Re: [PATCH v7 1/2] clk: qcom: Add support for SMD-RPM Clocks
To: Stephen Boyd <sboyd@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <1456243999-22652-1-git-send-email-georgi.djakov@linaro.org>
 <1456243999-22652-2-git-send-email-georgi.djakov@linaro.org>
 <56CD835A.1010608@linaro.org> <20160224191522.GE4847@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <56D08252.1000904@linaro.org>
Date: Fri, 26 Feb 2016 18:50:26 +0200
MIME-Version: 1.0
In-Reply-To: <20160224191522.GE4847@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 02/24/2016 09:15 PM, Stephen Boyd wrote:
> On 02/24, Srinivas Kandagatla wrote:
>>
>>
>> On 23/02/16 16:13, Georgi Djakov wrote:
>>> +/* msm8916 */
>>> +#define RPM_XO_CLK_SRC				0
>>> +#define RPM_XO_A_CLK_SRC			1
>>> +#define RPM_PCNOC_CLK				2
>>> +#define RPM_PCNOC_A_CLK				3
>>> +#define RPM_SNOC_CLK				4
>>> +#define RPM_SNOC_A_CLK				5
>>> +#define RPM_BIMC_CLK				6
>>> +#define RPM_BIMC_A_CLK				7
>>> +#define RPM_QDSS_CLK				8
>>> +#define RPM_QDSS_A_CLK				9
>>> +#define RPM_BB_CLK1				10
>>> +#define RPM_BB_CLK1_A				11
>>> +#define RPM_BB_CLK2				12
>>> +#define RPM_BB_CLK2_A				13
>>> +#define RPM_RF_CLK1				14
>>> +#define RPM_RF_CLK1_A				15
>>> +#define RPM_RF_CLK2				16
>>> +#define RPM_RF_CLK2_A				17
>>> +#define RPM_BB_CLK1_PIN				18
>>> +#define RPM_BB_CLK1_A_PIN			19
>>> +#define RPM_BB_CLK2_PIN				20
>>> +#define RPM_BB_CLK2_A_PIN			21
>>> +#define RPM_RF_CLK1_PIN				22
>>> +#define RPM_RF_CLK1_A_PIN			23
>>> +#define RPM_RF_CLK2_PIN				24
>>> +#define RPM_RF_CLK2_A_PIN			25
>>> +
>>
>> These names are more generic, and offsets are specific to the 8916
>> chip, adding soc prefix to these would make more sense and also set
>> a rule for the next soc support patches too.
>>
> 
> Do these ever change though? Maybe we should remove the msm8916
> specificness and let the rpm clk consumers choose the clks they
> want to use. Combine all the different SoCs into the same "RPM
> clk" numberspace so that we don't have a handful of different
> headers and different RPM clk definitions in the driver when
> they're almost the same across chips.
> 

Yes, these change actually. Some of them are common like the xo, bimc,
nocs and qdss, but the rest varies as count (21-47) and naming at the
different SoCs. I have a few that fit into the same numberspace, but
with some newer SoCs we will have issues. So we can have the same
definitions for the common clks, and the rest could be added to the
same header file with SoC prefix.
