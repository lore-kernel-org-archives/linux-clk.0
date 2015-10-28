Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: common: Add API to register board
 clocks backwards compatibly
To: Georgi Djakov <georgi.djakov@linaro.org>,
 Mike Turquette <mturquette@baylibre.com>
References: <1445987100-19492-1-git-send-email-sboyd@codeaurora.org>
 <20151028010604.GV19782@codeaurora.org> <56310DDC.6010000@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <563112F8.9070401@codeaurora.org>
Date: Wed, 28 Oct 2015 11:24:56 -0700
MIME-Version: 1.0
In-Reply-To: <56310DDC.6010000@linaro.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 10/28/2015 11:03 AM, Georgi Djakov wrote:
> On 10/28/2015 03:06 AM, Stephen Boyd wrote:
>> On 10/27, Stephen Boyd wrote:
>>> +
>>> +int qcom_cc_register_board_clk(struct device *dev, const char *path,
>>> +			       const char *name, unsigned long rate)
>>> +{
>>> +	return _qcom_cc_register_board_clk(dev, path, name, rate,
>>> +					   !IS_ENABLED(CONFIG_QCOM_RPMCC));
>> I just realized that we could have this config enabled but the
>> driver never probes on a certain platform. So we'll need to do
>> some sort of search to see if the rpmcc node exists and also
>> check to see if the driver is enabled. I guess we can do that all
>> here in this function as long as we have a compatible =
>> "qcom,rpmcc" as a more generic property for the rpm clock
>> controller node. So if the config is enabled, search the dt tree
>> for a qcom,rpmcc node. If the rpmcc node is there, the last
>> argument is false, otherwise it's true.
> I like the approach.  We could have both compatible strings like:
> compatible = "qcom,rpmcc-msm8916", "qcom,rpmcc";

Exactly.

>
> The only possible issue i could imagine is the case when rpmcc
> driver probe fails - does not enable scaling for example. Then we
> will be left without xo. But maybe we should not handle this
> scenario anyway.

Yeah let's not care until that problem happens.

>
>> ---8<----
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index 572851b5bc16..215a41ba0135 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/clk-provider.h>
>>  #include <linux/reset-controller.h>
>> +#include <linux/of.h>
>>  
>>  #include "common.h"
>>  #include "clk-rcg.h"
>> @@ -152,7 +153,18 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
>>  int qcom_cc_register_board_clk(struct device *dev, const char *path,
>>  			       const char *name, unsigned long rate)
>>  {
>> -	return _qcom_cc_register_board_clk(dev, path, name, rate, true);
>> +	bool add_factor = true;
>> +	struct device_node *node;
>> +
>> +	/* The RPM clock driver will add the factor clock if present */
>> +	if (IS_ENABLED(CONFIG_QCOM_RPMCC)) {
>> +		node = of_find_compatible_node(NULL, NULL, "qcom,rpmcc");
>> +		if (node)
> if (node && of_device_is_available(node))
> to handle also the case with status="disabled"

Good catch! Looks like we can pass NULL there though so it can be
simplified slightly.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
