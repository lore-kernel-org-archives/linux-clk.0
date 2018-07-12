Return-Path: <anischal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Thu, 12 Jul 2018 18:02:25 +0530
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Andy Gross
 <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra
 Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>,
 Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk-owner@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: clock: Introduce QCOM Graphics clock
 bindings
In-Reply-To: <153111468812.143105.11066074667783322403@swboyd.mtv.corp.google.com>
References: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
 <1528285308-25477-4-git-send-email-anischal@codeaurora.org>
 <153111468812.143105.11066074667783322403@swboyd.mtv.corp.google.com>
Message-ID: <d502fe124cb7ba447c81a2a76b925aff@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2018-07-09 11:08, Stephen Boyd wrote:
> Quoting Amit Nischal (2018-06-06 04:41:47)
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt 
>> b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
>> new file mode 100644
>> index 0000000..e311219
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
>> @@ -0,0 +1,18 @@
>> +Qualcomm Graphics Clock & Reset Controller Binding
>> +--------------------------------------------------
>> +
>> +Required properties :
>> +- compatible : shall contain "qcom,sdm845-gpucc".
>> +- reg : shall contain base register location and length.
>> +- #clock-cells : from common clock binding, shall contain 1.
>> +- #reset-cells : from common reset binding, shall contain 1.
>> +- #power-domain-cells : from generic power domain binding, shall 
>> contain 1.
>> +
>> +Example:
>> +       gpucc: clock-controller@@5090000 {
> 
> Drop the double '@'

Oh. I will fix this in next patch series.

> 
>> +               compatible = "qcom,sdm845-gpucc";
>> +               reg = <0x5090000 0x9000>;
>> +               #clock-cells = <1>;
>> +               #reset-cells = <1>;
>> +               #power-domain-cells = <1>;
>> +       };
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
