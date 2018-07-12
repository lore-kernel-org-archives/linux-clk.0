Return-Path: <anischal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Thu, 12 Jul 2018 17:53:48 +0530
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Andy Gross
 <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra
 Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>,
 Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk-owner@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: gdsc: Add support to enable/disable the
 clocks with GDSC
In-Reply-To: <153111447519.143105.17241493270191899078@swboyd.mtv.corp.google.com>
References: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
 <1528285308-25477-2-git-send-email-anischal@codeaurora.org>
 <153111447519.143105.17241493270191899078@swboyd.mtv.corp.google.com>
Message-ID: <6e53b7934af72e40e99a3d6afe54174f@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

Thanks for the review comments.

Regards,
Amit

On 2018-07-09 11:04, Stephen Boyd wrote:
> Quoting Amit Nischal (2018-06-06 04:41:45)
>> For some of the GDSCs, there is a requirement to enable/disable the
>> few clocks before turning on/off the gdsc power domain. Add support
> 
> Why is there a requirement? Do the clks need to be in hw control mode 
> or
> they can't be turned off when the GDSC is off? It's hard for me to
> understand with these vague statements.
> 

This requirement is primarily to turn on the GPU GX GDSC and these 
clocks
do not need to be in HW control mode and clock disable is not related
with the GDSC.

To turn on the GX GDSC, root clock (GFX3D RCG) needs to be enabled first
before writing to SW_COLLAPSE bit of the GDSC. The CLK_ON signal from 
RCG
would power up the GPU GX GDSC.


>> for the same by specifying a list of clk_hw pointers per gdsc and
>> enable/disable them along with power domain on/off callbacks.
>> 
>> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
>> ---
>>  drivers/clk/qcom/gdsc.c | 44 
>> ++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/qcom/gdsc.h |  5 +++++
>>  2 files changed, 49 insertions(+)
>> 
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index a077133..b6adca1 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -12,6 +12,8 @@
>>   */
>> 
>>  #include <linux/bitops.h>
>> +#include <linux/clk.h>
> 
> Ugh.
> 
>> +#include <linux/clk-provider.h>
> 
> Both, really?
> 

Above includes are required else we get a compilation error as below:
error: dereferencing pointer to incomplete type
    ret = clk_prepare_enable(sc->clk_hws[i]->clk);
                                           ^

>>  #include <linux/delay.h>
>>  #include <linux/err.h>
>>  #include <linux/jiffies.h>
>> @@ -208,11 +210,41 @@ static inline void gdsc_assert_reset_aon(struct 
>> gdsc *sc)
>>         regmap_update_bits(sc->regmap, sc->clamp_io_ctrl,
>>                            GMEM_RESET_MASK, 0);
>>  }
>> +
>> +static int gdsc_clk_prepare_enable(struct gdsc *sc)
>> +{
>> +       int i, ret;
>> +
>> +       for (i = 0; i < sc->clk_count; i++) {
>> +               ret = clk_prepare_enable(sc->clk_hws[i]->clk);
>> +               if (ret) {
>> +                       for (i--; i >= 0; i--)
>> +                               
>> clk_disable_unprepare(sc->clk_hws[i]->clk);
>> +                       return ret;
>> +               }
>> +       }
>> +       return 0;
>> +}
>> +
> 
> Looks an awful lot like bulk_enable clk API.

As mentioned above, ROOT_EN bit of GFX3D RCG needs to be enabled first 
to
turn on the GDSC. We want this enable to happen only through clock 
framework
API in order to avoid stability issues.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
