Return-Path: <tdas@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Introduce QCOM LPASS clock
 bindings
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, rohitkr@codeaurora.org
References: <1530773721-14668-1-git-send-email-tdas@codeaurora.org>
 <1530773721-14668-2-git-send-email-tdas@codeaurora.org>
 <153092054581.143105.16123786121344421693@swboyd.mtv.corp.google.com>
From: Taniya Das <tdas@codeaurora.org>
Message-ID: <408b3b59-d171-175c-f6da-b5d6f42a954d@codeaurora.org>
Date: Fri, 3 Aug 2018 17:49:31 +0530
MIME-Version: 1.0
In-Reply-To: <153092054581.143105.16123786121344421693@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 7/7/2018 5:12 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-07-04 23:55:20)
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
>> new file mode 100644
>> index 0000000..fe7378b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
>> @@ -0,0 +1,22 @@
>> +Qualcomm LPASS Clock Controller Binding
>> +-----------------------------------------------
>> +
>> +Required properties :
>> +- compatible   : shall contain "qcom,sdm845-lpasscc"
>> +- #clock-cells : from common clock binding, shall contain 1.
>> +- reg          : shall contain base register address and size.
>> +- reg-names    : shall contain the register names of LPASS domain
>> +                       "lpass_gcc", "lpass_cc", "lpass_qdsp6ss".
>> +
>> +Example:
>> +
>> +The below node has to be defined in the cases where the LPASS peripheral loader
>> +would bring the subsystem out of reset.
>> +
>> +       lpasscc: clock-controller {
>> +               compatible = "qcom,sdm845-lpasscc";
>> +               reg = <0x00147000 0x20>, <0x17014000 0x1f004>,
> 
> This first reg is inside GCC though? Why isn't it added to the gcc
> sdm845 driver? And then the next two might make sense as a different
> region, but the reg property ending in 20 looks really weird.
>
I have moved the GCC registers in the GCC driver with a device tree 
property flag. And also have mapped the lpass_qdsp6ss CC region.

>> +                       <0x17300020 0x20>;
>> +               reg-names = "lpass_gcc", "lpass_cc", "lpass_qdsp6ss";
>> +               #clock-cells = <1>;
>> +       };

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
