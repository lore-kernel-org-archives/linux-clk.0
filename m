Return-Path: <tdas@codeaurora.org>
Subject: Re: [PATCH 2/2] dt-bindings: clock: Introduce QCOM RPMh clock
 bindings
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1522304274-18989-1-git-send-email-tdas@codeaurora.org>
 <1522304274-18989-3-git-send-email-tdas@codeaurora.org>
 <152297042791.143116.12493897848354753009@swboyd.mtv.corp.google.com>
From: Taniya Das <tdas@codeaurora.org>
Message-ID: <98232fda-7952-b19f-7dcd-b22c45e5041a@codeaurora.org>
Date: Sun, 8 Apr 2018 15:41:33 +0530
MIME-Version: 1.0
In-Reply-To: <152297042791.143116.12493897848354753009@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Thanks Stephen for the review.

On 4/6/2018 4:50 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-03-28 23:17:53)
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh.txt b/Documentation/devicetree/bindings/clock/qcom,rpmh.txt
>> new file mode 100644
>> index 0000000..8222c88
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmh.txt
> 
> Can the file name be qcom,rpmh-clk?
> 

Sure will update the file name.

>> @@ -0,0 +1,22 @@
>> +Qualcomm Technologies, Inc. RPMh Clocks
>> +-------------------------------------------------------
>> +
>> +Resource Power Manager Hardened (RPMh) manages shared resources on
>> +some Qualcomm Technologies Inc. SoCs. It accepts clock requests from
>> +other hardware subsystems via RSC to control clocks.
>> +
>> +Required properties :
>> +- compatible : shall contain "qcom,rpmh-clk-sdm845"
>> +
>> +- #clock-cells : must contain 1
>> +
>> +Example :
>> +
>> +#include <dt-bindings/clock/qcom,rpmh.h>
>> +
>> +       &apps_rsc {
> 
>> +               clock_rpmh: qcom,rpmhclk {
> 
> Should say clock-controller for node name.
>

Would fix it in the next patch.

>> +               compatible = "qcom,rpmh-clk-sdm845";
>> +               #clock-cells = <1>;
> 
> Is this tabbed out correctly?
> 

Will fix the tabs in the next patch.

>> +               };
>> +       };

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
